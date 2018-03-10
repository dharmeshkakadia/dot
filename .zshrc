export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Users/dharmesh/.antigen/bundles/robbyrussell/oh-my-zsh/lib:/Users/dharmesh/bin"
export CLICOLOR=1

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle docker 
antigen bundle pip
antigen bundle lein
antigen bundle cp
antigen bundle fasd
antigen bundle supercrabtree/k
#antigen bundle zsh-users/zsh-completions

antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle andrewferrier/fzf-z
antigen bundle mvn
# antigen bundle zdharma/fast-syntax-highlighting
#This has to be last bundle
#antigen bundle zsh-users/zsh-syntax-highlighting
# This should be after syntax higlighter 
# antigen bundle history-substring-search
antigen theme robbyrussell

antigen apply

#Added by Dharmesh

HIST_STAMPS="mm/dd/yyyy"
eval "$(fasd --init auto)"

# because the plugin overrides k command alias
source <(kubectl completion zsh)

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
