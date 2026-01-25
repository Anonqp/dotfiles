export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
export LANG=en_US.UTF-8
export EDITOR='nvim'
export COLORTERM=truecolor

autoload -Uz compinit
if [ "$(date +'%j')" != "$(date -r ~/.zcompdump +%j 2>/dev/null)" ]; then
  compinit
else
  compinit -C
fi
eval "$(sheldon source)"


alias ..="z .."

alias ls="eza --icons=always --git"
alias ll="eza -l --icons=always --git"
alias la="eza -la --icons=always --git"
alias lt="eza --tree --level=2 --icons=always"

alias cat="bat"           
alias grep="rg"           
alias find="fd"          
alias r="y"  

alias lg="lazygit"
alias zshconfig="nvim ~/.zshrc"
alias sheldonconfig="nvim ~/.config/sheldon/plugins.toml"

eval "$(atuin init zsh)"


eval "$(zoxide init zsh)"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

bindkey -v
export KEYTIMEOUT=1

export BAT_THEME="gruvbox-dark" 
