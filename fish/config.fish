
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
set -gx ANDROID_NDK_HOME /Users/christianbelloni/Library/Android/sdk/ndk/28.2.13676358
fish_add_path /usr/local/bin
# fish_add_path $ANDROID_HOME/platform-tools
fish_add_path /Users/christianbelloni/.local/bin

fish_add_path /Users/christianbelloni/flutter/bin

# set -gx AWS_ACCESS_KEY_ID 12aUiLNQHDVfbgPv4Hv6
# set -gx AWS_SECRET_ACCESS_KEY jX3GwZsvERPVa5spKPUft9QKyyuYpk2dYXOqPQ4L
# set -gx SCCACHE_BUCKET sccache
# set -gx SCCACHE_REGION auto
# set -gx SCCACHE_ENDPOINT s3.babyloncloud.com:8081
# set -gx SCCACHE_S3_USE_SSL false
# set -gx RUSTC_WRAPPER $(which sccache)
# set -gx SCCACHE_S3_USE_SSL false

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/christianbelloni/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/christianbelloni/Downloads/google-cloud-sdk/path.fish.inc'; end
