#!/bin/bash
# This script will make a copy using rsync into a specific folder (Archive)
#
# Projct URL: https://github.com/koalalorenzo/easy-rsync-clone
# Author: Lorenzo Setale <lorenzo.setale@me.com> 4814 3410 288E 01D6
# Copyright: Lorenzo Setale 2014-2017
# License: GPL v3

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASE_DIR

function do_sync {
  rsync --delete --exclude-from $BASE_DIR/exclude.list -vah "$1" $BASE_DIR/Archive
}

while read DIR; do
  echo "### Backup $DIR"
  do_sync $DIR
done < $BASE_DIR/directories.list

echo "### Calculating hashes"

rm $BASE_DIR/files.shasum256 &> /dev/null
rm $BASE_DIR/files.* &> /dev/null

find -s ./Archive/ \( ! -regex '.*/\..*' ! -iname "node_modules" ! -iname ".*" ! -iname "*.dat" ! -iname "*.ldb" \) -type f -exec shasum -a256 {} \; >> $BASE_DIR/files.shasum256

gpg2 --armor --detach-sig -o $BASE_DIR/files.shasum256.sig $BASE_DIR/files.shasum256
read -p "Process completed. Return to close..."
