<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Copyright 2024-2026 TU Dresden, Fakultät Verkehrswissenschaften "Friedrich List", Professur für Verkehrsprozessautomatisierung (VPA)
    Susanne Wunsch {vpa | susanne.wunsch}<at>tu-dresden<dot>de

    Unless required by applicable law or agreed to in writing, software distributed under the software is distributed on an "AS IS" basis,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

    The software is developed for DB InfraGO and may be used by the costumer without any restrictions.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:fx="http://tu-dresden.de/vlp/schematron/functions" xmlns:gsvrl="http://tu-dresden.de/vlp/schematron/grouped-svrl"
    xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:saxon="http://saxon.sf.net/" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="fx gsvrl planpro saxon xs xsl" version="2.0">

    <xsl:include href="svrl2any-base.xsl"/>

    <xsl:output omit-xml-declaration="no" method="xml" indent="yes" encoding="UTF-8"/>

    <!-- Dieser Parameter gibt an, wieviele detaillierte Feststellungen pro Regel im Planungs-/Betrachtungsbereich 
         in der PDF-Datei höchstens enthalten sein sollen. Der Wert '0' hebelt diesen Mechanismus aus und bewirkt,
         dass alle vorhandenen Feststellungen detailliert beschrieben werden.
         
         Falls für eine Regel mehr als diese Anzahl an Feststellungen getrennt für Planungs- und Betrachtungsbereich vorliegen,
         dann wird nur die hier angegebene Anzahl an Feststellungen (= Anzahl an Objekten mit Feststellungen) für diese Regel
         in der PDF-Datei dargestellt. Auf die weiteren vorhandenen Feststellungen wird unter einer separaten Überschrift hingewiesen.
         
         Die Anzahlen an Feststellungen auf der Titelseite umfassen immer alle vorhandenen Feststellungen, unabhängig davon,
         ob diese in dieser PDF-Datei detailliert ausgeführt sind, oder aufgrund der Menge weggelassen wurden. -->
    <xsl:param name="MAX_OBJECT_COUNT_IN_PDF" as="xs:integer" select="50"/>

    <xsl:decimal-format name="WesternEurope" decimal-separator="," grouping-separator="."/>

    <xsl:variable name="large-paragraph-distance" as="xs:string">30pt</xsl:variable>
    <xsl:variable name="small-paragraph-distance" as="xs:string">6pt</xsl:variable>
    
    <xsl:variable name="default-symbol-font-family" as="xs:string" select="'Cambria Math'"/>
    <!--
        <fo:inline font-family="Symbol" font-size="smaller">...</fo:inline>
        FOP default font "Symbol" is not available in the compilation setting for Werkzeugkoffer,
        but the system-wide Windows fonts, therefore it's changed to the Windows font "Cambria Math"
    -->
    
    <!-- Codepoints already produced by the pre-processing step -->
    <xsl:variable name="math-symbols-regex" as="xs:string"
        select="'[←→≤≥≠±∧∨∃∄]'"/>
    
    <xsl:variable name="roman-numerals-map" as="element(map)+">
        <!-- Lowercase -->
        <map from="ⅰ" to="i"/>
        <map from="ⅱ" to="ii"/>
        <map from="ⅲ" to="iii"/>
        <map from="ⅳ" to="iv"/>
        <map from="ⅴ" to="v"/>
        <map from="ⅵ" to="vi"/>
        <map from="ⅶ" to="vii"/>
        <map from="ⅷ" to="viii"/>
        <map from="ⅸ" to="ix"/>
        <map from="ⅹ" to="x"/>
        <map from="ⅺ" to="xi"/>
        <map from="ⅻ" to="xii"/>
        <map from="ⅼ" to="l"/>
        <map from="ⅽ" to="c"/>
        <map from="ⅾ" to="d"/>
        <map from="ⅿ" to="m"/>
        <!-- Uppercase -->
        <map from="Ⅰ" to="I"/>
        <map from="Ⅱ" to="II"/>
        <map from="Ⅲ" to="III"/>
        <map from="Ⅳ" to="IV"/>
        <map from="Ⅴ" to="V"/>
        <map from="Ⅵ" to="VI"/>
        <map from="Ⅶ" to="VII"/>
        <map from="Ⅷ" to="VIII"/>
        <map from="Ⅸ" to="IX"/>
        <map from="Ⅹ" to="X"/>
        <map from="Ⅺ" to="XI"/>
        <map from="Ⅻ" to="XII"/>
        <map from="Ⅼ" to="L"/>
        <map from="Ⅽ" to="C"/>
        <map from="Ⅾ" to="D"/>
        <map from="Ⅿ" to="M"/>
    </xsl:variable>
    
    <!-- Single regex listing every Roman numeral codepoint -->
    <xsl:variable name="roman-numerals-regex" as="xs:string"
        select="concat('[', string-join($roman-numerals-map/@from, ''), ']')"/>

    <xsl:attribute-set name="Page-Defaults">
        <xsl:attribute name="language">de</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="Titelseite-Ueberschrift">
        <xsl:attribute name="space-before.minimum" select="$large-paragraph-distance"/>
        <xsl:attribute name="space-after.minimum" select="$small-paragraph-distance"/>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="Block-Abstand">
        <xsl:attribute name="space-before.minimum" select="$small-paragraph-distance"/>
        <xsl:attribute name="space-after.minimum" select="$small-paragraph-distance"/>
        <xsl:attribute name="provisional-label-separation" select="$small-paragraph-distance"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="Kopf-Fuss-Zeilen-Block">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="Tabelle-Eigenschaften">
        <xsl:attribute name="width">100%</xsl:attribute>
        <xsl:attribute name="table-layout">fixed</xsl:attribute>
        <xsl:attribute name="padding">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="Tabelle-Zeilen-Abstand">
        <xsl:attribute name="padding-bottom">2pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="horizontale-Linie">
        <xsl:attribute name="leader-pattern">rule</xsl:attribute>
        <xsl:attribute name="rule-thickness">1pt</xsl:attribute>
        <xsl:attribute name="leader-length">100%</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="Schweregrad-Ueberschrift">
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before.minimum">18pt</xsl:attribute>
        <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
        <xsl:attribute name="space-after.minimum">9pt</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="Arbeitspaket-Ueberschrift">
        <xsl:attribute name="font-size">16pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before.minimum">16pt</xsl:attribute>
        <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
        <xsl:attribute name="space-after.minimum">8pt</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="Technische-Regel-Ueberschrift">
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before.minimum">14pt</xsl:attribute>
        <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
        <xsl:attribute name="space-after.minimum">7pt</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="Objekt-Ueberschrift">
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before.minimum">12pt</xsl:attribute>
        <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
        <xsl:attribute name="space-after.minimum">6pt</xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="messageText">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="margin">5pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="DB Office">

            <xsl:call-template name="general-page-settings"/>

            <!--  and ($error-detected or $count-success > 0) -->
            <xsl:if test="$detailliertes-dokument">
                <xsl:call-template name="Bookmarks-setzen"/>
            </xsl:if>

            <xsl:call-template name="Titelseite-setzen"/>

            <!--  and ($error-detected or $count-success > 0) -->
            <xsl:if test="$detailliertes-dokument">

                <fo:page-sequence master-reference="page-master-0" xsl:use-attribute-sets="Page-Defaults">

                    <xsl:call-template name="Kopfzeile-setzen"/>
                    <xsl:call-template name="Fusszeile-setzen"/>

                    <fo:flow flow-name="xsl-region-body">

                        <fo:block hyphenate="true">
                            <xsl:call-template name="Inhaltsverzeichnis-setzen"/>

                            <xsl:call-template name="Inhalt-setzen"/>
                        </fo:block>

                        <fo:block id="LASTPAGE"/>
                    </fo:flow>
                </fo:page-sequence>
            </xsl:if>
        </fo:root>
    </xsl:template>

    <xsl:template name="general-page-settings">
        <fo:layout-master-set>
            <fo:simple-page-master master-name="A4" page-height="11.69in" page-width="8.27in" margin-left="1.3in" margin-right="1.3in" margin-top="0pt"
                margin-bottom="0pt" hyphenate="true">
                <fo:region-body margin-top="1in" margin-bottom="1in" column-count="1"/>
                <fo:region-before region-name="page-header" overflow="hidden" extent="1in" display-align="center"/>
                <fo:region-after region-name="page-footer" overflow="hidden" extent="1in"/>
            </fo:simple-page-master>

            <fo:page-sequence-master master-name="page-master-0">
                <fo:repeatable-page-master-alternatives>
                    <fo:conditional-page-master-reference master-reference="A4"/>
                </fo:repeatable-page-master-alternatives>
            </fo:page-sequence-master>
        </fo:layout-master-set>
    </xsl:template>

    <xsl:template name="Bookmarks-setzen">
        <fo:bookmark-tree>
            <fo:bookmark internal-destination="titelseite" starting-state="show">
                <fo:bookmark-title>
                    <xsl:value-of select="$plaz-titel"/>
                </fo:bookmark-title>
                <fo:bookmark internal-destination="toc" starting-state="show">
                    <fo:bookmark-title>Inhaltsverzeichnis</fo:bookmark-title>
                </fo:bookmark>
                <xsl:for-each select="$grouped-svrl//gsvrl:problems/descendant::gsvrl:severity">
                    <xsl:variable name="severity-position" select="position()"/>
                    <xsl:call-template name="detaillierte-bookmarks">
                        <xsl:with-param name="severity-position" select="$severity-position"/>
                        <xsl:with-param name="severity-heading" select="fx:generate-problem-severity-heading(current()/@role, current())"/>
                        <xsl:with-param name="problems" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$grouped-svrl//gsvrl:successes/*/gsvrl:severity[@only-success = 'true']">
                    <xsl:call-template name="detaillierte-bookmarks">
                        <xsl:with-param name="severity-position" select="fx:generate-success-number(current())"/>
                        <xsl:with-param name="severity-heading" select="fx:generate-success-severity-heading(current()/@role)"/>
                        <xsl:with-param name="problems" select="false()"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$grouped-svrl//gsvrl:incomplete/descendant::gsvrl:severity[@only-incomplete = 'true']">
                    <xsl:call-template name="detaillierte-bookmarks">
                        <xsl:with-param name="severity-position" select="fx:generate-incomplete-number(current())"/>
                        <xsl:with-param name="severity-heading" select="fx:generate-incomplete-severity-heading(current()/@role, current())"/>
                        <xsl:with-param name="problems" select="false()"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$grouped-svrl//gsvrl:ignored">
                    <xsl:variable name="severity-position" select="position() + $count-problem-severities + $count-success-severities + $count-incomplete-severities"/>
                    <xsl:call-template name="detaillierte-bookmarks">
                        <xsl:with-param name="severity-position" select="$severity-position"/>
                        <xsl:with-param name="severity-heading" select=" fx:generate-ignored-heading()"/>
                        <xsl:with-param name="problems" select="false()"/>
                    </xsl:call-template>
                </xsl:for-each>
            </fo:bookmark>
        </fo:bookmark-tree>
    </xsl:template>

    <xsl:function name="fx:generate-success-number" as="xs:integer">
        <xsl:param name="current-success-element" as="node()"/>
        
        <xsl:sequence select="count($current-success-element/
            preceding-sibling::*[@only-success = 'true']) + 1 + $count-problem-severities"/>
    </xsl:function>

    <xsl:function name="fx:generate-incomplete-number" as="xs:integer">
        <xsl:param name="current-incomplete-element" as="node()"/>
        
        <xsl:sequence select="count($current-incomplete-element/
            preceding-sibling::*[@only-incomplete = 'true']) + 1 + $count-problem-severities + $count-success-severities"/>
    </xsl:function>

    <xsl:function name="fx:format-number" as="xs:string">
        <xsl:param name="number" as="xs:integer"/>
        
        <xsl:sequence select="format-number($number, '#.###', 'WesternEurope')"/>
    </xsl:function>

    <!-- Bookmark-Baum vom Schweregrade über Arbeitspaket und Regel zum Objekt -->
    <xsl:template name="detaillierte-bookmarks">
        <xsl:param name="severity-position" as="xs:integer"/>
        <xsl:param name="severity-heading" as="xs:string"/>
        <xsl:param name="problems" as="xs:boolean"/>

        <fo:bookmark internal-destination="{generate-id(current())}" starting-state="show">
            <fo:bookmark-title>
                <xsl:value-of select="fx:generate-severity-number($severity-position)"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$severity-heading"/>
            </fo:bookmark-title>
            <xsl:for-each select="current()/*/gsvrl:workpackage
                [@only-success = 'true' or not(@only-success)]
                [@only-incomplete = 'true' or not(@only-incomplete)]">
                <xsl:variable name="workpackage-position" select="position()"/>
                <fo:bookmark internal-destination="{generate-id(current())}" starting-state="show">
                    <fo:bookmark-title>
                        <xsl:value-of select="fx:generate-workpackage-number($severity-position, $workpackage-position)"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="fx:generate-workpackage-heading(current()/@planpro:arbeitspaket)"/>
                    </fo:bookmark-title>
                    <xsl:for-each select="current()/*/gsvrl:technical-rule
                        [@only-success = 'true' or not(@only-success)]
                        [@only-incomplete = 'true' or not(@only-incomplete)]">
                        <xsl:variable name="technical-rule-position" select="position()"/>
                        <fo:bookmark internal-destination="{generate-id(current())}" starting-state="hide">
                            <fo:bookmark-title>
                                <xsl:value-of
                                    select="fx:generate-technical-rule-number($severity-position, $workpackage-position, $technical-rule-position)"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="fx:generate-technical-rule-heading(current()/@name)"/>
                            </fo:bookmark-title>
                            <xsl:if test="$problems">
                                <xsl:for-each select="descendant::gsvrl:failed-assert | descendant::gsvrl:successful-report">
                                    <xsl:variable name="objekt-position" select="position()"/>
                                    <xsl:choose>
                                        <xsl:when test="$MAX_OBJECT_COUNT_IN_PDF = 0 or $objekt-position lt $MAX_OBJECT_COUNT_IN_PDF + 1">
                                            <fo:bookmark internal-destination="{generate-id(current())}" starting-state="hide">
                                                <fo:bookmark-title>
                                                    <xsl:value-of
                                                            select="fx:generate-object-number($severity-position, $workpackage-position, $technical-rule-position, $objekt-position)"/>
                                                    <xsl:text> </xsl:text>
                                                    <xsl:choose>
                                                        <xsl:when test="gsvrl:diagnostic-reference/@diagnostic = 'spezifische-bezeichnung'">
                                                            <xsl:value-of
                                                                    select="normalize-space(gsvrl:diagnostic-reference[@diagnostic = 'spezifische-bezeichnung'])"
                                                            />
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:call-template name="generate-object-heading">
                                                                <xsl:with-param name="markup" select="false()"/>
                                                                <xsl:with-param name="aufbau" select="gsvrl:diagnostic-reference[@diagnostic = 'aufbau']"/>
                                                                <xsl:with-param name="s1" select="gsvrl:diagnostic-reference[@diagnostic = 's1']"/>
                                                                <xsl:with-param name="s2" select="gsvrl:diagnostic-reference[@diagnostic = 's2']"/>
                                                                <xsl:with-param name="s3" select="gsvrl:diagnostic-reference[@diagnostic = 's3']"/>
                                                                <xsl:with-param name="s4" select="gsvrl:diagnostic-reference[@diagnostic = 's4']"/>
                                                                <xsl:with-param name="s5" select="gsvrl:diagnostic-reference[@diagnostic = 's5']"/>
                                                                <xsl:with-param name="s6" select="gsvrl:diagnostic-reference[@diagnostic = 's6']"/>
                                                                <xsl:with-param name="s7" select="gsvrl:diagnostic-reference[@diagnostic = 's7']"/>
                                                            </xsl:call-template>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </fo:bookmark-title>
                                            </fo:bookmark>
                                        </xsl:when>
                                        <xsl:when test="$objekt-position = $MAX_OBJECT_COUNT_IN_PDF + 1">
                                            <fo:bookmark internal-destination="{generate-id(current())}" starting-state="hide">
                                                <fo:bookmark-title>
                                                    <xsl:value-of
                                                            select="fx:generate-object-number($severity-position, $workpackage-position, $technical-rule-position, $objekt-position)"/>
                                                    <xsl:text> </xsl:text>
                                                    <xsl:text>Weitere Feststellungen</xsl:text>
                                                </fo:bookmark-title>
                                            </fo:bookmark>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                            </xsl:if>
                        </fo:bookmark>
                    </xsl:for-each>
                </fo:bookmark>
            </xsl:for-each>
        </fo:bookmark>
    </xsl:template>

    <xsl:template name="Titelseite-setzen">

        <fo:page-sequence master-reference="page-master-0" xsl:use-attribute-sets="Page-Defaults">
            <fo:static-content flow-name="page-footer">
                <fo:block xsl:use-attribute-sets="Kopf-Fuss-Zeilen-Block">
                    <fo:leader xsl:use-attribute-sets="horizontale-Linie"/>
                    <fo:block>
                        <xsl:value-of select="$tool-stamp"/>
                    </fo:block>
                </fo:block>
            </fo:static-content>
            <fo:flow flow-name="xsl-region-body">

                <fo:block text-align="right">
                    <fo:external-graphic src="{$logo-path}" content-height="40pt"/>
                </fo:block>

                <fo:block space-before.minimum="{$large-paragraph-distance}">
                    <xsl:value-of select="$plaz-erzeugung"/>
                </fo:block>

                <fo:block space-after.minimum="{$small-paragraph-distance}" line-height="0pt">
                    <fo:leader xsl:use-attribute-sets="horizontale-Linie"/>
                </fo:block>

                <fo:block space-before.minimum="90pt" space-after.minimum="9pt" font-size="18pt" id="titelseite">
                    <xsl:value-of select="$plaz-titel"/>
                </fo:block>

                <fo:block xsl:use-attribute-sets="Block-Abstand">
                    <xsl:value-of select="fx:translate-dokument-typ()"/>
                </fo:block>

                <fo:block xsl:use-attribute-sets="Block-Abstand"> &#169; DB InfraGO AG </fo:block>

                <fo:block xsl:use-attribute-sets="Titelseite-Ueberschrift">Angaben zur PlanPro-Datei</fo:block>

                <fo:table xsl:use-attribute-sets="Block-Abstand Tabelle-Eigenschaften">
                    <fo:table-column column-width="35%"/>
                    <fo:table-column column-width="65%"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>PlanPro-Modell:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block text-align="left">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes" select="$planpro-version"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <xsl:if test="$signalbegriffe-version != ''">
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block>PlanPro-Signalbegriffe:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block text-align="left">
                                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                            <xsl:with-param name="inhalt" tunnel="yes" select="$signalbegriffe-version"/>
                                        </xsl:apply-templates>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </xsl:if>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>Dateiname:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block text-align="left">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes" select="$planpro-dateiname"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>letzte Änderung:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block text-align="left">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes" select="fx:format-date-time($file-changed-stamp)"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>md5:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block text-align="left">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes" select="if ($md5 != 'Angabe nicht verfügbar')
                                            then $md5 else ''"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>GUID:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block text-align="left">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes" select="$datei-guid"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>Validierung gegen XSD:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <xsl:choose>
                                    <xsl:when test="$schema-valid">
                                        <fo:block text-align="left">
                                            <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                                <xsl:with-param name="inhalt" tunnel="yes" select="fx:translate-schema-valid()"/>
                                            </xsl:apply-templates>
                                        </fo:block>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <fo:block text-align="left" color="red">
                                            <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                                <xsl:with-param name="inhalt" tunnel="yes" select="fx:translate-schema-valid()"/>
                                            </xsl:apply-templates>
                                        </fo:block>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>

                <fo:table xsl:use-attribute-sets="Block-Abstand Tabelle-Eigenschaften">
                    <fo:table-column column-width="35%"/>
                    <fo:table-column column-width="65%"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>Planungsprojekt:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block text-align="left">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes" select="$planungsprojekt"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>Planungsgruppe:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block text-align="left">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes" select="$planungsgruppe"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>Einzelplanung:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block text-align="left">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes" select="$einzelplanung"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>

                <fo:block xsl:use-attribute-sets="Titelseite-Ueberschrift">Angaben zu den PlaZ-Regeln</fo:block>

                <fo:table xsl:use-attribute-sets="Block-Abstand Tabelle-Eigenschaften">
                    <fo:table-column column-width="35%"/>
                    <fo:table-column column-width="65%"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>Ausgabestand:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block text-align="left">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes" select="fx:format-date($dateOfDelivery)"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>PlanPro-Modell:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block text-align="left">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes" select="$plaz-planpro-versions"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>

                <fo:block xsl:use-attribute-sets="Titelseite-Ueberschrift">Feststellungen</fo:block>

                <fo:table xsl:use-attribute-sets="Block-Abstand" padding="0" width="100%" table-layout="fixed">
                    <fo:table-column column-width="35%"/>
                    <fo:table-column column-width="11%"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>Anzahl Feststellungen:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block text-align="right">
                                    <xsl:value-of select="fx:format-number($count-all-statements)"/>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <xsl:if test="$count-success > 0">
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block>
                                        <fo:external-graphic src="Pictures/Icon_Okay.svg" content-height="10pt"/> davon Erfolg: </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-after="{$small-paragraph-distance}">
                                    <fo:block text-align="right">
                                        <xsl:value-of select="fx:format-number($count-success)"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </xsl:if>
                    </fo:table-body>
                </fo:table>                
                <xsl:if test="$error-detected">
                    <fo:table xsl:use-attribute-sets="Block-Abstand" padding="0" width="100%" table-layout="fixed">
                        <fo:table-column column-width="46%"/>
                        <fo:table-column column-width="8%"/>
                        <fo:table-column column-width="46%"/>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell>
                                    <xsl:if test="$grouped-svrl//gsvrl:problems/gsvrl:scope[@zuordnung = ('Planung', 'Betrachtung')]">
                                        <fo:block font-weight="bold">... im Planungsbereich</fo:block>
                                    </xsl:if>
                                    <fo:table padding="0" width="100%" table-layout="fixed">
                                        <fo:table-column column-width="75%"/>
                                        <fo:table-column column-width="25%"/>
                                        <fo:table-body>
                                            <xsl:call-template name="Festellungen-setzen">
                                                <xsl:with-param name="current-scope"
                                                    select="$grouped-svrl//gsvrl:problems/gsvrl:scope[@zuordnung = ('Planung', 'Zustand')]"/>
                                            </xsl:call-template>
                                        </fo:table-body>
                                    </fo:table>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block/>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <xsl:if test="$grouped-svrl//gsvrl:problems/gsvrl:scope[@zuordnung = ('Planung', 'Betrachtung')]">
                                        <fo:block font-weight="bold">... im Betrachtungsbereich</fo:block>   
                                        <fo:table padding="0" width="100%" table-layout="fixed">
                                            <fo:table-column column-width="75%"/>
                                            <fo:table-column column-width="25%"/>
                                            <fo:table-body>
                                                <xsl:call-template name="Festellungen-setzen">
                                                    <xsl:with-param name="current-scope"
                                                        select="$grouped-svrl//gsvrl:problems/gsvrl:scope[@zuordnung = 'Betrachtung']"/>
                                                </xsl:call-template>
                                            </fo:table-body>
                                        </fo:table>
                                    </xsl:if>
                                    <fo:block/>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </xsl:if>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
    
    <xsl:template name="Festellungen-setzen">
        <xsl:param name="current-scope" as="node()?"/>
        
        <xsl:for-each select="$inverse-schweregrad-prioritaeten">
            <xsl:sort select="position()" order="descending"/>
            <xsl:variable name="schweregrad-icon-path" as="xs:string" select="fx:select-schweregrad-icon(current())"/>
            <xsl:variable name="current-severity" as="node()?"
                select="$current-scope/descendant::gsvrl:severity[upper-case(@role) = current()]"/>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:if test="string-length($schweregrad-icon-path) > 0">
                                <fo:external-graphic src="{$schweregrad-icon-path}" content-height="10pt"/>
                            </xsl:if> davon <xsl:value-of select="fx:translate-schweregrad(current())"/>: </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="right">
                            <xsl:value-of select="if ($current-severity) then fx:format-number(count($current-severity/descendant::gsvrl:fired-rule)) else 0"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="Kopfzeile-setzen">
        <fo:static-content flow-name="page-header">
            <fo:block xsl:use-attribute-sets="Kopf-Fuss-Zeilen-Block">
                <fo:table xsl:use-attribute-sets="Tabelle-Eigenschaften">
                    <fo:table-column column-width="proportional-column-width(2)"/>
                    <fo:table-column column-width="proportional-column-width(1)"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block font-weight="bold">
                                    <xsl:value-of select="$planpro-dateiname"/>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell text-align="right" number-rows-spanned="2" line-height="0pt" display-align="center">
                                <fo:block>
                                    <fo:external-graphic src="{$logo-path}" content-height="20pt" padding-after.length="2pt"/>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>
                                    <fo:retrieve-marker retrieve-class-name="schweregrad-heading"/>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
            <fo:block line-height="0pt" space-after.minimum="{$small-paragraph-distance}">
                <fo:leader xsl:use-attribute-sets="horizontale-Linie"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="Fusszeile-setzen">
        <fo:static-content flow-name="page-footer">
            <fo:block xsl:use-attribute-sets="Kopf-Fuss-Zeilen-Block">
                <fo:leader xsl:use-attribute-sets="horizontale-Linie"/>
                <fo:table xsl:use-attribute-sets="Tabelle-Eigenschaften">
                    <fo:table-column column-width="proportional-column-width(2)"/>
                    <fo:table-column column-width="proportional-column-width(1)"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>
                                    <xsl:value-of select="$plaz-titel"/>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell text-align="right" padding-right="2pt">
                                <fo:block>Seite <fo:page-number/> von <fo:page-number-citation ref-id="LASTPAGE"/></fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="Inhaltsverzeichnis-setzen">
        <fo:block xsl:use-attribute-sets="Schweregrad-Ueberschrift" id="toc">Inhaltsverzeichnis</fo:block>

        <fo:table xsl:use-attribute-sets="Tabelle-Eigenschaften" break-after="page">
            <fo:table-column column-number="1" column-width="10%"/>
            <fo:table-column column-number="2" column-width="82%"/>
            <fo:table-column column-number="3" column-width="8%" text-align="right"/>
            <fo:table-body>
                <xsl:for-each select="$grouped-svrl//gsvrl:problems/descendant::gsvrl:severity">
                    <xsl:variable name="severity-position" select="position()"/>
                    <xsl:call-template name="detailliertes-inhaltsverzeichnis">
                        <xsl:with-param name="severity-position" select="$severity-position"/>
                        <xsl:with-param name="severity-heading" select="fx:generate-problem-severity-heading(current()/@role, current())"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$grouped-svrl//gsvrl:successes/*/gsvrl:severity[@only-success = 'true']">
                    <xsl:call-template name="detailliertes-inhaltsverzeichnis">
                        <xsl:with-param name="severity-position" select="fx:generate-success-number(current())"/>
                        <xsl:with-param name="severity-heading" select="fx:generate-success-severity-heading(current()/@role)"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$grouped-svrl//gsvrl:incomplete/descendant::gsvrl:severity[@only-incomplete = 'true']">
                    <xsl:call-template name="detailliertes-inhaltsverzeichnis">
                        <xsl:with-param name="severity-position" select="fx:generate-incomplete-number(current())"/>
                        <xsl:with-param name="severity-heading" select="fx:generate-incomplete-severity-heading(current()/@role, current())"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$grouped-svrl//gsvrl:ignored">
                    <xsl:variable name="severity-position" select="position() + $count-problem-severities + $count-success-severities + $count-incomplete-severities"/>
                    <xsl:call-template name="detailliertes-inhaltsverzeichnis">
                        <xsl:with-param name="severity-position" select="$severity-position"/>
                        <xsl:with-param name="severity-heading" select=" fx:generate-ignored-heading()"/>
                    </xsl:call-template>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <!-- Inhaltsverzeichnis ab Schweregrad über Arbeitspaket bis Regel -->
    <xsl:template name="detailliertes-inhaltsverzeichnis">
        <xsl:param name="severity-position" as="xs:integer"/>
        <xsl:param name="severity-heading" as="xs:string"/>

        <fo:table-row font-weight="bold">
            <fo:table-cell padding-top="14pt">
                <fo:block background-color="LightGray" padding="2pt">
                    <fo:basic-link internal-destination="{generate-id(current())}">
                        <xsl:value-of select="fx:generate-severity-number($severity-position)"/>
                    </fo:basic-link>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding-top="14pt">
                <fo:block background-color="LightGray" padding="2pt" text-align-last="justify">
                    <fo:basic-link internal-destination="{generate-id(current())}">
                        <xsl:value-of select="$severity-heading"/>
                        <fo:inline>
                            <fo:leader leader-pattern="dots"/>
                        </fo:inline>
                    </fo:basic-link>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding-top="14pt">
                <fo:block background-color="LightGray" padding="2pt" text-align="right">
                    <fo:basic-link internal-destination="{generate-id(current())}">
                        <fo:page-number-citation ref-id="{generate-id(current())}"/>
                    </fo:basic-link>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
        <xsl:for-each select="current()/*/gsvrl:workpackage
            [@only-success = 'true' or not(@only-success)]
            [@only-incomplete = 'true' or not(@only-incomplete)]">
            <xsl:variable name="workpackage-position" select="position()"/>
            <fo:table-row>
                <fo:table-cell>
                    <fo:block font-weight="bold" margin-top="10pt" margin-bottom="5pt">
                        <fo:basic-link internal-destination="{generate-id(current())}">
                            <xsl:value-of select="fx:generate-workpackage-number($severity-position, $workpackage-position)"/>
                        </fo:basic-link>
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell font-weight="bold">
                    <fo:block text-align-last="justify" margin-top="10pt" margin-bottom="5pt">
                        <fo:basic-link internal-destination="{generate-id(current())}">
                            <xsl:value-of select="fx:generate-workpackage-heading(current()/@planpro:arbeitspaket)"/>
                            <fo:inline>
                                <fo:leader leader-pattern="dots"/>
                            </fo:inline>
                        </fo:basic-link>
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                    <fo:block text-align="right" font-weight="bold" margin-top="10pt" margin-bottom="5pt">
                        <fo:basic-link internal-destination="{generate-id(current())}">
                            <fo:page-number-citation ref-id="{generate-id(current())}"/>
                        </fo:basic-link>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
            <xsl:for-each select="current()/*/gsvrl:technical-rule
                [@only-success = 'true' or not(@only-success)]
                [@only-incomplete = 'true' or not(@only-incomplete)]">
                <xsl:variable name="technical-rule-position" select="position()"/>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>
                            <fo:basic-link internal-destination="{generate-id(current())}">
                                <xsl:value-of
                                    select="fx:generate-technical-rule-number($severity-position, $workpackage-position, $technical-rule-position)"/>
                            </fo:basic-link>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align-last="justify">
                            <fo:basic-link internal-destination="{generate-id(current())}">
                                <xsl:value-of select="fx:generate-technical-rule-heading(current()/@name)"/>
                                <fo:inline>
                                    <fo:leader leader-pattern="dots"/>
                                </fo:inline>
                            </fo:basic-link>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="right">
                            <fo:basic-link internal-destination="{generate-id(current())}">
                                <fo:page-number-citation ref-id="{generate-id(current())}"/>
                            </fo:basic-link>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="Inhalt-setzen">
        <xsl:for-each select="$grouped-svrl//gsvrl:problems/descendant::gsvrl:severity">
