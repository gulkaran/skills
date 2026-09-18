#!/usr/bin/env bash
# Symlink each top-level skill dir (and _shared) into ~/.agents/skills.
# Safe alongside existing skills; refuses to clobber non-symlink entries.
set -euo pipefail

repo="$(cd "$(dirname "$0")" && pwd)"
target="${HOME}/.agents/skills"
mkdir -p "$target"

for dir in "$repo"/*/; do
  name="$(basename "$dir")"
  dest="$target/$name"
  if [ -L "$dest" ]; then
    ln -sfn "${dir%/}" "$dest"
    echo "relinked  $name"
  elif [ -e "$dest" ]; then
    echo "SKIPPED   $name (exists and is not a symlink — resolve manually)" >&2
  else
    ln -s "${dir%/}" "$dest"
    echo "linked    $name"
  fi
done
