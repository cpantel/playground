# problem:
# we have a document with two pages in every sheet and want one page per sheet
# the document has landscape orientation


# fix ImageMagick configuration:
# change none to read|write
# sudo vi /etc/ImageMagick-6/policy.xml
# <policy domain="coder" rights="none" pattern="PDF" />


# extract first page
echo "extracting first page"
pdftoppm -f 1 -l 1 -png input.pdf page

# get dimensions
echo "getting dimensions..."
read WIDTH HEIGHT  < <( file page-*.png | cut -d" " -f 5,7 | cut -d"," -f 1 )
rm page-*.png
#WIDTH=$(( $WIDTH / 2 ))
HEIGHT=$(( $HEIGHT / 2 ))
echo "  height: $HEIGHT"
echo "  width:  $WIDTH"

# extract half of the pages
pdftoppm -x 0 -y 0 -W "$WIDTH" -H "$HEIGHT" -png input.pdf page0

# extract the other half
pdftoppm -x 0 -y $HEIGHT -W "$WIDTH" -H "$HEIGHT" -png input.pdf page1

# rotate pages
DIR=90
for PNG in $(ls *png | sort  ); do
  convert -rotate $DIR $PNG $PNG
  DIR=$(( $DIR * -1 ))
done

# resort pages
STATE="invert0"
for PNG in $(ls *png | sort -t "-" -k 2 ); do
  case $STATE in
    "invert0")
      mv $PNG tmp
      PREV="$PNG"
      STATE="invert1"
    ;;
    "invert1")
      mv "$PNG" "$PREV"
      mv tmp "$PNG"
      STATE="skip0"
    ;;
    "skip0")
      STATE="skip1"
    ;;
    "skip1")
      STATE="invert0"
    ;;
  esac
done

# get list of pages
INPUT_PNG=$(ls *png | sort -t "-" -k 2 )

# put them all together
INPUT_PNG="$INPUT_PNG output.pdf"
convert $INPUT_PNG
