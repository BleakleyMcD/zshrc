MYNAME='NMAAHC Time-based Media Preservation'
export MYNAME

# ls colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

autoload -U colors
colors
bold=$(tput bold)

# Keep PATH free of repeats. zshrc adds folders to PATH, so every shell started
# from another shell (e.g. a VSCodium terminal) would otherwise add them again.
# Both names are needed: with only `path`, `export PATH=...` lines still repeat.
typeset -U path PATH

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
# zsh can only save what it holds in memory, so SAVEHIST shouldn't be larger than HISTSIZE
export HISTSIZE=50000
export SAVEHIST=50000
setopt EXTENDED_HISTORY          # timestamp each entry
setopt SHARE_HISTORY             # flush+reload every prompt so concurrent shells share history
setopt HIST_IGNORE_DUPS          # skip duplicate consecutive commands
setopt HIST_IGNORE_SPACE         # skip commands starting with a space
setopt HIST_REDUCE_BLANKS        # trim extra whitespace
setopt HIST_VERIFY               # show expanded !! before running
export HISTORY_IGNORE="(history|h|hh|hhh|pwd|exit|df|ls|ls -la|ll)"

setopt extended_glob
setopt INTERACTIVE_COMMENTS      # treat # as a comment in typed/pasted commands, like bash


# conda, if Anaconda or Miniconda is installed in one of the usual places; otherwise nothing.
# This replaces the block that `conda init` writes. Don't run `conda init zsh`: it would write
# its own block back into this file (through the ~/.zshrc link), so conda would be set up twice.
for _conda in /opt/homebrew/anaconda3 /usr/local/anaconda3 "$HOME/anaconda3" "$HOME/miniconda3"; do
	if [ -x "$_conda/bin/conda" ]; then
		eval "$("$_conda/bin/conda" shell.zsh hook 2>/dev/null)"
		break
	fi
done
unset _conda

# Homebrew's Ruby, and the commands its gems install (e.g. jekyll), ahead of macOS's own Ruby.
# The gems folder is named after Ruby's version (4.0.0, ...), so pick the newest one instead of
# hard-coding it. (N) leaves out folders that don't exist, so without Homebrew Ruby nothing is added.
path=(${HOMEBREW_PREFIX:-/opt/homebrew}/opt/ruby/bin(N) ${HOMEBREW_PREFIX:-/opt/homebrew}/lib/ruby/gems/*/bin(Nn[-1]) $path)
[ -f ~/github/jpc/aspace_jpc_av/jpc-shell-hint.zsh ] && source ~/github/jpc/aspace_jpc_av/jpc-shell-hint.zsh
