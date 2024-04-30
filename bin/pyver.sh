#!/bin/bash
#
# python3 -c 'import sys; print(sys.version_info[:])'
major=$(python3 -c 'import sys; print(sys.version_info.major)')

if [ ${major} -eq 3 ]
then
  minor=$(python3 -c 'import sys; print(sys.version_info.minor)')
  if [ ${minor} -ge 9 ]
  then
    echo "OK"
  else
    echo "Python 3.9 or greater required"
  fi
else
  echo "Python 3 required"
fi
