# hifiberry-dsp-docker

The project encapsulates official hifiberry-dsp toolkit (https://github.com/hifiberry/hifiberry-dsp) into docker container for an easy deploy and manage on a fresh RaspberryPi OS. Currently it was tested only on Hifiberry Beocreate HAT.

Default configuration enables alsa volume control, SPDIF input and LG Sound Sync feature (allows to control HiFiberry Beocreate volume from TV via SPDIF connection)

## Installation
Run `add-beocreate.sh` script locally or add lines to `/boot/firmware/config.txt` manually to enable Hifiberry HAT in the system:
```
dtparam=spi=on
dtoverlay=hifiberry-dac
```
Reboot RaspberryPi after this step

## Run tool
Use `docker-run.sh` script or `docker-compose up -d`.

### Params
- `INSTALL_PROFILE_ON_FIRST_RUN` Install Hifiberry Beocreate default profile. Required for playing music without custom DSP
- `ENABLE_SPDIF` Enable Hifiberry Beocreate SPDIF input. Requires installed profile
- `SERVER_OPTIONS` sigmatcpserver parameters. Requires installed profile
