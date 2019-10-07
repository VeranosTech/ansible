#!/usr/bin/env bash

git add . -A
git commit -m "automatic commit"
git push origin korean

git checkout -B gh-pages
git rebase korean

touch .nojekyll

echo '!_build/' >> .gitignore
echo '!env/' >> .gitignore

cd docs/docsite
make generate_rst
sphinx-build -j auto -D language='ko' rst _build/html
cd ../..

git add . -A
git commit -m "build"
git push -f origin gh-pages
git reset --hard HEAD
git clean -f
git checkout korean

source deactivate
