#!/bin/bash
#
# $Id$
#
# Citc PS1 utilities.

################################################################################
# This function outputs the switch client for use in your PS1. It returns 1 and
# outputs nothing if you're not in a switched citc client.
#
# Arguments:
#   $1: The printf pattern to output the switched client in with a "%s".
# Returns:
#   The switch client in the pattern or nothing.
#
# Usage:
# In your .bashrc set your PS1 to:
#  source ~/scripts/citc.sh
#  PS1='\u@$(hostname | sed s/.corp.google.com//):
#    \w$(citc_current_switch_client_ps1 "(%s)")\$ ';
################################################################################
function citc_current_switch_client_ps1 () {

  local printf_format="%s"
  if [ ! -z "$1" ]; then
     printf_format="$1"
  fi

  local citc_switch
  # Don't put command call in declaration or return code will be
  # from local.
  citc_switch="$(citctools info 2>/dev/null | grep Switch)"
  if (($? == 0)); then
    # Has switch line and is in google3 directory.
    local switch_client="${citc_switch/[^:]*: /}"
    printf ${printf_format} ${switch_client}
    return 0
  fi
  return 1
}
