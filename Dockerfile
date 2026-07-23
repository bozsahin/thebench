# Uses Debian-based Python 3.11 as the base image
FROM python:3.11-slim

# Installs sbcl
RUN apt-get update && apt-get install -y \
    sbcl \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Installs the Python libraries
RUN pip install --no-cache-dir cl4py sly prompt_toolkit
    
# Creates the temporary directory 
RUN mkdir -p /var/tmp/thebench
    
# Goes to the work directory
WORKDIR /opt/thebench

# Copies thebench
COPY . /opt/thebench

# Creates the dotfiles in the home directory
RUN mkdir -p /root/.local/bin && \
    echo "/opt/thebench" > /root/.thebenchhome && \
    touch /root/.thebenchhistory && \
    chmod u+rw /root/.thebenchhistory /root/.thebenchhome

# Creates the executable wrapper 
RUN echo '#!/bin/bash\n\
touch $(pwd)/.thebenchhistory\n\
ln -sf $(pwd)/.thebenchhistory /root/.thebenchhistory\n\
\n\
# Run Python. The bash script waits here until Python is closed.\n\
python3.11 /opt/thebench/src/bench.py "$@"\n\
\n\
# When Python closes, check if sbcl is running in the background.\n\
if pgrep -x "sbcl" > /dev/null; then\n\
    echo -e "\\n[Docker] Background training detected. Keeping container alive..."\n\
    while pgrep -x "sbcl" > /dev/null; do\n\
        sleep 30\n\
    done\n\
    echo "[Docker] Training finished. Shutting down."\n\
fi' > /usr/local/bin/thebench && \
    chmod +x /usr/local/bin/thebench

# Sets the default command
ENTRYPOINT ["thebench"]
