#
# ~/.bashrc
#

set -o vi

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

#alias cp="cp -i"                          # confirm before overwriting something
#alias df='df -h'                          # human-readable sizes
#alias free='free -m'                      # show sizes in MB
#alias np='nano -w PKGBUILD'
#alias more=less

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
export EDITOR=nvim

# Personal aliases {{{
alias cdls='cdls_func(){ cd "$1" && ls; unset -f cdls_func; }; cdls_func'
alias cdf='cdf_func(){ cd "$(find . - type d | fzf)"; unset -f cdf_func; }; cdf_func'
alias endall='endall_func(){ ~/scripts/system/shutdown.sh; unset -f endall_func; }; endall_func'

alias pushall='pushall_func(){ ~/scripts/git/git_push_all.sh; unset -f pushall_func; }; pushall_func'
alias pullall='pullall_func(){ ~/scripts/git/git_pull_all.sh; unset -f pullall_func; }; pullall_func'
alias addgit='addgit_func(){ echo "$(pwd),$(git remote get-url origin)" >> $HOME/scripts/git/github_tracked_dirs.csv; unset -f addgit_func; }; addgit_func'
alias citavpn='citavpn_func(){ ~/scripts/VPN/citavpn.sh & unset -f citavpn_func; }; citavpn_func'
gitac() {
    git add -u
    git commit -m "$1"
}


alias screenoff='screenoff_func(){ xset dpms force off; unset -f screenoff_func; }; screenoff_func'
alias cald='cald_func(){ cal -m; unset -f cald_func; }; cald_func'

alias invert='invert_func(){ ~/scripts/custom_docs_editing/invert_pdf.sh; unset -f invert_func; }; invert_func'

alias zd='zd_func(){ zathura "$1" ; unset -f zd_func; }; zd_func'
alias zl='zl_func(){ zathura -c .dotfiles/zathura/zathurarc-light "$1" ; unset -f zl_func; }; zl_func'
alias zdf='zd_func(){ zathura $(fzf) ; unset -f zd_func; }; zd_func'
alias zlf='zl_func(){ zathura -c .dotfiles/zathura/zathurarc-light $(fzf) ; unset -f zl_func; }; zl_func'

alias shgpt='shgpt_func(){ source ~/env/venv/bin/activate; source ~/.bash_profile; unset -f shgpt_func; }; shgpt_func'
alias srcenv='srcenv_func(){ source ./env/bin/activate ; unset -f srcenv_func; }; srcenv_func'
alias devenv='srcenv_func(){ python -m venv env; source ./env/bin/activate ; pip install numpy scipy matplotlib ; unset -f srcenv_func; }; srcenv_func'

function ccp() {
    xsel -b
}
alias cpp='xclip -selection clipboard -o'

alias remcon='remcon_func(){ if [ $# -eq 0 ]; then ~/scripts/web/remoteconnect.sh; else ~/scripts/web/remoteconnect.sh "$1"; fi; unset -f remcon_func; }; remcon_func'
alias stup='stup_func(){ ~/scripts/startup/startup.sh; unset -f stup_func; }; stup_func'
alias wifissh='wifissh_func(){ ~/scripts/web/establish_ssh_over_wifi.sh "$1"; unset -f wifissh_func; }; wifissh_func'

alias xopdf='~/scripts/custom_docs_editing/xopdf.sh'
alias note='~/Software/Noterius/bin/note.sh'
alias cdp='~/Software/Citerius/download_paper.sh'
alias cfp='~/Software/Citerius/fuzzy_find_paper.sh'
alias bslt='~/scripts/bspwm_scripts/bspwm-layouts.sh'
#}}}

ino_up_func() { #{{{
    ~/Documents/Projects/Arduino/upload_ino_sketch.sh "$@"
}
alias ino_up='ino_up_func'
#}}}


# Pinyin {{{
ibus-daemon -drx # This controls the overall language switching
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export IBUS_ENABLE_SYNC_MODE=1
# }}}

# Edit PATH
export PATH="$HOME/.local/bin:$PATH"

#alias vim='vim -c "set filetype=tex"'
# Shell-GPT integration BASH v0.1
_sgpt_bash() {
if [[ -n "$READLINE_LINE" ]]; then
	READLINE_LINE=$(sgpt --shell <<< "$READLINE_LINE")
    READLINE_POINT=${#READLINE_LINE}
fi
}
bind -x '"\C-l": _sgpt_bash'
# Shell-GPT integration BASH v0.1
#source ~/env/venv/bin/activate
#source ~/.bash_profile
# Shell-GPT integration BASH v0.1
_sgpt_bash() {
if [[ -n "$READLINE_LINE" ]]; then
	READLINE_LINE=$(sgpt --shell <<< "$READLINE_LINE")
    READLINE_POINT=${#READLINE_LINE}
fi
}
bind -x '"\C-l": _sgpt_bash'
# Shell-GPT integration BASH v0.1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
