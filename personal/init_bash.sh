export EDITOR=emacsclient
export HGMERGE=emacsclient

source $HOME/.emacs.d/personal/include_citc.sh
if [ -f $HOME/.bash_aliases ]; then
  source $HOME/.bash_aliases
fi
TRUNCATED_HOSTNAME=$(hostname | sed "s/\(\.corp\.google\.com\|\.googlers\.com\)//")
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
  PS1='\u@${TRUNCATED_HOSTNAME}:\w$(__git_ps1 "(%s)")$(citc_current_switch_client_ps1 "(%s)")\$ ';
fi

### Get current branch in hg repo
###   Requires hg-prompt extension (included in .config/hg/hg-prompt
###   See details: https://www.mercurial-scm.org/wiki/PromptExtension
##function parse_hg_branch() {
##  BRANCH=`hg prompt "{branch}{:{bookmark}}{status}" 2> /dev/null`
##  if [ ! "${BRANCH}" == "" ]; then
##    # Branch exists
##    echo "(${BRANCH})"
##  else
##    echo ""
##  fi
##}
##export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[34m\]\h\[\e[m\]:\[\e[36m\]\W\[\e[m\]\[\e[32m\]\`parse_hg_branch\`\[\e[m\] \\$ "
##
