loadAliases() {
	for file in $HOME/.config/alias/*.sh; do
		source $file
	done
}

bash_prompt() {
	PS1='${gebian_chroot:+($gebian_chroot)}'${blu}'$(git_branch)'${pur}' \W'${grn}' \$ '${clr}
}

printInfo() {
	# clear

	printf "\n"
	printf "   %s\n" "IP ADDR: $(curl -s ifconfig.me)"
	printf "   %s\n" "USER: $(echo $USER)"
	printf "   %s\n" "DATE: $(date)"
	printf "   %s\n" "UPTIME: $(uptime -p)"
	printf "   %s\n" "HOSTNAME: $(hostname -f)"
	printf "   %s\n" "CPU: $(awk -F: '/model name/{print $2}' /proc/cpuinfo | head -1)"
	printf "   %s\n" "KERNEL: $(uname -rms)"
	printf "   %s\n" "RESOLUTION: $(xrandr | awk '/\*/{printf $1" "}')"
	printf "   %s\n" "MEMORY: $(free -m -h | awk '/Mem/{print $3"/"$2}')"
	printf "\n"
}

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
	. /usr/share/bash-completion/bash_completion

loadAliases

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
PS1='\[\e[96m\]\u@\H\[\e[0m\] \[\e[38;5;35m\]\w\[\e[0m\](\[\e[93m\]${PS1_CMD1}\[\e[0m\])\n\$ '

printInfo
