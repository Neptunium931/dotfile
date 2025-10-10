git_init() {
	if [ -z "$1" ]; then
		printf "Usage: git_init <name>\n"
	else
		mkdir "$1"
		builtin cd "$1"
		pwd
		git init
		touch README .gitignore LICENSE
		echo "# $(basename $PWD)" >>README
		cp ~/perso/LICENSE .
		git commit -m "Initial commit"
	fi
}

alias gitlab='git -c core.sshCommand="/usr/bin/ssh -i ~/.ssh/id_ed25519"'
