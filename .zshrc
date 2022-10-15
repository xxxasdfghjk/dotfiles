## 補完系
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
source ~/.zsh/enhancd/init.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


## ホスト名とかの部分を変更
fpath=(~/.zsh $fpath)
if [ -f ${HOME}/.zsh/git-completion.zsh ]; then
    zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
fi
if [ -f ${HOME}/.zsh/git-prompt.sh ]; then
    source ${HOME}/.zsh/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTRAM=autoload
setopt PROMPT_SUBST;
PS1='%F{cyan}[${USER}@Mak %1~]%f%F{red}$(__git_ps1) %f$ '

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
git config --global alias.r rebase
git config --global alias.a add

logformat="%h %cd %cn:%s"
## alias
alias gi=git
alias g=git
alias c=peco-lscd
alias -g B='`git branch -a --sort=-authordate | grep -v "\->" | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`' 
alias -g ch='$(git log --pretty=format:"$logformat" | peco --prompt "COMMIT HASH>" | awk "{print \$1}")'
