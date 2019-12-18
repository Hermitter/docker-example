FROM balenalib/raspberrypi3:buster

WORKDIR /app
COPY . /app

RUN apt-get update && \
    apt-get install python3 python3-pip python3-setuptools python3-dev apt-transport-https build-essential curl && \
    curl https://apt.matrix.one/doc/apt-key.gpg | sudo apt-key add - && \
    echo "deb https://apt.matrix.one/raspbian buster main" | sudo tee /etc/apt/sources.list.d/matrixlabs.list && \
    apt-get update && \
    apt-get install libmatrixio-creator-hal-dev && \
    echo "Installing Node & MATRIX Lite JS" && \
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash && \
    . ~/.bashrc && \
    nvm install 13 && \
    npm init -y && \
    npm install @matrix-io/matrix-lite --save && \
    echo "Installing MATRIX Lite Py" && \
    sudo python3 -m pip install matrix-lite

# *******Change this command to what you want*******
CMD ["/bin/echo", "*********Edit CMD inside the Dockerfile*********"]