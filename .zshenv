# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


export ZDOTDIR="$HOME/.config/zsh"

# Add scripts folder to path
export PATH="/home/marco/scripts:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh
export ZSH_BASE=/usr/share/zsh

export HISTFILE="$HOME/.cache/zsh/history" 
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

# Save the location of the current completion dump file.
export ZSH_COMPDUMP="${HOME}/.cache/zsh/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
