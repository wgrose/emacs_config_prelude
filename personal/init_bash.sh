export EDITOR=emacsclient
export HGMERGE=emacsclient

source $HOME/.emacs.d/personal/include_citc.sh

if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
  PS1='\u@$(hostname | sed s/.corp.google.com//):\w$(__git_ps1 "(%s)")$(citc_current_switch_client_ps1 "(%s)")\$ ' ;
else
  PS1='\u@$(hostname | sed s/.corp.google.com//):\w$ ' ;
fi
