# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh
export ZSH_BASE=/usr/share/zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

export MOUNT_DIR=/run/media/marco

# Add scripts folder to path
export PATH=/home/marco/scripts:$PATH

# Golang path
export GOPATH=$HOME/.cache/go

# Start gnome keyring
# https://wiki.archlinux.org/index.php/GNOME/Keyring#With_a_display_manager
#if [ -n "$DESKTOP_SESSION" ];then
#    eval $(gnome-keyring-daemon --start)
#    export SSH_AUTH_SOCK
#fi
