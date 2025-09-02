#!/bin/bash

AEROSPACE_FOCUSED_WORKSPACE=$1

aerospace move-node-to-workspace --window-id $(aerospace list-windows --all --json | jq '.[] | select (."app-name" == "zoom.us" and ."window-title" == "zoom share statusbar window") | ."window-id"') $AEROSPACE_FOCUSED_WORKSPACE
aerospace move-node-to-workspace --window-id $(aerospace list-windows --all --json | jq '.[] | select (."app-name" == "zoom.us" and ."window-title" == "zoom floating video window") | ."window-id"') $AEROSPACE_FOCUSED_WORKSPACE
aerospace move-node-to-workspace --window-id $(aerospace list-windows --all --json | jq '.[] | select (."app-name" == "zoom.us" and ."window-title" == "zoom annotation entrypoint") | ."window-id"') $AEROSPACE_FOCUSED_WORKSPACE
aerospace move-node-to-workspace --window-id $(aerospace list-windows --all --json | jq '.[] | select (."app-name" == "zoom.us" and ."window-title" == "zoom share toolbar window") | ."window-id"') $AEROSPACE_FOCUSED_WORKSPACE
aerospace move-node-to-workspace --window-id $(aerospace list-windows --all --json | jq '.[] | select (."app-name" == "zoom.us" and ."window-title" == "Meeting chat") | ."window-id"') $AEROSPACE_FOCUSED_WORKSPACE
aerospace move-node-to-workspace --window-id $(aerospace list-windows --all --json | jq '.[] | select (."app-name" == "Microsoft Outlook" and (."window-title" | contains("Reminder"))) | ."window-id"') $AEROSPACE_FOCUSED_WORKSPACE
