#!/bin/bash

make

for pdf in inv trans nand xor
do
    [[ -f $pdf.pdf ]] && pdfcrop $pdf.pdf && convert $pdf-crop.pdf $pdf-sch.png
done
