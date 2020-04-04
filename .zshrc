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

HISTFILE=$HOME/.history
HISTSIZE=10000 # Number of commands loaded into memory
SAVEHIST=10000 # Number of commands saved into $HISTFILE

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
# Plugins installed with pacman
source $ZSH_BASE/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_BASE/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Codestats plugin cloned from:
# https://gitlab.com/code-stats/code-stats-zsh
export CODESTATS_API_KEY="SFMyNTY.VFdGeVkyOUVhVVp5WVc1alpYTmpidz09IyNOamczTXc9PQ.Q5knPIVxz568Al7Tev_xqahXr4_J7xcihLB7uyWbaBQ" 
source $ZSH/custom/plugins/code-stats-zsh/codestats.plugin.zsh

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='exa'
alias ll='l'
alias lll='exa -l | less'
alias lt='exa -T'
alias open='open_command'
alias config='/usr/bin/git --git-dir=$HOME/projects/linux-config --work-tree=$HOME'
# compinit is set on oh-my-zsh.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

#eval "`pip completion --zsh`"
#eval "`pipenv --completion`"
