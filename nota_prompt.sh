# A lightweight (single file), cross-compatible (bash v3/v4,
# MacOS, Linux), bash prompt with basic theming support. To 
# install, just source this file from your .bashrc with, so
# it is only loaded for an interactive session:
#
#   if [[ -n $PS1 && -f ~/nota_prompt.sh ]]; then
#     . ~/nota_prompt.sh
#     ps1_colorful_theme
#   fi

# Color definitions
 c_normal="\001$(tput sgr0)\002"
  c_black="\001$(tput setaf 0)\002"
    c_red="\001$(tput setaf 1)\002"
  c_green="\001$(tput setaf 2)\002"
 c_yellow="\001$(tput setaf 3)\002"
   c_blue="\001$(tput setaf 4)\002"
c_magenta="\001$(tput setaf 5)\002"
   c_cyan="\001$(tput setaf 6)\002"
  c_white="\001$(tput setaf 7)\002"
 c_bblack="\001$(tput setaf 8)\002"
 c_bwhite="\001$(tput setaf 15)\002"




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
  setup_ps1
}


function ps1_colorful_theme {
  c_token="$c_white"
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
  setup_ps1
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
  setup_ps1
}



function ps1_nota_theme {
  c_token="$c_normal"
  c_time="$c_yellow"
  c_dur_exit_zero="$c_yellow"
  c_dur_exit_nonzero="$c_red"
  c_user_root="$c_magenta"
  c_user_nonroot="$c_blue"
  c_hostname="$c_green"
  c_dir_path="$c_cyan"
  c_git_branch="$c_cyan"
  c_shell_jobs="$c_magenta"
  c_text_input="$c_normal"
  nota_prompt
}







# IMPLEMENTATION

function timer_start {
  # timer will already be set if a user is invoking a set 
  # of commands such as cmd1 && cmd2. If we don't check, then
  # we will not include the elapsed time of the first command.
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  # We need to unset this as we use the existence of it to 
  # test whether or not multiple commands were executed in
  # a manner such as cmd1 && cmd2.
  unset timer
}

# Elapsed time for last command; colorize based on status.
# Pirst arg is success color, and second arg is failure color.
function color_timer {
  local result=$?  # Must capture before it is reset
  local color=$1

  if [[ $timer_show > 1 ]]; then
  
    if [[ $result -ne 0 ]]; then
      color=$2
    fi
    printf "${c_token} took ${color}${timer_show}s"

  fi

}

# Colorize username with first arg. If username is root, use
# the second arg as the color.
function color_user {
  local color=$1
  if [[ $USER = "root" ]]; then
    local color="$2"
  fi
  printf "${color}${USER}"
}

# Colorize the number of running/sleeping jobs.
function color_jobs {
  local color="$1"
  local jobs=$(jobs -p | wc -l | tr -d '[:space:]')
  if [[ $jobs -gt 0 ]]; then
    printf "${color}${jobs}"
  fi
}

# Colorize the current Git branch.
function color_branch {
  local color=$1
  local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [[ -n $branch ]]; then
    printf "${c_token} on ${color}${branch}"
  fi
}

# Colorize the PWD, substituting tilde for $HOME, and trim to
# depth directories substituting excess with '...'. On newer
# versions of bash, you can use PROMPT_DIRTRIM, but this works
# with old school sed (no extended regexs) and bash3 which 
# does not support PROMPT_DIRTERM.
function color_dirtrim {
  local depth=$1
  local color=$2
  # Use only basic sed regex for compatibility across both
  # MacOS and Linux. It makes it hard to read, but it does
  # appear to work! Took me a while to get this working :-)
  dirtrim=$(echo $PWD | sed -e "s%${HOME}%~%" -e "s%^~\{0,1\}\(/[^/]\{1,\}\)\{1,\}\(\(/[^/]\{1,\}\)\{${depth}\}\)$%...\2%")
  printf "${color}${dirtrim}"
}

# Wrap text with tokens if text is not empty. The first arg
# must contain at least 2 characters. The first is used for
# the left token, and the rest are used for the right token.
# This allows the caller to insert a space following the 
# wrapped text. By passing the space in here, it will only
# be printed if the wrapped text is not empty.
function wrap {
  local beg_token="${1:0:1}"
  local end_token="${1:1}"
  local text="${@:2}"
  if [[ -n $text ]]; then
    printf "${c_token}${beg_token}${text}${c_token}${end_token}"
  fi
}





function nota_prompt {
  if [[ ! $(trap -p DEBUG) = *timer_start* ]]; then
    trap 'printf $c_normal; timer_start' DEBUG
  fi

  if [[ ! $PROMPT_COMMAND = *timer_stop* ]]; then
    if [[ -z $PROMPT_COMMAND ]]; then 
      PROMPT_COMMAND="timer_stop"
    else
      PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
    fi
  fi


  # Start with an empty prompt
  PS1=""

  # First part of the line drawing
  PS1+="\n${c_token}┌ "

  # HH:MM Time of day in 24-hour format
  # PS1+="${c_time}\A "
  # PS1+="${c_time}$(date) "


  # <username@host> Color of username changes if root
  PS1+="\$(color_user $c_user_nonroot $c_user_root)"
  PS1+="${c_token} at "
  PS1+="${c_hostname}\h"
  PS1+="${c_token} in "

  # [.../dir/dir/dir] Current path trimmed (compat w/ bash3 and bash4)
  PS1+="\$(color_dirtrim 3 $c_dir_path)"


  # [0s] Duration of last command; color reflects exit status
  PS1+="\$(color_timer $c_dur_exit_zero $c_dur_exit_nonzero)"


  # (master) Git branch name
  PS1+="\$(color_branch $c_git_branch)"

  # <N> Number of jobs running and sleeping
  PS1+="\$(wrap '<> ' \$(color_jobs $c_shell_jobs))"

  # Second part of the line drawing
  PS1+="\n${c_token}└─ "

  # Color our text input; cmd output is sent to c_normal in TRAP above
  PS1+="${c_text_input}"
}
