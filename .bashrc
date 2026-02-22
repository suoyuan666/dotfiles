#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSIZE=60
export LC_ALL=en_US.UTF-8

export EDITOR=/usr/bin/nvim

proxyoff() {
  unset http_proxy https_proxy all_proxy no_proxy
}

function fw_open() {
    local port=$1
    local zone=${2:-public}

    if [ -z "$port" ]; then
        echo "usage: fw_open <port> [zone]"
        return 1
    fi

    sudo-rs firewall-cmd --zone="$zone" --add-port="$port"/tcp
    sudo-rs firewall-cmd --zone="$zone" --add-port="$port"/udp
}

function fw_close() {
    local port=$1
    local zone=${2:-public}

    if [ -z "$port" ]; then
        echo "usage: fw_close <port> [zone]"
        return 1
    fi

    sudo-rs firewall-cmd --zone="$zone" --remove-port="$port"/tcp
    sudo-rs firewall-cmd --zone="$zone" --remove-port="$port"/udp
}

alias sudo='sudo-rs'
alias sudoedit='sudoedit-rs'
complete -F _sudo sudo-rs

# for doas
# alias sudo='doas'
# # alias sudoedit='doas rnano'
# complete -cf doas
# complete -F _command doas
#
# function sudoedit() {
#     [ -z "$1" ] && { echo "usage: sudoedit <file>"; return 1; }
#
#     local target="$1"
#     local filename=$(basename "$target")
#     local extension=""
#
#     if [[ "$filename" == *.* && "$filename" != .* ]]; then
#         extension=".${filename##*.}"
#     fi
#
#     local tempfile=$(mktemp --suffix="$extension" /tmp/doasedit.XXXXXX)
#
#     if [ -f "$target" ]; then
#         cat "$target" > "$tempfile"
#         chmod $(stat -c %a "$target") "$tempfile"
#     fi
#
#     ${EDITOR:-rnano} "$tempfile"
#
#     if ! cmp -s "$target" "$tempfile" 2>/dev/null; then
#         echo "save to $target..."
#         doas cp "$tempfile" "$target"
#     else
#         echo "$target has not been modified"
#     fi
#
#     rm -f "$tempfile"
# }

export CC="clang"
export CPP="clang-cpp" # necessary for xorg-server and possibly other packages
export CXX="clang++"
export AR="llvm-ar"
export NM="llvm-nm"
export RANLIB="llvm-ranlib"

export GPG_TTY=$(tty)

export PATH="$PATH:$HOME/.cargo/bin"
# export PATH="$HOME/.bin/bin/:$PATH"
# export LD_LIBRARY_PATH="$HOME/.bin/lib/:$LD_LIBRARY_PATH"

eval "$(starship init bash)"
alias ll='ls -l'
