#! /bin/sh
# Install xfce desktop environment
sudo pacman -S xfce4 --noconfirm
# Install applications through Pacman
echo "Installing Pacman applications..."
sudo pacman -S wget --noconfirm # For downloading simple stuff from the internet
sudo pacman -S chromium --noconfirm # Favorite internet browser
sudo pacman -S pacgraph --noconfirm # Make nice graph of packages
sudo pacman -S zsh --noconfirm 
sudo pacman -S vlc --noconfirm # Watch movies, listen to music
sudo pacman -S youtube-dl --noconfirm # Download mp3
sudo pacman -S reflector --noconfirm # Update mirrorlist
sudo pacman -S slim --noconfirm # Login manager
# Configure slim
echo "Configure slim using https://wiki.archlinux.org/index.php/SLiM"
sudo pacman -S python --noconfirm
sudo pacman -S qbittorrent --noconfirm # Download P2P stuff
sudo pacman -S mcomix --noconfirm # Read comic books
# Install favorite text editor
sudo pacman -S vim --noconfirm
# Install favorite DBMS
sudo pacman -S postgresql --noconfirm
# Start and enable postgresql service
systemctl start postgresql.service
systemctl enable postgresql.service
echo "Finished installing Pacman applications..."
echo "Retrieve sample .zshrc config"
wget -O ~/.zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc # Retrieve sample .zshrc config

echo "Installing AUR helper..."
# Install AUR helper pacaur
curl -s https://gist.githubusercontent.com/Tadly/0e65d30f279a34c33e9b/raw/pacaur_install.sh | bash
# Install AUR programs
echo "Installing programs from AUR..."
pacaur -Sa jdk8-openjdk --noconfirm
pacaur -Sa dropbox --noconfirm
pacaur -Sa pycharm-professional --noconfirm
pacaur -Sa oh-my-zsh-git --noconfirm
# Enable flash content for chromium
pacaur -Sa chromium-pepper-flash --noconfirm
# Enable Netflix for chromium
pacaur -Sa chromium-widevine --noconfirm
# Watch movies
pacaur -Sa popcorntime-bin --noconfirm
echo "Finished installing..."
echo "Make graph of installed packages..."
pacgraph
# Start Xorg on login
echo 'if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	  exec startx
  fi' >> ~/.zprofile
# Start xfce4 when Xorg starts
echo 'exec startxfce4' >> ~/.xinitrc

echo "Reboot to view changes!"
