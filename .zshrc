export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Users/dharmeshkakadia/bin"
export GOPATH=$HOME/Git-Repo/gospace

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle <<EOBUNDLES
git
pip
lein
cp
fasd
supercrabtree/k
zsh-users/zsh-syntax-highlighting
EOBUNDLES

#local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
#PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

antigen theme robbyrussell
#antigen theme ys
antigen apply

#Added by Dharmesh

#alias yd='python3 /Users/GreatGod/Videos/videos/youtube-dl'
#For man page coloring
#export LESS_TERMCAP_mb=$'\E[01;31m'
#export LESS_TERMCAP_md=$'\E[01;31m'
#export LESS_TERMCAP_me=$'\E[0m'
#export LESS_TERMCAP_se=$'\E[0m'
#export LESS_TERMCAP_so=$'\E[01;44;33m'
#export LESS_TERMCAP_ue=$'\E[0m'
#export LESS_TERMCAP_us=$'\E[01;32m'
HIST_STAMPS="mm/dd/yyyy"
#since its installed by brew and not in oh-my-zsh -- so that its easy to get updates
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(fasd --init auto)"
