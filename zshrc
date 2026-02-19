cat todo

autoload -Uz compinit
compinit

battery_status () {
	cat /sys/class/power_supply/BAT0/capacity
}

processus_vim () {
    local tty=$(tty)
    # ps -t <tty> liste les processus attachés à ce terminal
    ps -t "$tty" -o comm= | grep -c '^vim$'
}

git-branch () {
	local branch
	branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	[[ -n $branch ]] && echo " [$branch]"
}

line_prompt () {
	echo $(($(battery_status) + $(processus_vim) * 100))
}

export PATH="$HOME/.local/bin:$PATH"
setopt PROMPT_SUBST

PROMPT='$(line_prompt)$(git-branch) ' 
#%~ %# '

#alias ls='ls --color=auto'
alias dark='switch-foot-theme.sh dark'
alias light='switch-foot-theme.sh light'
alias night='switch-foot-theme.sh night'

export LESS='-RFX'

minishell() {
	cd ~/dev/local/minishell
}
minirt() {
	cd ~/dev/github/-miniRT
}
cpp() {
	cd ~/dev/github/cpp
}
exam() {
	cd ~/dev/local/exam42
}
local42() {
	cd ~/dev/local
}


clavier() {
  local level=$1
  local max=$(cat /sys/class/leds/asus::kbd_backlight/max_brightness)

  if [[ -z $level ]]; then
    echo "Usage: kbdlight <niveau_entre_0_et_$max>"
    return 1
  fi

  if (( level < 0 || level > max )); then
    echo "Erreur : niveau doit être entre 0 et $max"
    return 1
  fi

  echo $level | sudo tee /sys/class/leds/asus::kbd_backlight/brightness
}

get-networks () {
	iwctl station wlan0 scan
	iwctl station wlan0 get-networks
}

connect-to () {
	iwctl station wlan0 connect $1
}

restart-audio() {
	systemctl --user restart pipewire pipewire-pulse wireplumber
}

git-graph() {
	git log --oneline --decorate --graph --all
}

#nmtui() {
#	NEWT_COLORS=$(<~/.config/nmtui/palette) command nmtui
#}

grep-all() {
    if [ -z "$1" ]; then
        echo "Usage: grep-all <mot_ou_expression>"
        return 1
    fi
    grep -rn . -e "$1"
}

jelicourci()
{
	cd /srv/jellyfin/media
}

see-output() {
	swaymsg -t get_outputs
}

function cd {
    builtin cd "$@"
    if [ -f "todo" ]; then
        cat todo
    fi
}

change-scale() {
	swaymsg output eDP-1 scale $1  
}
