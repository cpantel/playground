# change none to read|write
# sudo vi /etc/ImageMagick-6/policy.xml
# <policy domain="coder" rights="none" pattern="PDF" />


# missing scaling

pdftoppm -f 1 -l 1 -png input.pdf page

read WIDTH HEIGHT  < <( file page-001.png | cut -d" " -f 5,7 | cut -d"," -f 1 )

rm page-001.png

WIDTH=$(( $WIDTH / 2 ))


pdftoppm -x 0 -y 0 -W "$WIDTH" -H "$HEIGHT" -png input.pdf page0

pdftoppm -x "$WIDTH" -y 0 -W "$WIDTH" -H "$HEIGTH" -png input.pdf page1

INPUT_PNG=$(ls *png | sort -t "-" -k 2 )
INPUT_PNG="$INPUT_PNG output.pdf"

convert $INPUT_PNG
