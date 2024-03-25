export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME='agnoster'

plugins=(
	asdf
	git
	rails
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

prompt_context() { }

alias vim=nvim

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

if type rg &> /dev/null; then
	export IGNORED_FOLDERS='--glob "!*/{.git,node_modules,vendor,tmp,cache}/*"'
  export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow $IGNORED_FOLDERS"
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi
