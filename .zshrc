export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Users/dharmesh/.antigen/bundles/robbyrussell/oh-my-zsh/lib:/Users/dharmesh/lib/vsts-cli/bin:/Users/dharmesh/bin:/Applications/Sketch.app/Contents/Resources/sketchtool/bin/:/Users/dharmesh/go/bin"
export CLICOLOR=1

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle docker
antigen bundle pip
antigen bundle lein
antigen bundle cp
antigen bundle fasd
#antigen bundle supercrabtree/k
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
#antigen theme https://github.com/iam4x/zsh-iterm-touchbar

antigen apply

#Added by Dharmesh

HIST_STAMPS="mm/dd/yyyy"
eval "$(fasd --init auto)"

# because the plugin overrides k command alias
#source <(kubectl completion zsh)
# because the antigen seems to have broken this ortherwise : https://github.com/zsh-users/antigen/issues/603
#source /usr/local/share/zsh/site-functions/_kubectl

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

confirm() {
    # call with a prompt string or use a default
    read "response?Are you sure? [y/N]"
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac

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
alias l='exa --header --long --accessed  --created --modified --git'
#alias python='python3'

alias spark="while true; do kubectl port-forward deploy/jupyter2.4 8888:8888 4040:4040 4041:4041 4042:4042 4043:4043 4044:4044 4045:4045 4046:4046 4047:4047 4048:4048 4049:4049 & kubectl port-forward deploy/spark-master 8080:8080 ;done"
alias slogs="kubectl logs -f $(kubectl get pods -n=spark-operator -o name) -n=spark-operator"

krun() {
  kubectl run -it --rm dkakadia-krun-`date "+%s"` --image=$1
}

kex(){
  _name=`kubectl get pod -o name | grep -F $1 | sed 's/pod\///'`
  if [ $(echo ${_name} | wc -l) -ne 1 ];then
    echo "Found pods: \n ${_name}"
    return 1
  fi
  shift
  echo "Exec into ${_name} :"
  kubectl exec -it ${_name} $@
}

kl(){
  _name=`kubectl get pod -o name | grep -F $1`
  if [ $(echo ${_name} | wc -l) -ne 1 ];then
    echo "Found pods: \n ${_name}"
    return 1
  fi
  shift
  echo "logs for ${_name} :"
  kubectl logs -f ${_name} $@
}

deploy(){
  _kind=`yq r $1 kind | tr '[:upper:]' '[:lower:]'`
  _name=`yq r $1 metadata.name | tr '[:upper:]' '[:lower:]'`
  echo "Deploying ${_kind} : ${_name}"
  kubectl create -f $1 || return 1

  if [ "${_kind}" = "job" ]; then
    _label="-l job-name=${_name}"
  elif [ "${_kind}" = "sparkapplication" ]; then
    _label="-l sparkoperator.k8s.io/app-name=${_name},spark-role=driver"
  elif [ "${_kind}" = "pod" ]; then
    _label=${_name}
  else
    echo "Not getting logs for ${_kind} : ${_name}"
    kubectl get pods
    return 1
  fi

  _wait="kubectl wait --for=condition=Ready --timeout=600s pod ${_label}"
  echo ${_wait}
  eval ${_wait}
  echo "done"

  _pod="kubectl get pods ${_label} -o name | sed 's/pod\///'"
  _logs="kubectl logs -f $(eval $(echo ${_pod}))"
  echo ${_logs}
  eval ${_logs}
}
