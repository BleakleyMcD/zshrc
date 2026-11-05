# NMAAHC zsh setup

The shell setup we use on the media lab Macs: a welcome banner and prompt, history settings,
and the aliases and functions we use every day. It's four files that get linked into your
home folder:

| file in this repo | linked to             | what it holds                                                  |
|-------------------|-----------------------|----------------------------------------------------------------|
| `zprofile`        | `~/.zprofile`         | PATH and Homebrew; runs once when a Terminal window opens       |
| `zshrc`           | `~/.zshrc`            | banner, prompt, history, PATH extras; loads the two files below |
| `zshrc_alias`     | `~/.zshrc_alias`      | aliases                                                        |
| `zshrc_functions` | `~/.zshrc_functions`  | functions                                                      |

`bootstrap.sh` makes the links for you.

## Install

1. **Check that zsh is your shell.** Run `echo $0`. It should print `-zsh`.
   If it doesn't, run `chsh -s /bin/zsh`, open a new Terminal window and check again.

2. **Fork** https://github.com/NMAAHC/zshrc into your own GitHub account.

3. **Clone your fork.** It can go anywhere; we use `~/github/<your-github-username>`:

   ```sh
   mkdir -p ~/github/<your-github-username>
   cd ~/github/<your-github-username>
   git clone https://github.com/<your-github-username>/zshrc
   cd zshrc
   ```

4. **Run the bootstrap script:**

   ```sh
   ./bootstrap.sh
   ```

   It links the four files into your home folder. If you already have any of them as
   ordinary files, it renames those to `.bak` first (for example `~/.zprofile.bak`),
   so nothing is lost.

5. **Open a new Terminal window**, or run `exec zsh -l`.

Your shell now reads these files straight from your clone. Edit a file there, open a new
window, and the change is live. It also means that whichever branch is checked out in your
clone is the setup you're running.

## Check that it worked

The four files in your home folder should be links into your clone:

```
ls -l ~/.zprofile ~/.zshrc ~/.zshrc_alias ~/.zshrc_functions
```

```
lrwxr-xr-x  1 you  staff  49 Nov  4 17:17 /Users/you/.zprofile -> /Users/you/github/<your-github-username>/zshrc/zprofile
lrwxr-xr-x  1 you  staff  46 Nov  4 17:17 /Users/you/.zshrc -> /Users/you/github/<your-github-username>/zshrc/zshrc
lrwxr-xr-x  1 you  staff  52 Nov  4 17:17 /Users/you/.zshrc_alias -> /Users/you/github/<your-github-username>/zshrc/zshrc_alias
lrwxr-xr-x  1 you  staff  56 Nov  4 17:17 /Users/you/.zshrc_functions -> /Users/you/github/<your-github-username>/zshrc/zshrc_functions
```

Each line starts with `l` (a link) and points into your clone. And `brew --version` should
work, which shows Homebrew is on your PATH.

## What a new Terminal window looks like

```

Welcome to NMAAHC Time-based Media Preservation!
The Home of TBM Archiving, Conservation & Restoration
Be All That You Can Be Today!
Let's Go!

/Users/you
≈:≈
```

The four welcome lines are bold yellow, blue, white and red. The prompt is two lines: the
full path of the folder you're in, in bold yellow, then a bold cyan `≈:≈` where you type. There's
a blank line before every prompt. If you use conda, the active environment shows in front
of the path, for example `(base) /Users/you`.

## What the files set up

**`zprofile`** (once per Terminal window)
- Puts Homebrew on your PATH, on Apple Silicon (`/opt/homebrew`) and Intel (`/usr/local`) Macs.
- Adds `~/bin` to your PATH, for your own scripts.

**`zshrc`** (every new shell)
- The welcome banner and the prompt shown above.
- PATH extras:
  - Homebrew's Ruby and the commands its gems install (such as `jekyll`), but only if Homebrew
    Ruby is installed. Any Ruby version works.
  - No folder is listed twice, even in a shell started from another shell.
