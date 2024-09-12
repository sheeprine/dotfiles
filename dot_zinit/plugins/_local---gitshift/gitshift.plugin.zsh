# Shifts the commit/author date of a git commit
function gcsd() {
  if [[ "$1" =~ ^[-+][0-9]+ ]]; then
    local hour_shift="$1"
  elif [[ "$1" =~ ^[0-9]+ ]]; then
    local hour_shift="+$1"
  else
    echo "Date shift must be an integer!"
    return 1
  fi
  if [[ $OSTYPE == darwin* ]]; then
    local shifted_date=$(date -v ${hour_shift}H)
  else
    local shifted_date=$(date -d "{$hour_shift} hour")
  fi
  shift
  GIT_COMMITTER_DATE="$shifted_date" git commit --date="$shifted_date" $@
}
compdef _git gcsd=git-commit
