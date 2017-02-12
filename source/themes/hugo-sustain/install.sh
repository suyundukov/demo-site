git clone https://github.com/nurlansu/hugo-sustain.git ./source/themes/hugo-sustain/themes/hugo-sustain
find ./source/themes/hugo-sustain/ -name "*.html" -exec perl -pe 's/<\/body>/`cat .\/source\/themes\/hugo-sustain\/github.txt`/ge' -i {} \;
hugo -s ./source/themes/hugo-sustain
