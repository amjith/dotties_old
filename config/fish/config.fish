set -g -x PATH $HOME/.bin $HOME/Library/Python/2.7/bin  /usr/local/bin $PATH /usr/X11/bin 
set -g -x TERM screen-256color

set -g -x ERL_AFLAGS "-kernel shell_history enabled"
# stop creating pyc files.
set -g -x PYTHONDONTWRITEBYTECODE
set -g -x EDITOR /usr/loca/bin/nvim
set -g -x FLOW_CONFIG_PATH $HOME/netflix/flow_config/failover_config.json
set -g -x NETFLIX_ENVIRONMENT test

if test -e $HOME/.config/fish/env.fish
    . $HOME/.config/fish/env.fish
end

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
