export ZSH="/home/$USER/.oh-my-zsh"

echo -en "\e[=2c"
EDITOR="nvim"

ZSH_THEME="spaceship"
plugins=(git asdf)
source $ZSH/oh-my-zsh.sh

#Spaceship config
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  line_sep      # Line breakp
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_PROMPT_ADD_NEWLINE=false

# VMS
alias vms="/home/defauth/scripts/hacking/vms.sh"

# Trybe Projects git alias
alias p-trybe="cd  /home/defauth/code/trybe/projects/delivery-app"
alias main="git checkout main-group-9"

# utils
alias wm="wmctrl"
alias getReadme="/home/defauth/scripts/getReadme.md"

# Workspaces work
alias fanstok="/home/defauth/scripts/fanstok.sh"
alias phono-api="/home/defauth/scripts/phono-api.sh"
alias phono-app="/home/defauth/scripts/phono-app.sh"

# Workspaces trybe
alias blog-api="/home/defauth/scripts/trybe/blog-api.sh"
alias cookmaster="/home/defauth/scripts/trybe/cookmaster.sh"
alias store-manager="/home/defauth/scripts/trybe/store-manager.sh"
alias talker-manager="/home/defauth/scripts/trybe/talker-manager.sh"
alias web-chat="/home/defauth/scripts/trybe/webchat.sh"
alias delivery-backend="/home/defauth/scripts/trybe/delivery-backend.sh"
alias delivery-frontend="/home/defauth/scripts/trybe/delivery-frontend.sh"
alias ciencias="/home/defauth/scripts/ciencia-computacao.sh"

# fronend projects
alias online-store="/home/defauth/scripts/trybe/online-store.sh"
alias proffy="/home/defauth/scripts/github/proffy.sh"
alias portfolio="$HOME/scripts/daniel-portifolio.sh"
alias defauth98="/home/defauth/scripts/github-io.sh"

# Programs alias
alias ls_node_modules="find . -name "node_modules" -type d -prune | xargs du -chs"
alias rm_node_modules="find . -name "node_modules" -type d -prune | xargs rm -rf"
alias amend-push="git add .; git commit --amend; push -f"
alias short=" /home/defauth/code/scripts/shortcuts.sh"
alias pr="gh pr view -w"
alias proffydeploy="/home/defauth/code/scripts/proffy.sh"
alias upp="/home/defauth/code/scripts/update.sh"
alias top="bashtop"

# Config alias
alias alaconf="code ~/.config/alacritty/alacritty.yml"
alias vimconf="code .config/nvim/init.vim"
alias zshconf="code .zshrc"

# LS to Exa
alias ls='exa -l --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first' 
alias ll='exa -la --color=always --group-directories-first'

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

# git
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -am'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'
alias amend="git commit --amend"
alias diff='git diff --color'
alias glg="git lg -n 8"
# git g
alias g="git"

#alias vim for nvim
alias v="nvim"
alias vim="nvim"

# yarn alias
alias aa="clear; npm start"
alias n="npm"
alias tt="npm test"
alias trybe="cd $HOME/code/trybe/projects"

# Start alias 
alias docker-stop="sudo systemctl stop docker; sudo systemctl status docker"
alias docker-start="sudo systemctl start docker; sudo systemctl status docker"
alias testdb-start="sudo docker start test-db; sudo docker ps -a"
alias mysql-start="sudo systemctl start mysql; sudo systemctl status mysql"
alias mongo-start="sudo systemctl start mongod; ; sudo systemctl status mongod"

# Github CLI alias
alias repo='gh repo view --web'
alias pr="gh pr view -w"

# Dotfiles alias
alias config='yadm'

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
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
zplugin light zdharma/fast-syntax-highlighting
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-history-substring-search
zplugin light zsh-users/zsh-completions
zplugin light buonomo/yarn-completion

PATH="/home/defauth/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/defauth/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/defauth/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/defauth/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/defauth/perl5"; export PERL_MM_OPT;
fpath=($fpath "/home/defauth/.zfunctions")

export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=~/Library/Android/sdk/platform-tools:$PATH

# export PATH="$(yarn global bin):$PATH"
. $HOME/.asdf/completions/asdf.bash
. /home/defauth/.asdf/asdf.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
