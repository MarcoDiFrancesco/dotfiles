export RXVT_SOCKET="$HOME/.cache/urxvtd-socket"

# Sourced in .profile, for some reasons here it isn't sourced early enough
export PATH="/home/marco/scripts:$PATH"

# Path to your oh-my-zsh installation.
if [ $(hostname) = MarcoSSD ]; then
	export ZSH="$HOME/.oh-my-zsh"
	export ZSH_BASE="$ZSH/custom"
else
	export ZSH=/usr/share/oh-my-zsh
        export ZSH_BASE=/usr/share/zsh
fi
export ZDOTDIR="$HOME/.config/zsh"

# Save the location of the current completion dump file.
export ZSH_CACHE="$HOME/.cache/zsh"
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
export CUDA_CACHE_PATH="$HOME/.cache/nv"

# Android config location
export ANDROID_SDK_HOME="$HOME/.cache/android"

# Npm config location
export NPM_CONFIG_USERCONFIG="$HOME/.cache/npm"

# IPython config location
export IPYTHONDIR="$HOME/.cache/jupiter"

# Golang path
export GOPATH="$HOME/.cache/go"

# GnuPG config folder
export GNUPGHOME="$HOME/.cache/gnupg"

# Gradle config location
export GRADLE_USER_HOME="$HOME/.cache/gradle"

