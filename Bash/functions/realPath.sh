#!/bin/bash

function realPath() {

echo 1---- $(realpath -s $0)
echo 2---- ${0##*/}
}


realPath
