XDG_CACHE_HOME="$HOME/.cache"
XDG_CONFIG_HOME="$HOME/.config"
# Urxvt socket
export RXVT_SOCKET="$XDG_CACHE_HOME/urxvtd-socket"

# Sourced in .profile, for some reasons here it isn't sourced early enough
export PATH="/home/marco/scripts:$PATH"

# Path to your oh-my-zsh installation.
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
export HISTSIZE=10000 # Number of commands loaded into memory
export SAVEHIST=10000 # Number of commands saved into $HISTFILE

# Preferred editor for local and remote sessions
export EDITOR="vim"
export MOUNT_DIR="/run/media/marco"

# Nvidia config location
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

# Android config location
export ANDROID_SDK_HOME="$XDG_CACHE_HOME/android"

# Npm config location
export NPM_CONFIG_USERCONFIG="$XDG_CACHE_HOME/npm"

# IPython config location
export IPYTHONDIR="$XDG_CACHE_HOME/jupiter"

# Golang path
export GOPATH="$XDG_CACHE_HOME/go"

# GnuPG config folder
export GNUPGHOME="$XDG_CACHE_HOME/gnupg"

# Gradle config location
export GRADLE_USER_HOME="$XDG_CACHE_HOME/gradle"

# Less cache location
mkdir -p "$XDG_CACHE_HOME/less"
export LESSKEY="$XDG_CACHE_HOME/less/lesskey"
# Disable history setting file to a non existing location
export LESSHISTFILE=-
