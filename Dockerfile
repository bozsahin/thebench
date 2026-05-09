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

# Creates the dotfiles in the home directory
RUN echo "/opt/thebench" > /root/.thebenchhome && \
    touch /root/.thebenchhistory && \
    chmod u+rw /root/.thebenchhistory /root/.thebenchhome

# Creates the executable wrapper 
RUN echo '#!/bin/bash\ntouch $(pwd)/.thebenchhistory\nln -sf $(pwd)/.thebenchhistory /root/.thebenchhistory\npython3.11 /opt/thebench/src/bench.py "$@"' > /usr/local/bin/thebench && \
    chmod +x /usr/local/bin/thebench

# Sets the default command
ENTRYPOINT ["thebench"]