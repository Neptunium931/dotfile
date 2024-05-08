# Configure color-scheme
COLOR_SCHEME=dark # dark/light


# Charger les fichiers .alias depuis ~/.config
# for alias_file in ~/.config/alias/*.alias; do
#     [ -r "$alias_file" ] && source "$alias_file"
# done

# --------------------------------- ALIASES -----------------------------------
alias ..='cd ..'
alias xclip='xclip -selection c'
alias last='echo `!!` | xclip'
alias get='aria2c -x 16'
alias sollama="systemctl --user start ollama-serve.service"

tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }

### Colorize commands
if [[ $(uname) != "OpenBSD" ]]; then
  alias cp='cp -v'
  alias rm='rm -I'
  alias mv='mv -iv'
  alias ln='ln -sriv'
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
  alias diff='diff --color=auto'
  alias ip='ip --color=auto'
  alias pacman='pacman --color=auto'
fi

### LS & TREE
alias ll='ls -la'
alias la='ls -A'
alias l='ls -F'
command -v lsd > /dev/null && alias ls='lsd --group-dirs first' && \
    alias tree='lsd --tree'
command -v colorls > /dev/null && alias ls='colorls --sd --gs' && \
    alias tree='colorls --tree'

### CAT & LESS
command -v bat > /dev/null && \
    alias bat='bat --theme=ansi' && \
    alias cat='bat --pager=never' && \
    alias less='bat'
# in debian the command is batcat
command -v batcat > /dev/null && \
    alias batcat='batcat --theme=ansi' && \
    alias cat='batcat --pager=never' && \
    alias less='batcat'

### TOP
command -v htop > /dev/null && alias top='htop'

# --------------------------------- SETTINGS ----------------------------------
setopt AUTO_CD
setopt BEEP
#setopt CORRECT
setopt HIST_BEEP
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS
setopt MAGIC_EQUAL_SUBST
setopt NO_NO_MATCH
setopt NOTIFY
setopt NUMERIC_GLOB_SORT
setopt PROMPT_SUBST
setopt SHARE_HISTORY

