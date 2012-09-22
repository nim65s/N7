#!/bin/bash

if [[ $1 == "" ]]
then
    echo 'Il faut un argument…'
    exit 1
fi

if [[ ! -f ~/Downloads/notebook.ipynb ]]
then
    echo 'Pas de notebook.ipynb'
    exit 2
fi

~/scripts/ipynbtotex.py ~/Downloads/notebook.ipynb $1
rm ~/Downloads/notebook.ipynb
