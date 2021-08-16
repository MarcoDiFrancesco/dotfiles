# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Command execution timestamp
HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

# Theme must be sourced after oh-my-zsh.sh
source ~/.config/zsh/.zsh-theme

# Custom plugins
PLUGIN=$ZSH_BASE/plugins
if [ ! -d $PLUGIN ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $PLUGIN/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-history-substring-search $PLUGIN/zsh-history-substring-search
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $PLUGIN/zsh-autosuggestions
fi

source $PLUGIN/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PLUGIN/zsh-history-substring-search/zsh-history-substring-search.zsh
source $PLUGIN/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# zsh-history-substring-search bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Plugins
plugins=(git extract)

if command -v exa &> /dev/null; then
	alias ls='exa'
	alias ll='l'
	alias lll='exa -l | less'
	alias lt='exa -T'
fi

# Config repostory
alias config='git --git-dir=$HOME/projects/dotfiles --work-tree=$HOME'
# Ranger get directory on exit and cd into it
alias r='ranger --choosedir=$HOME/.cache/ranger/dir; LASTDIR=`cat $HOME/.cache/ranger/dir`; cd "$LASTDIR"; rm $HOME/.cache/ranger/dir;'
# Trash list order by date
alias trash-ls='trash-list | sort | grep "`pwd`"'
alias trash-rs='trash-restore | grep'
# Get folder size as output sort by name
alias dir_size='du --max-depth=1 --human-readable | sort --key=2'
# Avoid using deprecated scp
alias scp='echo "scp is deprecated! Use rsync instead"'
# Pip aliases to avoid using it
alias pip='./.venv/bin/pip'

# fzf (ctrl+r)
if command -v fzf &> /dev/null; then
	source /usr/share/fzf/key-bindings.zsh
	source /usr/share/fzf/completion.zsh
fi

# Get urxvt ctrl+backspace escape character and set it to delete word
# https://unix.stackexchange.com/a/39731/337926
bindkey '^[[33~' backward-delete-word
# Don't stop word deletion on the characters below on ctrl+backspace (removed /)
# https://unix.stackexchange.com/a/392199/337926
autoload -U select-word-style
select-word-style bash
export WORDCHARS='*?_.[]~=&;!#$%^(){}<>'

# Change cursor shape
printf '\033[5 q\r'

# Load nvm for WSL
NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
	export NVM_DIR
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi

# TOCHECK if they are useful
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
setopt PUSHD_IGNORE_DUPS

