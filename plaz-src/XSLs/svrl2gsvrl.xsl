<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:import href="HierarchicalSVRL.xsl"/>
    <xsl:import href="GroupedSVRL.xsl"/>
    
    <xsl:output omit-xml-declaration="no" method="xml" indent="yes" encoding="UTF-8"/>
    
    <xsl:variable name="strukt-svrl">
        <xsl:apply-templates mode="restructure"/>
    </xsl:variable>
    
    <xsl:template match="/">
        <!-- Shadows GroupedSVRL.xsl root template; applies group to hsvrl:, not raw SVRL -->
        <xsl:apply-templates select="$strukt-svrl" mode="group"/>
    </xsl:template>

</xsl:stylesheet>