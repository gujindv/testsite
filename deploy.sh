export TZ='Asia/Shanghai'
git config --global user.email email@email.com
git config --global user.name user-circleci
git clone git@github.com:gujindv/testsite.git -b gh-pages gh-pages

git config --global core.quotepath false

#download hugo
curl -L -o hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.55.6/hugo_0.55.6_Linux-64bit.tar.gz
tar -xzvf hugo.tar.gz

#build site
./hugo
cp gh-pages/.git public -r

#deploy
cd public
git add .
git commit -m "Site updated by circleci: `date +"%Y%m%d-%H:%M:%S"` UTC+8"
git push origin gh-pages