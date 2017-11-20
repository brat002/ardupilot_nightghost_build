export USER=root
apt-get install cmake git gcc-arm-none-eabi gawk python-pip lsb-release
pip install future
apt-get install sudo
bash Tools/scripts/install-prereqs-ubuntu.sh
make px4-v2