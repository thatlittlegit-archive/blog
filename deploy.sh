#!/bin/sh
hugo --help 2>/dev/null >/dev/null || (echo "$0: error: hugo failed, is it installed?" && exit 1) || exit $?
git checkout gh-pages
hugo
find -type f | grep -v './.git' | grep -v './public' | xargs rm
mv public/* .
rm .gitmodules
git add -A
git commit -m "Update site [ci skip]"
git push origin gh-pages
git checkout master
