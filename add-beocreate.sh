filename="/boot/firmware/config.txt"

echo "dtoverlay=hifiberry-dac" | sudo tee -a ${filename}
echo "dtparam=spi=on" | sudo tee -a ${filename}

sudo reboot now