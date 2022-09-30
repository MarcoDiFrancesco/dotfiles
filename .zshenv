export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Urxvt socket
export RXVT_SOCKET="$XDG_CACHE_HOME/urxvtd-socket"

# Sourced in .profile, for some reasons here it isn't sourced early enough
export PATH="$HOME/scripts:$PATH"
# Ruby gem path, for bundle command
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

# Path to your oh-my-zsh installation
if [ -d "$HOME/.oh-my-zsh" ]; then
    export ZSH="$HOME/.oh-my-zsh"
    export ZSH_BASE="$ZSH/custom"
else
    export ZSH=/usr/share/oh-my-zsh
    export ZSH_BASE=/usr/share/zsh
fi
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Save the location of the current completion dump file.
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
# Create directory if doesn't exist
mkdir -p $ZSH_CACHE
export ZSH_COMPDUMP="$ZSH_CACHE/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
export HISTFILE="$ZSH_CACHE/history" 
export HISTSIZE=100000 # Number of commands loaded into memory
export SAVEHIST=100000 # Number of commands saved into $HISTFILE

# Delete duplicates from history
$HOME/scripts/history-clean > /dev/null

# Preferred editor for local and remote sessions
export EDITOR="vim"
export MOUNT_DIR="/run/media/marco"

# Less
mkdir -p "$XDG_CACHE_HOME/less"
export LESSKEY="$XDG_CACHE_HOME/less/lesskey"
# Disable history setting file to a non existing location
export LESSHISTFILE=-
# -R used to colorize
export LESS='-R --ignore-case --mouse --wheel-lines=3'

# Gtk
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
# Nvidia
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
# Android
export ANDROID_SDK_HOME="$XDG_CACHE_HOME/android"
# Npm
export NPM_CONFIG_USERCONFIG="$XDG_CACHE_HOME/npm"
# Jarn (used by aur, so probably does not work)
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
# IPython
export IPYTHONDIR="$XDG_CACHE_HOME/jupiter"
# Golang
export GOPATH="$XDG_CACHE_HOME/go"
# GPG
export GNUPGHOME="$XDG_CACHE_HOME/gnupg"
# Gradle (Android Studio)
export GRADLE_USER_HOME="$XDG_CACHE_HOME/gradle"
# Rust
export CARGO_HOME="$XDG_CACHE_HOME/cargo"
# Node Npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
# Conda
export CONDARC="$XDG_CONFIG_HOME/conda/condarc"
# Ruby
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_CACHE_HOME/bundle"
# Jupyter
export JUPYTER_CONFIG_DIR="$XDG_CACHE_HOME"/jupyter 
# Zoom
export SSB_HOME="$XDG_CACHE_HOME/zoom"
# Vim
export GVIMINIT='let $MYGVIMRC="$XDG_CONFIG_HOME/vim/gvimrc" | source $MYGVIMRC'
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
