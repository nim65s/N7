#!/bin/bash

echo -e "\033[1;32m − Compilation du programme…\033[0m"
cd ../build
make
cd ../rapport

echo -e "\033[1;32m − Nettoyage…\033[0m"
rm -f *.pdf *.svg genere.*
make clean

echo -e "\033[1;32m − Éxécution du programme…\033[0m"
../bin/circuit

echo -e "\033[1;32m − Éxécution du matlab…\033[0m"
octave genere.m

echo -e "\033[1;32m − Génération des pdf à partir des svg…\033[0m"
for i in *.svg
do convert $i ${i/svg/pdf}
done

echo -e "\033[1;32m − compilation du rapport…\033[0m"
touch rapport.tex
make
