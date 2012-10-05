# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt autocd extendedglob
bindkey -e

autoload colors
colors

#PROMPT="[%n@%m]%(!.#.$) "
PROMPT="%{${fg[blue]}%}[%n@%m]%(!.#.$) %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"

## ヒストリファイルにコマンドラインだけではなく実行時刻と実行時間も保存する。
setopt extended_history
### 同じコマンドラインを連続で実行した場合はヒストリに登録しない。
setopt hist_ignore_dups
### スペースで始まるコマンドラインはヒストリに追加しない。
#setopt hist_ignore_space
### すぐにヒストリファイルに追記する。
setopt inc_append_history
### zshプロセス間でヒストリを共有する。
setopt share_history

## jobsでプロセスIDも出力する。
setopt long_list_jobs

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tatunori/.zshrc'

autoload -U compinit
compinit
# End of lines added by compinstall
zstyle ':completion:*' verbose yes

## 補完方法毎にグループ化する。
#### 補完方法の表示方法
#### %B...%b: 「...」を太字にする。
#### %d: 補完方法のラベル
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''

### 補完侯補をメニューから選択する。
#### select=2: 補完候補を一覧から選択する。
#### ただし、補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2

## 補完候補に色を付ける。
### "": 空文字列はデフォルト値を使うという意味。
zstyle ':completion:*:default' list-colors ""

# 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

## 補完方法の設定。指定した順番に実行する。
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
zstyle ':completion:*' completer \
    _oldlist _complete _match _ignored _approximate _prefix

## カーソル位置で補完する。
setopt complete_in_word
### globを展開しないで候補の一覧から補完する。
setopt glob_complete


#aliases
alias ll="ls -lhAF"
alias pd="pushd"
alias pd1="pushd +1"
alias pd2="pushd +2"
alias j=jobs

