#!/usr/bin/env bash

current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

get_tmux_option() {
	local option=$1
	local default=$2
	local value=$(tmux show-option -gqv "$option")

	if [ -n "$value" ]; then
		echo "$value"
	else
		echo "$default"
	fi
}

set() {
	local opt=$1
	local val=$2
	tmux_commands+=(set-option -gq "$opt" "$val" ";")
}

setw() {
	local opt=$1
	local val=$2
	tmux_commands+=(set-window-option -gq "$opt" "$val" ";")
}

main() {
	local flavor=$(get_tmux_option "@lunaria-flavor" "light")
	local tmux_commands=()

	source /dev/stdin <<<"$(sed -e "/^[^#].*=/s/^/local /" "${current_dir}/lunaria-${flavor}.tmuxtheme" | tr '[:upper:]' '[:lower:]')"

	# Status
	set status-style "fg=${lunaria_fg} bg=${lunaria_deemph_bg}"

	# Messages
	set message-style "fg=${lunaria_emph_fg} bg=${lunaria_bg_green_05}"

	# Panes
	set pane-border-style "fg=${lunaria_deemph_bg}"
	set pane-active-border-style "fg=${lunaria_vivid_violet}"

	# Modes
	setw mode-style "fg=${lunaria_emph_fg} bg=${lunaria_bg_blue_025}"

	tmux "${tmux_commands[@]}"
}

main "$@"
