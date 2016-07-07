set -g -x PATH $HOME/bin $HOME/anaconda/bin /usr/local/bin $PATH /usr/X11/bin 
set -g -x TERM screen-256color

# Autojump settings
if test -e /usr/local/share/autojump/autojump.fish 
    . /usr/local/share/autojump/autojump.fish
end

# Virtualenv wrapper 
set -g VIRTUALFISH_COMPAT_ALIASES
. $HOME/.virtualfish/virtual.fish

# Alias
alias l='ls -lah'
