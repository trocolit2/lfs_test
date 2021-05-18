#! /bin/bash

show_helper=false
if [ -z "$1" ];
then
  echo "ERROR: Empty packge_name"
  show_helper=true
fi

if [ -z "$2" ];
then
  echo "ERROR: Empty version"
  show_helper=true
fi

if [ "$show_helper" = true ];
then
  echo "Usage: ./$0 <package_name> <version>"
  echo "Example: ./$0 fake_package 1.0.1"
  exit 1
fi

wget https://raw.githubusercontent.com/trocolit2/lfs_test/master/equivs_template
mv equivs_template $1
sed -i 's/__package-name__/'$1'/g' $1
sed -i 's/__version__/'$2'/g' $1

equivs-build $1
sudo dpkg -i $1*.deb