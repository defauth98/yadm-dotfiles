sudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

sudo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-mirror/zinit/master/doc/install.sh)"

sudo chsh -s /bin/zsh

yadm checkout $HOME/.zshrc