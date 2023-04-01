#!/bin/bash

leanYearMonths=(31 28 31 30 31 30 31 31 30 31 30 31)
ThisMonth=$(date +"%m")

echo "In $(date +"%B"), there are ${leanYearMonths[$ThisMonth-1]} days."