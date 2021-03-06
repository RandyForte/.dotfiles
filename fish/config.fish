alias c="clear"
alias ls="ls -f"
alias apt="sudo apt"
alias ..="cd .."
alias wifioff="nmcli radio wifi off"
alias wifion="nmcli radio wifi on"
alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ."
set -gx FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'
alias fanspeed="cat /proc/acpi/ibm/fan"
alias tmux="tmux -u"

#alias ssh="kitty +kitten ssh"

set -x VISUAL vim

# Start X at login
# if status --is-interactive
#   if test -z "$DISPLAY" -a $XDG_VTNR = 1
#     exec startx -- -keeptty
#   end
# end
# ~/.fehbg &
alias copy "pbcopy"
alias paste "pbpaste"
set -gx FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'
set -g fish_user_paths "/usr/local/opt/node@14/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/node@14/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/apr/bin" $fish_user_paths
set -x LANG C
set -x LC_CTYPE C
fish_vi_key_bindings
fish_add_path /usr/local/opt/php@7.4/bin
fish_add_path /usr/local/opt/php@7.4/sbin

export TERM=screen-256color
