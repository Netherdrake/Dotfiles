# Default Theme
TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'235'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'255'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}


# Format: segment_name background_color foreground_color [non_default_separator]

# if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
#   TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
#     "tmux_session_info 24 255" \
#     # "hostname 33 0" \
#     # "ifstat_sys 30 255" \
#     "wan_ip 93 255" \
#     "ifstat_sys 64 255" \
#     "vcs_branch 29 88" \
#   )
# fi
# if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
#   TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
#     # "pwd 89 211" \
#     # "now_playing 234 37" \
#     #"cpu 240 136" \
#     "battery 64 255" \
#     "load 93 255" \
#     #"rainbarf 0 0" \
#     #"xkb_layout 125 117" \
#     "date_day 24 255" \
#     "date 24 255 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
#     "time 24 255 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
#   )
# fi

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
  TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
    "tmux_session_info 24 255" \
    # "hostname 33 0" \
    # "ifstat_sys 30 255" \
    # "lan_ip 59 255" \
    "wan_ip 59 255" \
    # "ifstat_sys 64 255" \
    "vcs_branch 64 255" \
  )
fi
if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
  TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
    # "pwd 89 211" \
    # "now_playing 234 37" \
    #"cpu 240 136" \
    "battery 64 255" \
    "load 59 255" \
    #"rainbarf 0 0" \
    #"xkb_layout 125 117" \
    "date_day 24 255" \
    "date 24 255 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
    "time 24 255 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
  )
fi