<!--            hier Anpassen! um pdf zu kürzen, bei mehr als 100 problemen-->
            <xsl:variable name="severity-position" select="position()"/>
            <xsl:call-template name="detaillierten-Inhalt-setzen">
                <xsl:with-param name="severity-position" select="$severity-position"/>
                <xsl:with-param name="severity-heading" select="fx:generate-problem-severity-heading(current()/@role, current())"/>
                <xsl:with-param name="problems" select="true()"/>
            </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="$grouped-svrl//gsvrl:successes/*/gsvrl:severity[@only-success = 'true']">
            <xsl:call-template name="detaillierten-Inhalt-setzen">
                <xsl:with-param name="severity-position" select="fx:generate-success-number(current())"/>
                <xsl:with-param name="severity-heading" select="fx:generate-success-severity-heading(current()/@role)"/>
                <xsl:with-param name="problems" select="false()"/>
            </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="$grouped-svrl//gsvrl:incomplete/descendant::gsvrl:severity[@only-incomplete = 'true']">
            <xsl:call-template name="detaillierten-Inhalt-setzen">
                <xsl:with-param name="severity-position" select="fx:generate-incomplete-number(current())"/>
                <xsl:with-param name="severity-heading" select="fx:generate-incomplete-severity-heading(current()/@role, current())"/>
                <xsl:with-param name="problems" select="false()"/>
            </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="$grouped-svrl//gsvrl:ignored">
            <xsl:variable name="severity-position" select="position() + $count-problem-severities + $count-success-severities + $count-incomplete-severities"/>
            <xsl:call-template name="detaillierten-Inhalt-setzen">
                <xsl:with-param name="severity-position" select="$severity-position"/>
                <xsl:with-param name="severity-heading" select=" fx:generate-ignored-heading()"/>
                <xsl:with-param name="problems" select="false()"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="detaillierten-Inhalt-setzen">
        <xsl:param name="severity-position" as="xs:integer"/>
        <xsl:param name="severity-heading" as="xs:string"/>
        <xsl:param name="problems" as="xs:boolean"/>

        <fo:block break-before="page" xsl:use-attribute-sets="Schweregrad-Ueberschrift" id="{generate-id(current())}">
            <fo:list-block provisional-distance-between-starts="1*20pt" provisional-label-separation="{$small-paragraph-distance}">
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block>
                            <xsl:value-of select="fx:generate-severity-number($severity-position)"/>
                        </fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <xsl:value-of select="$severity-heading"/>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </fo:list-block>

            <fo:block>
                <fo:marker marker-class-name="schweregrad-heading">
                    <xsl:value-of select="$severity-position"/>.&#x2001; <xsl:value-of select="$severity-heading"/>
                </fo:marker>
            </fo:block>
        </fo:block>

        <xsl:for-each select="current()/*/gsvrl:workpackage
            [@only-success = 'true' or not(@only-success)]
            [@only-incomplete = 'true' or not(@only-incomplete)]">
            <xsl:variable name="workpackage-position" select="position()"/>
            <fo:block xsl:use-attribute-sets="Arbeitspaket-Ueberschrift"
                id="{generate-id(current())}">
                <fo:list-block provisional-distance-between-starts="2*20pt"
                    provisional-label-separation="{$small-paragraph-distance}">
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block>
                                <xsl:value-of
                                    select="fx:generate-workpackage-number($severity-position, $workpackage-position)"
                                />
                            </fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block>
                                <xsl:value-of
                                    select="fx:generate-workpackage-heading(current()/@planpro:arbeitspaket)"
                                />
                            </fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </fo:list-block>
            </fo:block>

            <xsl:for-each select="current()/*/gsvrl:technical-rule
                [@only-success = 'true' or not(@only-success)]
                [@only-incomplete = 'true' or not(@only-incomplete)]">
                <xsl:variable name="technical-rule-position" select="position()"/>
                <fo:block xsl:use-attribute-sets="Technische-Regel-Ueberschrift"
                    id="{generate-id(current())}">
                    <fo:list-block provisional-distance-between-starts="3*20pt"
                        provisional-label-separation="{$small-paragraph-distance}">
                        <fo:list-item>
                            <fo:list-item-label end-indent="label-end()">
                                <fo:block>
                                    <xsl:value-of
                                        select="fx:generate-technical-rule-number($severity-position, $workpackage-position, $technical-rule-position)"
                                    />
                                </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body start-indent="body-start()">
                                <fo:block>
                                    <xsl:value-of
                                        select="fx:generate-technical-rule-heading(current()/@name)"
                                    />
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                </fo:block>

                <xsl:if test="$problems">
                    <fo:block xsl:use-attribute-sets="Block-Abstand" font-weight="bold"
                        keep-with-next="always"> Angaben zur Regel </fo:block>
                </xsl:if>

                <fo:table xsl:use-attribute-sets="Block-Abstand Tabelle-Eigenschaften"
                    keep-together.within-page="always">
                    <fo:table-column column-width="20%"/>
                    <fo:table-column column-width="11%"/>
                    <fo:table-column column-width="69%"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand">
                                <fo:block>GUID:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand"
                                 number-columns-spanned="2">
                                <fo:block text-align="justify">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes" select="@fpi"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand">
                                <fo:block>Quelle:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand"
                                 number-columns-spanned="2">
                                <fo:block text-align="justify">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes"
                                            select="@planpro:quelle"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand">
                                <fo:block>Inhalt:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand"
                                 number-columns-spanned="2">
                                <fo:block text-align="justify">
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes"
                                            select="gsvrl:active-pattern/
                                            gsvrl:text/planpro:description"/>
                                    </xsl:apply-templates>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <xsl:if test="not(ancestor::gsvrl:ignored)">
                            <xsl:variable name="rule-success-count" as="xs:integer">
                                <xsl:choose>
                                    <xsl:when test="ancestor::gsvrl:successes">
                                        <xsl:value-of select="count(descendant::gsvrl:fired-rule)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:variable name="current-rule-fpi" select="@fpi"/>
                                        <xsl:variable name="current-workpackage" select="ancestor::gsvrl:workpackage/@planpro:arbeitspaket"/>
                                        <xsl:value-of select="count(//gsvrl:successes/
                                            descendant::gsvrl:workpackage[@planpro:arbeitspaket = $current-workpackage]/
                                            descendant::gsvrl:technical-rule[@fpi = $current-rule-fpi]/
                                            descendant::gsvrl:fired-rule)"/>
                                    </xsl:otherwise>
                                </xsl:choose>                                
                            </xsl:variable>
                            <xsl:variable name="rule-incomplete-count" as="xs:integer">
                                <xsl:choose>
                                    <xsl:when test="ancestor::gsvrl:incomplete">
                                        <xsl:value-of select="count(descendant::gsvrl:fired-rule)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:variable name="current-rule-fpi" select="@fpi"/>
                                        <xsl:variable name="current-workpackage" select="ancestor::gsvrl:workpackage/@planpro:arbeitspaket"/>
                                        <xsl:variable name="current-scope" select="ancestor::gsvrl:scope/@zuordnung"/>
                                        <xsl:value-of select="count(//gsvrl:incomplete/
                                            gsvrl:scope[@zuordnung = $current-scope]//
                                            gsvrl:workpackage[@planpro:arbeitspaket = $current-workpackage]/*/
                                            gsvrl:technical-rule[@fpi = $current-rule-fpi]/*/
                                            gsvrl:fired-rule)"/>
                                    </xsl:otherwise>
                                </xsl:choose>                                
                            </xsl:variable>

                            <xsl:if test="$problems">
                                <xsl:variable name="schweregrad-icon-path" as="xs:string" select="fx:select-schweregrad-icon(ancestor::gsvrl:severity/@role)"/>                                
                                <fo:table-row>
                                    <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand">
                                        <fo:block text-indent="-14pt" margin-top="-1pt">
                                            <xsl:if test="string-length($schweregrad-icon-path) > 0">
                                                <fo:external-graphic src="{$schweregrad-icon-path}" content-height="10pt" alignment-baseline="hanging"/>
                                            </xsl:if> Feststellungen</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand">
                                        <fo:block text-align="right" text-align-last="justify">
                                            <fo:leader leader-pattern="dots"/>
                                            <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                                <xsl:with-param name="inhalt" tunnel="yes"
                                                    select="fx:format-number(count(descendant-or-self::gsvrl:fired-rule))"/>
                                            </xsl:apply-templates>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block/>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:if>
                            <xsl:if test="$rule-success-count != 0">
                                <fo:table-row>
                                    <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand">
                                        <fo:block text-indent="-14pt" margin-top="-1pt">
                                            <fo:external-graphic src="Pictures/Icon_Okay.svg" content-height="10pt" alignment-baseline="hanging"/> Erfolge</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand">
                                        <fo:block text-align="right" text-align-last="justify">
                                            <fo:leader leader-pattern="dots"/>
                                            <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                                <xsl:with-param name="inhalt" tunnel="yes"
                                                    select="fx:format-number(($rule-success-count))"/>
                                            </xsl:apply-templates>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block/>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:if>
                            <xsl:if test="$rule-incomplete-count != 0">
                                <fo:table-row>
                                    <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand">
                                        <fo:block text-indent="-14pt" margin-top="-1pt">
                                            <fo:external-graphic src="Pictures/Icon_Missing.svg" content-height="10pt" alignment-baseline="hanging"/> Unvollständig</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand">
                                        <fo:block text-align="right" text-align-last="justify">
                                            <fo:leader leader-pattern="dots"/>
                                            <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                                <xsl:with-param name="inhalt" tunnel="yes"
                                                    select="fx:format-number(($rule-incomplete-count))"/>
                                            </xsl:apply-templates>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block/>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:if>
                            <xsl:if test="ancestor::gsvrl:successes">
                                <xsl:variable name="current-rule-fpi" select="@fpi"/>
                                <xsl:variable name="current-workpackage" select="ancestor::gsvrl:workpackage/@planpro:arbeitspaket"/>
                                <xsl:if test="//gsvrl:incomplete/
                                    descendant::gsvrl:workpackage[@planpro:arbeitspaket = $current-workpackage]/*/
                                    gsvrl:technical-rule[@fpi = $current-rule-fpi]/*/
                                    gsvrl:fired-rule">
                                    <xsl:for-each select="//gsvrl:incomplete/gsvrl:scope[//gsvrl:workpackage
                                        [@planpro:arbeitspaket = $current-workpackage]/*/
                                        gsvrl:technical-rule[@fpi = $current-rule-fpi]]">
                                        <fo:table-row>
                                            <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand">
                                                <fo:block text-indent="-14pt" margin-top="-1pt">
                                                    <fo:external-graphic src="Pictures/Icon_Missing.svg" content-height="10pt" alignment-baseline="hanging"/> Unvollständig</fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell xsl:use-attribute-sets="Tabelle-Zeilen-Abstand">
                                                <fo:block text-align="right" text-align-last="justify">
                                                    <fo:leader leader-pattern="dots"/>
                                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                                        <xsl:with-param name="inhalt" tunnel="yes"
                                                            select="fx:format-number(count(current()//gsvrl:workpackage[@planpro:arbeitspaket = $current-workpackage]/*/
                                                            gsvrl:technical-rule[@fpi = $current-rule-fpi]/*/
                                                            gsvrl:fired-rule))"/>
                                                    </xsl:apply-templates>
                                                    <fo:inline> (</fo:inline>
                                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                                        <xsl:with-param name="inhalt" tunnel="yes"
                                                            select="fx:show-bereich(current())"/>
                                                    </xsl:apply-templates>
                                                    <fo:inline>)</fo:inline>
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block/>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </xsl:for-each>
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </fo:table-body>
                </fo:table>

                <xsl:if test="$problems">
                    <xsl:variable name="report-count" as="xs:integer"
                        select="count(descendant::gsvrl:failed-assert | descendant::gsvrl:successful-report)"/>
                    <xsl:for-each
                        select="descendant::gsvrl:failed-assert | descendant::gsvrl:successful-report">
                        <xsl:variable name="objekt-position" select="position()"/>
                        <xsl:choose>
                            <xsl:when
                                test="$MAX_OBJECT_COUNT_IN_PDF = 0 or $objekt-position lt $MAX_OBJECT_COUNT_IN_PDF + 1">
                                <fo:block xsl:use-attribute-sets="Objekt-Ueberschrift"
                                    id="{generate-id(current())}">
                                    <fo:list-block provisional-distance-between-starts="4*20pt"
                                        provisional-label-separation="{$small-paragraph-distance}">
                                        <fo:list-item>
                                            <fo:list-item-label end-indent="label-end()">
                                                <fo:block>
                                                  <xsl:value-of
                                                  select="fx:generate-object-number($severity-position, $workpackage-position, $technical-rule-position, $objekt-position)"
                                                  />
                                                </fo:block>
                                            </fo:list-item-label>
                                            <fo:list-item-body start-indent="body-start()">
                                                <fo:block>
                                                  <xsl:call-template name="generate-object-heading">
                                                  <xsl:with-param name="markup" select="true()"/>
                                                  <xsl:with-param name="aufbau"
                                                  select="gsvrl:diagnostic-reference[@diagnostic = 'aufbau']"/>
                                                  <xsl:with-param name="s1"
                                                  select="gsvrl:diagnostic-reference[@diagnostic = 's1']"/>
                                                  <xsl:with-param name="s2"
                                                  select="gsvrl:diagnostic-reference[@diagnostic = 's2']"/>
                                                  <xsl:with-param name="s3"
                                                  select="gsvrl:diagnostic-reference[@diagnostic = 's3']"/>
                                                  <xsl:with-param name="s4"
                                                  select="gsvrl:diagnostic-reference[@diagnostic = 's4']"/>
                                                  <xsl:with-param name="s5"
                                                  select="gsvrl:diagnostic-reference[@diagnostic = 's5']"/>
                                                  <xsl:with-param name="s6"
                                                  select="gsvrl:diagnostic-reference[@diagnostic = 's6']"/>
                                                  <xsl:with-param name="s7"
                                                  select="gsvrl:diagnostic-reference[@diagnostic = 's7']"
                                                  />
                                                  </xsl:call-template>
                                                </fo:block>
                                            </fo:list-item-body>
                                        </fo:list-item>
                                    </fo:list-block>
                                </fo:block>
                                <xsl:call-template name="process-details">
                                    <xsl:with-param name="current-detail" select="current()"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="$objekt-position = $MAX_OBJECT_COUNT_IN_PDF + 1">
                                <fo:block xsl:use-attribute-sets="Objekt-Ueberschrift"
                                    id="{generate-id(current())}">
                                    <fo:list-block provisional-distance-between-starts="4*20pt"
                                        provisional-label-separation="{$small-paragraph-distance}">
                                        <fo:list-item>
                                            <fo:list-item-label end-indent="label-end()">
                                                <fo:block>
                                                  <xsl:value-of
                                                  select="fx:generate-object-number($severity-position, $workpackage-position, $technical-rule-position, $objekt-position)"
                                                  />
                                                </fo:block>
                                            </fo:list-item-label>
                                            <fo:list-item-body start-indent="body-start()">
                                                <fo:block>Weitere Feststellungen</fo:block>
                                            </fo:list-item-body>
                                        </fo:list-item>
                                    </fo:list-block>
                                </fo:block>
                                <fo:block>Es existieren <xsl:value-of
                                        select="$report-count - $MAX_OBJECT_COUNT_IN_PDF"/> weitere
                                    Feststellungen, die nicht detailliert aufgeführt werden. Eine
                                    vollständige Auflistung aller Feststellungen kann über die
                                    HTML-Sicht aufgerufen werden.</fo:block>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="process-details">
        <xsl:param name="current-detail" as="node()"/>

        <xsl:variable name="border-color" as="xs:string" select="fx:select-schweregrad-color($current-detail/parent::*/@role)"/>
        <xsl:variable name="schweregrad-icon-path" as="xs:string" select="fx:select-schweregrad-icon($current-detail/parent::*/@role)"/>

        <fo:list-block xsl:use-attribute-sets="Block-Abstand" provisional-distance-between-starts="{$small-paragraph-distance}">
            <fo:list-item>
                <fo:list-item-label end-indent="label-end()">
                    <fo:block font-size="23pt" line-height="23pt" text-indent="-27pt" margin-top="-1pt">
                        <!-- font-size, line-height auf 21pt gesetzt,
                             da vererbte line-height (12pt) + gesetzte margins (2 x 4pt) + table-cell-border (1pt) -->
                        <!-- text-indent auf -25pt gesetzt,
                             da Inhalt (21pt) um 4pt (table-cell-margin) in den Rand geschoben werden sollen -->
                        <!-- margin-top auf -1pt gesetzt,
                             da um table-cell-border (1pt) noch oben geschoben werden soll -->
                        <xsl:if test="string-length($schweregrad-icon-path) > 0">
                            <fo:external-graphic src="{$schweregrad-icon-path}" content-height="23pt"/>
                            <!-- content-height auf 21pt gesetzt,
                                 da gleicher Wert mit line-height und font-size benötigt -->
                        </xsl:if>
                    </fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="0pt">
                    <fo:table table-layout="fixed" width="100%" keep-together.within-page="always">
                        <fo:table-column column-width="1.1in"/>
                        <fo:table-column column-width="proportional-column-width(1)"/>
                        <!--                        Test für XSL3.0, im Falle der rückwärtigen Auflösung von XPathes aus dem SVRL                            
                        <xsl:variable name="planpro-instanz">
                            <xsl:evaluate xpath="$current-detail/@location" context-item="doc($planpro-datei-location)"/>
                        </xsl:variable>
