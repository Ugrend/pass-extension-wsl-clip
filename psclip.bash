#!/bin/bash
POWERSHELL_EXE_LOCATION="${POWERSHELL_EXE_LOCATION:-/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe}"
clip() {
        local sleep_argv0="password store sleep on display $DISPLAY"
        pkill -f "^$sleep_argv0" 2>/dev/null && sleep 0.5
        local before="$(${POWERSHELL_EXE_LOCATION} Get-Clipboard 2>/dev/null | base64)"
        ${POWERSHELL_EXE_LOCATION} Set-Clipboard -Value  "'${1//\'/\'\'}'" || die "Error: Could not copy data to the clipboard"
        (
                ( exec -a "$sleep_argv0" sleep "$CLIP_TIME" )
                local now="$(${POWERSHELL_EXE_LOCATION} Get-Clipboard | base64)"
                [[ $now != $(echo -n "$1" | base64) ]] && before="$now"
                ${POWERSHELL_EXE_LOCATION} "echo ' ' | Set-Clipboard" # Can't Work out a way to set before correctly so set it to a blank string
        ) 2> /dev/null & disown
        echo "Copied $2 to clipboard. Will clear in $CLIP_TIME seconds."
}
cmd_show --clip "$@"
