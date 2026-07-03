# UTF-8 locale so Nerd Font glyphs render in tmux/starship
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

if [[ -f "$HOME/.config/bash/aliases" ]]; then
  source "$HOME/.config/bash/aliases"
fi

if command -v starship &> /dev/null && [[ ${TERM:-} != "dumb" ]]; then
  eval "$(starship init zsh)"
fi



if [[ -d /opt/nvim-linux-x86_64/bin ]]; then
  export PATH=/opt/nvim-linux-x86_64/bin:$PATH #add nvim
fi

if [[ -d /home/tpv/.opencode/bin ]]; then
  export PATH=/home/tpv/.opencode/bin:$PATH
fi
