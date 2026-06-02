# zprofile — environment for login shells (symlinked to ~/.zprofile)
#
# This runs once per login shell, before ~/.zshrc. Put PATH / environment here;
# put interactive things (aliases, prompt, functions) in zshrc.

# Personal bin first, then whatever /etc/zprofile (path_helper) already set up.
export PATH="$HOME/bin:$PATH"

# Homebrew — works on Apple Silicon (/opt/homebrew) and Intel (/usr/local).
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi
