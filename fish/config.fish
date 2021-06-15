alias c="clear"
alias ls="ls -f --color=auto"
alias apt="sudo apt"
alias ..="cd .."
alias wifioff="nmcli radio wifi off"
alias wifion="nmcli radio wifi on"
set -gx FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'
alias fanspeed="cat /proc/acpi/ibm/fan"

alias ssh="kitty +kitten ssh"

set -x VISUAL vim

# Start X at login
if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end
~/.fehbg &
