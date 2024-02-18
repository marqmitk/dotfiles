# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

#--------ZINIT--------
### Added by Zinit's installer
##############################
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
##############################



#-------PLUGINS-------
zinit light-mode for					\
	aloxaf/fzf-tab				    	\
	zdharma-continuum/fast-syntax-highlighting	\
	hlissner/zsh-autopair				\
	arzzen/calc.plugin.zsh				\
	willghatch/zsh-saneopt				\
	zsh-users/zsh-autosuggestions			\
	zsh-users/zsh-completions			\
	raisty/alt-and-select				\
	xylous/gitstatus				\
	joshskidmore/zsh-fzf-history-search		
################################

#--------COMPLETIONS--------
# enable completion features
autoload -Uz compinit
compinit -i

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path "$HOME/.config/zsh/.zcompcache"

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
##############################




#------HISTORY-------------
HISTFILE="$HOME/.cache/.zsh_history"
HISTSIZE=10000
SAVEHIST=20000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
##############################



#-------COLORS AND THEMES---
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#999999,underline"
export FZF_DEFAULT_OPTS='--color=fg:#ebdbb2,hl:#bd93f9 --color=fg+:#d5c4a1,bg+:#32302f,hl+:#bd93f9 --color=info:#ffb86c,prompt:#98971a,pointer:#d79921 --color=marker:#ff79c6,spinner:#ffb86c,header:#458588'

#cd with eza config
zstyle ':completion:*:descriptions' format '[%d]' # set descriptions format to enable group support 
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # set list-colors to enable filename colorizing
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # preview directory's content with eza when completing cd


#-------KEYBINDS-------
bindkey '^[[Z' autosuggest-accept   # Accept suggestion from zsh-autosuggest (shift-tab) 
bindkey '^ '   autosuggest-execute  # Accept and execute suggestion from zsh-autosuggest (ctrl-space)

bindkey "^[[1;5C" forward-word #Bind move one word left/right to ctrl left/right
bindkey "^[[1;5D" backward-word

#############################



#-------ALIAS-------
alias chroot='TERM=xterm-256color chroot'
alias eza="eza -x --icons"
alias ls="eza -x --icons"
alias youtube="google-chrome-stable https://www.youtube.com"
alias logout="loginctl terminate-user marq"
alias intellij="screen -S intellij sh /usr/bin/idea-IU-233.13135.103/bin/idea.sh"
alias cat="bat"
alias discord="discord --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias spotify="spotify --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias chrome="google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland"
#-------VARIABLES-------
export notes="/home/marco/Documents/notes"
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="$PATH:$HOME/.local/bin:/usr/local/bin/"
export PATH="$PATH:$HOME/bin/"
###########################

#-------FUNCTIONS-------
#AND THAT'S ALL


eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
