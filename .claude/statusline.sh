#!/usr/bin/env bash
input=$(cat)
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

green="\033[32m"
yellow="\033[33m"
red="\033[31m"
reset="\033[0m"

segment_color() {
  local pos=$1  # 1-indexed
  if [ "$pos" -ge 9 ]; then
    printf "%s" "$red"
  elif [ "$pos" -ge 6 ]; then
    printf "%s" "$yellow"
  else
    printf "%s" "$green"
  fi
}

if [ -z "$used" ]; then
  used="0"
fi

pct=$(printf "%.0f" "$used")
filled=$(( (pct + 9) / 10 ))

bar=""
for ((i=1; i<=10; i++)); do
  color=$(segment_color "$i")
  if [ "$i" -le "$filled" ]; then
    bar+="${color}|"
  else
    bar+="${color}·"
  fi
done

if [ "$pct" -ge 80 ]; then
  pct_color="$red"
elif [ "$pct" -ge 50 ]; then
  pct_color="$yellow"
else
  pct_color="$green"
fi

printf "Context %b%b %b%s%%%b" "$bar" "$reset" "$pct_color" "$pct" "$reset"
