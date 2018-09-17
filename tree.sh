#!/bin/bash

if [ -z "$1" ]
then
  AP=""
else
  AP="--ancestry-path"
fi

# Dot headers
echo "digraph G {" > tmp.dot # overwrites the file to be sure that we have a clean file
echo "rankdir=LR" >> tmp.dot
echo "node [shape=circle,style=filled,fillcolor=red,fontsize=8]" >> tmp.dot

# Fill with information from the git log
git log $1 --pretty="format:\"%p\" -> \"%h\";" --all --color --date=short $AP | sed 's/^\([^\ ]*\)\ \([^\ ]*\)\ ->\ \([^\ ]*\)/\1"\ ->\ \3\ "\2\ ->\ \3/' >> tmp.dot
#git log $1 --pretty="format:\"%p\" -> \"%h\"; \"%h\" [label=\"%ad\"];" --all --color --date=short --ancestry-path | sed 's/^\([^\ ]*\)\ \([^\ ]*\)\ ->\ \([^\ ]*\)/\1"\ ->\ \3\ "\2\ ->\ \3/' >> tmp.dot

# Trailer for the dot file 
echo "}" >> tmp.dot

# Generate the graph
dot -T png tmp.dot > tmp.png
