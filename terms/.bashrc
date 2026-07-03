[[ -n ${BASH_VERSION:-} ]] || return 0 2>/dev/null || exit 0
[[ $- != *i* ]] && return

if [[ -f "$HOME/.config/bash/aliases" ]]; then
  source "$HOME/.config/bash/aliases"
fi

if command -v starship &>/dev/null && [[ ${TERM:-} != "dumb" ]]; then
  eval "$(starship init bash)"
fi

export PATH="$HOME/.local/bin:$PATH"
