<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" fpi="E4E85B7D-7FAD-439d-AE05-9A0F79F4BCB3" see="Fahrstrasse_ID278" id="ID278" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Definition Vorzugs-DWeg einmalig je Fahrweg</iso:title>
    <iso:p>
      <planpro:description>
      	Wird ein Fahrweg als befahrenener Teil von Zugstraßen mit DWeg genutzt, muss in genau einer dieser Zugstraßen
      	ein Vorzugs-DWeg definiert sein. Die Bedingung gilt auch, wenn nur eine Zugstraße mit DWeg für diesen Fahrweg existiert.
      	
      	Bei allen Fstr_Zug_Rangier mit Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_DWeg mit 
      	Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_DWeg.ID_Fstr_DWeg → Fstr_DWeg.Fstr_DWeg_Spezifisch und gleichem 
      	Fstr_Zug_Rangier.ID_Fstr_Fahrweg muss genau einmal Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_DWeg.DWeg_Vorzug == "true"
      	gesetzt sein.
      </planpro:description>
      <planpro:comment/>
      <planpro:test>
        <planpro:success>
        	Für den Fahrweg gibt es genau eine Zugstraße, in der ein Vorzugs-DWeg definiert ist.
		</planpro:success>
        <planpro:error>
        	Für den Fahrweg gibt es keine oder mehrere Fahrstraßen, in denen ein Vorzugs-DWeg definiert ist. Es muss jedoch genau einen Vorzugs-DWeg geben. 
		</planpro:error>
      </planpro:test>
      <planpro:output>
      	Fstr_Fahrweg mit Liste zugehöriger Fstr_Zug_Rangier und jeweiligem Wert DWeg_Vorzug [ja/nein]
      </planpro:output>
    </iso:p>
	<iso:rule role="error" context="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-278(current(), parent::*)]">
		<iso:let name="Fstr_Zug_Rangier" value="key('Fstr_Zug_Rangier-fuerFstr_Fahrweg', Identitaet/Wert, parent::*)"/>
		<iso:let name="Fstr_Zug_Rangier_Vorzug" value="$Fstr_Zug_Rangier[Fstr_Zug/Fstr_Zug_DWeg/DWeg_Vorzug/Wert = 'true']"/>
		<iso:let name="Fstr_Zug_Rangier_keinVorzug" value="$Fstr_Zug_Rangier[not(Fstr_Zug/Fstr_Zug_DWeg/DWeg_Vorzug/Wert = 'true')]"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="count($Fstr_Zug_Rangier_Vorzug) = 1">Für den Fahrweg gibt es keine oder mehrere Fahrstraßen, in denen ein Vorzugs-DWeg definiert ist. Es muss jedoch genau einen Vorzugs-DWeg geben.
			<xsl:if test="$Fstr_Zug_Rangier_Vorzug">
				Für folgende Fahrstraßen des Fahrwegs ist ein Vorzugs-DWeg definiert:
				<xsl:value-of select="$Fstr_Zug_Rangier_Vorzug/Identitaet/Wert" separator=" / "/>.
			</xsl:if>			
			<xsl:if test="$Fstr_Zug_Rangier_keinVorzug">
				Für folgende Fahrstraßen des Fahrwegs ist kein Vorzugs-DWeg definiert:
				<xsl:value-of select="$Fstr_Zug_Rangier_keinVorzug/Identitaet/Wert" separator=" / "/>.
			</xsl:if></iso:assert>	
	</iso:rule>
</iso:pattern>