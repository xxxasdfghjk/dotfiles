autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

 
# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed

setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "
source /usr/local/src/enhancd/init.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

## ホスト名とかの部分を変更
PS1="%{$fg[cyan]%}[${USER}@Mak %1~]%(!.#.$)${reset_color} "


## peco-func

function peco-lscd(){
    local dir="$( ls -1d */ | peco)"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}

## git-alias
git config --global alias.o checkout
git config --global alias.b branch
git config --global alias.c commit
git config --global alias.s status
git config --global alias.l log


## alias
alias gi=git
alias g=git
alias c=peco-lscd