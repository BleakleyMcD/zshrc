MYNAME='NMAAHC Time-based Media Preservation'
export MYNAME

# ls colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

autoload -U colors
colors
bold=$(tput bold)

if [ -f ~/.zshrc_alias ]; then
source ~/.zshrc_alias
fi

if [ -f ~/.zshrc_functions ]; then
source ~/.zshrc_functions
fi

autoload -Uz compinit && compinit

echo " "
echo $fg[yellow]${bold}Welcome to ${MYNAME}!
echo $fg[blue]The Home of 'TBM Archiving, Conservation & Restoration'
echo $fg[white]Be All That You Can Be Today!
echo $fg[red]Let\'s Go!

precmd() { print "" }
PROMPT='%F{yellow}%B%d%f
%F{cyan}≈:≈%f%b '

export LESS='-MN'

export EDITOR="nano"
export VISUAL="$EDITOR"

# history modifications
export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=100000
setopt EXTENDED_HISTORY          # timestamp each entry
setopt SHARE_HISTORY             # flush+reload every prompt so concurrent shells share history
setopt HIST_IGNORE_DUPS          # skip duplicate consecutive commands
setopt HIST_IGNORE_SPACE         # skip commands starting with a space
setopt HIST_REDUCE_BLANKS        # trim extra whitespace
setopt HIST_VERIFY               # show expanded !! before running
export HISTORY_IGNORE="(history|pwd|exit|df|ls|ls -la|ll)"

setopt extended_glob


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/4.0.0/bin:$PATH"
