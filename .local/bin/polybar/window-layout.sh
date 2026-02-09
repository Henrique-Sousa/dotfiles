#!/bin/sh
# Queries the i3 tree to find the layout of the parent of the focused window
layout=$(i3-msg -t get_tree | jq -r '
  recurse(.nodes[], .floating_nodes[])
  | select(.nodes[]? | .focused)
  | .layout
')

case "$layout" in
  "tabbed")  echo "T" ;;
  "stacked") echo "S" ;;
  "splith")  echo "H" ;;
  "splitv")  echo "V" ;;
  *)         echo "" ;;
esac
