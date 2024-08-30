# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.pre.bash"
## Alias command
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -A'
alias grep='grep --color=auto'
alias vim='nvim'
alias vi='vim'
alias ssh='TERM=xterm-256color ssh'

#PATH
export PATH=$PATH:$HOME/.bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/go/bin:$HOME/Data/code/go/bin:$HOME/.roswell/bin:$HOME/.deno/bin:/usr/bin/core_perl:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.pub-cache/bin:/usr/lib/dart/bin:/run/user/1000/fnm_multishells/61116_1682314705167/bin

# FNM
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_MULTISHELL_PATH="/run/user/1000/fnm_multishells/29113_1682261197986"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/home/sakunia/.local/share/fnm"
export FNM_ARCH="x64"
export FNM_LOGLEVEL="info"
eval "$(fnm env --use-on-cd)"

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
    ssh -X root@104.244.77.141 -p 333
}

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.post.bash"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias sudo='doas'
alias sudoedit='doas nvim'

## Upload file
upload() {
  token=`cat $HOME/.clipboard.token`
  if [[ $? != 0 ]]; then
    echo "token配置文件'${HOME}/.clipboard.token'不存在"
    return
  fi
  if [ -z $1 ]; then
    echo "请传入文件路径"
    return
  fi
  cat $1 | curl https://clipboard.sakura1943.top:8800/api/document/upload -F "file=@-" -H "token: ${token}" 
}
