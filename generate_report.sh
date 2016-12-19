#!/bin/bash

GIT_DIR="your git directory"
AUTHOR_NAME="your committer name"

BEFORE_DATE=$(date +%Y-%m-%d)
AFTER_DATE=$(date +%Y-%m-%d)

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 9
fi

while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
        -yd|--yesterday)
		AFTER_DATE=$(date -v-1d +%Y-%m-%d)	
		break
        ;;
        -lw|--lastweek)
		WEEK_DAY=$(date +%u)
		if [ $WEEK_DAY == 5 ] || [ $WEEK_DAY == 6 ] || [ $WEEK_DAY == 7 ] 
		then
		OFFSET=$(($WEEK_DAY))
		AFTER_DATE=$(date -v-${OFFSET}d +%Y-%m-%d)
		else
		OFFSET=$(($WEEK_DAY + 7))
		AFTER_DATE=$(date -v-${OFFSET}d +%Y-%m-%d)
		fi
		break
        ;;
        -lm|--lastmonth)
		AFTER_DATE=$(date -v-1m +%Y-%m-01)
		BEFORE_DATE=$(date -v-1m +%Y-%m-31)
		break
        ;;
        -b|--before)
		shift
		BEFORE_DATE=$1
		;;
		-a|--after)
		shift
		AFTER_DATE=$1
		;;
        *)
        echo "Unknown option '$key'"
        exit 9
        ;;
    esac
    # Shift after checking all the cases to get the next option
    shift
done

git --git-dir=$GIT_DIR log --all --author=$AUTHOR_NAME --after=$AFTER_DATE --before=$BEFORE_DATE --pretty=format:"%s" | pbcopy

echo "git log between $AFTER_DATE and $BEFORE_DATE copied to pasteboard"