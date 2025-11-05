#! /usr/bin/env bash
PROJECTS_DIR="${HOME}/Projects/"

CHOICE=$(printf "$(ls $PROJECTS_DIR)\nCREATE NEW" | rofi -dmenu -p "")

if [ -z $CHOICE ]; then
	exit
fi

if [ "$CHOICE" = "CREATE NEW" ]; then
	NEW_PROJECT=$(rofi -dmenu -p "")
	if [ -n "$NEW_PROJECT" ]; then
		mkdir -p "$PROJECTS_DIR$NEW_PROJECT"
		code "$PROJECTS_DIR$NEW_PROJECT"
	fi
else
	code "$PROJECTS_DIR$CHOICE"
fi

