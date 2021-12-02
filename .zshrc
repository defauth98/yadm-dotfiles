export ZSH="/home/defauth/.oh-my-zsh"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(git python virtualenv)

source $ZSH/oh-my-zsh.sh

alias vms="/home/defauth/code/scripts/hacking/vms.sh"

# Trybe Projects git alias
alias python-dir="cd /home/defauth/code/trybe/exercises/ciencia_da_computacao"
alias p-trybe="cd /home/defauth/code/trybe/projects/delivery-app"
alias main="git checkout main-group-9"

# utils
alias wm="wmctrl"

# Workspaces work
alias fanstok="/home/defauth/code/workspaces-scripts/gmalato/fanstok.sh"
alias phono-api="/home/defauth/code/workspaces-scripts/gmalato/phono-api.sh"
alias phono-app="/home/defauth/code/workspaces-scripts/gmalato/phono-app.sh"
alias neocryptal="/home/defauth/code/workspaces-scripts/gmalato/cryptal.sh"

# Workspaces trybe
alias blog-api="/home/defauth/code/workspaces-scripts/trybe/blog-api.sh"
alias cookmaster="/home/defauth/code/workspaces-scripts/trybe/cookmaster.sh"
alias store-manager="/home/defauth/code/workspaces-scripts/trybe/store-manager.sh"
alias talker-manager="/home/defauth/code/workspaces-scripts/trybe/talker-manager.sh"
alias web-chat="/home/defauth/code/workspaces-scripts/trybe/webchat.sh"
alias delivery="/home/defauth/code/workspaces-scripts/trybe/delivery.sh"
alias ciencias="/home/defauth/code/workspaces-scripts/trybe/ciencia-computacao.sh"

# fronend projects
alias online-store="/home/defauth/code/workspaces-scripts/trybe/online-store.sh"
alias proffy="/home/defauth/code/workspaces-scripts/github/proffy.sh"
alias portfolio="$HOME/scripts/daniel-portifolio.sh"
alias defauth98="/home/defauth/code/workspaces-scripts/github-io.sh"

# Programs alias
alias ls_node_modules="find . -name "node_modules" -type d -prune | xargs du -chs"
alias rm_node_modules="find . -name "node_modules" -type d -prune | xargs rm -rf"
alias amend-push="git add .; git commit --amend; push -f"
alias short=" /home/defauth/code/scripts/shortcuts.sh"
alias pr="gh pr view -w"
alias proffydeploy="/home/defauth/code/scripts/proffy.sh"
alias upp="/home/defauth/code/scripts/update.sh"
alias top="bashtop"

#config files alias
alias alaconf="code ~/.config/alacritty/alacritty.yml"
alias vimconf="code .config/nvim/init.vim"
alias zshconf="code .zshrc"

# LS to Exa
alias ls='exa -l --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first' 
alias ll='exa -la --color=always --group-directories-first'

#alias vim for nvim
alias v="nvim"
alias vim="nvim"

# yarn alias
alias aa="clear; npm start"
alias tt="npm test"
alias trybe="cd $HOME/code/trybe/projects"

alias docker-stop="sudo systemctl stop docker;"
alias docker-start="sudo systemctl start docker;"
alias testdb-start="sudo docker start test-db;"
alias mysql-start="sudo systemctl start mysql; "
alias mongo-start="sudo systemctl start mongod;"

# Github CLI alias
alias repo='gh repo view --web'
alias pr="gh pr view -w"

# Dotfiles alias
alias config='yadm'

# Coloriza GREP
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# My functions
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Raw Syntax
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/clipboard.zsh
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/termsupport.zsh

## Oh My Zsh Setting
zinit light spaceship-prompt/spaceship-prompt
ZSH_THEME="spaceship"

## Zinit Setting
# Must Load OMZ Git library
zinit snippet OMZL::git.zsh

# Load Git plugin from OMZ
zinit snippet OMZP::git
zinit cdclear -q # <- forget completions provided up to this moment

setopt promptsubst

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "


# Load Prompt
# zinit snippet OMZT::robbyrussell
### End of Zinit's installer chunk

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
