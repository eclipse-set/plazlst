<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Copyright 2024-2026 TU Dresden, Fakultät Verkehrswissenschaften "Friedrich List", Professur für Verkehrsprozessautomatisierung (VPA)
    Susanne Wunsch {vpa | susanne.wunsch}<at>tu-dresden<dot>de
    
    Unless required by applicable law or agreed to in writing, software distributed under the software is distributed on an "AS IS" basis,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    
    The software is developed for DB InfraGO and may be used by the costumer without any restrictions.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fx="http://tu-dresden.de/vlp/schematron/functions"
    xmlns:hsvrl="http://tu-dresden.de/vlp/schematron/hierarchical-svrl"
    xmlns:gsvrl="http://tu-dresden.de/vlp/schematron/grouped-svrl"
    xmlns:planpro="http://www.plan-pro.org/regeln/struktur"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="hsvrl xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="inverse-schweregrad-prioritaeten" as="xs:string*"
        select="'INFORMATION', 'WARNING', 'ERROR'"/>

    <xsl:function name="fx:convert-number" as="xs:double">
        <xsl:param name="current-string" as="xs:string?"/>
        
        <!-- translate(<string>, ',', '.') changes 'comma' (decimal separator) into 'dot' as requirement for the type cast into number
             translate(<string>, '.', '') removes 'dot' (grouping seperator) as requirement for the type cast into number
             number(<string>) type cast is needed to handle integers and decimals correctly in the sorting algorithm  -->
                
        <xsl:variable name="corrected-string" as="xs:string">
            <xsl:choose>
                <xsl:when test="matches($current-string, '^\d+\.\d{3},\d+$')">  <!-- from 1.234,56  to 1234.56 -->
                    <xsl:value-of select="translate(translate($current-string, '.', ''), ',', '.')"/>
                </xsl:when>
                <xsl:when test="matches($current-string, '^\d+,\d+$')">         <!-- from 12,3456 to 12.3456-->
                    <xsl:value-of select="translate($current-string, ',', '.')"/>
                </xsl:when>
                <xsl:otherwise>                                                 <!-- from 12.3456 to 12.3456   from 12345 to 12345 -->
                    <xsl:value-of select="$current-string"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:value-of select="number($corrected-string)"/>
    </xsl:function>
    
    <xsl:function name="fx:desired-workpackage" as="xs:string">
        <xsl:param name="current-fired-rule" as="node()"/>
        
        <!-- in most cases, the attribute planpro:arbeitspaket of the active-pattern will be used directly,
             if this is 'BASISOBJEKTE', then it's translated to the workpackage according to the object type -->
        
        <xsl:variable name="workpackage-by-pattern" select="$current-fired-rule/../@planpro:arbeitspaket"/>
        
        <xsl:choose>
            <xsl:when test="upper-case($workpackage-by-pattern) = 'BASISOBJEKTE'">
                <xsl:variable name="current-object"
                    select="$current-fired-rule/*/hsvrl:diagnostic-reference[@diagnostic='typ']"/>
                <xsl:variable name="converted-workpackage"
                    select="doc('AP-Objektzuordnung.xml')/planpro:AP-Objektzuordnung/planpro:AP[@objekt = $current-object]"/>
                <xsl:choose>
                    <xsl:when test="$converted-workpackage">
                        <xsl:value-of select="$converted-workpackage"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'Basisobjekte'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$workpackage-by-pattern"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <!-- The following templates in 'mode="group"' perform the grouping process -->

    <xsl:template match="/">
        <xsl:apply-templates mode="group"/>
    </xsl:template>

    <xsl:template match="@*|comment()" mode="group statement success">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|comment()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="hsvrl:*" mode="group statement success">
        <xsl:element name="{local-name()}" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
            <xsl:apply-templates select="@*|comment()|node()" mode="#current"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*" mode="group statement success">
        <xsl:element name="{name()}" namespace="{namespace-uri()}">
            <xsl:apply-templates select="@*|comment()|node()" mode="#current"/>
        </xsl:element>                
    </xsl:template>
    
    <xsl:template match="hsvrl:fired-rule[not(descendant-or-self::*[hsvrl:failed-assert | hsvrl:successful-report])]" mode="statement"/> 
    
    <xsl:template match="hsvrl:fired-rule[descendant-or-self::*[hsvrl:failed-assert | hsvrl:successful-report]]" mode="success"/>
    
    <xsl:template match="hsvrl:fired-rule[@flag='ignore']" mode="success"/> 
    
    <xsl:template match="hsvrl:schematron-output" mode="group">
        <xsl:element name="{local-name()}" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
            <xsl:namespace name="planpro">http://www.plan-pro.org/regeln/struktur</xsl:namespace>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:comment>
                This is a grouped, restructured SVRL document, which does not comply with ISO 19757-3 Annex D grammar!
            </xsl:comment>
            <xsl:apply-templates select="comment()" mode="#current"/>
            <xsl:apply-templates select="hsvrl:text" mode="#current"/>
            <xsl:apply-templates select="hsvrl:ns-prefix-in-attribute-values" mode="#current"/>

            <!-- "statements" contains all patterns/rules which fired an failed-assert or successful-report -->
            <xsl:element name="problems" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                <xsl:if test="current()/descendant::hsvrl:fired-rule[not(@flag)]/*">
                    
                    <xsl:for-each-group select="hsvrl:active-pattern/hsvrl:fired-rule[not(@flag)][*]"
                        group-by="current()/descendant::hsvrl:diagnostic-reference[@diagnostic = 'bereich']/tokenize(text(), ' ')">
                        <xsl:sort select="current-grouping-key()" order="descending"/>
                        <xsl:element name="scope" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                            <xsl:attribute name="zuordnung" select="current-grouping-key()"/>
                            
                            <xsl:element name="severities" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                        <!-- Group active-pattern elements according a descendant @role attribute value -->
                            <xsl:for-each-group select="current-group()"
                                group-by="upper-case((./@role)[1])">
                                <xsl:sort select="index-of($inverse-schweregrad-prioritaeten, current-grouping-key())" order="descending"/>
                                <xsl:sort order="ascending"/>
                                <xsl:element name="severity" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                    <xsl:copy-of select="(./@role)[1]"/>
                                    
                                    <xsl:element name="workpackages" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                       <!-- Group active-pattern elements according to its @planpro:arbeitspaket attribute values or
                                           translate in case of "BASISOBJEKTE"-->
                                       <xsl:for-each-group select="current-group()" group-by="upper-case(fx:desired-workpackage(.))">
                                           <xsl:sort select="current-grouping-key()" order="ascending"/>
                                           <xsl:element name="workpackage" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                               <xsl:attribute name="planpro:arbeitspaket" select="fx:desired-workpackage(.)"/>
                                               
                                               <xsl:element name="technical-rules" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                                   <!-- Group active-pattern elements according its @fpi attribute values -->
                                                   <xsl:for-each-group select="current-group()" group-by="upper-case(../@fpi)">
                                                       <xsl:sort order="ascending"/>
