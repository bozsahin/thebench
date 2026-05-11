# Uses Debian-based Python 3.11 as the base image
FROM python:3.11-slim

# Installs sbcl
RUN apt-get update && apt-get install -y \
    sbcl \
    && rm -rf /var/lib/apt/lists/*

# Installs the Python libraries
RUN pip install --no-cache-dir cl4py sly prompt_toolkit
    
# Creates the temporary directory 
RUN mkdir -p /var/tmp/thebench
    
# Goes to the work directory
WORKDIR /opt/thebench

# Copies thebench
COPY . /opt/thebench

# Patch bench.py to handle non‑TTY gracefully
RUN python3 -c "import re; f=open('/opt/thebench/src/bench.py','r'); c=f.read(); f.close(); c=re.sub(r'(\s*)(command\s*=\s*myPromptSession\.prompt\(_prompt\))', r'\1if sys.stdin.isatty():\n\1    command = myPromptSession.prompt(_prompt)\n\1else:\n\1    try:\n\1        command = input()\n\1    except EOFError:\n\1        command = \"\"', c, count=1); f=open('/opt/thebench/src/bench.py','w'); f.write(c); f.close()"

# Creates the dotfiles in the home directory
RUN echo "/opt/thebench" > /root/.thebenchhome && \
    touch /root/.thebenchhistory && \
    chmod u+rw /root/.thebenchhistory /root/.thebenchhome

# Creates the executable wrapper 
RUN echo '#!/bin/bash\ntouch $(pwd)/.thebenchhistory\nln -sf $(pwd)/.thebenchhistory /root/.thebenchhistory\npython3.11 /opt/thebench/src/bench.py "$@"' > /usr/local/bin/thebench && \
    chmod +x /usr/local/bin/thebench

# Sets the default command
ENTRYPOINT ["thebench"]
