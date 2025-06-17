
eval "$(/opt/homebrew/bin/brew shellenv)"

if status is-interactive
end

function cbzl
    cd ~/work/Client
end

function work
    cd ~/work/Client && tmux
end

function side
    cd ~/side
end

function pmd
    pandoc -s $argv[1].md -o $argv[1].pdf -V colorlinks=true -V linkcolor=blue -V urlcolor=blue -V toccolor=gray
end

function git_work
    gh auth logout
    git config --global user.email "christian.belloni@babyloncloud.com"
    gh auth login
end

function git_side
    gh auth logout
    git config --global user.email "christianbelloni@hotmail.com"
    gh auth login
end

# alias nvim="lvim"

set -gx ANDROID_HOME /Users/christianbelloni/Library/Android/sdk
set -gx ANDROID_NDK_HOME /Users/christianbelloni/Library/Android/sdk/ndk/27.0.11718014
fish_add_path /usr/local/bin
# fish_add_path $ANDROID_HOME/platform-tools
fish_add_path /Users/christianbelloni/.local/bin

fish_add_path /Users/christianbelloni/flutter/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/christianbelloni/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/christianbelloni/Downloads/google-cloud-sdk/path.fish.inc'; end
