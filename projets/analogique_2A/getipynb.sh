#!/bin/bash

if [[ $1 == "" ]]
then
    echo 'Il faut un argument…'
    exit 1
fi

if [[ $1 == "all" ]]
then
    for ipynb in IPy/*
    do
        file=${ipynb#IPy/}
        ~/scripts/ipynbtotex.py $ipynb ${file%.*}
    done
else
    if [[ ! -f ~/Downloads/notebook.ipynb ]]
    then
        echo 'Pas de notebook.ipynb'
        exit 2
    fi

    ~/scripts/ipynbtotex.py ~/Downloads/notebook.ipynb $1
    mv ~/Downloads/notebook.ipynb IPy/$1.ipynb
fi
