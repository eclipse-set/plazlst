<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Copyright 2024-2026 TU Dresden, Fakultät Verkehrswissenschaften "Friedrich List", Professur für Verkehrsprozessautomatisierung (VPA)
    Susanne Wunsch {vpa | susanne.wunsch}<at>tu-dresden<dot>de

    Unless required by applicable law or agreed to in writing, software distributed under the software is distributed on an "AS IS" basis,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

    The software is developed for DB InfraGo and may be used by the costumer without any restrictions.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fx="http://tu-dresden.de/vlp/schematron/functions"
    xmlns:gsvrl="http://tu-dresden.de/vlp/schematron/grouped-svrl"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:planpro="http://www.plan-pro.org/regeln/struktur"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="fx gsvrl xs xsl"
    version="2.0">
    
    <!-- This stylesheet provides basic functions and variable for different output formats
         through data pre-processing in order to serve best usable strings and structures
         to the output specific stylesheet generated in the same way -->
    
    <xsl:import href="HierarchicalSVRL.xsl"/>
    <xsl:import href="GroupedSVRL.xsl"/>
    
    <xsl:param name="notAvailable" as="xs:string">Angabe nicht verfügbar</xsl:param>
    <xsl:param name="detailliertes-dokument" as="xs:boolean" select="true()"/>
    <xsl:param name="schema-valid" as="xs:boolean" select="false()"/>
    <xsl:param name="tool-stamp" as="xs:string">PlanPro-Werkzeugkoffer, Version 0.0.0</xsl:param>
    <xsl:param name="planpro-dateiname" as="xs:string">unbekannt.ppxml</xsl:param>
    <xsl:param name="md5" as="xs:string">Angabe nicht verfügbar</xsl:param>
    
    <xsl:variable name="plaz-titel" as="xs:string">Feststellungsbericht PlaZ LST</xsl:variable>
    <xsl:variable name="logo-path" as="xs:string">Pictures/DB_InfraGo_logo_red_black_100px_rgb.svg</xsl:variable>

    <xsl:variable name="strukt-svrl">
        <xsl:apply-templates mode="restructure"/>
    </xsl:variable>
    
    <xsl:variable name="grouped-svrl">
        <xsl:apply-templates select="$strukt-svrl" mode="group"/>
    </xsl:variable>

    <xsl:variable name="error-detected" as="xs:boolean"
        select="boolean($grouped-svrl//gsvrl:problems/descendant::*[gsvrl:failed-assert | gsvrl:successful-report])"/>
    
    <xsl:variable name="count-all-statements" as="xs:integer"
        select="count($grouped-svrl//(gsvrl:successes | gsvrl:problems)/descendant::gsvrl:fired-rule)"/>
    
    <xsl:variable name="count-success" as="xs:integer" 
        select="count($grouped-svrl//gsvrl:successes/descendant::gsvrl:fired-rule)"/>

    <!-- Provide PlanPro-XML document location with file path -->
    <xsl:variable name="planpro-datei-location" as="node()"
        select="($grouped-svrl//*[@document])[1]/@document"/>
    
    <!-- Extract file name from PlanPro-XML document location -->
<!-- ursprüngliche Ableitung des Dateinamens bei direkten PlanPro-XML-Dateien
        seit Einführung des Zip-Containers nicht mehr sinnvoll,
        da dann überall nur "content.xml" stehen würde
        deshalb hier auskommentiert für ggf. Wiederverwendung, falls mal notwendig
        stattdessen globaler Input-Parameter für dieses Skript,
        um den Dateinamen des Zip-Archivs übergeordnet in den Prozess einzubringen
        
    <xsl:variable name="planpro-dateiname" as="xs:string">
        <xsl:analyze-string select="$planpro-datei-location" regex="file:.*/(.*)">
            <xsl:matching-substring>
                <xsl:value-of select="regex-group(1)"/>
            </xsl:matching-substring>
        </xsl:analyze-string>        
    </xsl:variable>
