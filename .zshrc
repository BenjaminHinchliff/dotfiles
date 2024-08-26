# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
#
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
#
# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
setopt extended_glob
bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/benja/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt correct
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Add nvm
# source /usr/share/nvm/init-nvm.sh

# FNM
eval "$(fnm env --use-on-cd)"

export PATH="$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$PATH"
export PAGER="nvimpager"

# ccache
export PATH="/usr/lib/ccache/bin:$PATH"

# Doom Emacs
# export PATH="$HOME/.emacs.d/bin:$PATH"

alias config='/usr/bin/git --git-dir=/home/benja/.dotfiles --work-tree=/home/benja'
alias ls="exa --icons"
alias ll="ls -l"
alias locate="plocate"
alias ssh="kitty +kitten ssh"
alias icat="kitty +kitten icat --align=left"
alias nnn="nnn -ade"
alias make="make -j$(nproc)"
alias neofetch="neofetch --kitty --source ~/Pictures/corro.png --crop_mode fit --size 300px"
alias pscale="pscale/pscale"
alias t="todo.sh"
alias docker="podman"
alias sudo="run0"

# nnn options
export NNN_OPTS="H"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_PLUG="p:preview-tui;m:xdgdefault"

# nnn cd on quit
n ()
{
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The backslash allows one to alias n to nnn if desired without making an
    # infinitely recursive alias
    \nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
eval "$(starship init zsh)"

eval "$(zoxide init zsh --cmd cd)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
