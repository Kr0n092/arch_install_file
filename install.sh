#! /bin/sh
# Switch to root
su
# Install i3
pacman -S i3 --no-confirm
# Install applications through Pacman
echo "Installing Pacman applications..."
pacman -S chromium --noconfirm # Favorite internet browser
pacaur -S jre8-openjdk --no-confirm
pacman -S pacgraph --no-confirm # Make nice graph of packages
pacman -S zsh --no-confirm 
pacman -S vlc --no-confirm # Watch movies, listen to music
pacman -S youtube-dl --no-confirm # Download mp3
pacman -S reflector --no-confirm # Update mirrorlist
pacman -S slim --no-confirm # Login manager
# Configure slim
echo "Configure slim using https://wiki.archlinux.org/index.php/SLiM"
pacman -S python --no-confirm
pacman -S qbittorrent --no-confirm # Download P2P stuff
pacman -S mcomix --no-confirm # Read comic books
# Install favorite text editor
pacman -S vim --no-confirm
# Install favorite DBMS
pacman -S postgresql --no-confirm
# Start and enable postgresql service
systemctl start postgresql.service
systemctl enable postgresql.service
echo "Finished installing Pacman applications..."
exit
echo "Retrieve sample .zshrc config"
wget -O .zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc # Retrieve sample .zshrc config

echo "Installing AUR helper..."
# Install AUR helper pacaur
curl -s https://gist.githubusercontent.com/Tadly/0e65d30f279a34c33e9b/raw/pacaur_install.sh | bash
# Install AUR programs
echo "Installing programs from AUR..."
pacaur -S dropbox
pacaur -S pycharm-professional
pacaur -S oh-my-zsh-git
# Enable flash content for chromium
pacaur -S chromium-pepper-flash
# Enable Netflix for chromium
pacaur -S chromium-widevine
# Watch movies
pacaur -S popcorntime-bin
echo "Finished installing..."
echo "Make graph of installed packages..."
pacgraph
# Start Xorg on login
echo 'if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	  exec startx
  fi' >> ~/.zprofile
# Start i3 when Xorg starts
echo 'exec i3' >> .xinitrc

echo "Reboot to view changes!"
