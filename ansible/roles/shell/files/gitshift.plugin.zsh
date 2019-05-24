function gcsd() {
  if [[ "$1" =~ ^[-+][0-9]+ ]]; then
    local hour_shift="$1"
  elif [[ "$1" =~ ^[0-9]+ ]]; then
    local hour_shift="+$1"
  else
    echo "Date shift must be an integer!"
    return 1
  fi
  local shifted_date=$(date --date="$hour_shift hour")
  shift
  GIT_COMMITTER_DATE="$shifted_date" git commit --date="$shifted_date" $@
}
compdef _git gcsd=git-commit
