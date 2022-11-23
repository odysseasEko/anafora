#!/bin/bash

PS3="Select type to conver to please: "

items=("convert to HTML" "convert to PDF")

while true; do
    select item in "${items[@]}" Quit
    do
        case $REPLY in
            1) echo "Selected HTML #$REPLY"; pandoc par8.md -f markdown -t html --metadata title="Anafora" -s -o par8.html; echo "HTML created!"; break;;
            2) echo "Selected PDF, #$REPLY ready in just a sec;)"; pandoc -N --variable "geometry=margin=1.1in" --variable mainfont="Source Code Pro Medium" --variable fontsize=13pt --variable version=2.0 par8.md  --pdf-engine=xelatex --toc -o par8.pdf; echo "PDF ready!"; break;;
            $((${#items[@]}+1))) echo "We're done!"; break 2;;
            *) echo "Ooops - unknown choice $REPLY"; break;
        esac
    done
done