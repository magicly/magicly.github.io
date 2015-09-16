#!/bin/bash

cd ~/magicly.github.io

git pull

rm public/README.html

cp source/README.md public/

hexo d -g
