#########################################
#		Nathan's cool zsh config		#
#########################################
autoload -Uz compinit promptinit vcs_info &&
	compinit && promptinit
setopt prompt_subst

# Enabling history
HISTFILE=$HOME/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000

# Set up VCS Integration
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '✓'
zstyle ':vcs_info:git*' formats " %s:(%b%u%c)"
precmd() { vcs_info }

# Setting prompt
PROMPT='[%*] %F{cyan}%n%f@%F{green}%m%f%F{yellow}${vcs_info_msg_0_}%f %~%# '
RPROMPT='%F{red}${?##0}%f'

#Colour ls and grep output
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Other useful aliases
alias ll='ls -l'
alias la='ls -a'

# Setting up autocomplete
zstyle ':completion*' menu select
zstyle ':completion*' list-suffixes
zstyle ':completion*' expand prefix suffix

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias config='/usr/bin/git --git-dir=/home/nathan/.dotfiles/ --work-tree=/home/nathan'
