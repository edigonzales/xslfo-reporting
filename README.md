# xslfo-reporting

```
java -jar /Users/stefan/apps/SaxonHE12-4J/saxon-he-12.4.jar -s:grundstuecksbeschrieb.xml -xsl:grundstuecksbeschrieb.xsl -o:grundstuecksbeschrieb.fo
```

Download: https://sourceforge.net/projects/offo/files/offo-hyphenation/ 
Kopiere in fop/libs Ordner.

```
/Users/stefan/apps/fop-2.9/fop/fop -fo grundstuecksbeschrieb.fo -pdf grundstuecksbeschrieb.pdf -c fop.xconf
```

```
./xml2pdf.sh grundstuecksbeschrieb
```

Testen:

- Autorisierung?
- Bilder via URL
- ~~Frutiger~~
- ~~Header in sauber~~
- Was passiert wenn an einer Koordinate zwei Objekte liegen? (technologie-unabhängige Frage (glaubs)). Z.B. Selbstrecht auf Liegenschaft.
- WMS-Request muss mit SQL berechenbar sein (BBOX)
- Workflow überlegen:
  0. "Schema" überlegen (dummy xml)
  1. Grundgerüst xsl -> pdf (ohne dynamische Daten), nur mit root-element-match
  2. sql


EWS:

Achtung: 
- noch keine Logik wegen "nicht erlaubt" im xsl und wegen Abständen abhängig von der Tiefe (?) und Grund für Beschränkung (habe nur ein case when).
- Kann WMS-GetMap-Request mit SQL hergestellt werden? BBox? Aufpassen wegen urlencoding. Kann aber bereits in SQL gemacht werden.

https://dox42.so.ch/dox42restservice.ashx?Operation=GenerateDocument&ReturnAction.Format=pdf&DocTemplate=c%3a%5cdox42Server%5ctemplates%5cAFU%5cEWS_moeglich.docx&InputParam.p_koordinate_x=2605775&InputParam.p_koordinate_y=1228417&InputParam.p_grundstueck=3317%20(Solothurn)&InputParam.p_gemeinde=Solothurn&InputParam.p_tiefe=100&InputParam.p_tiefe_gruende=Instabiler_UG&InputParam.p_gw=true

https://dox42.so.ch/dox42restservice.ashx?Operation=GenerateDocument&ReturnAction.Format=pdf&DocTemplate=c%3a%5cdox42Server%5ctemplates%5cAFU%5cEWS_moeglich.docx&InputParam.p_koordinate_x=2605775&InputParam.p_koordinate_y=1228417&InputParam.p_grundstueck=3317%20(Solothurn)&InputParam.p_gemeinde=Solothurn&InputParam.p_tiefe=100&InputParam.p_tiefe_gruende=Instabiler_UG&InputParam.p_gw=false

https://dox42.so.ch/dox42restservice.ashx?Operation=GenerateDocument&ReturnAction.Format=pdf&DocTemplate=c%3a%5cdox42Server%5ctemplates%5cAFU%5cEWS_moeglich.docx&InputParam.p_koordinate_x=2604911&InputParam.p_koordinate_y=1219629&InputParam.p_grundstueck=119%20(Aetingen)&InputParam.p_gemeinde=Buchegg&InputParam.p_tiefe=400&InputParam.p_tiefe_gruende=Malmkalke&InputParam.p_gw=false

