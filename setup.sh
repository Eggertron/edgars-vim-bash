#!/bin/bash

# Install Pyenv 

## Install Pyenv dependencies
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ## Ubuntu
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl

elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install openssl readline sqlite3 xz zlib
fi

## Install Pyenv
curl https://pyenv.run | bash

## Configure Pyenv

### Install Python 3.8.5
pyenv install -v 3.8.5
pyenv global 3.8.5

# Install Powerline (Ubuntu Bash)
# from https://earlybyte.medium.com/powerline-for-bash-6d3dd004f6fc
pip3 install --user powerline-status
pip3 install powerline-gitstatus

cat << 'EOT' >> ~/.bashrc
# Add this to your PATH if it’s not already declared
export PATH=$PATH:$HOME/.local/bin

# Powerline configuration
if [ -f $HOME/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh ]; then
    $HOME/.local/bin/powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source $HOME/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh
fi
EOT

