for newXyt in "$@"; do
    mapped_prints="/Users/andyh2/Google Drive/Documents/projects/cryptothumb/dro/mapped_prints/"
    bozorth3="/Users/andyh2/Documents/projects/cryptothumb/nbis/bin/bozorth3"
    cd "$mapped_prints"
    scores=
    echo "$(ls)" > ~/out
    for f in *.xyt; do
        score=$($bozorth3 -m1 "$newXyt" "$f" 2>&1)
        if [ "$score" -lt 10 ]; then
            continue
        fi
        scores=$scores$(printf "$score $f\n")
    done
    highScore=$(echo "$scores" | sort -k 1 | tail -n 1)
    if [ "$highScore" = "" ]; then
        continue
    fi
    echo "$highScore" > ~/out
    url=$(echo "$highScore" | awk '{print $2}' | awk -F'-' '{print $1}')
    open "http://$url"
done