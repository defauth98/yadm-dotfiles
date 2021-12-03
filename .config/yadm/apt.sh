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

echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -

echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list


sudo apt update && sudo apt upgrade -y

# install tools
sudo apt install \
   fonts-firacode \
   google-chrome-stable \
   beekeeper-studio \
   keepassxc \
   gimp \
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
   exa \
   snapd \
   gh -y

gh auth login

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install 14

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

# change origin yadm to ssh
yadm remote remove origin
yadm remote add origin git@github.com:defauth98/yadm-dotfiles.git

./fonts.sh
