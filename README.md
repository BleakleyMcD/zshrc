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

## Aliases

Defined in `zshrc_alias`. Add your own there.

### Navigation & listing

| alias  | runs                 | what it does                                            |
|--------|----------------------|---------------------------------------------------------|
| `ll`   | `command ls -lahG`   | long listing: all files, human-readable sizes, colorized |
| `ls`   | `ls -1`              | one entry per line                                      |
| `home` | `cd ~`               | go to your home directory                               |
| `up`   | `cd ..`              | go up one directory                                     |
| `h`    | `history`            | show command history                                    |

### Handier defaults

| alias    | runs                                              | what it does                                          |
|----------|---------------------------------------------------|-------------------------------------------------------|
| `df`     | `df -h`                                            | disk free, human-readable sizes                       |
| `du`     | `du -h`                                            | disk usage, human-readable sizes                      |
| `mkdir`  | `mkdir -p`                                         | make a directory, creating parent directories as needed |
| `diffy`  | `diff -y --suppress-common-lines --width=250`     | side-by-side diff showing only the differences        |
| `treeL`  | `tree -RapugD --si --du`                          | recursive tree with permissions, owner/group, dates, and directory sizes |

### macOS / Finder

| alias        | runs                                                                 | what it does                          |
|--------------|----------------------------------------------------------------------|---------------------------------------|
| `showFiles`  | `defaults write com.apple.finder AppleShowAllFiles YES; killall Finder` | show hidden files in Finder           |
| `hideFiles`  | `defaults write com.apple.finder AppleShowAllFiles NO; killall Finder`  | hide hidden files in Finder           |

### Homebrew

| alias    | runs                                                  | what it does                                       |
|----------|-------------------------------------------------------|----------------------------------------------------|
| `brewUp` | `brew update && brew upgrade && brew doctor && brew cleanup` | full Homebrew maintenance pass               |

### Git

| alias  | runs                | what it does                          |
|--------|---------------------|---------------------------------------|
| `ga`   | `git add`           | stage specific files                  |
| `gaa`  | `git add --all`     | stage everything                      |
| `gc`   | `git commit`        | commit staged changes                 |
| `gca`  | `git commit --all`  | stage tracked changes and commit      |
| `gst`  | `git status`        | show working-tree status              |

### Open apps

| alias  | runs                  | what it does                  |
|--------|-----------------------|-------------------------------|
| `text` | `open -a textedit`    | open in TextEdit              |
| `code` | `open -a VSCodium`    | open in VSCodium              |

## Functions

Defined in `zshrc_functions`. Add your own there.

### Maintenance

| function        | what it does                                            |
|-----------------|---------------------------------------------------------|
| `nmaahcmm`      | `brew reinstall nmaahcmm` — reinstall the nmaahcmm tools |
| `nmaahczshrc`   | `brew reinstall zshrc` — reinstall this zsh config via Homebrew |

### Files & directories

| function              | what it does                                                                 |
|-----------------------|------------------------------------------------------------------------------|
| `makedirfile`         | for each file with an extension in the current directory, make a folder named after the file (minus extension) |
| `removehidden <dir>`  | remove hidden files/folders inside `<dir>` (leaves `<dir>` itself in place)   |
| `sortk2 <file>`       | sort `<file>` in place by the second space-separated column                   |

### rsync transfers

All use `-avvPhi --stats` (archive, very verbose, progress + resume, human-readable, itemized changes, summary stats).

| function           | what it does                                                                     |
|--------------------|----------------------------------------------------------------------------------|
| `rsyncDAMS <args>` | transfer for DAMS uploads — adds `--no-p` (don't preserve permissions)            |
| `rsyncT <args>`    | general transfer                                                                  |
| `rsyncD <args>`    | transfer then delete the source files (a move) via `--remove-source-files`        |

Arguments are passed straight through to `rsync`, e.g. `rsyncT /src/ /dest/`.

### Media

| function             | what it does                                                                      |
|----------------------|-----------------------------------------------------------------------------------|
| `shortinfo <file…>`  | `mediainfo` summary: filename, file size, duration, then width/height/codec       |

> Needs `mediainfo` (and `removehidden`/`sortk2` print via `cowsay`) — install with Homebrew if missing: `brew install mediainfo cowsay`.

## Terminal

Your terminal will look like this (with your own user name):

![what your terminal will look like](https://raw.githubusercontent.com/NMAAHC/zshrc/main/terminal.png)
