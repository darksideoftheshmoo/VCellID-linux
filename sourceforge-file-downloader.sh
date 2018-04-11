#!/bin/sh

display_usage() {
  echo "Downloads all of a SourceForge project's files."
  echo "\nUsage: ./sourceforge-file-download.sh [project name] \n"
}

if [ $# -eq 0 ]
then
  display_usage
  exit 1
fi

project=$1
echo "Downloading $project's files"

# download all the pages on which direct download links are
# be nice, sleep a second
wget -w 1 -np -m -A download http://sourceforge.net/projects/$project/files/
# Si estás en FCEN-UBA, necesitás configurar el proxy. Se puede hacer directamente en wget:
# wget -w 1 -np -m -A download http://sourceforge.net/projects/$project/files/ -e use_proxy=yes -e http_proxy=proxy.fcen.uba.ar:8080

# extract those links
grep -Rh refresh sourceforge.net/ | grep -o "https[^\\?]*" > urllist

# remove temporary files, unless you want to keep them for some reason
rm -r sourceforge.net/

# download each of the extracted URLs, put into $projectname/
while read url; do wget --content-disposition -x -nH --cut-dirs=1 "${url}"; done < urllist

rm urllist
