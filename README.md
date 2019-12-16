# Overview

This repository contains a basic setup for settings up a Docker container on a Raspberry Pi with access to a MATRIX device.

### Devices

- **HAL:** Will be on of the following
  - **Bus**: `/dev/Bus: spidev0.0`
  - **Kernel Modules**: `/dev/Modules: matrixio_regmap`
- **NFC**: `/dev/spidev0.1`
- **Hardware Microphone**: `/dev/snd:/dev/snd`
  - This will block microphone usage for other applications

# Prerequisites

- Setup a Raspberry Pi (2/3/4)
- [Install MATRIX HAL](https://matrix-io.github.io/matrix-documentation/matrix-hal/getting-started/installation-package/)
- (Optional) Install Kernel Modules for ([MATRIX Voice](https://matrix-io.github.io/matrix-documentation/matrix-voice/resources/microphone/#usage) or [MATRIX Creator](https://matrix-io.github.io/matrix-documentation/matrix-creator/resources/microphone/#usage))

# Install Docker

```bash
curl -sSL https://get.docker.com | bash
sudo usermod -aG docker pi
sudo reboot
```

Verify installation.

```
docker run hello-world
```

# Build Docker Image

TBC...

# Run Docker Image

Depending on if you installed the Kernel Modules, use one of the following commands to start your container.

```bash
# Bus
docker run --device=/dev/spidev0.0 --name matrix matrix

# Kernel Modules
docker run --device=/dev/matrixio_regmap --name matrix matrix
```
