# NMAAHC custom zshrc and associated files

A small, self-contained zsh setup. Four files, symlinked into your home directory:

| repo file         | symlinked to            | purpose                                  |
|-------------------|-------------------------|------------------------------------------|
| `zprofile`        | `~/.zprofile`           | `PATH` / Homebrew, for login shells      |
| `zshrc`           | `~/.zshrc`              | prompt, history, sources the two below   |
| `zshrc_alias`     | `~/.zshrc_alias`        | aliases                                  |
| `zshrc_functions` | `~/.zshrc_functions`    | functions                                |

`bootstrap.sh` creates the symlinks for you.

## Install

1. **Confirm zsh is your default shell.**
   - Run `echo $0` — it should print `-zsh`.
   - If not: `chsh -s /bin/zsh`, then open a new terminal and check again.

2. **Fork** https://github.com/NMAAHC/zshrc into your own GitHub account.

3. **Clone your fork.** It can live anywhere; the convention is
   `$HOME/github/<your-github-username>`:

   ```sh
   mkdir -p "$HOME/github/<your-github-username>"
   cd "$HOME/github/<your-github-username>"
   git clone https://github.com/<your-github-username>/zshrc
   cd zshrc
   ```

4. **Run the bootstrap script:**

   ```sh
   ./bootstrap.sh
   ```

   It symlinks the four files above into `$HOME`. If you already have any of
   them as real files, they're backed up to `*.bak` first. The script locates
   the repo on its own, so the clone path doesn't matter.

5. **Open a new terminal** (or run `exec zsh -l`). Done.

## Verify

- `echo $PATH` includes `/opt/homebrew/bin` (Apple Silicon) or `/usr/local/bin` (Intel).
- `ls -lahG ~` shows the four symlinks pointing back into your repo:

![what the zsh symlinks should look like](https://raw.githubusercontent.com/NMAAHC/zshrc/main/zsh_symlinks.png)

## Using it

A few examples — see `zshrc_alias` and `zshrc_functions` for the full list, and
add your own there:

- `ll`          → `command ls -lahG`
- `treeL`       → `tree -RapugD --si --du`
- `rsyncDAMS …` → `rsync -avvPhi --no-p --stats …`

Your terminal will look like this (with your own user name):

![what your terminal will look like](https://raw.githubusercontent.com/NMAAHC/zshrc/main/terminal.png)
