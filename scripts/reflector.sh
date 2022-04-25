#/bin/bash

sudo pacman -Sy --noconfirm reflector

sudo rm -rf /etc/xdg/reflector/reflector.conf

sudo echo "--save /etc/pacman.d/mirrorlist
--country Brazil,Paraguay
--protocol http,https
--latest 15
--sort rate" > /etc/xdg/reflector/reflector.conf

sudo systemctl enable reflector.service
sudo systemctl enable reflector.timer

sudo cp /etc/pacman.conf /etc/pacman.conf.backup
sudo sed -i 's/^#NoExtract   =/NoExtract   = pacman-mirrorlist/' /etc/pacman.conf