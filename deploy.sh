#!/bin/sh
hugo --help 2>/dev/null >/dev/null || (echo "$0: error: hugo failed, is it installed?" && exit 1) || exit $?
git stash save
git checkout gh-pages
git checkout master -- .
ls
hugo
find -type f | grep -v './.git' | grep -v './public' | xargs rm
mv public/* .
mv public/posts/* .
rm .gitmodules
git add -A
git commit -m "Update site [ci skip]"
git push origin gh-pages
git checkout master
git stash pop
git submodule update --force