- History:
  - remembers your last 50,000 commands;
  - shared between open windows as you go, with the time each command was run;
  - skips a command repeated right after itself, and any command you start with a space;
  - never saves `history`, `h`, `hh`, `hhh`, `pwd`, `exit`, `df`, `ls`, `ls -la` or `ll`.
- Tab completion for commands and their options.
- `#` starts a comment in commands you type or paste, as in bash.
- `nano` is the editor that other programs open (`EDITOR`).
- `less` shows line numbers and how far through the file you are.
- conda, if Anaconda or Miniconda is installed in `/opt/homebrew/anaconda3`, `/usr/local/anaconda3`,
  `~/anaconda3` or `~/miniconda3`. Don't run `conda init zsh`: this file already sets conda up,
  and `conda init` would write a second setup into it (through the `~/.zshrc` link), which then
  shows up as a change in your clone.
- If `~/github/jpc/aspace_jpc_av` is checked out, its JPC shell hint.

**Forgot a shortcut?** Type `cheat` to list every alias (with what it runs) and every
function (with a one-line description) in your Terminal.

## Aliases

In `zshrc_alias`. Add your own there.

### Moving around and listing

| alias  | runs                 | what it does                                             |
|--------|----------------------|----------------------------------------------------------|
| `ll`   | `command ls -lahG`   | long listing: all files, readable sizes, in color        |
| `ls`   | `ls -1`              | one entry per line                                       |
| `lt`   | `command ls -lht`    | long listing, newest first                               |
| `lS`   | `command ls -lhS`    | long listing, biggest first                              |
| `dus`  | `du -sh * \| sort -h` | size of each item in this folder, smallest to largest (hidden items not included) |
| `home` | `cd ~`               | go to your home folder                                   |
| `up`   | `cd ..`              | go up one folder                                         |
| `..`   | `cd ..`              | go up one folder                                         |
| `...`  | `cd ../..`           | go up two folders                                        |
| `h`    | `history -25`        | show the last 25 commands                                |
| `hh`   | `history -50`        | show the last 50 commands                                |
| `hhh`  | `history -100`       | show the last 100 commands                               |

### The shell itself

| alias       | runs                          | what it does                                                        |
|-------------|-------------------------------|---------------------------------------------------------------------|
| `path`      | `print -l $path`              | list the folders on your PATH, one per line                         |
| `reload`    | `exec zsh`                    | restart the shell in this window, so edits to these files take effect |
| `zshconfig` | `code <your zshrc clone>`     | open this repo in VSCodium, wherever you cloned it                  |
| `localip`   | `ipconfig getifaddr en0`      | this Mac's network address (on its first network port, `en0`)      |

### Handier defaults

`df`, `du` and `mkdir` keep their names but get better defaults, so these take effect
whenever you type the ordinary command.

| alias    | runs                                              | what it does                                            |
|----------|---------------------------------------------------|---------------------------------------------------------|
| `df`     | `df -h`                                           | free disk space, in readable sizes (`1.2G`)             |
| `du`     | `du -h`                                           | disk usage, in readable sizes                           |
| `mkdir`  | `mkdir -p`                                        | make a folder, creating any missing folders above it    |
| `diffy`  | `diff -y --suppress-common-lines --width=250`     | side-by-side comparison showing only the lines that differ |
| `treeL`  | `tree -apugD --si --du`                           | full folder tree with permissions, owner, group, dates and folder sizes |

### macOS and Finder

| alias        | runs                                                                    | what it does                     |
|--------------|-------------------------------------------------------------------------|----------------------------------|
| `showFiles`  | `defaults write com.apple.finder AppleShowAllFiles YES; killall Finder` | show hidden files in Finder      |
| `hideFiles`  | `defaults write com.apple.finder AppleShowAllFiles NO; killall Finder`  | hide them again                  |

### Homebrew

| alias    | runs                                                     | what it does                                                       |
|----------|----------------------------------------------------------|--------------------------------------------------------------------|
| `brewUp` | `brew update && brew upgrade; brew doctor; brew cleanup` | update and upgrade everything, check for problems, clear old files |
| `nmaahcmm` | `brew reinstall nmaahcmm`                              | reinstall the nmaahcmm scripts (needs the `nmaahc/nmaahcmm` tap)   |

