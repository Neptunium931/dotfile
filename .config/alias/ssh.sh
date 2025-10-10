function ssh-rm-known-hosts() {
	sed -i "/$1/d" ~/.ssh/known_hosts
}
