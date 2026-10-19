<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Copyright 2024-2026 TU Dresden, Fakultät Verkehrswissenschaften "Friedrich List", Professur für Verkehrsprozessautomatisierung (VPA)
    Susanne Wunsch {vpa | susanne.wunsch}<at>tu-dresden<dot>de
    
    Unless required by applicable law or agreed to in writing, software distributed under the software is distributed on an "AS IS" basis,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    
    The software is developed for DB InfraGO and may be used by the costumer without any restrictions.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:fx="http://tu-dresden.de/vlp/schematron/functions"
    xmlns:gsvrl="http://tu-dresden.de/vlp/schematron/grouped-svrl"
    xmlns:planpro="http://www.plan-pro.org/regeln/struktur"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="fx gsvrl planpro xs xsl"
    xpath-default-namespace="http://www.w3.org/1999/xhtml" version="2.0">

    <xsl:include href="svrl2any-base.xsl"/>

    <xsl:output method="xhtml" omit-xml-declaration="yes" indent="no" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <xsl:call-template name="general-html-settings"/>
                <title>
                    <xsl:value-of select="$plaz-titel"/>
                </title>
            </head>
            <body>
                <xsl:call-template name="Titelseite-setzen"/>
                <xsl:if test="$detailliertes-dokument and ($error-detected or $count-success > 0)">
                    <xsl:call-template name="Inhalt-setzen"/>
                </xsl:if>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="general-html-settings">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" type="text/css" href="JS/css/main.css" />
		<link rel="stylesheet" href="JS/SOL/sol3.css" />
		<link rel="stylesheet" href="JS/font-awesome-4.6.1/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="JS/DataTables-2.3.1/css/datatables.min.css" />
		<script type="text/javascript" src="JS/jQuery/jquery-3.7.1.slim.min.js"></script>
		<script type="text/javascript" src="JS/SOL/sol3.js"></script>
		<script type="text/javascript" src="JS/DataTables-2.3.1/js/datatables.min.js"></script>
        <script type="text/javascript" src="JS/main.js"/>
        <script type="text/javascript">
            <xsl:text disable-output-escaping="yes"><![CDATA[var export_filename = 'PlaZ-Teilexport-'+']]></xsl:text>
            <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                <xsl:with-param name="inhalt" tunnel="yes" select="$planpro-dateiname"/>
            </xsl:apply-templates>
            <xsl:text disable-output-escaping="yes"><![CDATA[';]]></xsl:text>
        </script>
    </xsl:template>

    <xsl:template name="Titelseite-setzen">
        <div id="head">
            <div class="rightFixed">
                <img src="{$logo-path}" alt="DB-Netze" style="padding-right:10px;" width="168pt"
                    height="40pt"/>
            </div>
            <div style="vertical-align:bottom;line-height:30pt;">
                <xsl:value-of select="$plaz-erzeugung"/>
            </div>

            <hr/>
			
			<div class="dt-buttons">
				<button id="kopfButton" class="dt-button" style="right:10px; position: absolute;"
					onclick="showOrHide('fileInfo');">Kopf einklappen</button>
			</div>
			
            <div style="font-weight:bold; font-size:x-large;">
                <xsl:value-of select="$plaz-titel"/>
            </div>

            <div style="margin-bottom:1em;"> &#169; DB InfraGO AG </div>

            <div id="fileInfo">
                <div style="margin-bottom:1ex; margin-right:2em;font-size:large;float:left;">
                    <b>Angaben zur PlanPro-Datei</b>
                    <table>
                        <tbody>
                            <tr>
                                <td>PlanPro-Modell:</td>
                                <td>
                                    <xsl:apply-templates mode="missing-or-content" select="node()">
                                        <xsl:with-param name="inhalt" tunnel="yes"
                                            select="$planpro-version"/>
                                    </xsl:apply-templates>
                                </td>
                            </tr>
                            <xsl:if test="$signalbegriffe-version != ''">
                                <tr>
                                    <td>PlanPro-Signalbegriffe:</td>
                                    <td>
                                        <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                            <xsl:with-param name="inhalt" tunnel="yes"
                                                select="$signalbegriffe-version"/>
                                        </xsl:apply-templates>
                                    </td>
                                </tr>
                            </xsl:if>                            
                            <tr>
                                <td>Dateiname:</td>
                                <td>
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes"
                                            select="$planpro-dateiname"/>
                                    </xsl:apply-templates>
                                </td>
                            </tr>
                            <tr>
                                <td>letzte Änderung:</td>
                                <td>
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes"
                                            select="fx:format-date-time($file-changed-stamp)"/>
                                    </xsl:apply-templates>
                                </td>
                            </tr>
                            <tr>
                                <td>md5:</td>
                                <td>
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes"
                                            select="$md5"/>
                                    </xsl:apply-templates>
                                </td>
                            </tr>
                            <tr>
                                <td>GUID:</td>
                                <td>
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes"
                                            select="$datei-guid"/>
                                    </xsl:apply-templates>
                                </td>
                            </tr>
                            <tr>
                                <td>Validierung gegen XSD:</td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="$schema-valid">
                                            <xsl:apply-templates mode="missing-or-content"
                                                select="node()[1]">
                                                <xsl:with-param name="inhalt" tunnel="yes"
                                                  select="fx:translate-schema-valid()"/>
                                            </xsl:apply-templates>

                                        </xsl:when>
                                        <xsl:otherwise>
                                            <font color="red">
                                                <xsl:apply-templates mode="missing-or-content"
                                                    select="node()[1]">
                                                  <xsl:with-param name="inhalt" tunnel="yes"
                                                  select="fx:translate-schema-valid()"/>
                                                </xsl:apply-templates>
                                            </font>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                            <tr>
                                <td>Planungsprojekt:</td>
                                <td>
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes"
                                            select="$planungsprojekt"/>
                                    </xsl:apply-templates>
                                </td>
                            </tr>
                            <tr>
                                <td>Planungsgruppe:</td>
                                <td>
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes"
                                            select="$planungsgruppe"/>
                                    </xsl:apply-templates>
                                </td>
                            </tr>
                            <tr>
                                <td>Einzelplanung:</td>
                                <td>
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes"
                                            select="$einzelplanung"/>
                                    </xsl:apply-templates>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div style="font-size:large;float:center;">
                    <b>Angaben zu den PlaZ-Regeln</b>
                    <table>
                        <tbody>
                            <tr>
                                <td>Ausgabestand:</td>
                                <td>
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes"
                                            select="fx:format-date($dateOfDelivery)"/>
                                    </xsl:apply-templates>
                                </td>
                            </tr>
                            <tr>
                                <td>PlanPro-Modell:</td>
                                <td>
                                    <xsl:apply-templates mode="missing-or-content" select="node()[1]">
                                        <xsl:with-param name="inhalt" tunnel="yes"
                                            select="$plaz-planpro-versions"/>
                                    </xsl:apply-templates>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <b>Feststellungen</b>
                    <table>
                        <tbody>
                            <tr>
                                <td>Anzahl Feststellungen:</td>
                                <td align="left">
                                    <xsl:value-of select="$count-all-statements"/>
                                </td>
                            </tr>
                            <xsl:if test="$count-success > 0">
                                <tr>
                                    <td>
                                        <img src="Pictures/Icon_Okay.svg" alt="ok" height="10pt"/>
                                        davon Erfolg: </td>
                                    <td align="left">
                                        <xsl:value-of select="$count-success"/>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="$error-detected">
                                <tr>
                                    <td>
                                        <xsl:if test="$grouped-svrl//gsvrl:problems/gsvrl:scope[@zuordnung = ('Planung', 'Betrachtung')]">
                                            <b style="padding-right:2em;">... im Planungsbereich</b>
                                            <br/>
                                        </xsl:if>
                                        <table>
                                            <tbody>
                                                <xsl:call-template name="Feststellungen-setzen">
                                                    <xsl:with-param name="current-scope" select="$grouped-svrl//gsvrl:problems/gsvrl:scope[@zuordnung = ('Planung', 'Zustand')]"/>
                                                </xsl:call-template>
                                            </tbody>
                                        </table>
                                    </td>
                                    <xsl:if test="$grouped-svrl//gsvrl:problems/gsvrl:scope[@zuordnung = ('Planung', 'Betrachtung')]">
                                        <td>
                                            <b style="padding-right:2em;">... im Betrachtungsbereich</b>
                                            <br/>
                                            <table>
                                                <tbody>
                                                    <xsl:call-template name="Feststellungen-setzen">
                                                        <xsl:with-param name="current-scope" select="$grouped-svrl//gsvrl:problems/gsvrl:scope[@zuordnung = ('Betrachtung')]"/>
                                                    </xsl:call-template>
                                                </tbody>
                                            </table>
                                        </td>
                                    </xsl:if>
                                </tr>
                            </xsl:if>
                        </tbody>
                    </table>
                </div>
            </div>

            <hr style="clear:left"/>
        </div>
    </xsl:template>
    
    <xsl:template name="Feststellungen-setzen">
        <xsl:param name="current-scope" as="node()?"/>
        
        <xsl:for-each select="$inverse-schweregrad-prioritaeten">
            <xsl:sort select="position()" order="descending"/>
            <xsl:variable name="schweregrad-icon-path" as="xs:string" select="fx:select-schweregrad-icon(current())"/>
            <xsl:variable name="current-severity" as="node()?"
                select="$current-scope/descendant::gsvrl:severity[upper-case(@role) = current()]"/>
                <tr>
                    <td>
                        <xsl:if test="string-length($schweregrad-icon-path) > 0">
                            <img src="{$schweregrad-icon-path}" alt="image" style="height:1ex; width:1ex;"/>
                        </xsl:if> davon <xsl:value-of select="fx:translate-schweregrad(current())"/>: </td>
                    <td align="right"> <xsl:value-of select="if ($current-severity) then count($current-severity/descendant::gsvrl:fired-rule) else 0"/> </td>
                </tr>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="Inhalt-setzen">
        <xsl:variable name="bereich-setzen" select="$grouped-svrl//gsvrl:problems/gsvrl:scope/@zuordnung = ('Betrachtung', 'Planung')" as="xs:boolean"/>
        <xsl:variable name="headings" as="xs:string*">
            <xsl:if test="$bereich-setzen">
                <xsl:value-of select="'Bereich'"/>    
            </xsl:if>
            <xsl:value-of select="'Typ'"/>
            <xsl:value-of select="'Arbeitspaket'"/>
            <xsl:value-of select="'Regel-Bezeichnung'"/>
            <xsl:value-of select="'Regel-GUID'"/>
            <xsl:value-of select="'Quelle'"/>
            <xsl:value-of select="'Objekttyp'"/>
            <xsl:value-of select="'Objekt-Bezeichnung'"/>
            <xsl:value-of select="'Objekt-GUID'"/>
            <xsl:value-of select="'Beschreibung'"/>
        </xsl:variable>
        
        <table class="display" cellspacing="0" width="100%">
            <thead>
                <xsl:call-template name="generate-table-header">
                    <xsl:with-param name="listed-headings" select="$headings"/>
                </xsl:call-template>
            </thead>
            <tfoot>
                <xsl:call-template name="generate-table-header">
                    <xsl:with-param name="listed-headings" select="$headings"/>
                </xsl:call-template>
            </tfoot>
            <tbody>
                <xsl:for-each select="$grouped-svrl//gsvrl:problems/gsvrl:scope">                    
                    <xsl:for-each select="current()/*/gsvrl:severity">
                        <xsl:for-each select="current()/*/gsvrl:workpackage">
                            <xsl:for-each select="current()/*/gsvrl:technical-rule">
                                <xsl:for-each
                                    select="descendant::gsvrl:failed-assert | descendant::gsvrl:successful-report">
                                    <tr>
                                        <td/>
                                        <!--<xsl:variable name="schweregrad-icon-path" as="xs:string"
                                            select="fx:select-schweregrad-icon(ancestor::gsvrl:severity/@role)"/>-->
                                        <xsl:if test="$bereich-setzen">
                                            <td>
                                                <xsl:apply-templates mode="missing-or-content"
                                                    select="node()[1]">
                                                    <xsl:with-param name="inhalt"
                                                        select="gsvrl:diagnostic-reference[@diagnostic = 'bereich']"
                                                        tunnel="yes"/>
                                                </xsl:apply-templates>
                                            </td>
                                        </xsl:if>
                                        <td>
                                            <!--<xsl:if test="string-length($schweregrad-icon-path) > 0">
                                                <img src="{$schweregrad-icon-path}"
                                                    alt="image" height="10pt"/>
                                            </xsl:if>-->
                                            <xsl:value-of
                                                select="fx:translate-schweregrad(ancestor::gsvrl:severity/@role)"
                                            />
                                        </td>
                                        <td>
                                            <xsl:variable name="ReturnValue">
                                                <xsl:apply-templates mode="missing-or-content"
                                                    select="node()[1]">
                                                    <xsl:with-param name="inhalt" tunnel="yes"
                                                      select="ancestor::gsvrl:workpackage/@planpro:arbeitspaket"
                                                    />
                                                </xsl:apply-templates>
                                            </xsl:variable>
                                            <xsl:value-of
                                                select="replace($ReturnValue, '_', '_&#8203;')"/>
                                        </td>
                                        <td>
                                            <xsl:apply-templates mode="missing-or-content"
                                                select="node()[1]">
                                                <xsl:with-param name="inhalt" tunnel="yes"
                                                    select="ancestor::gsvrl:technical-rule/@name"/>
                                            </xsl:apply-templates>
                                        </td>
                                        <td>
                                            <xsl:apply-templates mode="missing-or-content"
                                                select="node()[1]">
                                                <xsl:with-param name="inhalt" tunnel="yes"
                                                    select="ancestor::gsvrl:technical-rule/@fpi"/>
                                            </xsl:apply-templates>
                                        </td>
                                        <td>
                                            <xsl:apply-templates mode="missing-or-content"
                                                select="node()[1]">
                                                <xsl:with-param name="inhalt" tunnel="yes"
                                                    select="@planpro:quelle"/>
                                            </xsl:apply-templates>
                                        </td>
                                        <td>
                                            <xsl:apply-templates mode="missing-or-content"
                                                select="node()[1]">
                                                <xsl:with-param name="inhalt"
                                                    select="gsvrl:diagnostic-reference[@diagnostic = 'typ']"
                                                    tunnel="yes"/>
                                            </xsl:apply-templates>
                                        </td>
                                        <td>
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
                                            <!--
                                             <xsl:call-template name="missing-or-content"><xsl:with-param name="inhalt" select="gsvrl:diagnostic-reference[@diagnostic = 'objektbezeichnung']" tunnel="yes"/>-->
                                        </td>
                                        <td>
                                            <xsl:apply-templates mode="missing-or-content"
                                                select="node()[1]">
                                                <xsl:with-param name="inhalt"
                                                    select="gsvrl:diagnostic-reference[@diagnostic = 'guid']"
                                                    tunnel="yes"/>
                                            </xsl:apply-templates>
                                        </td>
                                        <td style="text-align: justify;">
                                            <xsl:apply-templates mode="missing-or-content"
                                                select="node()[1]">
                                                <xsl:with-param name="inhalt" select="gsvrl:text"
                                                    tunnel="yes"/>
                                            </xsl:apply-templates>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            </tbody>
        </table>
        <nav class="sidebar sidebar-menu-collapsed">
            <ul class="level1" style="float:left;">
                <li>
                    <a class="expandable" href="#" title="Suche" id="expandablediv1">
                        <i class="collapsed-element fa fa-search" aria-hidden="true"/>
                        <span class="expanded-element"/>
                    </a>
                </li>
                <li>
                    <a class="expandable" href="#" title="Filter" id="expandablediv2">
                        <i class="collapsed-element fa fa-filter" aria-hidden="true"/>
                        <span class="expanded-element"/>
                    </a>
                </li>
                <li>
                    <a class="expandable" href="#" title="Spalten" id="expandablediv3">
                        <i class="collapsed-element fa fa-eye-slash" aria-hidden="true"/>
                        <span class="expanded-element"/>
                    </a>
                </li>
                <li>
                    <a class="expandable" href="#" title="Export" id="expandablediv4">
                        <i class="collapsed-element fa fa-download" aria-hidden="true"/>
                        <span class="expanded-element"/>
                    </a>
                </li>
            </ul>
        </nav>
        <div id="expandablediv1" class="sidebar-menu-collapsed sidebar-content">
            <div class="tableDiv">
                <xsl:call-template name="closeButton"/>
                <div class="expandableRightContent">
                    <p>Suchen Sie nach Begriffen in allen Zellen der Tabelle. Es werden alle Spalten
                        zurückgegeben, die sämtliche Ihrer Suchbegriffe enthalten.</p>
                    <input type="search" style="width:21.4em; color:black;" id="searchInput"
                        placeholder="Zum Suchen hier klicken"/>
                    <p style="margin-top:10px;">Entfernen Sie unmarkierte Zeilen um die Datenmenge
                        zu verringern.</p>
					<div class="dt-buttons">
						<button class="dt-button button" type="button" id="filterRowsOn" width="10em">Filtere Zeilen</button>
						<button class="dt-button button" type="button" id="filterRowsOff" width="10em">Alle Zeilen</button>
					</div>
                </div>
            </div>
        </div>
        <div id="expandablediv2" class="sidebar-menu-collapsed sidebar-content">
            <div class="tableDiv">
                <xsl:call-template name="closeButton"/>
                <div class="expandableRightContent">
					<div style="width: 100%" class="dt-buttons" id="clearAllFilterDiv">
						<button style="width: 100%;" id="clearAllFilter" class="dt-button btn margin">
							<span>Entferne alle Filter </span>
						</button>
					</div>
                    <div id="filteringSOL" style="height:100%">
                        <xsl:call-template name="generate-filter-entries">
                            <xsl:with-param name="listed-headings" as="xs:string*" select="$headings"/>
                        </xsl:call-template>
                    </div>
                </div>
            </div>
        </div>
        <div id="expandablediv3" class="sidebar-menu-collapsed sidebar-content">
            <div class="tableDiv">
                <xsl:call-template name="closeButton"/>
                <div class="expandableRightContent">
                    <p>Blenden Sie Tabellenspalten aus, um sich einen Überblick zu beschaffen.
                        Blenden Sie sie für zusätzliche Informationen wieder ein. </p>
                    <div id="filteringButtons">
                        <xsl:call-template name="generate-visibility-entries">
                            <xsl:with-param name="listed-headings" as="xs:string*" select="$headings"/>
                        </xsl:call-template>
                    </div>
                    <div style="width: 75%; padding-top:1em;" class="dt-buttons" id="showAllColsDiv">
                        <button style="width: 100%;" id="showAllCols" class="dt-button btn margin">
                            <span>zeige alle Spalten</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div id="expandablediv4" class="sidebar-menu-collapsed sidebar-content">
            <div class="tableDiv">
                <xsl:call-template name="closeButton"/>
                <div class="expandableRightContent">
                    <p>Exportieren Sie die vorkonfigurierte Tabelle für schnellen
                        Datenaustausch!</p>
                    <div class="copy-button" id="button1"/>
                    <div class="copy-button" id="button2"/>
                    <div class="copy-button" id="button3"/>
                    <div class="copy-button" id="button4"/>
                </div>
            </div>
        </div>
        <div class="status"/>
    </xsl:template>

    <xsl:template name="generate-table-header">
        <xsl:param name="listed-headings" as="xs:string*"/>
        <tr>
            <th/>
            <xsl:for-each select="$listed-headings">
                <th><xsl:value-of select="."/></th>
            </xsl:for-each>
        </tr>
    </xsl:template>

    <xsl:template name="closeButton">
        <!--<div class="sidebarClose" style="float:right;margin-right:0pt;">
            <a class="expandable sidebarClose" href="#" title="Schließen">
                <span class="fa fa-remove collapsed-element"></span>
            </a>
        </div>-->
        <div class="sidebarClose expandable"
            style="display: table-cell; width: 20px; border-right: 1pt solid;">
            <span style="position:absolute; top:50%;">&#x25BA;</span>
        </div>
    </xsl:template>

    <xsl:template name="generate-filter-entries">
        <xsl:param name="listed-headings" as="xs:string*"/>
        
        <xsl:for-each select="$listed-headings">
            <div id="selectDiv{position()}" style="min-height:8%">
                <b style="color:white;"><xsl:value-of select="current()"/></b>
                <select id="demonstration{position()}" name="character{position()}"
                    style="max-width:100%; min-width: 100px"
                    multiple="multiple"/>
            </div>
            <xsl:if test="position() != last()">
                <hr style="border-color:inherit;height:0px;margin: 10px 5px;"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="generate-visibility-entries">
        <xsl:param name="listed-headings" as="xs:string*"/>

        <xsl:for-each select="$listed-headings">
            <div style="width: 50%" class="dt-buttons" id="filterCol{position()}">
                <button style="width: 100%;" id="filterButton{position()}" data-toggle="tooltip" title="ein-/ausblenden"
                    data-column="{position()}" tabindex="{position()}"
                    class="dt-button btn buttons-columnVisibility active margin">
                    <span><xsl:value-of select="current()"/></span>
                </button>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="node()" mode="missing-or-content" priority="1">
        <xsl:param name="inhalt" as="xs:string?" tunnel="yes"/>
        <xsl:param name="markup" as="xs:boolean" required="no" select="true()"/>

        <!-- This template overloads the stub template in the same mode in 'svrl2any-base.xsl' through its higher priority -->

        <xsl:choose>
            <xsl:when test="string-length($inhalt) = 0">
                <i>
                    <xsl:value-of select="$notAvailable"/>
                </i>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space($inhalt)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
