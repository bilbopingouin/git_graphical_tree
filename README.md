# git_graphical_tree

Using dot (graphviz) to visualise the tree

# Usage

It requires graphviz (particularly `dot` to be installed) as well as git obviously.

On Debian-like systems, simply run

    sudo apt-get install graphviz git

And then to run it,

    cd /path/to/a/git/repo
    path/to/script/tree.sh

This will produce two files, 

- tmp.dot: containing the dot-language description of the tree
- tmp.png: a graphical output, where each commit is represented by a red circle

Optionally, one can run it (git style) as

    tree.sh <hash>..HEAD

if one wants to focus on a part of the tree.
