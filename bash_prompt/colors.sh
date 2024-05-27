# Color definitions
 c_normal="$(tput sgr0)"
  c_black="$(tput setaf 0)"
    c_red="$(tput setaf 1)"
  c_green="$(tput setaf 2)"
 c_yellow="$(tput setaf 3)"
   c_blue="$(tput setaf 4)"
c_magenta="$(tput setaf 5)"
   c_cyan="$(tput setaf 6)"
  c_white="$(tput setaf 7)"
 c_bblack="$(tput setaf 8)"
 c_bwhite="$(tput setaf 15)"


# Better color definition TODO: fix color names not being correct
if tput setaf 1 &> /dev/null; then
  #tput sgr0
  normal=$(tput sgr0)
  bold=$(tput bold) # was: Bright
  blink=$(tput blink)
  reverse=$(tput smso)
  underline=$(tput smul)
  # Foreground colors
  black=$(tput setaf 0)        #000000
  maroon=$(tput setaf 1)       #800000
  green=$(tput setaf 2)        #008000
  olive=$(tput setaf 3)        #808000
  navy=$(tput setaf 4)         #000080
  purple=$(tput setaf 5)       #800080
  teal=$(tput setaf 6)         #008080
  silver=$(tput setaf 7)       #c0c0c0
  gray=$(tput setaf 8)         #808080
  red=$(tput setaf 9)          #ff0000
  lime=$(tput setaf 10)        #00ff00
  yellow=$(tput setaf 11)      #ffff00
  blue=$(tput setaf 12)        #0000ff
  magenta=$(tput setaf 13)     #ff00ff
  aqua=$(tput setaf 14)        #00ffff
  white=$(tput setaf 15)       #ffffff
  # Background colors
  black_bg=$(tput setab 0)     #000000
  maroon_bg=$(tput setab 1)    #800000
  green_bg=$(tput setab 2)     #008000
  olive_bg=$(tput setab 3)     #808000
  navy_bg=$(tput setab 4)      #000080
  purple_bg=$(tput setab 5)    #800080
  teal_bg=$(tput setab 6)      #008080
  silver_bg=$(tput setab 7)    #c0c0c0
  gray_bg=$(tput setab 8)      #808080
  red_bg=$(tput setab 9)       #ff0000
  lime_bg=$(tput setab 10)     #00ff00
  yellow_bg=$(tput setab 11)   #ffff00
  blue_bg=$(tput setab 12)     #0000ff
  magenta_bg=$(tput setab 13)  #ff00ff
  aqua_bg=$(tput setab 14)     #00ffff
  white_bg=$(tput setab 15)    #ffffff
else
  normal='\033[m'
  bold='\033[0;1m' # was: Bright
  blink='\033[0;5m'
  reverse='\033[0;7m'
  underline='\033[0;4m'
  # Foreground colors
  black='\033[0;30m'           #000000
  maroon='\033[0;31m'          #800000
  green='\033[0;32m'           #008000
  olive='\033[0;33m'           #808000
  navy='\033[0;34m'            #000080
  purple='\033[0;35m'          #800080
  teal='\033[0;36m'            #008080
  silver='\033[0;37m'          #c0c0c0
  gray='\033[1;30m'            #808080
  red='\033[1;31m'             #ff0000
  lime='\033[1;32m'            #00ff00
  yellow='\033[1;33m'          #ffff00
  blue='\033[1;34m'            #0000ff
  magenta='\033[1;35m'         #ff00ff
  aqua='\033[1;36m'            #00ffff
  white='\033[1;37m'           #ffffff
  # Background Colors
  black_bg='\033[0;40m'        #000000
  maroon_bg='\033[0;41m'       #800000
  green_bg='\033[0;42m'        #008000
  olive_bg='\033[0;43m'        #808000
  navy_bg='\033[0;44m'         #000080
  purple_bg='\033[0;45m'       #800080
  teal_bg='\033[0;46m'         #008080
  silver_bg='\033[0;47m'       #c0c0c0
  gray_bg='\033[1;40m'         #808080
  red_bg='\033[1;41m'          #ff0000
  lime_bg='\033[1;42m'         #00ff00
  yellow_bg='\033[1;43m'       #ffff00
  blue_bg='\033[1;44m'         #0000ff
  magenta_bg='\033[1;45m'      #ff00ff
  aqua_bg='\033[1;46m'         #00ffff
  white_bg='\033[1;47m'        #ffffff
