docker run \
    -v /lib/modules:/lib/modules \
    -v /sys:/sys \
    -v /dev:/dev \
    --device /dev/snd:/dev/snd \
    --privileged \
    -p 8089:8089 \
    -e INSTALL_PROFILE_ON_FIRST_RUN: "true" \
    -e ENABLE_SPDIF: "true" \
    -e SERVER_OPTIONS: "--alsa --lgsoundsync" \
    dobrikov91/hifiberry-dsp:v1.2