# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.pre.bash"
## Alias command
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -A'
alias grep='grep --color=auto'
alias vim='lvim'
alias vi='vim'

#PATH
export PATH=$PATH:$HOME/.bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/go/bin:$HOME/Data/Projects/go/bin:$HOME/.roswell/bin:$HOME/.deno/bin

# Rustup
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rustup-static/rustup

proxy_on() {
	export all_proxy=http://127.0.0.1:$1
	export ALL_PROXY=http://127.0.0.1:$1
	export http_proxy=http://127.0.0.1:$1
	export https_proxy=http://127.0.0.1:$1
	git config --global http.proxy http://127.0.0.1:$1
	git config --global https.proxy http://127.0.0.1:$1
}

proxy_off() {
	unset all_proxy ALL_PROXY http_proxy https_proxy
	git config --global --unset http.proxy
	git config --global --unset https.proxy
}
ssh_on() {
    ssh root@104.244.77.141 -p 333
}

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.post.bash"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
