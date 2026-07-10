[[ -n ${BASH_VERSION:-} ]] || return 0 2>/dev/null || exit 0
[[ $- != *i* ]] && return

# UTF-8 locale so Nerd Font glyphs render in tmux/starship
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

if [[ -f "$HOME/.config/bash/aliases" ]]; then
  source "$HOME/.config/bash/aliases"
fi

if command -v starship &>/dev/null && [[ ${TERM:-} != "dumb" ]]; then
  eval "$(starship init bash)"
fi

export PATH="$HOME/.local/bin:$PATH"

if [[ -d "$HOME/google-cloud-sdk/bin" ]]; then
  export PATH="$HOME/google-cloud-sdk/bin:$PATH"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="$HOME/miniconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [[ -d /opt/nvim-linux-x86_64/bin ]]; then
  export PATH=/opt/nvim-linux-x86_64/bin:$PATH #add nvim
fi

if [[ -d /home/tpv/.opencode/bin ]]; then
  export PATH=/home/tpv/.opencode/bin:$PATH
fi
