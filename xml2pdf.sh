#!/bin/bash

java -jar /Users/stefan/apps/SaxonHE12-4J/saxon-he-12.4.jar -s:"${1}.xml" -xsl:"${1}.xsl" -o:"${1}.fo"
/Users/stefan/apps/fop-2.9/fop/fop -fo "${1}.fo" -pdf "${1}.pdf" -c fop.xconf
