if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux"
    sudo apt update
    sudo apt upgrade -y
    sudo apt install youtube-dl -y
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "mac"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install firefox
fi

if [ -n "$ZSH_VERSION" ]; then
   echo "zsh"
   mkdir ~/.utility
   cp zsh/.zshrc ~
   cp zsh ~/.utility/shortcuts
   source ~/.zshrc
   reload
elif [ -n "$BASH_VERSION" ]; then
   echo "Bash"
   touch ~/.hushlogin
   cp bash/.bash_aliases ~
   cat bash/prompt.bash >> ~/.bashrc
   source ~/.bashrc
   reload
fi