-->    
    <!-- Catch PlanPro-XML-XPath from SVRL location attribute -->
    <xsl:variable name="planpro-namespace" as="xs:string?"
        select="if (exists($planpro-datei)) 
        then $planpro-datei/*/namespace-uri() 
        else ''"/>
    
    <!-- Analyse the string "http://www.plan-pro.org/modell/PlanPro/1.7.0.1"
         Namespace shall end with the version string -->
    <xsl:variable name="planpro-version" as="xs:string?">
        <xsl:analyze-string select="$planpro-namespace" regex="http://.*/(.*)">
            <xsl:matching-substring>
                <xsl:value-of select="regex-group(1)"/>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:variable>

    <!-- Catch PlanPro-XML-XPath from SVRL location attribute -->
    <xsl:variable name="signalbegriff-4-namespace" as="node()?"
        select="if (exists($planpro-datei)) 
        then ($planpro-datei//Signalbegriff_ID[@xsi:type])[1] 
        else ()"/>

    <!-- Analyse the string "http://www.plan-pro.org/modell/Signalbegriffe_Ril_301/1.10.0.1"
         Namespace shall end with the version string -->
    <xsl:variable name="signalbegriffe-version" as="xs:string?">
        <xsl:if test="$signalbegriff-4-namespace">
            <xsl:analyze-string select="namespace-uri-for-prefix(
                substring-before($signalbegriff-4-namespace/@xsi:type, ':'), 
                $signalbegriff-4-namespace)"
                regex="http://.*/(.*)">
                <xsl:matching-substring>
                    <xsl:value-of select="regex-group(1)"/>
                </xsl:matching-substring>
            </xsl:analyze-string>
        </xsl:if>
    </xsl:variable>
    
    <!-- Find all planpro:version strings in the active-patterns -->
    <xsl:variable name="catched-plaz-planpro-versions" as="xs:string*"
        select="distinct-values($grouped-svrl//gsvrl:active-pattern/@planpro:version)"/>

    <!-- Provide found planpro:version in plaz-rule with a comma separator -->
    <xsl:variable name="plaz-planpro-versions" as="xs:string*">
        <xsl:value-of select="$catched-plaz-planpro-versions" separator=", "/>
    </xsl:variable>
    
    <xsl:variable name="planpro-datei" as="document-node()?"
        select="if ($planpro-datei-location != '' and doc-available($planpro-datei-location))
        then doc($planpro-datei-location)
        else ()"/>

    <xsl:variable name="file-changed-stamp" as="xs:dateTime?"
        select="if (exists($planpro-datei)) 
        then $planpro-datei/descendant::Erzeugung_Zeitstempel/Wert 
        else ()"/>
    
    <xsl:variable name="datei-guid" as="xs:string?"
        select="if (exists($planpro-datei))
        then $planpro-datei/*/Identitaet/Wert
        else ''"/>
    
    <xsl:variable name="planungsprojekt" as="xs:string?"
        select="if (exists($planpro-datei))
        then ($planpro-datei/descendant::Bezeichnung_Planung_Projekt/Wert)[1]
        else ''"/>
    
    <xsl:variable name="alle-lst-planungsgruppen" as="node()*"
        select="if (exists($planpro-datei)) 
        then $planpro-datei/descendant::LST_Planung_Gruppe
        else ()"/>

    <xsl:variable name="eine-lst-planungsgruppe" as="node()?">
        <xsl:choose>
            <xsl:when test="$alle-lst-planungsgruppen/*/Untergewerk_Art/Wert='ESTW'">
                <xsl:sequence select="$alle-lst-planungsgruppen[*/Untergewerk_Art/Wert='ESTW'][1]" />
            </xsl:when>
            <xsl:when test="$alle-lst-planungsgruppen/*/Untergewerk_Art/Wert='Geo'">
                <xsl:sequence select="$alle-lst-planungsgruppen[*/Untergewerk_Art/Wert='Geo'][1]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="''"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="planungsgruppe" as="xs:string?"
        select="$eine-lst-planungsgruppe/descendant::Bezeichnung_Planung_Gruppe/Wert"/>

    <xsl:variable name="einzelplanung" as="xs:string?"
        select="$eine-lst-planungsgruppe/descendant::Bauzustand_Kurzbezeichnung/Wert"/>

    <xsl:variable name="plaz-erzeugung" as="xs:string"
        select="concat('Erstellt am ', fx:format-date-time(current-dateTime()))"/>

    <xsl:variable name="count-problem-severities"
        select="count($grouped-svrl//gsvrl:problems/descendant::gsvrl:severity)"/>

    <xsl:variable name="count-success-severities"
        select="count($grouped-svrl//gsvrl:successes/descendant::gsvrl:severity[@only-success = 'true'])"/>

    <xsl:variable name="count-incomplete-severities"
        select="count($grouped-svrl//gsvrl:incomplete/descendant::gsvrl:severity[@only-incomplete = 'true'])"/>
    
    <xsl:function name="fx:translate-schweregrad" as="xs:string">
        <xsl:param name="current-role" as="xs:string?"/>
        
        <xsl:choose>
            <xsl:when test="upper-case($current-role) = 'ERROR'">
                <xsl:value-of select="'Fehler'"/>
            </xsl:when>
            <xsl:when test="upper-case($current-role) = 'WARNING'">
                <xsl:value-of select="'Warnung'"/>
            </xsl:when>
            <xsl:when test="upper-case($current-role) = 'INFORMATION'">
                <xsl:value-of select="'Hinweis'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat('Unbekannter Fehlercode ', upper-case($current-role))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="fx:show-bereich" as="xs:string">
        <xsl:param name="current" as="node()"/>
        
        <xsl:choose>
            <xsl:when test="$current/ancestor-or-self::gsvrl:scope/@zuordnung = 'Planung'">
                <xsl:value-of select="' im Planungsbereich'"/>
            </xsl:when>
            <xsl:when test="$current/ancestor-or-self::gsvrl:scope/@zuordnung = 'Betrachtung'">
                <xsl:value-of select="' im Betrachtungsbereich'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="''"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="fx:select-schweregrad-icon" as="xs:string">
        <xsl:param name="current-role" as="xs:string?"/>
        
        <xsl:choose>
            <xsl:when test="upper-case($current-role) = 'ERROR'">
                <xsl:value-of select="'Pictures/Icon_Error.svg'"/>
            </xsl:when>
            <xsl:when test="upper-case($current-role) = 'WARNING'">
                <xsl:value-of select="'Pictures/Icon_Warning.svg'"/>
            </xsl:when>
            <xsl:when test="upper-case($current-role) = 'INFORMATION'">
                <xsl:value-of select="'Pictures/Icon_Information.svg'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="''"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="fx:select-schweregrad-color" as="xs:string">
        <xsl:param name="current-role" as="xs:string?"/>
        
        <xsl:choose>
            <xsl:when test="upper-case($current-role) = 'ERROR'">
                <xsl:value-of select="'red'"/>
            </xsl:when>
            <xsl:when test="upper-case($current-role) = 'WARNING'">
                <xsl:value-of select="'orange'"/>
            </xsl:when>
            <xsl:when test="upper-case($current-role) = 'INFORMATION'">
                <xsl:value-of select="'gray'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="'black'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
        
    <xsl:function name="fx:translate-dokument-typ" as="xs:string">
        <xsl:choose>
            <xsl:when test="$detailliertes-dokument">
                <xsl:value-of select="'Vollständige Dokumentation'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="'Übersicht'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="fx:translate-schema-valid" as="xs:string">
        <xsl:choose>
            <xsl:when test="$schema-valid">
                <xsl:value-of select="'erfolgreich'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="'nicht erfolgreich'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- Following functions generate headings for XSL-FO (PDF) -->

    <xsl:function name="fx:generate-problem-severity-heading" as="xs:string">
        <xsl:param name="current-role" as="xs:string?"/>
        <xsl:param name="current-bereich" as="node()"/>
        
        <xsl:value-of select="concat('Feststellungen vom Typ &#8222;',
            fx:translate-schweregrad($current-role),'&#8220;', fx:show-bereich($current-bereich))"/>
    </xsl:function>

    <xsl:function name="fx:generate-success-severity-heading" as="xs:string">
        <xsl:param name="current-role" as="xs:string?"/>
        
        <xsl:value-of select="concat('Erfolge für Regeln vom Typ &#8222;', fx:translate-schweregrad($current-role),'&#8220;')"/>
    </xsl:function>

    <xsl:function name="fx:generate-incomplete-severity-heading" as="xs:string">
        <xsl:param name="current-role" as="xs:string?"/>
        <xsl:param name="current-bereich" as="node()"/>
        
        <xsl:value-of select="concat('Unvollständige Daten für Regeln vom Typ &#8222;',
            fx:translate-schweregrad($current-role),'&#8220;', fx:show-bereich($current-bereich))"/>
    </xsl:function>

    <xsl:function name="fx:generate-ignored-heading" as="xs:string">
        <xsl:value-of select="'Nicht relevante Regeln'"/>
    </xsl:function>

    <xsl:function name="fx:generate-workpackage-heading" as="xs:string">
        <xsl:param name="current-workpackage" as="xs:string?"/>
        
        <xsl:value-of select="concat('Arbeitspaket &#8222;', $current-workpackage,'&#8220;')"/>
    </xsl:function>
    
    <xsl:function name="fx:generate-technical-rule-heading" as="xs:string">
        <xsl:param name="current-technical-rule-name" as="xs:string?"/>
        
        <xsl:value-of select="concat('Regel &#8222;', $current-technical-rule-name,'&#8220;')"/>
    </xsl:function>
    
    <xsl:function name="fx:generate-severity-number" as="xs:string">
        <xsl:param name="current-severity-position" as="xs:integer"/>
        
        <xsl:value-of select="$current-severity-position"/>
    </xsl:function>

    <xsl:function name="fx:generate-workpackage-number" as="xs:string">
        <xsl:param name="current-severity-position" as="xs:integer"/>
        <xsl:param name="current-workpackage-position" as="xs:integer"/>
        
        <xsl:value-of select="concat(fx:generate-severity-number($current-severity-position), '.', $current-workpackage-position)"/>
    </xsl:function>

    <xsl:function name="fx:generate-technical-rule-number" as="xs:string">
        <xsl:param name="current-severity-position" as="xs:integer"/>
        <xsl:param name="current-workpackage-position" as="xs:integer"/>
        <xsl:param name="technical-rule-position" as="xs:integer"/>
        
        <xsl:value-of select="concat(fx:generate-workpackage-number($current-severity-position, $current-workpackage-position), '.', $technical-rule-position)"/>
    </xsl:function>

    <xsl:function name="fx:generate-object-number" as="xs:string">
        <xsl:param name="current-severity-position" as="xs:integer"/>
        <xsl:param name="current-workpackage-position" as="xs:integer"/>
        <xsl:param name="technical-rule-position" as="xs:integer"/>
        <xsl:param name="oject-position" as="xs:integer"/>
        
        <xsl:value-of select="concat(fx:generate-technical-rule-number($current-severity-position, $current-workpackage-position, $technical-rule-position), '.', $oject-position)"/>
    </xsl:function>
    
    <xsl:function name="fx:format-date-time" as="xs:string">
        <xsl:param name="date-time"/>
        <xsl:choose>
            <xsl:when test="not($date-time castable as xs:dateTime)">
                <xsl:value-of select="format-dateTime(current-dateTime(), '[D01].[M01].[Y0001], [H01]:[m01]:[s01]')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="format-dateTime($date-time, '[D01].[M01].[Y0001], [H01]:[m01]:[s01]')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="fx:format-date" as="xs:string">
        <xsl:param name="date"/>
        <xsl:choose>
            <xsl:when test="not($date castable as xs:date)">
                <xsl:value-of select="format-date(current-date(), '[D01].[M01].[Y0001]')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="format-date($date, '[D01].[M01].[Y0001]')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:template name="generate-object-heading">
        <xsl:param name="markup" as="xs:boolean"/>
        <xsl:param name="aufbau" as="xs:string?"/>
        <xsl:param name="s1" as="xs:string?"/>
        <xsl:param name="s2" as="xs:string?"/>
        <xsl:param name="s3" as="xs:string?"/>
        <xsl:param name="s4" as="xs:string?"/>
        <xsl:param name="s5" as="xs:string?"/>
        <xsl:param name="s6" as="xs:string?"/>
        <xsl:param name="s7" as="xs:string?"/>
        
        <!-- Die Bezeichnungen werden nach folgendem Muster ausgegeben:
        
         '00'   s1 "s2"
         
         '01'   s1 "s2 s3"
         '02'   s1 "s2/s3"
         '03'   s1 "s2 (s3)"
         '04'   s1 "s2 - s3"
         '05'   s1 "s2s3"
         
         '10'   s1 "s2", s3 "s4"
         '11'   s1 "s2/s3 [s4]"
         '12'   s1 "s2/s3 (s4)"
         '13'   s1 "s2 s3/s4"
         '14'   s1 "s2 (s3/s4)"
         '15'   s1 "s2s3s4"
         '16'   s1 "s2 (s3 s4)"
         '17'   s1 "s2 s3 (s4)"
         '18'   s1 "s2 s3 s4"
         '19'   s1 "s2 - s3 s4"
         
         '20'   s1 "s2 s3, s4 s5"
         '21'   s1 "s2", s3 "s4 s5"
         '22'   s1 "s2 s3" (s4 s5)
         '23'   s1 "s2", s3 "s4 (s5)"
         '24'   s1 "s2/s3" s4 "s5"
         '25'   s1 "s2/s3 [s4] (s5)"
         '26'   s1 "s2 s3/s4 [s5]"
         '27'   s1 "s2 s3/s4 (s5)"
         '28'   s1 "s2/s3 (s4 s5)"
         '29'   s1 "s2 (s3s4s5)"
		 '30'   s1 "s2 s3 (s4/s5)"
         
         '40'   s1 "s2, s3 s4, s5 s6"
         '41'   s1 "s2 s3/s4 [s5] (s6)"
         
         '50'   s1 "s2 (s3 s4 s5, s6 s7)"
         '51'   s1 "s2 - s3 (s4 s5, s6 s7)"
         '52'   s1 "s2 - s3 s4, s5 (s6, s7)"
         '53'   s1 "s2 - s3 s4, s5 (s6, s7)..."
         '54'   s1 "s2 s3, s4 s5, s6 s7"

        -->
        
        <xsl:choose>
            <xsl:when test="$aufbau">
                <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                    <xsl:with-param name="inhalt" tunnel="yes" select="$s1"/>
                    <xsl:with-param name="markup" select="$markup"/>
                </xsl:apply-templates>
                <xsl:text> &#8222;</xsl:text>
                <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                    <xsl:with-param name="inhalt" tunnel="yes" select="$s2"/>
                    <xsl:with-param name="markup" select="$markup"/>
                </xsl:apply-templates>
                <xsl:choose>
                    <xsl:when test="$aufbau = '00'">
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '01'">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '02'">
                        <xsl:text>/</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '03'">
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '04'">
                        <xsl:text> - </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '05'">
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '10'">
                        <xsl:text>&#8220;, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> &#8222;</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '11'">
                        <xsl:text>/</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> [</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>]&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '12'">
                        <xsl:text>/</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '13'">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>/</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '14'">
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>/</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '15'">
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '16'">
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '17'">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                     <xsl:when test="$aufbau = '18'">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '19'">
                        <xsl:text> - </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '20'">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '22'">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220; (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '23'">
                        <xsl:text>&#8220;, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> &#8222;</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '24'">
                        <xsl:text>/</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220; </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> &#8222;</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '25'">
                        <xsl:text>/</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> [</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>] (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '26'">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>/</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> [</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>]&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '27'">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>/</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '28'">
                        <xsl:text>/</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '29'">
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '30'">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>/</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '40'">
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s6"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>&#8220;
                    </xsl:when>
                    <xsl:when test="$aufbau = '41'">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>/</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> [</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>] (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s6"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '50'">
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s6"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s7"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '51'">
                        <xsl:text> - </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s6"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s7"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '52'">
                        <xsl:text> - </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s6"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s7"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '53'">
                        <xsl:text> - </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s6"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s7"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>)...&#8220;</xsl:text>
                    </xsl:when>
                    <xsl:when test="$aufbau = '54'">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s3"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s4"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s5"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s6"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                            <xsl:with-param name="inhalt" tunnel="yes" select="$s7"/>
                            <xsl:with-param name="markup" select="$markup"/>
                        </xsl:apply-templates>
                        <xsl:text>&#8220;</xsl:text>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                    <xsl:with-param name="inhalt" tunnel="yes" select="$s1"/>
                    <xsl:with-param name="markup" select="$markup"/>
                </xsl:apply-templates>
                <xsl:text> &#8222;</xsl:text>
                <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                    <xsl:with-param name="inhalt" tunnel="yes" select="$s2"/>
                    <xsl:with-param name="markup" select="$markup"/>
                </xsl:apply-templates>
                <xsl:text>&#8220;</xsl:text>
            </xsl:otherwise>
        </xsl:choose>

     </xsl:template>
    
    <xsl:template match="node()" mode="missing-or-content">
        <xsl:param name="inhalt"/>
        <xsl:param name="markup"/>
        
        <!-- This is a stub, that will be over-loaded by the local format-specific templates in the same mode -->
        
    </xsl:template>
    
</xsl:stylesheet>
