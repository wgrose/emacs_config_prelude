#!/bin/sh
SCRIPT_PATH=`realpath $(dirname $0)`
rm ~/.emacs.d/prelude-modules.el
ln -s $SCRIPT_PATH/prelude-modules.el ~/.emacs.d/prelude-modules.el
if [[ -d ~/.emacs.d/personal ]]; then
  rm -rf ~/.emacs.d/personal
elif [[ -h ~/.emacs.d/personal ]]; then
  rm -f ~/.emacs.d/personal
fi

ln -s $SCRIPT_PATH/personal/ ~/.emacs.d/personal

profile_file="$HOME/.bashrc"
if ! grep -q '.emacs.d/personal/init_bash.sh' "${profile_file}" ; then
  echo "source \"$HOME/.emacs.d/personal/init_bash.sh\"" >> "${profile_file}"
fi