HISTFILE=~/.zsh_history
HIST_STAMPS=mm/dd/yyyy
HISTSIZE=5000
SAVEHIST=5000
ZLE_RPROMPT_INDENT=0
WORDCHARS=${WORDCHARS//\/}
PROMPT_EOL_MARK=
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'


# ZSH completion system
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Prompt
PROMPT=$'${$((_p9k_on_expand()))+}%{${_p9k__raw_msg-}${_p9k__raw_msg::=}%}${(e)_p9k_t[7]}${_p9k__1-${_p9k__1l_frame-"%F{blue}╭─"}${_p9k__1l-${${:-${_p9k__bg::=NONE}${_p9k__i::=0}${_p9k__sss::=%f}}+}${${:-${P9K_CONTENT::=}${_p9k__n::=}${${${_p9k__bg:-0}:#NONE}:-${_p9k__n::=8}}${_p9k__n:=${${(M)${:-x001}:#x($_p9k__bg|${_p9k__bg:-0})}:+10}}${_p9k__n:=11}${P9K_VISUAL_IDENTIFIER::=}${_p9k__c::="${P9K_CONTENT} $(whoami | grep -v "^root\$")"}${_p9k__c::=${_p9k__c//}}${_p9k__e::=${${_p9k__1los_icon+00}:-${${(%):-$_p9k__c%1(l.1.0)}[-1]}0}}}+}${${_p9k__e:#00}:+${${_p9k_t[$_p9k__n]/<_p9k__ss>/$_p9k__ss}/<_p9k__s>/$_p9k__s}${_p9k__c}%b%K{001\}%F{007\} ${${:-${_p9k__s::=%F{001\}}${_p9k__ss::=}${_p9k__sss::=%F{001\}}${_p9k__i::=1}${_p9k__bg::=001}}+}}${${:-"${${(%):-%#}:#\%}"}:+${${:-${P9K_CONTENT::=}${_p9k__n::=}${${${_p9k__bg:-0}:#NONE}:-${_p9k__n::=12}}${_p9k__n:=${${(M)${:-x000}:#x($_p9k__bg|${_p9k__bg:-0})}:+14}}${_p9k__n:=15}${_p9k__v::=}${_p9k__c::="${P9K_CONTENT}"}${_p9k__c::=${_p9k__c//}}${_p9k__e::=${${_p9k__1lroot_indicator+00}:-${${(%):-$_p9k__c%1(l.1.0)}[-1]}1}}}+}${${_p9k__e:#00}:+${${_p9k_t[$_p9k__n]/<_p9k__ss>/$_p9k__ss}/<_p9k__s>/$_p9k__s}${_p9k__v}${${(M)_p9k__e:#11}:+ }${_p9k__c}%b%K{000\}%F{001\} ${${:-${_p9k__s::=%F{000\}}${_p9k__ss::=}${_p9k__sss::=%F{000\}}${_p9k__i::=2}${_p9k__bg::=000}}+}}}${${:-${P9K_CONTENT::=${(Q)${:-"\~"}}}${_p9k__n::=}${${${_p9k__bg:-0}:#NONE}:-${_p9k__n::=16}}${_p9k__n:=${${(M)${:-x004}:#x($_p9k__bg|${_p9k__bg:-0})}:+18}}${_p9k__n:=19}${_p9k__v::= }${_p9k__c::="${P9K_CONTENT}"}${_p9k__c::=${_p9k__c//}}${_p9k__e::=${${_p9k__1ldir+00}:-${${(%):-$_p9k__c%1(l.1.0)}[-1]}1}}}+}${${_p9k__e:#00}:+${${_p9k_t[$_p9k__n]/<_p9k__ss>/$_p9k__ss}/<_p9k__s>/$_p9k__s}${_p9k__v}${${(M)_p9k__e:#11}:+ }${_p9k__c}%b%K{004\}%F{000\} ${${:-${_p9k__s::=%F{004\}}${_p9k__ss::=}${_p9k__sss::=%F{004\}}${_p9k__i::=4}${_p9k__bg::=004}}+}}${(e)_p9k__vcs}%b%k$_p9k__sss%b%k%f${:-" %b%k%f"}} }${_p9k__2-${_p9k__2l_frame-"%F{blue}╰%f "}${_p9k__2l-${${:-${_p9k__bg::=NONE}${_p9k__i::=0}${_p9k__sss::=%f}}+}${_p9k__sss::=}%b%k$_p9k__sss%b%k%f}}${${COLUMNS::=$_p9k__clm}+} '
RPROMPT=$' ${_p9k__2-${${_p9k__clm::=$COLUMNS}+}${${COLUMNS::=1024}+}${_p9k__2r-${${:-${_p9k__bg::=NONE}${_p9k__i::=0}${_p9k__sss::=}}+}${${:-"${${:-$_p9k__keymap.$_p9k__zle_state}:#(vicmd.*|vivis.*|vivli.*|*.*insert*)}"}:+${${:-${P9K_CONTENT::=OVERTYPE}${_p9k__n::=}${${${_p9k__bg:-0}:#NONE}:-${_p9k__n::=20}}${_p9k__n:=${${(M)${:-x$_p9k__bg}:#x(001|001)}:+22}}${_p9k__n:=23}${_p9k__c::="${P9K_CONTENT}"}${_p9k__c::=${_p9k__c//}}${_p9k__e::=${${_p9k__2rvi_mode+00}:-${${(%):-$_p9k__c%1(l.1.0)}[-1]}0}}}+}${${_p9k__e:#00}:+${_p9k_t[$_p9k__n]/<_p9k__w>/$_p9k__w}${_p9k__c}%b%K{001\}%F{000\}${${:-${_p9k__w::=%b%K{001\}%F{000\} %b%K{001\}%F{000\}}${_p9k__sss::=%b%K{001\}%F{000\} %k%F{001\}%b%K{001\}%F{000\}}${_p9k__i::=1}${_p9k__bg::=001}}+}}}${${:-"${(M)${:-$_p9k__keymap$_p9k__region_active}:#vicmd0}"}:+${${:-${P9K_CONTENT::=NORMAL}${_p9k__n::=}${${${_p9k__bg:-0}:#NONE}:-${_p9k__n::=24}}${_p9k__n:=${${(M)${:-x$_p9k__bg}:#x(002|002)}:+26}}${_p9k__n:=27}${_p9k__c::="${P9K_CONTENT}"}${_p9k__c::=${_p9k__c//}}${_p9k__e::=${${_p9k__2rvi_mode+00}:-${${(%):-$_p9k__c%1(l.1.0)}[-1]}0}}}+}${${_p9k__e:#00}:+${_p9k_t[$_p9k__n]/<_p9k__w>/$_p9k__w}${_p9k__c}%b%K{002\}%F{000\}${${:-${_p9k__w::=%b%K{002\}%F{000\} %b%K{002\}%F{000\}}${_p9k__sss::=%b%K{002\}%F{000\} %k%F{002\}%b%K{002\}%F{000\}}${_p9k__i::=1}${_p9k__bg::=002}}+}}}${${:-"${(M)${:-$_p9k__keymap$_p9k__region_active}:#(vicmd1|vivis?|vivli?)}"}:+${${:-${P9K_CONTENT::=VISUAL}${_p9k__n::=}${${${_p9k__bg:-0}:#NONE}:-${_p9k__n::=28}}${_p9k__n:=${${(M)${:-x$_p9k__bg}:#x(004|004)}:+30}}${_p9k__n:=31}${_p9k__c::="${P9K_CONTENT}"}${_p9k__c::=${_p9k__c//}}${_p9k__e::=${${_p9k__2rvi_mode+00}:-${${(%):-$_p9k__c%1(l.1.0)}[-1]}0}}}+}${${_p9k__e:#00}:+${_p9k_t[$_p9k__n]/<_p9k__w>/$_p9k__w}${_p9k__c}%b%K{004\}%F{000\}${${:-${_p9k__w::=%b%K{004\}%F{000\} %b%K{004\}%F{000\}}${_p9k__sss::=%b%K{004\}%F{000\} %k%F{004\}%b%K{004\}%F{000\}}${_p9k__i::=1}${_p9k__bg::=004}}+}}}${${:-${P9K_CONTENT::=}${_p9k__n::=}${${${_p9k__bg:-0}:#NONE}:-${_p9k__n::=32}}${_p9k__n:=${${(M)${:-x$_p9k__bg}:#x(000|000)}:+34}}${_p9k__n:=35}${_p9k__v::= }${_p9k__c::="${P9K_CONTENT}"}${_p9k__c::=${_p9k__c//}}${_p9k__e::=${${_p9k__2rstatus+00}:-${${(%):-$_p9k__c%1(l.1.0)}[-1]}1}}}+}${${_p9k__e:#00}:+${_p9k_t[$_p9k__n]/<_p9k__w>/$_p9k__w}${_p9k__c}%b%K{000\}%F{002\}${${(M)_p9k__e:#11}:+ }$_p9k__v${${:-${_p9k__w::=%b%K{000\}%F{002\} %b%K{000\}%F{002\}}${_p9k__sss::=%b%K{000\}%F{002\} %k%F{000\}%b%K{000\}%F{002\}}${_p9k__i::=2}${_p9k__bg::=000}}+}}${${:-${P9K_CONTENT::=0.01s}${_p9k__n::=}${${${_p9k__bg:-0}:#NONE}:-${_p9k__n::=48}}${_p9k__n:=${${(M)${:-x$_p9k__bg}:#x(000|000)}:+50}}${_p9k__n:=51}${_p9k__v::=󱦟 }${_p9k__c::="${P9K_CONTENT}"}${_p9k__c::=${_p9k__c//}}${_p9k__e::=${${_p9k__2rcommand_execution_time+00}:-${${(%):-$_p9k__c%1(l.1.0)}[-1]}1}}}+}${${_p9k__e:#00}:+${_p9k_t[$_p9k__n]/<_p9k__w>/$_p9k__w}${_p9k__c}%b%K{000\}%F{004\}${${(M)_p9k__e:#11}:+ }$_p9k__v${${:-${_p9k__w::=%b%K{000\}%F{004\} %b%K{000\}%F{004\}}${_p9k__sss::=%b%K{000\}%F{004\} %k%F{000\}%b%K{000\}%F{004\}}${_p9k__i::=3}${_p9k__bg::=000}}+}}${${:-"${${(%):-%j}:#0}"}:+${${:-${P9K_CONTENT::="${${(%):-%j}:#1}"}${_p9k__n::=}${${${_p9k__bg:-0}:#NONE}:-${_p9k__n::=36}}${_p9k__n:=${${(M)${:-x$_p9k__bg}:#x(000|000)}:+38}}${_p9k__n:=39}${_p9k__v::= }${_p9k__c::="${P9K_CONTENT}"}${_p9k__c::=${_p9k__c//}}${_p9k__e::=${${_p9k__2rbackground_jobs+00}:-${${(%):-$_p9k__c%1(l.1.0)}[-1]}1}}}+}${${_p9k__e:#00}:+${_p9k_t[$_p9k__n]/<_p9k__w>/$_p9k__w}${_p9k__c}%b%K{000\}%F{006\}${${(M)_p9k__e:#11}:+ }$_p9k__v${${:-${_p9k__w::=%b%K{000\}%F{006\} %b%K{000\}%F{006\}}${_p9k__sss::=%b%K{000\}%F{006\} %k%F{000\}%b%K{000\}%F{006\}}${_p9k__i::=4}${_p9k__bg::=000}}+}}}${${:-${P9K_CONTENT::=10:06}${_p9k__n::=}${${${_p9k__bg:-0}:#NONE}:-${_p9k__n::=40}}${_p9k__n:=${${(M)${:-x$_p9k__bg}:#x(000|000)}:+42}}${_p9k__n:=43}${_p9k__c::="${P9K_CONTENT}"}${_p9k__c::=${_p9k__c//}}${_p9k__e::=${${_p9k__2rtime+00}:-${${(%):-$_p9k__c%1(l.1.0)}[-1]}0}}}+}${${_p9k__e:#00}:+${_p9k_t[$_p9k__n]/<_p9k__w>/$_p9k__w}${_p9k__c}%b%K{000\}%F{007\}${${:-${_p9k__w::=%b%K{000\}%F{007\} %b%K{000\}%F{007\}}${_p9k__sss::=%b%K{000\}%F{007\} %k%F{000\}%b%K{000\}%F{007\}}${_p9k__i::=5}${_p9k__bg::=000}}+}}${${:-"$_p9k__ram_free"}:+${${:-${P9K_CONTENT::="$_p9k__ram_free"}${_p9k__n::=}${${${_p9k__bg:-0}:#NONE}:-${_p9k__n::=44}}${_p9k__n:=${${(M)${:-x$_p9k__bg}:#x(003|003)}:+46}}${_p9k__n:=47}${_p9k__v::=󰍛}${_p9k__c::="${P9K_CONTENT}"}${_p9k__c::=${_p9k__c//}}${_p9k__e::=${${_p9k__2rram+00}:-${${(%):-$_p9k__c%1(l.1.0)}[-1]}1}}}+}${${_p9k__e:#00}:+${_p9k_t[$_p9k__n]/<_p9k__w>/$_p9k__w}${_p9k__c}%b%K{003\}%F{000\}${${(M)_p9k__e:#11}:+ }$_p9k__v${${:-${_p9k__w::=%b%K{003\}%F{000\} %b%K{003\}%F{000\}}${_p9k__sss::=%b%K{003\}%F{000\} %k%F{003\}%b%K{003\}%F{000\}}${_p9k__i::=6}${_p9k__bg::=003}}+}}}$_p9k__sss%b%k%f}${${COLUMNS::=$_p9k__clm}+}} '

# ----------------------------------- MISC -----------------------------------
export VISUAL=nvim
export EDITOR=$VISUAL
export GPG_TTY=$(tty)

#

# arduino
export ARDUINO_DIR=/usr/share/arduino/
export ARDMK_DIR=$HOME/.arduino/
export AVR_TOOLS_DIR=/usr
export ARDUINO_LIB_PATH=/home/neptunium/.arduino/lib/
# enable terminal linewrap
setterm -linewrap on 2> /dev/null

# colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LESSHISTFILE=-
export PATH=$HOME/.cargo/bin/:$PATH
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.local/bin

# ------------------------------- ZSH PLUGINS ---------------------------------
# Plugin source helper
_source_plugin() {
    local plugin_name="$1"
    for basedir in /usr/share/zsh/plugins /usr/share
    do
        plugin="$basedir/$plugin_name/$plugin_name.zsh"
        [ -f "$plugin" ] && source "$plugin" && return 0
    done
    echo "\033[33m[ ! ]\033[0m ZSH ${plugin_name#zsh-} not installed"
    return 1
}

# ZSH Autosuggestions
_source_plugin zsh-autosuggestions && ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'

# ZSH Syntax Highlighting
if _source_plugin zsh-syntax-highlighting
then
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white,underline
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
    ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
    ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
    ZSH_HIGHLIGHT_STYLES[path]=bold
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
    ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[command-substitution]=none
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[process-substitution]=none
    ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
    ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[assign]=none
    ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
    # ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
    ZSH_HIGHLIGHT_STYLES[comment]='fg=#888888'
    ZSH_HIGHLIGHT_STYLES[named-fd]=none
    ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
    ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
    ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
    ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi

unset -f _source_plugin



switch_powerlevel_multiline_prompt(){
    [ $POWERLEVEL9K_PROMPT_ON_NEWLINE = true ] \
        && POWERLEVEL9K_PROMPT_ON_NEWLINE=false \
        || POWERLEVEL9K_PROMPT_ON_NEWLINE=true

    zle && zle accept-line
}
zle -N switch_powerlevel_multiline_prompt
bindkey ^P switch_powerlevel_multiline_prompt


# -------------------------------- FUNCTIONS ---------------------------------
systemctl --user restart satpaper.service

eval "$(rbenv init - zsh)"

# pnpm
export PNPM_HOME="/home/neptunium/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(zoxide init --cmd cd zsh)"

export LANG=us_US.UTF-8
clear
