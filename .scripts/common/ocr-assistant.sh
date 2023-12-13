#!/bin/zsh

lockfile=/tmp/screenshot_lock
if [ -e $lockfile ]; then
    echo "Another instance is already running."
else
    touch $lockfile
    fname=ss_$(date -d "today" +"%Y_%m_%d_%H_%M_%S").png
    sleep 1
    import ~/Pictures/$fname 
    rm $lockfile

    fname=~/Pictures/$fname
    uuid=$(uuidgen)
    newfname=~/Pictures/ocr-assistant/screenshots/$uuid.png
    mv $fname $newfname

    preprocessed=~/Pictures/ocr-assistant/preprocessed/$uuid.png
    python - $newfname $preprocessed <<'EOF'
from PIL import Image
from PIL import ImageEnhance
import sys


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python .. <filepath> <outputpath>")
        exit(1)

    filepath = sys.argv[1]
    outputpath = sys.argv[2]

    img = Image.open(filepath)
    # resize
    basewidth = 300
    if img.size[0] < basewidth: 
        wpercent = basewidth / float(img.size[0])
        hsize = int((float(img.size[1]) * float(wpercent)))
        img = img.resize((basewidth, hsize), Image.LANCZOS)

    # greyscale
    img = img.convert("L")

    # contrast
    enhancer = ImageEnhance.Contrast(img)
    img = enhancer.enhance(2.0)

    img.save(outputpath)
EOF

    tesseract $preprocessed $uuid
    mv $uuid.txt ~/Pictures/ocr-assistant/results/
    textfile=~/Pictures/ocr-assistant/results/$uuid.txt
    echo $textfile
    xclip -se c < $textfile
fi

