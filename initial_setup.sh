#!/bin/bash

# Install Homebrew if not installed
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    if ! /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        echo "Failed to install Homebrew. Please check your internet connection or try again manually."
        exit 1
    fi
fi

# Update Homebrew
brew update

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install plugins and tools with Homebrew
echo "Installing plugins and tools with Homebrew..."
if ! brew list zsh-syntax-highlighting &>/dev/null; then
    brew install zsh-syntax-highlighting
fi

if ! brew list zsh-autosuggestions &>/dev/null; then
    brew install zsh-autosuggestions
fi

if ! brew list zsh-git-prompt &>/dev/null; then
    brew install zsh-git-prompt
fi

if ! brew list tesseract &>/dev/null; then
    brew install tesseract
fi

# Install the latest version of NVM
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing the latest version of NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

    # Load NVM and check version
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    echo "NVM version: $(nvm --version)"
fi

echo "Setup complete! Please restart your terminal or source your .zshrc file to apply the changes."
