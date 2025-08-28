# utlis.sh 
# is a collection of functions that i want to use in multiple files
# do not call this file directly 

log()   { echo -e "\033[1;32m[INFO]\033[0m $*"; }
warn()  { echo -e "\033[1;33m[WARN]\033[0m $*"; }
err()   { echo -e "\033[1;31m[ERROR]\033[0m $*" >&2; }


check_cmd() {
  local cmd="$1"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    err "Required command '$cmd' not found."
    exit 1
  fi
}
