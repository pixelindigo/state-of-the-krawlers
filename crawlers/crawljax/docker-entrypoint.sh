#!/bin/bash
timeout=60
while getopts ":t:" opt; do
  case $opt in
    t) timeout=$((($OPTARG+1)*60))
    ;;
  esac
done
echo "Timeout is $timeout"
timeout $timeout xvfb-run java -Djpyconfig.properties=/opt/crawljax/jpyconfig.properties -jar crawljax.jar $@
