alias fucknode="rm -rf node_modules/ && rm package-lock.json && npm install"
alias ls="ls -laG"
alias l="ls"
alias vim="nvim"
alias ..="cd .."
alias tmux='tmux -u'
alias dc='docker-compose'
alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ."
alias ghl="~/scripts/githubfilelink.sh"
alias copy "pbcopy"
alias paste "pbpaste"
alias cls "clear"
alias pull "git fetch && git rebase"
alias fun "fortune -s 25% linuxcookie 25% computers 25% riddles 25% definitions | cowsay -f small | lolcat"

set -x VISUAL vim
set -gx FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'
set -g fish_user_paths "/usr/local/opt/apr/bin" $fish_user_paths
set -x LANG C
set -x LC_CTYPE C

fish_vi_key_bindings
#fish_add_path /usr/local/opt/php@7.4/bin
#fish_add_path /usr/local/opt/php@7.4/sbin
status --is-interactive; and rbenv init - fish | source

fzf_configure_bindings --directory=\cf
set -gx $EDITOR "vim" # or "vim", or "code", etc.
# Ctrl-o will open the selected file/directory in your editor of choice.
set fzf_dir_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

export TERM=screen-256color
#fish_add_path /opt/homebrew/opt/node@16/bin

#set fish_greeting
function fish_greeting
  # fortune -s 25% linuxcookie 25% computers 25% riddles 25% definitions | cowsay -f small | lolcat
end

# function fish_prompt
#   printf '%s %s%s%s \n> ' $USER \
#         (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
# end

# function fish_right_prompt -d "Write out the right prompt"
# 	fish_weather_icon & 
# 	echo $__fish_weather_icon
#     date '+%m/%d/%y'
# end
