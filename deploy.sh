 #!/bin/bash

cd ~/development/magicly.github.io

git pull

hexo g 

rm public/README.html

cp source/README.md public/

hexo d
