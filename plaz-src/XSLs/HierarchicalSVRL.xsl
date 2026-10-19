<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Copyright 2024-2026 TU Dresden, Fakultät Verkehrswissenschaften "Friedrich List", Professur für Verkehrsprozessautomatisierung (VPA)
    Susanne Wunsch {vpa | susanne.wunsch}<at>tu-dresden<dot>de
    
    Unless required by applicable law or agreed to in writing, software distributed under the software is distributed on an "AS IS" basis,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    
    The software is developed for DB InfraGo and may be used by the costumer without any restrictions.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
    xmlns:hsvrl="http://tu-dresden.de/vlp/schematron/hierarchical-svrl"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs svrl"
    version="2.0">
    
    <xsl:variable name="dateOfDelivery">2026-07-02</xsl:variable>    

    <xsl:output method="xml" indent="yes"/>
    
    <!-- The following templates in 'mode="restructure"' perform the restructuring process -->

    <xsl:template match="@*|comment()" mode="restructure">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|comment()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="svrl:*" mode="restructure">
        <xsl:element name="{local-name()}" namespace="http://tu-dresden.de/vlp/schematron/hierarchical-svrl">
            <xsl:apply-templates select="@*|comment()|node()" mode="#current"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*" mode="restructure">
        <xsl:element name="{name()}" namespace="{namespace-uri()}">
            <xsl:apply-templates select="@*|comment()|node()" mode="#current"/>
        </xsl:element>                
    </xsl:template>
    
    <xsl:template match="svrl:schematron-output" mode="restructure">
        <xsl:element name="{local-name()}" namespace="http://tu-dresden.de/vlp/schematron/hierarchical-svrl">
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:comment>
                This is a restructured SVRL document, which does not comply with ISO 19757-3 Annex D grammar!
            </xsl:comment>
            <xsl:apply-templates select="comment()" mode="#current"/>
            <xsl:apply-templates select="svrl:text" mode="#current"/>
            <xsl:apply-templates select="svrl:ns-prefix-in-attribute-values" mode="#current"/>
            <xsl:for-each-group select="svrl:active-pattern | svrl:active-pattern/following-sibling::*" 
                group-starting-with="svrl:active-pattern">
                <xsl:apply-templates select="current-group()" mode="restructure_active-pattern"/>
            </xsl:for-each-group>
        </xsl:element>
        <xsl:message select="'PlaZ LST Lieferung vom ', $dateOfDelivery"/>
    </xsl:template>
    
    <xsl:template match="*" mode="restructure_active-pattern">
        <xsl:if test="self::svrl:active-pattern">
            <xsl:element name="{local-name()}" namespace="http://tu-dresden.de/vlp/schematron/hierarchical-svrl">
                <xsl:apply-templates select="@* | comment() | *" mode="restructure"/>
                <xsl:for-each-group select="current-group() except current()"
                    group-starting-with="svrl:fired-rule">
                    <xsl:apply-templates select="current-group()" mode="restructure_fired-rule"/>
                </xsl:for-each-group>
            </xsl:element>            
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="*" mode="restructure_fired-rule">
        <xsl:if test="self::svrl:fired-rule">
            <xsl:element name="{local-name()}" namespace="http://tu-dresden.de/vlp/schematron/hierarchical-svrl">
                <xsl:apply-templates select="@* | comment()" mode="restructure"/>
                <xsl:apply-templates select="current-group() except current()" mode="restructure"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="svrl:fired-rule[@flag = 'ignore']" mode="restructure_fired-rule">
        <!-- Die nicht zu prüfenden Fälle, die in der Gruppe 'ignored' gelistet sind, sollen
             weder das HTML noch das PDF beeinflussen und können an dieser Stelle entfernt werden,
             um die Prozessierungszeit zu reduzieren -->
    </xsl:template>
    
    <xsl:template match="svrl:fired-rule[not(@role)]" mode="restructure_fired-rule" priority="-1">
        <!-- Die nicht zu prüfenden Fälle, die in der Gruppe 'ignored' gelistet sind, sollen
             weder das HTML noch das PDF beeinflussen und können an dieser Stelle entfernt werden,
             um die Prozessierungszeit zu reduzieren -->
    </xsl:template>
    
    <xsl:template match="svrl:failed-assert[preceding-sibling::*[1]/@flag = 'ignore']" mode="restructure" priority="2">
        <!-- Die nicht zu prüfenden Fälle, die in der Gruppe 'ignored' gelistet sind, sollen
             weder das HTML noch das PDF beeinflussen und können an dieser Stelle entfernt werden,
             um die Prozessierungszeit zu reduzieren -->
    </xsl:template>
    
    <xsl:template match="svrl:successful-report[preceding-sibling::*[1]/@flag = 'ignore']" mode="restructure" priority="2">
        <!-- Die nicht zu prüfenden Fälle, die in der Gruppe 'ignored' gelistet sind, sollen
             weder das HTML noch das PDF beeinflussen und können an dieser Stelle entfernt werden,
             um die Prozessierungszeit zu reduzieren -->
    </xsl:template>

</xsl:stylesheet>
