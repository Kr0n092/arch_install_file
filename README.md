Install my Arch Linux setup

The files in this repo can be used to easily replicate the programs on my Arch Linux setup.
Dependencies:
 - Basic Arch setup using https://wiki.archlinux.org/index.php/Installation_guide
 - Git: https://wiki.archlinux.org/index.php/git

Usage:
 - Add yourself as user:
```
useradd -m -G wheel -s /bin/bash <username>
passwd <username>
```
 - Use ``visudo`` to use sudo for yourself by adding ``<username> ALL=(ALL) ALL`` below root ALL=(ALL) ALL
 - Reboot
```
reboot
```
 - Install graphic tools
```
sudo pacman -S xorg-server xorg-xinit xorg-server-utils mesa
sudo pacman -S xorg-twm xorg-xclock xterm
```
 - Clone the repository:
```
git clone https://github.com/Kr0n092/arch_install_file.git
```
 - Change directories:
```
cd arch_install_file
```
 - Install programs
```
./install.sh
```
 - Reboot
```
reboot
```	
