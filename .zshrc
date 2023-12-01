# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/brian/.zshrc'

autoload -Uz compinit && compinit
# End of lines added by compinstall
#
#eval "$(starship init zsh)"

[[ -d ~/.antigen ]] || git clone https://github.com/zsh-users/antigen.git ~/.antigen
source ~/.antigen/bin/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
# antigen bundle command-not-found
antigen bundle unixorn/fzf-zsh-plugin@main
antigen bundle Aloxaf/fzf-tab

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme romkatv/powerlevel10k

antigen apply

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if which eza > /dev/null
then
	alias la='eza -aF --icons --color=auto --group-directories-first --git'
	alias ls='eza -aF --icons --color=auto --group-directories-first --git'
	alias ll='eza -alF --icons --color=auto --group-directories-first --git'
fi

alias emacs='emacs -nw'
alias fish='exec env SHELL=/usr/bin/fish /usr/bin/fish -l'
alias vi=nvim
alias vim=nvim
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export LIBVIRT_DEFAULT_URI="qemu:///system"

[[ -d ~/.asdf ]] || git clone https://github.com/asdf-vm/asdf.git ~/.asdf
source ~/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

mkdir -pv ~/.zfunc
if which rustup > /dev/null
then
	rustup completions zsh > ~/.zfunc/_rustup
	rustup completions zsh cargo > ~/.zfunc/_cargo
	[[ ! -d ${HOME}/.cargo/bin ]] || PATH="${HOME}/.cargo/bin:${PATH}"
fi
fpath+=~/.zfunc

[[ ! -f ~/.asdf/plugins/java/set-java-home.zsh ]] || source ~/.asdf/plugins/java/set-java-home.zsh

newterm() {
  find ~ -type d | fzf --bind 'enter:execute(termite -d {} -t "$(basename {})" -e "tmux new-session -A -s \"$(basename {})\"" &)+accept'
}

zle -N newterm newterm

# bindkey -s '^F' "find ~ -type d | fzf --bind 'enter:execute(termite -d {} -t \"\$\(basename {}\)\" -e \"tmux new-session -A -s \\\"\$\(basename {}\)\\\"\" &)+accept'^M"
bindkey '^F' newterm
# bindkey -s '^F^F' '`find . -type f | fzf`^M'
# bindkey -s '^F^D' '`find . -type d | fzf`^M'
# bindkey -s '^F^H' 'eval `cat ~/.histfile| fzf | awk -F "'";"'" "'"{print $2}"'"`^M'
# bindkey -s '^F^P' '`ps -ef | fzf | awk "'"{print $2}"'"`^M'

autoload -Uz compinit
compinit
