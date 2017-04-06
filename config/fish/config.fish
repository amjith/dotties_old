set -g -x PATH $HOME/.bin /usr/local/bin $PATH /usr/X11/bin 
set -g -x TERM screen-256color

# Autojump settings
if test -e /usr/local/share/autojump/autojump.fish 
    . /usr/local/share/autojump/autojump.fish
else if test -e /usr/share/autojump/autojump.fish
    . /usr/share/autojump/autojump.fish
end

# Virtualenv wrapper 
set -g VIRTUALFISH_COMPAT_ALIASES
. $HOME/.virtualfish/virtual.fish

# Aliases
alias l='ls -lah'

switch (uname)
    case Linux
        alias pbcopy 'xsel --clipboard --input'
        alias pbpaste 'xsel --clipboard --output'
end