`brew doctor` reports an error whenever it has a warning, so the steps after it are joined
with `;` to make sure `brew cleanup` still runs.

### Git

| alias  | runs                | what it does                                |
|--------|---------------------|---------------------------------------------|
| `ga`   | `git add`           | stage the files you name                    |
| `gaa`  | `git add --all`     | stage everything                            |
| `gc`   | `git commit`        | commit what's staged                        |
| `gca`  | `git commit --all`  | stage every changed tracked file and commit |
| `gst`  | `git status`        | show what's changed                         |
| `gd`   | `git diff`          | show the changes line by line               |
| `glog` | `git log --oneline --graph --decorate` | history, one line per commit, with branches drawn |

### Opening apps

| alias  | runs                  | what it does         |
|--------|-----------------------|----------------------|
| `text` | `open -a textedit`    | open in TextEdit     |
| `code` | `open -a VSCodium`    | open in VSCodium     |

## Functions

In `zshrc_functions`. Add your own there. `cheat` shows the first line of the comment above
each function, so start that comment with a short description.

| function | what it does |
|----------|--------------|
| `cheat`  | lists all the aliases and functions in these files |

### Files and folders

| function             | what it does |
|----------------------|--------------|
| `removehidden <dir>` | deletes the hidden files and folders (names starting with `.`) inside `<dir>`, at every level. `<dir>` itself stays, even if its own name starts with a dot. |
| `sortk2 <file>`      | sorts `<file>` in place by its second column onward, with columns separated by spaces. Handy for a checksum list (`hash  filename`) sorted by filename. |
| `ff <text> [folder]` | lists every file and folder whose name contains `<text>` (upper or lower case doesn't matter), in this folder and every folder below it, however deep. Give a folder to search there instead: `ff 2018_37 /Volumes/archive`. |

### Sharing a folder

| function       | what it does |
|----------------|--------------|
| `serve [port]` | shares the current folder as a web page until you press Ctrl-C. It prints the address to open, e.g. `http://192.168.1.50:8000/`. **Anyone on the network can browse and download the folder's files while it runs.** The port is 8000 unless you give another: `serve 9000`. |

### rsync transfers

| function           | what it does |
|--------------------|--------------|
| `rsyncT <args>`    | general copy |
| `rsyncDAMS <args>` | copy to the DAMS shares and similar; adds `--no-p` so rsync doesn't try to copy permissions the share can't store |
| `rsyncD <args>`    | copy, then delete each source file once it has arrived (a move) |

What you type after the name goes straight to rsync, e.g. `rsyncT /Volumes/drive/folder/ /Volumes/archive/folder/`.

All three run `rsync -avvhi --progress --stats`: archive mode, very verbose, readable sizes,
a line for each changed file, progress for each file, and a summary at the end.

They keep the Mac from falling asleep while the copy runs (`caffeinate -i`). It can still
sleep if someone chooses Sleep or closes a laptop's lid.

They also print how long the copy took, even if you stop it with Ctrl-C:

```
Transfer time: 1:02.05
```

That's 1 minute 2.05 seconds; hours show as `1:02:05.00`. The time goes to the screen, not
into the output, so to keep it in a log, send both into the file:
`rsyncT src/ dst/ 2>&1 | tee copy.log`.

They use `--progress` rather than `-P` on purpose. `-P` also turns on `--partial`, which,
if a copy is interrupted, leaves a cut-off file under its real name at the destination.
Without it, rsync throws its unfinished temporary file away, so every file under its real
name is complete. To finish an interrupted copy, run the same command again.

## What else you need

Install these with Homebrew if you don't have them:

```sh
brew install cowsay tree rsync
```

- `cowsay` for the messages from `removehidden` and `sortk2`
- `tree` for `treeL`
- `rsync` for the rsync functions. macOS's built-in rsync (openrsync) also accepts these
  options, but the Homebrew one is what we use.

## Making changes

Edit the files in your clone. Open a new Terminal window to try them out.

To share a change with everyone, make it on a branch in your fork, merge it into your
fork's `main`, then open a pull request from your fork to `NMAAHC/zshrc`.
