echo " apt ----------------------------------"
sudo apt install -y \
    git \
    tig \
    vim \
    fzf \
    bash-completion \
    dnsutils \
    openssh-server \
    screen \
    expect \
    cron \
    procps \
    htop \
    tree \
    ncdu \
    ftp \
    ncftp \
    aria2 \
    openssl \
    inotify-tools \
    poppler-utils \
    qrencode \
    lsb-release \
    ripgrep \
    direnv \
    jq \
    locales \
    pwgen \
    tmux

echo " tfenv ----------------------------------"
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH=$PATH:$HOME/.tfenv/bin' >> ~/.bash_profile

echo " xpanes ----------------------------------"
wget -O tmux-xpanes_v4.2.0.deb https://github.com/greymd/tmux-xpanes/releases/download/v4.2.0/tmux-xpanes_v4.2.0.deb
sudo dpkg -i tmux-xpanes*.deb
rm tmux-xpanes*.deb

echo " locale ----------------------------------"
sudo locale-gen ja_JP.UTF-8
sudo localedef -f UTF-8 -i ja_JP ja_JP

echo " ssh-keygen ----------------------------------"
mkdir ~/.ssh
ssh-keygen -t ed25519
cp -i ./ssh/config ~/.ssh/config
cp -i ./ssh/hosting.config ~/.ssh/hosting.config
cp -i ./ssh/local-machine.config ~/.ssh/local-machine.config
cat ~/.ssh/config/*.pub
read -p " --> add pub-key to https://github.com/settings/keys. and Hit ENTER"

echo " create workspace ----------------------------------"
mkdir -p ~/workspace/github
cd ~/workspace/github

echo " dotfiles ----------------------------------"
git clone git@github.com:nobiki/dotfiles
cd dotfiles/
./copy.sh
cd ../

echo " vim ----------------------------------"
cd ~/
git clone git@github.com:nobiki/vim
cd vim/
cp environments.example environments
./setup.sh
