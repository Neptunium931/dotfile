command -v bat >/dev/null &&
	alias bat='bat --theme=ansi' &&
	alias cat='bat --pager=never' &&
	alias less='bat'
# in debian the command is batcat
command -v batcat >/dev/null &&
	alias batcat='batcat --theme=ansi' &&
	alias cat='batcat --pager=never' &&
	alias less='batcat'
