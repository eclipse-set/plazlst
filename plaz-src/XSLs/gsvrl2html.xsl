<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:gsvrl="http://tu-dresden.de/vlp/schematron/grouped-svrl" version="2.0">
    
    <!-- 
    Copyright 2024-2026 TU Dresden, Fakultät Verkehrswissenschaften "Friedrich List", Professur für Verkehrsprozessautomatisierung (VPA)
    Susanne Wunsch {vpa | susanne.wunsch}<at>tu-dresden<dot>de
    
    Unless required by applicable law or agreed to in writing, software distributed under the software is distributed on an "AS IS" basis,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    
    The software is developed for DB InfraGO and may be used by the costumer without any restrictions.
-->

    <xsl:import href="svrl2html.xsl"/>
    
    <!-- Strip whitespace-only text nodes introduced by indent="yes"
         serialization in svrl2gsvrl.xsl into the GSVRL source document -->
    <xsl:strip-space elements="gsvrl:*"/>
    
    <!-- Shadow the variables from svrl2any-base.xsl that would process SVRL input -->
    <xsl:variable name="strukt-svrl" select="()"/>
    <xsl:variable name="grouped-svrl" select="/"/>
    
</xsl:stylesheet>