<!--                                                       <xsl:if test="count(current-group()) > 1">
                                                           <xsl:message select="'Achtung! Es existiert mehr als eine Regel mit der GUID:', current-grouping-key(), ' &#xA;', 
                                                               'Dadurch wird das PDF (im FOP-Prozess) fehlerhaft erstellt.'"/>
                                                       </xsl:if>-->
                                                       <xsl:element name="technical-rule" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                                           <xsl:copy-of select="../@fpi"/>
                                                           <xsl:copy-of select="../@name"/>
                                                           <xsl:copy-of select="../@planpro:quelle"/>
                                                           <xsl:element name="active-pattern" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                                               <xsl:apply-templates select="current()/../@*" mode="statement"/>
                                                               <xsl:apply-templates select="current()/../hsvrl:text" mode="statement"/>                                
                                                               <xsl:for-each select="current-group()">
                                                                   <xsl:for-each select="current()/descendant-or-self::hsvrl:fired-rule">
                                                                       <!-- regular expressions in xpath:
                                                                            ^ matches the start of an expression
                                                                            $ matches the end of an expression
                                                                            (..) saves a match for further re-use
                                                                            [..] matches a character group
                                                                            \d matches digits (0..9)
                                                                            \p{L} matches letters (a..zA..ZäöüÄÖÜß)
                                                                            \p{Z} matches seperators (_-     )
                                                                            \p{P} matches punctuation (.,)                    /seems not to work as expected, see "Aneinander gereihte Fahrstraße"
                                                                            . matches any non-line-end character
                                                                            ? quantifies to zero or one time
                                                                            + quantifies to one or more times
                                                                            * quantifies to zero or more times
                                                                            \d*\.?\d+,?\d* matches either integers (123) or decimals (12,345 or 12.345) or grouped decimals (1.234,56)
                                                                            lower-case(<string>) is needed to perform case-insensitive sorting
                                                                            fx:convert-number helps to convert digits with "wrong" decimal and grouping separators into "right" numbers
                                                                            $1 as third parameter in the replace function returns the saved match
                                                                       -->
                                                                       <xsl:sort select="lower-case(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s1'], '^([\p{L}\p{Z}\p{P}]+).*$', '$1'))" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s1'], '^[\p{L}\p{Z}\p{P}]+(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="current()/*/hsvrl:diagnostic-reference[@diagnostic='s1']" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s2'], '^(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="lower-case(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s2'], '^\d*\.?\d*,?\d*([\p{L}\p{Z}\p{P}]+).*$', '$1'))" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s2'], '^\d*\.?\d*,?\d*[\p{L}\p{Z}\p{P}]+(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="lower-case(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s2'], '^\d*\.?\d*,?\d*[\p{L}\p{Z}\p{P}]+\d*\.?\d+,?\d*([\p{L}\p{Z}\p{P}]+).*$', '$1'))" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s2'], '^\d*\.?\d*,?\d*[\p{L}\p{Z}\p{P}]+\d*\.?\d+,?\d*[\p{L}\p{Z}\p{P}]+(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="current()/*/hsvrl:diagnostic-reference[@diagnostic='s2']" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s3'], '^(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="lower-case(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s3'], '^\d*\.?\d*,?\d*([\p{L}\p{Z}]+).*$', '$1'))" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s3'], '^\d*\.?\d*,?\d*[\p{L}\p{Z}]+(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="lower-case(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s3'], '^\d*\.?\d*,?\d*[\p{L}\p{Z}]+\d*\.?\d+,?\d*([\p{L}\p{Z}]+).*$', '$1'))" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s3'], '^\d*\.?\d*,?\d*[\p{L}\p{Z}]+\d*\.?\d+,?\d*[\p{L}\p{Z}]+(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="current()/*/hsvrl:diagnostic-reference[@diagnostic='s3']" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s4'], '^(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="lower-case(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s4'], '^\d*\.?\d*,?\d*([\p{L}\p{Z}]+).*$', '$1'))" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s4'], '^\d*\.?\d*,?\d*[\p{L}\p{Z}]+(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="lower-case(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s4'], '^\d*\.?\d*,?\d*[\p{L}\p{Z}]+\d*\.?\d+,?\d*([\p{L}\p{Z}]+).*$', '$1'))" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s4'], '^\d*\.?\d*,?\d*[\p{L}\p{Z}]+\d*\.?\d+,?\d*[\p{L}\p{Z}]+(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="current()/*/hsvrl:diagnostic-reference[@diagnostic='s4']" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s5'], '^(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="lower-case(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s5'], '^\d*\.?\d*,?\d*([\p{L}\p{Z}]+).*$', '$1'))" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s5'], '^\d*\.?\d*,?\d*[\p{L}\p{Z}]+(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="lower-case(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s5'], '^\d*\.?\d*,?\d*[\p{L}\p{Z}]+\d*\.?\d+,?\d*([\p{L}\p{Z}]+).*$', '$1'))" data-type="text"/>
                                                                       <xsl:sort select="fx:convert-number(replace(current()/*/hsvrl:diagnostic-reference[@diagnostic='s5'], '^\d*\.?\d*,?\d*[\p{L}\p{Z}]+\d*\.?\d+,?\d*[\p{L}\p{Z}]+(\d*\.?\d+,?\d*).*$', '$1'))" data-type="number"/>
                                                                       <xsl:sort select="current()/*/hsvrl:diagnostic-reference[@diagnostic='s5']" data-type="text"/>
                                                                       <xsl:apply-templates select="current()" mode="statement"/>                                
                                                                   </xsl:for-each>
                                                               </xsl:for-each>

                                                           </xsl:element>
                                                       </xsl:element>
                                                   </xsl:for-each-group>
                                               </xsl:element>
                                           </xsl:element>
                                       </xsl:for-each-group>
                                   </xsl:element>
                                </xsl:element>
                            </xsl:for-each-group>
                        
                            </xsl:element>
                        </xsl:element>
                    </xsl:for-each-group>
                </xsl:if>
            </xsl:element>
            
            <!-- "positive-checked" contains all patterns/rules which were checked but without any failed-assert or successful-report
                 they are correct -->
            <xsl:element name="successes" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                <xsl:if test="descendant::hsvrl:fired-rule[not(*)][not(@flag)]">
                    <xsl:element name="severities" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                        <!-- Group active-pattern elements according a descendant @role attribute value -->
                        <xsl:for-each-group select="hsvrl:active-pattern[hsvrl:fired-rule[not(*)][not(@flag)]]"
                            group-by="upper-case((hsvrl:fired-rule[not(*)][not(@flag)]/@role)[1])">
                            <xsl:sort select="index-of($inverse-schweregrad-prioritaeten, current-grouping-key())" order="descending"/>
                            <xsl:sort order="ascending"/>
                            <xsl:element name="severity" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                <xsl:copy-of select="(hsvrl:fired-rule[not(*)][not(@flag)]/@role)[1]"/>
                                <xsl:attribute name="only-success" 
                                    select="if (current-group()[not(hsvrl:fired-rule[not(@flag)]/*)]) then true() else false()"/>

                                <xsl:element name="workpackages" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                    <!-- Group active-pattern elements according its @planpro:arbeitspaket attribute values -->
                                    <xsl:for-each-group select="current-group()" group-by="upper-case(@planpro:arbeitspaket)">
                                        <xsl:sort select="current-grouping-key()" order="ascending"/>
                                        <xsl:element name="workpackage" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                            <xsl:copy-of select="@planpro:arbeitspaket"/>
                                            <xsl:attribute name="only-success" 
                                                select="if (current-group()[not(hsvrl:fired-rule[not(@flag)]/*)]) then true() else false()"/>
                                            
                                            <xsl:element name="technical-rules" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                                <!-- Group active-pattern elements according its @fpi attribute values -->
                                                <xsl:for-each-group select="current-group()" group-by="upper-case(@fpi)">
                                                    <xsl:sort order="ascending"/>
                                                    <xsl:element name="technical-rule" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                                        <xsl:copy-of select="@fpi"/>
                                                        <xsl:copy-of select="@name"/>
                                                        <xsl:copy-of select="@planpro:quelle"/>
                                                        <xsl:attribute name="only-success" 
                                                            select="if (current-group()[not(hsvrl:fired-rule[not(@flag)]/*)]) then true() else false()"/>
                                                        
                                                        <xsl:for-each select="current-group()">
                                                            <xsl:apply-templates select="current()" mode="success"/>                                
                                                        </xsl:for-each>
                                                    </xsl:element>
                                                </xsl:for-each-group>
                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:for-each-group>
                                </xsl:element>
                                
                            </xsl:element>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:if>
            </xsl:element>
            
            <!-- "incomplete" contains all patterns/rules which fired an failed-assert or successful-report with flag='incomplete' -->
            <xsl:element name="incomplete" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                <xsl:if test="current()/descendant::hsvrl:fired-rule[@flag = 'incomplete']/*">
                    
                    <xsl:for-each-group select="hsvrl:active-pattern/hsvrl:fired-rule[@flag = 'incomplete'][*]"
                        group-by="current()/descendant::hsvrl:diagnostic-reference[@diagnostic = 'bereich']/tokenize(text(), ' ')">
                        <xsl:sort select="current-grouping-key()" order="descending"/>
                        <xsl:variable name="current-scope" select="current-grouping-key()" as="xs:string"/>
                        <xsl:element name="scope" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                            <xsl:attribute name="zuordnung" select="$current-scope"/>
                            <xsl:attribute name="only-incomplete" 
                                select="if (current-group()/..[not(hsvrl:fired-rule[not(@flag)]
                                [*/hsvrl:diagnostic-reference[@diagnostic = 'bereich']/text() = $current-scope])]
                                [not(hsvrl:fired-rule[not(*)][not(@flag)]) or
                                (hsvrl:fired-rule[not(*)][not(@flag)] and
                                hsvrl:fired-rule[not(@flag)][*/hsvrl:diagnostic-reference[@diagnostic = 'bereich']/text() != $current-scope])]) then true() else false()"/>
                            
                            <xsl:element name="severities" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                <!-- Group active-pattern elements according a descendant @role attribute value -->
                                <xsl:for-each-group select="current-group()"
                                    group-by="upper-case((./@role)[1])">
                                    <xsl:sort select="index-of($inverse-schweregrad-prioritaeten, current-grouping-key())" order="descending"/>
                                    <xsl:sort order="ascending"/>
                                    <xsl:element name="severity" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                        <xsl:copy-of select="(./@role)[1]"/>
                                        <xsl:attribute name="only-incomplete" 
                                            select="if (current-group()/..[not(hsvrl:fired-rule[not(@flag)]
                                            [*/hsvrl:diagnostic-reference[@diagnostic = 'bereich']/text() = $current-scope])]
                                            [not(hsvrl:fired-rule[not(*)][not(@flag)]) or
                                            (hsvrl:fired-rule[not(*)][not(@flag)] and
                                            hsvrl:fired-rule[not(@flag)][*/hsvrl:diagnostic-reference[@diagnostic = 'bereich']/text() != $current-scope])]) then true() else false()"/>
                            
                                        <xsl:element name="workpackages" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                        <!-- Group active-pattern elements according to its @planpro:arbeitspaket attribute values or
                                       translate in case of "BASISOBJEKTE"-->
                                            <xsl:for-each-group select="current-group()" group-by="upper-case(fx:desired-workpackage(.))">
                                                <xsl:sort select="current-grouping-key()" order="ascending"/>
                                                <xsl:element name="workpackage" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                                    <xsl:attribute name="planpro:arbeitspaket" select="fx:desired-workpackage(.)"/>
                                                    <xsl:attribute name="only-incomplete" 
                                                        select="if (current-group()/..[not(hsvrl:fired-rule[not(@flag)]
                                                        [*/hsvrl:diagnostic-reference[@diagnostic = 'bereich']/text() = $current-scope])]
                                                        [not(hsvrl:fired-rule[not(*)][not(@flag)]) or
                                                        (hsvrl:fired-rule[not(*)][not(@flag)] and
                                                        hsvrl:fired-rule[not(@flag)][*/hsvrl:diagnostic-reference[@diagnostic = 'bereich']/text() != $current-scope])]) then true() else false()"/>
                                                    
                                                    <xsl:element name="technical-rules" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                                        <!-- Group active-pattern elements according its @fpi attribute values -->
                                                        <xsl:for-each-group select="current-group()" group-by="upper-case(../@fpi)">
                                                            <xsl:sort order="ascending"/>
                                                            <!--                                                       <xsl:if test="count(current-group()) > 1">
                                                           <xsl:message select="'Achtung! Es existiert mehr als eine Regel mit der GUID:', current-grouping-key(), ' &#xA;', 
                                                               'Dadurch wird das PDF (im FOP-Prozess) fehlerhaft erstellt.'"/>
                                                       </xsl:if>-->
                                                            <xsl:element name="technical-rule" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                                                <xsl:copy-of select="../@fpi"/>
                                                                <xsl:copy-of select="../@name"/>
                                                                <xsl:copy-of select="../@planpro:quelle"/>
                                                                <xsl:attribute name="only-incomplete" 
                                                                    select="if (current-group()/..[not(hsvrl:fired-rule[not(@flag)]
                                                                    [*/hsvrl:diagnostic-reference[@diagnostic = 'bereich']/text() = $current-scope])]
                                                                    [not(hsvrl:fired-rule[not(*)][not(@flag)]) or
                                                                    (hsvrl:fired-rule[not(*)][not(@flag)] and
                                                                    hsvrl:fired-rule[not(@flag)][*/hsvrl:diagnostic-reference[@diagnostic = 'bereich']/text() != $current-scope])])
                                                                    then true() else false()"/>
                                                                
                                                                <xsl:element name="active-pattern" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                                                    <xsl:apply-templates select="current()/../@*" mode="statement"/>
                                                                    <xsl:apply-templates select="current()/../hsvrl:text" mode="statement"/>                                
                                                                    <xsl:for-each select="current-group()">
                                                                        <xsl:for-each select="current()/descendant-or-self::hsvrl:fired-rule">
                                                                            <!-- sorting for headings ommitted for first trial,
                                                                                shall be included, when uncomplete statements will be promted in the report in all detail,
                                                                                meaning with a specific heading -->
                                                                            <xsl:apply-templates select="current()" mode="statement"/>                                
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                    
                                                                </xsl:element>
                                                            </xsl:element>
                                                        </xsl:for-each-group>
                                                    </xsl:element>
                                                </xsl:element>
                                            </xsl:for-each-group>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:for-each-group>
                            </xsl:element>
                        </xsl:element>
                    </xsl:for-each-group>
                </xsl:if>
            </xsl:element>
            
            <!-- "ignored" contains all patterns/rules which were not checked in the current file because of missing XML elements for matching the rule context -->
            <xsl:element name="ignored" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                <xsl:if test="hsvrl:active-pattern[not(descendant::hsvrl:fired-rule)]">
                    <xsl:element name="workpackages" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                        <!-- Group active-pattern elements according its @planpro:arbeitspaket attribute values -->
                        <xsl:for-each-group select="hsvrl:active-pattern[not(descendant::hsvrl:fired-rule)]"
                            group-by="upper-case(@planpro:arbeitspaket)">
                            <xsl:sort select="current-grouping-key()" order="ascending"/>
                            <xsl:element name="workpackage" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                <xsl:copy-of select="@planpro:arbeitspaket"/>
                                
                                <xsl:element name="technical-rules" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                    <!-- Group active-pattern elements according its @fpi attribute values -->
                                    <xsl:for-each-group select="current-group()" group-by="upper-case(@fpi)">
                                        <xsl:sort order="ascending"/>
                                        <xsl:element name="technical-rule" namespace="http://tu-dresden.de/vlp/schematron/grouped-svrl">
                                            <xsl:copy-of select="@fpi"/>
                                            <xsl:copy-of select="@name"/>
                                            <xsl:copy-of select="@planpro:quelle"/>
                                            <xsl:for-each select="current-group()">
                                                <xsl:apply-templates select="current()" mode="#current"/>                                
                                            </xsl:for-each>
                                        </xsl:element>
                                    </xsl:for-each-group>
                                </xsl:element>
                            </xsl:element>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:if>
            </xsl:element>
            
            
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>