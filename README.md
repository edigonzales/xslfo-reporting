# xslfo-reporting

```
java -jar /Users/stefan/apps/SaxonHE12-4J/saxon-he-12.4.jar -s:grundstuecksbeschrieb.xml -xsl:grundstuecksbeschrieb.xsl -o:grundstuecksbeschrieb.fo
```

Download: https://sourceforge.net/projects/offo/files/offo-hyphenation/ 
Kopiere in fop/libs Ordner.

```
/Users/stefan/apps/fop-2.9/fop/fop -fo grundstuecksbeschrieb.fo -pdf grundstuecksbeschrieb.pdf -c fop.xconf
```


Testen:

- Bilder via URL
- Frutiger
- Header in sauber
- WMS-Request muss mit SQL berechenbar sein (BBOX)
- Workflow überlegen:
  0. "Schema" überlegen (dummy xml)
  1. Grundgerüst xsl -> pdf (ohne dynamische Daten), nur mit root-element-match
  2. sql