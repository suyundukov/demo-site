git clone https://github.com/nurlansu/hugo-vitae.git ./source/themes/hugo-vitae/themes/hugo-vitae
find ./source/themes/hugo-vitae/ -name "*.html" -exec perl -pe 's/<\/body>/`cat .\/source\/themes\/hugo-vitae\/github.txt`/ge' -i {} \;
hugo -s ./source/themes/hugo-vitae
