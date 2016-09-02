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

# Sauce lab creds
set -g -x JIL_SAUCE_LABS_USERNAME bam_dev
set -g -x JIL_SAUCE_LABS_ACCESS_KEY 291fc8ed-7260-4d82-bc4c-fb2cb139f673


test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
