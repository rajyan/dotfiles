### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

# zsh plugins in light-mode
zinit light zdharma-continuum/z-a-bin-gem-node
zinit wait lucid light-mode for \
    atinit'zicompinit; zicdreplay' \
        zdharma-continuum/fast-syntax-highlighting \
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
#    atload'prompt paradox' \
#	PZTM::prompt

## async git info themes
#zinit wait'!' lucid light-mode for \
#    pick'async.zsh' src'pure.zsh' \
#        sindresorhus/pure

zinit wait'!' depth=1 lucid nocd light-mode for \
    atload'source ~/.p10k.zsh' \
    atload'_p9k_precmd' \
        romkatv/powerlevel10k

# plugins and snippets

## omz and prezto
zinit wait lucid for \
    zdharma-continuum/history-search-multi-word \
    OMZP::colored-man-pages \
    OMZL::clipboard.zsh \
    OMZL::completion.zsh \
    OMZL::grep.zsh \
    PZTM::directory

## load history without turbo
zinit snippet PZTM::history

## dircolors
zinit wait if'[[ "$(uname)" == "Linux" ]]' lucid for \
    atclone'dircolors -b src/dir_colors >! clrs.zsh' \
    atpull'%atclone' pick'clrs.zsh' nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' \
        nordtheme/dircolors

# development

## homebrew
zinit lucid for \
    atclone'./install.sh' \
    atclone'[[ "$(uname)" == "Linux" ]] && HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew' \
    atclone'[[ "$(uname)" == "Darwin" ]] && HOMEBREW_PREFIX=/opt/homebrew' \
    atclone'"$HOMEBREW_PREFIX/bin/brew" shellenv > brew.zsh' \
    atclone'"$HOMEBREW_PREFIX/bin/brew" bundle --global --force' \
    atclone'zinit creinstall "$HOMEBREW_PREFIX/share/zsh/site-functions"' \
    atpull'%atclone' src'brew.zsh' \
        Homebrew/install

## git credential manager
zinit wait'1' from'gh-r' sbin'git-credential-manager' lucid for \
    if'[[ "$(uname)" == "Linux" ]]' bpick'*amd64*[0-9].tar.gz' \
    atinit'export GCM_CREDENTIAL_STORE=secretservice' \
        @git-ecosystem/git-credential-manager
zinit wait'1' from'gh-r' sbin'git-credential-manager' lucid for \
    if'[[ "$(uname)" == "Darwin" ]]' bpick'*osx*[0-9].tar.gz' \
    atinit'export GCM_CREDENTIAL_STORE=keychain' \
        @git-ecosystem/git-credential-manager

## fzf
zinit wait'1' sbin'bin/fzf' lucid for \
    has'go' make'!''PREFIX=$ZPFX install' \
    atclone'command cp shell/completion.zsh _fzf_completion' \
    atpull'%atclone' \
        junegunn/fzf

## direnv
zinit wait'1' from'gh-r' mv'direnv* -> direnv' sbin'direnv' lucid for \
    atclone'./direnv hook zsh >! direnv.zsh' \
    atpull'%atclone' src'direnv.zsh' \
        direnv/direnv

## n
zinit wait'1' as'command' sbin'bin/n' lucid for \
    atclone'N_PREFIX="$ZPFX" bin/n lts' \
    atclone'npm install -g aws-cdk npm-check-updates' \
    atload'export N_PREFIX="$ZPFX"' \
    atpull'%atclone' \
        tj/n

## auto compiling zshrc & run additional setup
zinit wait'1' as'null' lucid nocd for \
    atload'([[ ! -e ~/.zshrc.zwc ]] || [[ ~/.zshrc -nt ~/.zshrc.zwc ]]) && zcompile ~/.zshrc' \
    atload'export PATH="$HOME/.local/bin:$PATH"' \
        rajyan/null

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
if [[ -n "${terminfo[kcuu1]}" ]]; then
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
if [[ -n "${terminfo[kcud1]}" ]]; then
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
if [[ -n "${terminfo[kbs]}" ]]; then
    bindkey "${terminfo[kbs]}" backward-delete-char
fi
bindkey "^?" backward-delete-char
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^U" backward-kill-line

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

if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi
