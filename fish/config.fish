
eval "$(/opt/homebrew/bin/brew shellenv)"

if status is-interactive
end

function cbzl
    cd ~/work/Client
end

function side
    cd ~/side
end

set -gx ANDROID_HOME /Users/christianbelloni/Library/Android/sdk
set -gx ANDROID_NDK_HOME /Users/christianbelloni/Library/Android/sdk/ndk/26.2.11394342
fish_add_path /usr/local/bin
