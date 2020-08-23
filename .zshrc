# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# plugins in light-mode
zinit wait lucid light-mode for \
    atinit'zicompinit; zicdreplay' \
        zdharma/fast-syntax-highlighting \
    atload'_zsh_autosuggest_start' \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions

# themes

## prompt while loading themes
PS1='Init > '

## oh-my-zsh themes
zinit wait'!' lucid light-mode for \
    OMZL::git.zsh \
    OMZL::prompt_info_functions.zsh \
    OMZL::spectrum.zsh \
    OMZL::theme-and-appearance.zsh \
#    OMZT::af-magic

## prezto themes
#zinit wait lucid light-mode for \
#        mafredri/zsh-async
#zinit wait'!' svn silent light-mode for \
#    atload"zstyle ':prezto:module:git:alias' skip 'yes'" \
#	PZTM::git \
#    atload"prompt paradox" \
#	PZTM::prompt

## async git info themes
#zinit wait'!' lucid light-mode for \
#    pick"async.zsh" src"pure.zsh" \
#        sindresorhus/pure

zinit wait'!' depth=1 lucid nocd light-mode for \
    atload'source ~/.p10k.zsh' \
    atload'_p9k_precmd' \
        romkatv/powerlevel10k

# plugins and snippets

## omz and prezto
zinit wait lucid for \
    zdharma/history-search-multi-word \
    OMZP::colored-man-pages \
    OMZL::clipboard.zsh \
    OMZL::completion.zsh \
    OMZL::grep.zsh \
    PZTM::directory

## dircolors
zinit wait lucid for \
    atclone"dircolors -b src/dir_colors >! clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' \
        arcticicestudio/nord-dircolors

## direnv
zinit wait'1' as"program" lucid for \
    atclone'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' \
    atclone'make && ./direnv hook zsh >! zhook.zsh' \
    atpull'%atclone' pick"direnv" src"zhook.zsh" \
        direnv/direnv

# others
 
## lazy brew & pyenv init
zinit wait'1' lucid for \
    atclone'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' \
    atclone'pyenv init - >! zpyenv.zsh' \
    run-atpull atpull'%atclone' \
    atinit'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' \
    atinit'export PYENV_ROOT="$HOME/.pyenv" PATH="$PYENV_ROOT/bin:$PATH"' \
    atinit'PATH="$HOME/.local/bin:$PATH"' \
    pick'zpyenv.zsh' nocompile'!' \
    atload'python ~/Desktop/images/background.py' \
        zdharma/null

## auto compiling zshrc
zinit wait'1' lucid is-snippet nocd for \
    atload"([ ! -e ~/.zshrc.zwc ] || [ ~/.zshrc -nt ~/.zshrc.zwc ]) && zcompile ~/.zshrc" \
        /dev/null

# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups  
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# keybindings
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init() {
        echoti smkx
    }
    function zle-line-finish() {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# aliases
alias l='ls'
alias la='ls -A' 
alias ll='ls -lh'
alias lsa='ls -lAh'
alias rm='rm -i' 
alias mv='mv -i' 
alias cp='cp -i'
alias mkdir='mkdir -p'
alias md='mkdir'
alias rd='rmdir'
alias c='clear' 
alias h='history'
alias pbc='clipcopy'
alias pbp='clippaste'

[ -f ~/.aliases ] && source ~/.aliases
