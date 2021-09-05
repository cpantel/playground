# problem: we have a document with two pages in every sheet and want one page per sheet

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
WIDTH=$(( $WIDTH / 2 ))
echo "  height: $HEIGHT"
echo "  width:  $WIDTH"

# extract half of the pages
pdftoppm -x 0 -y 0 -W "$WIDTH" -H "$HEIGHT" -png input.pdf page0

# extract the other half
pdftoppm -x "$WIDTH" -y 0 -W "$WIDTH" -H "$HEIGHT" -png input.pdf page1

# get list of pages
INPUT_PNG=$(ls *png | sort -t "-" -k 2 )

# put them all together
INPUT_PNG="$INPUT_PNG output.pdf"
convert $INPUT_PNG
