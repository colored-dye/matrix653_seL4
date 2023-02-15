#!/usr/bin/bash
rm -f .fetch-log
while IFS=" " read -r path url; do
    # printf "%s %s\n" $url $path
    if ! test -e $path; then
        git clone $url $path >>.fetch-log 2>&1
        date >> .fetch-log
        if test $? -ne 0; then
            echo "Failed: " $path $url
        fi
    else
        echo "Skipped: " $path $url
    fi
done < $1
