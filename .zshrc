export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Users/dharmesh/.antigen/bundles/robbyrussell/oh-my-zsh/lib:/Users/dharmesh/.krew/bin/:/Users/dharmesh/bin:/Applications/Sketch.app/Contents/Resources/sketchtool/bin/:/Users/dharmesh/go/bin:/usr/local/anaconda3/bin"
export CLICOLOR=1

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source /usr/local/share/antigen/antigen.zsh
# Remember to apply antigen reset if you change something here to clear the cache
antigen init ~/.antigenrc

#Added by Dharmesh

ZSHZ_EXCLUDE_DIRS=~/.dropbox/
HIST_STAMPS="mm/dd/yyyy"
eval "$(fasd --init auto)"

# because the plugin overrides k command alias
#source <(kubectl completion zsh)
# because the antigen seems to have broken this ortherwise : https://github.com/zsh-users/antigen/issues/603
#source /usr/local/share/zsh/site-functions/_kubectl

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# from https://github.com/ahmetb/kubectl-aliases/blob/master/.kubectl_aliases
alias k='kubectl'
alias ksys='kubectl --namespace=kube-system'
#alias kex='kubectl exec -i -t'
alias kp='kubectl proxy'
#alias kgpo='kubectl get pods'
alias kg='kubectl get pods'
alias kctx='kubectx'

alias markasread='pockyt mod -a 1 -i redirect'
alias utc='date -u'
alias b='bat --theme=GitHub'
#alias cat='bat --theme=GitHub'
alias l='exa --header --long --accessed  --created --modified --git -a'
alias python='python3'

# https://bcb.github.io/python/mac-repl-readline
export PYTHONSTARTUP=$HOME/.python_startup.py

# alias spark="while true; do kubectl port-forward deploy/jupyter2.4 8888:8888 4040:4040 4041:4041 4042:4042 4043:4043 4044:4044 4045:4045 4046:4046 4047:4047 4048:4048 4049:4049 & kubectl port-forward deploy/spark-master 8080:8080 ;done"
# # it works but evaluting at the shell startup. Should delay. Dont need it for now.
# #alias slogs="kubectl logs -f $(kubectl get pods -n=spark-operator -o name) -n=spark-operator"

# krun() {
#   kubectl run -it --rm dkakadia-krun-`date "+%s"` --image=$1
# }

# kex(){
#   _name=`kubectl get pod -o name | grep -F $1 | sed 's/pod\///'`
#   if [ $(echo ${_name} | wc -l) -ne 1 ];then
#     echo "Found pods: \n ${_name}"
#     return 1
#   fi
#   shift
#   echo "Exec into ${_name} :"
#   kubectl exec -it ${_name} $@
# }

# kl(){
#   _name=`kubectl get pod -o name | grep -F $1`
#   if [ $(echo ${_name} | wc -l) -ne 1 ];then
#     echo "Found pods: \n ${_name}"
#     return 1
#   fi
#   shift
#   echo "logs for ${_name} :"
#   kubectl logs -f ${_name} $@
# }

# deploy(){
#   _kind=`yq r $1 kind | tr '[:upper:]' '[:lower:]'`
#   _name=`yq r $1 metadata.name | tr '[:upper:]' '[:lower:]'`
#   echo "Deploying ${_kind} : ${_name}"
#   kubectl delete -f $1 
#   kubectl create -f $1 || return 1

#   if [ "${_kind}" = "job" ]; then
#     _label="-l job-name=${_name}"
#   elif [ "${_kind}" = "sparkapplication" ]; then
#     _label="-l sparkoperator.k8s.io/app-name=${_name},spark-role=driver"
#     while true; do 
#       (kubectl get pods ${_label} | grep ${_name}) >/dev/null 2>&1
#       if [[ "$?" -eq 0 ]]; then 
#         break
#       fi
#       echo "waiting for sparkapplication ${_name} to start.."
#       sleep 3
#     done
#   elif [ "${_kind}" = "pod" ]; then
#     _label=${_name}
#   else
#     echo "Not getting logs for ${_kind} : ${_name}"
#     kubectl get pods
#     return 1
#   fi
  
#   _wait="kubectl wait --for=condition=Ready --timeout=600s pod ${_label}"
#   echo ${_wait}
#   eval ${_wait}
#   echo "done"
  
#   _pod="kubectl get pods ${_label} -o name | sed 's/pod\///'"
#   _logs="kubectl logs -f $(eval $(echo ${_pod}))"
#   echo ${_logs}
#   eval ${_logs}
# }

# function c() { awk "{print \$$1}" }

# newnext(){
#   mkdir $1 && cd $1 && npm init -y && npm install --save react react-dom next && mkdir pages
#   cat package.json | jq '.scripts.dev="next"' | jq '.scripts.build="next build"'| jq '.scripts.start="next start"' > package.json
#   cat > pages/index.js <<EOF
# const Index = () => (
# <div>
#   <p>Hello $1</p>
# </div>
# )

# export default Index
# EOF

#   code . 
#   yarn dev
# }

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/usr/local/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/usr/local/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