-->
                        <fo:table-body>
                            <xsl:call-template name="process-detail-zeile">
                                <xsl:with-param name="bezeichnung" select="'Objekt-GUID'"/>
                                <xsl:with-param name="inhalt" tunnel="yes" select="$current-detail/gsvrl:diagnostic-reference[@diagnostic = 'guid']"/>
                                <!--                                Saxon-Extension-Version, im Falle der rückwärtigen Auflösung von XPathes aus dem SVRL 
                                <xsl:with-param name="inhalt" select="doc($planpro-datei-location)/saxon:evaluate($current-detail/@location)/ancestor-or-self::*[parent::Container]/name()"/>
-->
                                <xsl:with-param name="border-color" select="$border-color"/>
                            </xsl:call-template>
                            <xsl:call-template name="process-detail-zeile">
                                <xsl:with-param name="bezeichnung" select="'Beschreibung'"/>
                                <xsl:with-param name="inhalt" tunnel="yes" select="$current-detail/gsvrl:text"/>
                                <xsl:with-param name="border-color" select="$border-color"/>
                            </xsl:call-template>
                        </fo:table-body>
                    </fo:table>
                </fo:list-item-body>
            </fo:list-item>
        </fo:list-block>
    </xsl:template>

    <xsl:template name="process-detail-zeile">
        <xsl:param name="bezeichnung" as="xs:string"/>
        <xsl:param name="border-color" as="xs:string"/>

        <fo:table-row>
            <fo:table-cell border="solid 1pt" border-color="{$border-color}">
                <fo:block xsl:use-attribute-sets="messageText">
                    <xsl:value-of select="$bezeichnung"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell border="solid 1pt" border-color="{$border-color}" display-align="center">
                <fo:block xsl:use-attribute-sets="messageText" text-align="justify">
                    <xsl:apply-templates mode="missing-or-content" select="node()[1]"/>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="node()" mode="missing-or-content" priority="1">
        <xsl:param name="inhalt" as="xs:string?" tunnel="yes"/>
        <xsl:param name="markup" as="xs:boolean" required="no" select="true()"/>

        <!-- This template overloads the stub template in the same mode in 'svrl2any-base.xsl' through its higher priority -->

        <xsl:choose>
            <xsl:when test="string-length($inhalt) = 0">
                <xsl:choose>
                    <xsl:when test="$markup">
                        <fo:inline font-style="italic">
                            <xsl:value-of select="$notAvailable"/>
                        </fo:inline>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$notAvailable"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!--
                    1) Transliterate Roman numerals to ASCII (string  -> string)
                    2) Wrap remaining math/logic symbols in fo:inline (string -> nodes) 
                -->
                <xsl:sequence select="fx:wrap-math-symbols(
                    fx:transliterate-roman-numerals(normalize-space($inhalt)))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:function name="fx:wrap-math-symbols" as="node()*">
        <xsl:param name="input" as="xs:string"/>
        
        <xsl:analyze-string select="$input" regex="{$math-symbols-regex}">
            <xsl:matching-substring>
                <fo:inline font-family="{$default-symbol-font-family}" font-size="smaller">
                    <xsl:value-of select="."/>
                </fo:inline>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:function>
    
    
    <xsl:function name="fx:transliterate-roman-numerals" as="xs:string">
        <xsl:param name="input" as="xs:string"/>
        
        <xsl:variable name="parts" as="xs:string*">
            <xsl:analyze-string select="$input" regex="{$roman-numerals-regex}">
                <xsl:matching-substring>
                    <xsl:value-of select="$roman-numerals-map[@from = current()]/@to"/>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:variable>
        
        <xsl:value-of select="string-join($parts, '')"/>
    </xsl:function>

</xsl:stylesheet>
