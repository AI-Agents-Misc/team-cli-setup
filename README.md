# Team CLI Setup

Modern CLI tools that make terminal life better.

## One-Line Install

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/AI-Agents-Misc/team-cli-setup/main/install.sh)"
```

Or clone and run:
```bash
git clone https://github.com/AI-Agents-Misc/team-cli-setup.git
cd team-cli-setup
./install.sh
```

## What Gets Installed

| Tool | Replaces | Why it's better |
|------|----------|-----------------|
| [eza](https://github.com/eza-community/eza) | `ls` | Colors, icons, git status, tree view |
| [bat](https://github.com/sharkdp/bat) | `cat` | Syntax highlighting, line numbers |
| [fd](https://github.com/sharkdp/fd) | `find` | Simpler syntax, faster, respects .gitignore |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | `grep` | Blazingly fast, respects .gitignore |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | `cd` | Learns your habits, jump with partial names |
| [fzf](https://github.com/junegunn/fzf) | - | Fuzzy finder for everything |
| [btop](https://github.com/aristocratos/btop) | `top` | Beautiful system monitor |
| [lazygit](https://github.com/jesseduffield/lazygit) | - | Terminal UI for git |
| [delta](https://github.com/dandavison/delta) | `diff` | Side-by-side diffs with syntax highlighting |
| [dust](https://github.com/bootandy/dust) | `du` | Visual disk usage |
| [procs](https://github.com/dalance/procs) | `ps` | Better process viewer |
| [jq](https://github.com/jqlang/jq) | - | JSON processor |

## Quick Reference

### File Navigation
```bash
ls              # List files (eza)
ll              # Long format
la              # Include hidden files
lt              # Tree view

z projects      # Jump to ~/Desktop/projects (or wherever you go most)
z api           # Jump to any directory with "api" in the path
```

### Searching
```bash
fd config           # Find files named "config"
fd -e js            # Find all .js files
rg "TODO"           # Search for "TODO" in all files
rg "function" -t js # Search only in JavaScript files
```

### Fuzzy Finding
```bash
Ctrl+R              # Fuzzy search command history
Ctrl+T              # Fuzzy find files
cd **<Tab>          # Fuzzy cd into directories
```

### Git
```bash
lazygit             # Open git UI (q to quit)
git diff            # Now shows side-by-side with syntax highlighting
```

### System
```bash
btop                # System monitor (q to quit)
dust                # Disk usage visualization
ps                  # Better process list
```

### Claude Code Cleanup

The install script also adds automatic cleanup for Claude Code processes:

- **On shell exit**: Kills Claude when you close a terminal tab (`setopt HUP`)
- **On shell startup**: Kills any orphaned Claude processes (detached from terminals)

This prevents the common issue of Claude processes accumulating in the background and eating up RAM.

## Uninstall

Remove the "Modern CLI Tools" section from your `~/.zshrc` and run:
```bash
brew uninstall eza bat fd ripgrep zoxide fzf btop lazygit git-delta dust procs jq
```
