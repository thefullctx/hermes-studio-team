#!/usr/bin/env bash
# Install the Hermes Studio Team souls into Hermes profiles.
#
#   ./install.sh                         # roles -> profiles with the same name
#   ./install.sh lead=atlas qa=sentinel  # map a role to a differently named profile
#   ./install.sh --dry-run               # show what would happen
#
# Each soul is copied to <HERMES_ROOT>/profiles/<profile>/SOUL.md.
# Existing SOUL.md files are backed up first. Missing profiles are skipped.
set -euo pipefail

HERMES_ROOT="${HERMES_ROOT:-$HOME/.hermes}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOULS_DIR="$SCRIPT_DIR/souls"
ROLES=(lead designer engineer qa)
DRY_RUN=0

declare -A PROFILE
for role in "${ROLES[@]}"; do PROFILE[$role]="$role"; done

for arg in "$@"; do
  case "$arg" in
    --dry-run|-n) DRY_RUN=1 ;;
    -h|--help) sed -n '2,10p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *=*)
      role="${arg%%=*}"; name="${arg#*=}"
      if [[ -z "${PROFILE[$role]+x}" ]]; then
        echo "Unknown role '$role'. Roles: ${ROLES[*]}" >&2; exit 1
      fi
      if [[ ! "$name" =~ ^[A-Za-z0-9._-]+$ ]]; then
        echo "Invalid profile name '$name'" >&2; exit 1
      fi
      PROFILE[$role]="$name" ;;
    *) echo "Unknown argument '$arg' (try --help)" >&2; exit 1 ;;
  esac
done

stamp="$(date +%Y%m%d-%H%M%S)"
installed=0

for role in "${ROLES[@]}"; do
  src="$SOULS_DIR/$role.md"
  dir="$HERMES_ROOT/profiles/${PROFILE[$role]}"
  dest="$dir/SOUL.md"

  if [[ ! -d "$dir" ]]; then
    echo "skip   $role: no profile at $dir"
    continue
  fi
  if [[ -f "$dest" ]] && cmp -s "$src" "$dest"; then
    echo "same   $role -> $dest"
    continue
  fi
  if (( DRY_RUN )); then
    echo "would  $role -> $dest"
    continue
  fi
  [[ -f "$dest" ]] && cp "$dest" "$dest.bak-$stamp"
  cp "$src" "$dest"
  echo "ok     $role -> $dest"
  installed=$((installed + 1))
done

echo
if (( DRY_RUN )); then
  echo "Dry run: nothing was changed."
else
  echo "Installed $installed soul(s). Start a new session for each agent to load it."
fi
