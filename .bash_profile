HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups
HISTSIZE=10000
HISTFILESIZE=10000

shopt -s histappend

blk='\[\033[01;30m\]' # Black
red='\[\033[01;31m\]' # Red
grn='\[\033[01;32m\]' # Green
ylw='\[\033[01;33m\]' # Yellow
blu='\[\033[01;34m\]' # Blue
pur='\[\033[01;35m\]' # Purple
cyn='\[\033[01;36m\]' # Cyan
wht='\[\033[01;37m\]' # White
clr='\[\033[00m\]'    # Reset

export VISUAL=nvim
export EDITOR=$VISUAL
export GPG_TTY=$(tty)

export ANDROID_HOME=~/android-sdk

# arduino
export ARDUINO_DIR=/usr/share/arduino/
export ARDMK_DIR=$HOME/.arduino/
export AVR_TOOLS_DIR=/usr
export ARDUINO_LIB_PATH=/home/neptunium/.arduino/lib/

export PATH=$HOME/.cargo/bin/:$PATH
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.4.0/bin:$HOME/.local/bin
export PATH=$PATH:$HOME/.rvm/bin/
export PATH=$PATH:$HOME/perso/bin
export PATH=$PATH:$HOME/idapro-9.0/

export PYTHONPATH=./venv/lib/python3.13/site-packages/

# pnpm
export PNPM_HOME="/home/neptunium/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
