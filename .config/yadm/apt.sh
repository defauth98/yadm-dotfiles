# Repos
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo add-apt-repository universe

# install docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


apt update && sudo apt upgrade -y

# install tools
sudo apt install \
   fonts-firacode \
   curl \
   coreutils \
   net-tools \
   apt-transport-https \
   ca-certificates \
   software-properties-common \
   ubuntu-restricted-extras \
   gnome-tweak-tool \
   network-manager-openvpn-gnome \
   libxss1 \
   libappindicator1 \
   libindicator7 \
   vim \
   nfs-common \
   nfs-kernel-server \
   psensor \
   zsh \
   tmux \
   neovim \
   percol \
   bat \
   yadm \
   docker \
   fzf \
   fonts-firacode \
   mysql-server \
   gh -y

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# docker
apt install docker-ce -y
groupadd docker
usermod -aG docker defauth

systemctl enable docker
systemctl disable docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

docker run hello-world

chown defauth:defauth /home/$USER/.docker -R
chmod g+rwx "/home/$USER/.docker" -R

#  node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash

# Download vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#Update vim plugins
if command -v vim >/dev/null 2>&1; then
 echo "Bootstraping Vim"
 nvim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
fi

# Install tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux source ~/.tmux.conf

echo "Termine de configurar o mysql"
echo "--> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'mysql'; flush privileges;"

./fonts.sh
