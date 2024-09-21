FROM ubuntu:latest

EXPOSE 8080

RUN apt update

# Install base packages
RUN apt -y install sudo curl git vim tmux less

# Install Python packages
RUN apt -y install python3 python3-pip

# Install Go
RUN curl -LO https://golang.org/dl/go1.20.5.linux-amd64.tar.gz && \
    sudo tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz && \
    rm go1.20.5.linux-amd64.tar.gz

# Set Go environment variables
ENV PATH=$PATH:/usr/local/go/bin
ENV GOPATH=/go
RUN echo "PATH=${PATH}:/usr/local/go/bin" >> /home/code/.bashrc

# Install code-server (VSCode Web)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Setting up code user account
ARG CODE_PASSWORD
RUN groupadd -g 1600 code
RUN useradd -rm -d /home/code -s /bin/bash -G sudo -u 1600 -g 1600 code
RUN echo "code:$CODE_PASSWORD" | chpasswd
RUN echo 'code ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir -p /home/code/.config/code-server
COPY config.yaml /home/code/.config/code-server
RUN sed -i "s/password: REPLACE/password: $CODE_PASSWORD/g" /home/code/.config/code-server/config.yaml
RUN chown -R code:code /home/code/.config
RUN chmod -R 700 /home/code/.config

COPY entry.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/entry.sh
CMD ["/usr/local/bin/entry.sh"]
