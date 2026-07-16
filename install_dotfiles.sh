# general dotfiles shit
git clone https://github.com/sandemiroren1/dotfiles.git
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.xprofile ~/.xprofile
ln -s ~/dotfiles/.config/i3 ~/.config/i3
ln -s ~/dotfiles/.config/rofi ~/.config/rofi
ln -s ~/dotfiles/.config/picom ~/.config/picom
ln -s ~/dotfiles/.config/polybar ~/.config/polybar
ln -s ~/dotfiles/.config/wal ~/.config/wal
ln -s ~/dotfiles/.config/alacritty ~/.config/alacritty
ln -s ~/dotfiles/.config/ghostty ~/.config/ghostty
sudo pacman -S autotiling
# install for zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# neovim
sudo pacman -S neovim
ln -s ~/dotfiles/.config/nvim ~/.config/nvim

# i3
sudo pacman -S i3-wm i3status i3lock dmenu xorg-server xorg-xinit
sudo pacman -S --needed picom polybar rofi python-pywal

# terminal
sudo pacman -S alacritty ghostty

# fonts (i3 titlebar, polybar bars)
sudo pacman -S ttf-meslo-nerd ttf-firacode-nerd terminus-font

# audio (pipewire) + keybind tools
sudo pacman -S pipewire pipewire-pulse pipewire-alsa alsa-utils

# i3 utilities (screenshots, clipboard, autostart, lock, wallpaper, tray)
sudo pacman -S maim xdotool xclip dex xss-lock feh network-manager-applet \
	xbindkeys brightnessctl gnome-screenshot xorg-xrdb xorg-setxkbmap

# polybar forest scripts (notifications, update count, media, volume)
sudo pacman -S libnotify papirus-icon-theme pacman-contrib mpc

# bluetooth (blueman gui + stack)
sudo pacman -S blueman bluez bluez-utils
sudo systemctl enable --now bluetooth.service

# neovim / LazyVim tooling
sudo pacman -S ripgrep fd nodejs npm unzip base-devel lazygit

# shell
sudo pacman -S fastfetch

# yay (AUR helper)
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si && cd ..

# AUR packages
yay -S betterlockscreen

# polybar forest icon fonts (waffle, feather)
git clone https://github.com/adi1090x/polybar-themes.git
mkdir -p ~/.local/share/fonts
cp -r polybar-themes/fonts/* ~/.local/share/fonts/
fc-cache -f

# qylock: sddm theme + quickshell lockscreen (https://github.com/Darkkal44/qylock)
sudo pacman -S sddm qt6-declarative qt6-5compat qt6-svg qt6-multimedia qt6-multimedia-ffmpeg \
	gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly fzf
yay -S quickshell
git clone https://github.com/Darkkal44/qylock.git
cd qylock && chmod +x sddm.sh quickshell.sh && ./sddm.sh && ./quickshell.sh && cd ..
sudo pacman -S tmux
