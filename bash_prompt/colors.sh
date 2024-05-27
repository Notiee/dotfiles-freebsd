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
}


