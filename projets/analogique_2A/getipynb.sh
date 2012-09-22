#!/bin/bash

if [[ $1 == "" ]]
then
    echo 'Il faut un argument…'
    exit 1
fi

~/scripts/ipynbtotex.py ~/Downloads/notebook.ipynb > tex/$1-genere.tex
rm ~/Downloads/notebook.ipynb