fi

# Color themes

function ps1_dark_theme {
  c_token="$c_bblack"
  c_time="$c_bblack"
  c_dur_exit_zero="$c_bblack"
  c_dur_exit_nonzero="$c_red"
  c_user_root="$c_red"
  c_user_nonroot="$c_bblack"
  c_hostname="$c_bblack"
  c_dir_path="$c_bblack"
  c_git_branch="$c_bblack"
  c_shell_jobs="$c_bblack"
  c_text_input="$c_blue"
}

function ps1_colorful_theme {
  c_token="$c_normal"
  c_time="$c_bwhite"
  c_dur_exit_zero="$c_green"
  c_dur_exit_nonzero="$c_red"
  c_user_root="$c_red"
  c_user_nonroot="$c_magenta"
  c_hostname="$c_yellow"
  c_dir_path="$c_cyan"
  c_git_branch="$c_magenta"
  c_shell_jobs="$c_red"
  c_text_input="$c_blue"
}

function ps1_white_theme {
  c_token="$c_bblack"
  c_time="$c_bwhite"
  c_dur_exit_zero="$c_bwhite"
  c_dur_exit_nonzero="$c_red"
  c_user_root="$c_red"
  c_user_nonroot="$c_bwhite"
  c_hostname="$c_bwhite"
  c_dir_path="$c_bwhite"
  c_git_branch="$c_bwhite"
  c_shell_jobs="$c_bwhite"
  c_text_input="$c_blue"
}

function ps1_blue_theme {
  c_token="$c_blue"
  c_time="$c_blue"
  c_dur_exit_zero="$c_blue"
  c_dur_exit_nonzero="$c_yellow"
  c_user_root="$c_yellow"
  c_user_nonroot="$c_blue"
  c_hostname="$c_blue"
  c_dir_path="$c_blue"
  c_git_branch="$c_blue"
  c_shell_jobs="$c_blue"
  c_text_input="$c_red"
}

function ps1_green_theme {
  c_token="$c_green"
  c_time="$c_green"
  c_dur_exit_zero="$c_green"
  c_dur_exit_nonzero="$c_red"
  c_user_root="$c_red"
  c_user_nonroot="$c_green"
  c_hostname="$c_green"
  c_dir_path="$c_green"
  c_git_branch="$c_green"
  c_shell_jobs="$c_green"
  c_text_input="$c_yellow"
}

function ps1_yellow_theme {
  c_token="$c_yellow"
  c_time="$c_yellow"
  c_dur_exit_zero="$c_yellow"
  c_dur_exit_nonzero="$c_red"
  c_user_root="$c_red"
  c_user_nonroot="$c_yellow"
  c_hostname="$c_yellow"
  c_dir_path="$c_yellow"
  c_git_branch="$c_yellow"
  c_shell_jobs="$c_yellow"
  c_text_input="$c_blue"
}

function ps1_red_theme {
  c_token="$c_red"
  c_time="$c_red"
  c_dur_exit_zero="$c_red"
  c_dur_exit_nonzero="$c_yellow"
  c_user_root="$c_yellow"
  c_user_nonroot="$c_red"
  c_hostname="$c_red"
  c_dir_path="$c_red"
  c_git_branch="$c_red"
  c_shell_jobs="$c_red"
  c_text_input="$c_blue"
}

function ps1_nota_theme {
  c_token="$c_white"
  c_time="$c_yellow"
  c_dur_exit_zero="$c_yellow"
  c_dur_exit_nonzero="$c_red"
  c_user_root="$c_red"
  c_user_nonroot="$c_blue"
  c_hostname="$c_green"
  c_dir_path="$c_cyan"
  c_git_branch="$c_magenta"
  c_shell_jobs="$c_magenta"
  c_text_input="$c_white"
}


