<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:fox="http://xmlgraphics.apache.org/fop/extensions">
    <xsl:output method="xml" indent="yes"/>
    <xsl:decimal-format name="swiss" decimal-separator="." grouping-separator="'"/>
    <xsl:template match="/grundstuecke">
        <xsl:message>Hallo Welt.</xsl:message> 
        <fo:root language="de" font-family="Frutiger" font-size="10pt" font-weight="400" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:fox="http://xmlgraphics.apache.org/fop/extensions" xmlns:xsd="https://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xml:lang="en">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="first-page" page-height="297mm" page-width="210mm" margin-top="10mm" margin-bottom="10mm" margin-left="12mm" margin-right="10mm">
                    <fo:region-body margin-top="35mm" margin-bottom="15mm" background-color="transparent"/>
                    <fo:region-before region-name="xsl-region-before-first" extent="30mm" background-color="transparent"/>
                    <fo:region-after extent="10mm" background-color="transparent" display-align="after"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="other-pages" page-height="297mm" page-width="210mm" margin-top="10mm" margin-bottom="10mm" margin-left="12mm" margin-right="10mm">
                    <fo:region-body margin-top="15mm" margin-bottom="15mm" background-color="transparent"/>
                    <fo:region-before extent="10mm" background-color="transparent"/>
                    <fo:region-after extent="10mm" background-color="transparent" display-align="after"/>
                </fo:simple-page-master>

                <fo:page-sequence-master master-name="page-sequence">
                    <fo:repeatable-page-master-alternatives>
                        <fo:conditional-page-master-reference master-reference="first-page" page-position="first"/>
                        <fo:conditional-page-master-reference master-reference="other-pages"/>
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>        
            </fo:layout-master-set>

            <!-- Habe es nicht geschafft mit apply-templates wegen Referenz auf
            letzte Seite. position()=last() scheint nur mit for-each zu funktionieren.-->
            <!--<xsl:apply-templates/>-->

            <xsl:for-each select="grundstueck">

                <fo:page-sequence master-reference="page-sequence" id="my-sequence-id">
                    <fo:static-content flow-name="xsl-region-before-first">
                        <fo:block>
                            <fo:block-container text-align="end" margin="0mm" padding="0mm" background-color="transparent">
                                <fo:block margin="0mm" padding="0mm" font-size="0pt" background-color="transparent">                                
                                    <fo:external-graphic width="60mm" content-width="scale-to-fit" fox:alt-text="CantonalLogo">
                                        <xsl:attribute name="src">
                                        <xsl:text>url('data:</xsl:text>
                                        <xsl:text>image/png;base64,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</xsl:text>
                                        <xsl:text>')</xsl:text>
                                        </xsl:attribute>
                                    </fo:external-graphic>
                                
                                </fo:block>
                            </fo:block-container>
                            <fo:block-container margin="0mm" padding="0mm" background-color="transparent">
                                <fo:block font-style="italic" font-weight="700">
                                    Amt für Geoinformation
                                </fo:block>
                            </fo:block-container>
                            <fo:block-container margin-left="4mm" font-style="italic" font-weight="400">
                                <fo:block>
                                    Rötistrasse 4
                                </fo:block>
                                <fo:block>
                                    4500 Solothurn
                                </fo:block>
                                <fo:block>
                                    agi@bd.so.ch
                                </fo:block>
                                <fo:block>
                                    agi.so.ch
                                </fo:block>
                            </fo:block-container>
                        </fo:block>

                        <!--
                        <fo:block text-align="center" margin="5mm 10mm">
                            <fo:page-number/>
                        </fo:block>
                        -->
                    </fo:static-content>

                    <fo:static-content flow-name="xsl-region-after">
                        <fo:table table-layout="fixed" width="100%" margin-top="1mm" font-size="8pt">
                        <fo:table-column column-width="50%"/>
                        <fo:table-column column-width="50%"/>
                        <fo:table-body>
                            <fo:table-row>
                            <fo:table-cell>
                                <fo:block>
                                <xsl:value-of select="format-dateTime(current-dateTime(),'[Y0001]-[M01]-[D01] [H01]:[m01]:[s01]')"/>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell text-align="right">
                                <fo:block>Seite <fo:page-number/>/<fo:page-number-citation-last ref-id="last-page-marker"/></fo:block>
                            </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                        </fo:table>
                    </fo:static-content>

                    <!--
                    <fo:static-content flow-name="xsl-region-after">
                        <fo:block text-align="center" background-color="transparent">
                            <fo:block>Seite <fo:page-number/>/<fo:page-number-citation-last ref-id="my-sequence-id"/></fo:block>
                        </fo:block>
                    </fo:static-content>
                    -->

                    <fo:flow flow-name="xsl-region-body">
                        <fo:block-container wrap-option="wrap" hyphenate="false" hyphenation-character="-" font-weight="700" font-size="14pt">
                            <fo:table table-layout="fixed" width="100%">
                            <fo:table-column column-width="94mm"/>
                            <fo:table-column column-width="94mm"/>
                            <fo:table-body>
                                <fo:table-row>
                                <fo:table-cell>
                                    <fo:block>Grundstücksbeschrieb</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block>GB-Nr. <xsl:value-of select="nummer"/></fo:block>
                                </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                            </fo:table>
                        </fo:block-container>

                        <fo:block-container wrap-option="wrap" hyphenate="false" hyphenation-character="-" font-weight="400" font-size="10pt">
                            <fo:table table-layout="fixed" width="100%" margin-top="8mm">
                            <fo:table-column column-width="50mm"/>
                            <fo:table-column column-width="25mm"/>
                            <fo:table-column column-width="19mm"/>
                            <fo:table-column column-width="50mm"/>
                            <fo:table-column column-width="25mm"/>
                            <fo:table-body>
                                <fo:table-row>
                                <fo:table-cell font-weight="700" padding-top="2mm">
                                    <fo:block>Gemeinde:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" padding-top="2mm">
                                    <fo:block>
                                    <xsl:value-of select="gemeinde"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" padding-top="2mm">
                                    <fo:block/>
                                </fo:table-cell>
                                <fo:table-cell font-weight="700" padding-top="2mm">
                                    <fo:block>E-GRID:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" padding-top="2mm">
                                    <fo:block>
                                    <xsl:value-of select="egrid"/>
                                    </fo:block>
                                </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                <fo:table-cell font-weight="700" padding-top="2mm">
                                    <fo:block>Grundbuch:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" padding-top="2mm">
                                    <fo:block>
                                    <xsl:value-of select="grundbuch"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" padding-top="2mm">
                                    <fo:block/>
                                </fo:table-cell>
                                <fo:table-cell font-weight="700" padding-top="2mm">
                                    <fo:block>NBIdent:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" padding-top="2mm">
                                    <fo:block>
                                    <xsl:value-of select="nbident"/>
                                    </fo:block>
                                </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                <fo:table-cell font-weight="700" padding-top="2mm">
                                    <fo:block>Grundstücksart:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" padding-top="2mm">
                                    <fo:block>
                                    <xsl:value-of select="art"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" padding-top="2mm">
                                    <fo:block/>
                                </fo:table-cell>
                                <fo:table-cell font-weight="700" padding-top="2mm">
                                    <fo:block>Grundstücksfläche:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" padding-top="2mm">
                                    <fo:block line-height-shift-adjustment="disregard-shifts"><xsl:value-of select="format-number(flaechenmass, &quot;#'###&quot;, &quot;swiss&quot;)"/> m<fo:inline baseline-shift="super" font-size="60%">2</fo:inline></fo:block>
                                </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                            </fo:table>
                        </fo:block-container>

                        <fo:block-container language="de" wrap-option="wrap" hyphenate="true" hyphenation-character="-" font-weight="400" font-size="10pt">
                            <fo:table table-layout="fixed" width="100%" margin-top="8mm">
                                <fo:table-column column-width="94mm"/>
                                <fo:table-column column-width="94mm"/>
                                <fo:table-body>
                                    <fo:table-row>
                                        <fo:table-cell font-weight="700" padding-top="2mm">
                                            <fo:block>Bodenbedeckung:</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell font-weight="700" padding-top="2mm">
                                            <fo:block>Flurnamen:</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell font-weight="400" padding-top="1mm">
                                            <fo:block>
                                            <fo:table table-layout="fixed" width="100%" margin-top="0mm">
                                                <fo:table-column column-width="50mm"/>
                                                <fo:table-column column-width="20mm"/>
                                                <fo:table-column column-width="5mm"/>
                                                <fo:table-body border-width="0pt" border-style="solid">
                                                <xsl:for-each select="bodbdanteil">
                                                    <xsl:sort select="upper-case(artbezeichnung)"/>
                                                    <fo:table-row border-width="0pt" border-style="solid">
                                                    <fo:table-cell padding-top="1mm" border-style="solid" border-width="0pt">
                                                        <fo:block>
                                                        <xsl:value-of select="artbezeichnung"/>
                                                        </fo:block>
                                                    </fo:table-cell>
                                                    <fo:table-cell padding-top="1mm" border-style="solid" border-width="0pt">
                                                        <fo:block text-align="right">
                                                        <xsl:value-of select="format-number(flaechenmass, &quot;#'###&quot;, &quot;swiss&quot;)"/>
                                                        </fo:block>
                                                    </fo:table-cell>
                                                    <fo:table-cell padding-top="1mm" border-style="solid" border-width="0pt">
                                                        <fo:block text-align="right" margin-left="1mm" line-height-shift-adjustment="disregard-shifts">m<fo:inline baseline-shift="super" font-size="60%">2</fo:inline></fo:block>
                                                    </fo:table-cell>
                                                    </fo:table-row>
                                                </xsl:for-each>
                                                <fo:table-row border-width="0pt" border-style="solid" font-weight="400" font-style="italic">
                                                    <fo:table-cell padding-top="1mm">
                                                    <fo:block>Total</fo:block>
                                                    </fo:table-cell>
                                                    <fo:table-cell padding-top="1mm">
                                                    <fo:block text-align="right">
                                                        <xsl:value-of select="format-number(sum(bodbdanteil/flaechenmass), &quot;#'###&quot;, &quot;swiss&quot;)"/>
                                                    </fo:block>
                                                    </fo:table-cell>
                                                    <fo:table-cell padding-top="1mm">
                                                    <fo:block text-align="right" margin-left="1mm" line-height-shift-adjustment="disregard-shifts">m<fo:inline baseline-shift="super" font-size="60%">2</fo:inline></fo:block>
                                                    </fo:table-cell>
                                                </fo:table-row>
                                                </fo:table-body>
                                            </fo:table>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell font-weight="400" padding-top="2mm">
                                            <fo:block>
                                                <xsl:for-each select="flurname">
                                                    <xsl:sort select="." order="ascending"/>
                                                    <xsl:value-of select="."/>
                                                    <xsl:if test="position() != last()">, </xsl:if>
                                                </xsl:for-each>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-body>
                            </fo:table>
                        </fo:block-container>


                        <fo:block text-align="justify" hyphenate="true">
                            <fo:block space-after="1em">
                                Als Gregor Samsa eines Morgens aus unruhigen Träumen erwachte, fand er sich in seinem Bett zu einem ungeheueren Ungeziefer verwandelt. Er lag auf seinem panzerartig harten Rücken und sah, wenn er den Kopf ein wenig hob, seinen gewölbten, braunen, von bogenförmigen Versteifungen geteilten Bauch, auf dessen Höhe sich die Bettdecke, zum gänzlichen Niedergleiten bereit, kaum noch erhalten konnte. Seine vielen, im Vergleich zu seinem sonstigen Umfang kläglich dünnen Beine flimmerten ihm hilflos vor den Augen. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.   

        Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.   

        Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.   

        Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.   

        Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.   

        At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, At accusam aliquyam diam diam dolore dolores duo eirmod eos erat, et nonumy sed tempor et et invidunt justo labore Stet clita ea et gubergren, kasd magna no rebum. sanctus sea sed takimata ut vero voluptua. est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.   

        Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus.   

        Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.   

        Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.   

        Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.   

        Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.   

        Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.   

        At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, At accusam aliquyam diam diam dolore dolores duo eirmod eos erat, et nonumy sed tempor et et invidunt justo labore Stet clita ea et gubergren, kasd magna no rebum. sanctus sea sed takimata ut vero voluptua. est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.   

        Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus.   

        Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.   

                            </fo:block>
                        </fo:block>
                        <xsl:if test="position() = last()">
                            <xsl:message>Last page</xsl:message>
                            <fo:block id="last-page-marker" visibility="hidden">Last page marker</fo:block>
                        </xsl:if>
                    </fo:flow>
                </fo:page-sequence>


            </xsl:for-each>



        </fo:root>
    </xsl:template>

    <xsl:template match="grundstueck">
    </xsl:template>

</xsl:stylesheet>