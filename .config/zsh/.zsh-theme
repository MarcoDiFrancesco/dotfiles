#!/bin/bash
# Symbols meaning https://blog.aamnah.com/sysadmin/zsh-custom-theme-ultimate-guide
# Repo https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/fwalch.zsh-theme

ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}'

# REPO: https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/awesomepanda.zsh-theme
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_PROMPT_BASE_COLOR="%{$fg_bold[blue]%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"

# Not working
#ZSH_THEME_GIT_PROMPT_ADDED=" %{$fg[green]%}✚"
#ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$fg[yellow]%}⚑"
#ZSH_THEME_GIT_PROMPT_DELETED=" %{$fg[red]%}✖"
#ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[blue]%}▴"
#ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg[cyan]%}§"
#ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[white]%}◒"

