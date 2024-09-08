alias ll='ls -la'
alias la='ls -A'
alias l='ls -F'
command -v lsd >/dev/null && alias ls='lsd --group-dirs first' &&
	alias tree='lsd --tree'
command -v colorls >/dev/null && alias ls='colorls --sd --gs' &&
	alias tree='colorls --tree'
