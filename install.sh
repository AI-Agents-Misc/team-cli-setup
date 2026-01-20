#!/bin/bash

set -e

echo "Installing modern CLI tools..."

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install all the tools
echo "Installing tools via Homebrew..."
brew install eza bat fd ripgrep zoxide fzf btop lazygit git-delta dust procs jq

# Configure git to use delta
echo "Configuring git to use delta..."
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global merge.conflictstyle diff3
git config --global diff.colorMoved default

# Detect shell config file
if [ -f "$HOME/.zshrc" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
else
    SHELL_CONFIG="$HOME/.zshrc"
    touch "$SHELL_CONFIG"
fi

# Check if already installed
if grep -q "# === Modern CLI Tools ===" "$SHELL_CONFIG" 2>/dev/null; then
    echo "Shell config already contains modern CLI tools setup. Skipping..."
else
    echo "Adding aliases to $SHELL_CONFIG..."
    cat >> "$SHELL_CONFIG" << 'EOF'

# === Modern CLI Tools ===
# Installed via team-cli-setup

# Better ls
alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
alias lt='eza --tree'

# Better cat, find, du, ps
alias cat='bat'
alias find='fd'
alias du='dust'
alias ps='procs'

# Zoxide (smart cd - use 'z' to jump to directories)
eval "$(zoxide init zsh)"

# fzf shell integration (Ctrl+R for history, Ctrl+T for files)
source <(fzf --zsh)

# === End Modern CLI Tools ===
EOF
fi

echo ""
echo "Done! Restart your terminal or run: source $SHELL_CONFIG"
echo ""
echo "Quick reference:"
echo "  ls, ll, la, lt  - eza (better file listing)"
echo "  cat             - bat (syntax highlighting)"
echo "  find            - fd (simpler syntax)"
echo "  du              - dust (visual disk usage)"
echo "  ps              - procs (better process view)"
echo "  z <name>        - zoxide (smart directory jump)"
echo "  Ctrl+R          - fzf fuzzy history search"
echo "  Ctrl+T          - fzf fuzzy file finder"
echo "  lazygit         - terminal git UI"
echo "  btop            - system monitor"
echo "  rg <pattern>    - ripgrep (fast code search)"
