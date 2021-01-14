# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# Stamp and alias found in:
# https://github.com/ohmyzsh/ohmyzsh/issues/3466#issuecomment-104896730
HIST_STAMPS="yyyy-mm-dd"

# History command is overritten somewhere
# alias history='fc -il 1 | less +G
alias hist='fc -il 1 | less +G'
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    extract
)
source $ZSH/oh-my-zsh.sh

# Custom plugins
PLUGIN=$ZSH_BASE/plugins/zsh-syntax-highlighting
if [ ! -d $PLUGIN ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $PLUGIN
fi
source $PLUGIN/zsh-syntax-highlighting.zsh

PLUGIN=$ZSH_BASE/plugins/zsh-autosuggestions
if [ ! -d $PLUGIN ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $PLUGIN
fi
source $PLUGIN/zsh-autosuggestions.plugin.zsh

export CODESTATS_API_KEY="SFMyNTY.VFdGeVkyOUVhVVp5WVc1alpYTmpidz09IyNOamczTXc9PQ.Q5knPIVxz568Al7Tev_xqahXr4_J7xcihLB7uyWbaBQ" 
PLUGIN=$ZSH_BASE/plugins/code-stats-zsh
if [ ! -d $PLUGIN ]; then
  git clone https://gitlab.com/code-stats/code-stats-zsh.git $PLUGIN
fi
source $PLUGIN/codestats.plugin.zsh

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
# Generate random password
#alias generatePassword='pwgen -s --numerals -1 16 | tr -d '\n' | gpaste-client add-password generated-password'
# Trash list order by date
alias trash-ls='trash-list | sort | grep `pwd`'
# Calendar alias
alias calendar='xdg-open https://calendar.google.com'
# Get folder size as output sort by name
alias dir_size='du --max-depth=1 --human-readable | sort --key=2'
# Avoid using deprecated scp
alias scp='echo "scp is deprecated! Use rsync instead"'
# Pip aliases to avoid using it
alias pip='./.venv/bin/pip'


# compinit is set on oh-my-zsh.sh
if command -v exa &> /dev/null; then
	source /usr/share/fzf/key-bindings.zsh
	source /usr/share/fzf/completion.zsh
fi
#eval "`pip completion --zsh`"
#eval "`pipenv --completion`"

# https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/
#export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'

# Change cursor shape
printf '\033[5 q\r'

# Load NVM for WSL
NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
	export NVM_DIR
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi
