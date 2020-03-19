## How to restore this configuration file to Gnome Desktop

```
# dconf
curl https://raw.githubusercontent.com/nobiki/nobian/master/config/gnome-desktop/dconf-backup.dconf | dconf load /

# terminator
mkdir -p ~/.config/terminator
wget -O ~/.config/terminator/config https://raw.githubusercontent.com/nobiki/nobian/master/config/gnome-desktop/terminator.config

```

