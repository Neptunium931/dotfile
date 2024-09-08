get() {
	if command -v aria2c &>/dev/null; then
		aria2c -x 16 $@
	elif command -v wget &>/dev/null; then
		wget $@
	else
		curl -O $@
	fi
}
