mindtct=/Users/andyh2/Documents/projects/cryptothumb/nbis/bin/mindtct
cd ~/Documents/projects/cryptothumb/image_sandbox/
mkdir -p mindtct

for file in "$@"
do
    newpath=$(basename "$file").jpg
    sips -s format jpeg "$file" --out "$newpath"
    /usr/local/bin/mogrify -depth 8 "$newpath"
    $mindtct -m1 -b "$newpath" "mindtct/$newpath"
done
