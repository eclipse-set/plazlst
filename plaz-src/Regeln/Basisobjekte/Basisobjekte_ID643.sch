<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" fpi="DB809CE8-DF83-4E2E-9D78-9D90F41BE868" see="Basisobjekte_ID643" id="ID643" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3">
	<iso:title>Kein Bearbeitungsvermerk bei ENUM-Wert ungleich "sonstige"</iso:title>
	<iso:p>
		<planpro:description>
			Wenn für ein ENUM-Attribut ein Bearbeitungsvermerk angefügt wurde, muss der ENUM-Wert == "sonstige" sein.
			
			Wenn Basis_Objekt.Attributname.ID_Bearbeitungsvermerk vorhanden, dann muss Basis_Objekt.Attributname.Wert
			= "sonstige" sein. 
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Für [das ENUM-Attribut/die ENUM-Attribute] "[Attributname]" wurde ein Bearbeitungsvermerk angefügt und 
				[der ENUM-Wert ist/die ENUM-Werte sind] "sonstige".			
			</planpro:success>
			<planpro:error>
				Für [das ENUM-Attribut/die ENUM-Attribute] "[Attributname]" wurde ein Bearbeitungsvermerk angefügt,
				[der ENUM-Wert ist/ die ENUM-Werte sind] jedoch ungleich "sonstige".
				Bitte entfernen Sie [den Bearbeitungsvermerk/die Bearbeitungsvermerke]!
			</planpro:error>
		</planpro:test>
		<planpro:output>Basis_Objekt</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Container[parent::LST_Zustand_Ziel | parent::LST_Zustand]/*[*/descendant::ID_Bearbeitungsvermerk]">
		<iso:let name="Attribut_ohne_sonstige" value="descendant::*[ID_Bearbeitungsvermerk][not(Wert = 'sonstige')]"/>
		<iso:let name="attr-count" value="if (count($Attribut_ohne_sonstige) = 1) then 'das ENUM-Attribut ' else 'die ENUM-Attribute '"/>
		<iso:let name="vermerk-count" value="if (count($Attribut_ohne_sonstige) = 1) then 'den Bearbeitungsvermerk' else 'die Bearbeitungsvermerke'"/>
		<iso:let name="werte-count" value="if (count($Attribut_ohne_sonstige) = 1) then 'der ENUM-Wert ist ' else 'die ENUM-Werte sind '"/>
		
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="not($Attribut_ohne_sonstige)">Für <iso:value-of select="$attr-count"/> <xsl:value-of select="for $i in $Attribut_ohne_sonstige return concat('&#34;', /local-name($i), '&#34;')" separator=", "/> wurde ein Bearbeitungsvermerk angefügt, <iso:value-of select="$werte-count"/> jedoch ungleich "sonstige". Bitte entfernen Sie <iso:value-of select="$vermerk-count"/>!</iso:assert>
  </iso:rule>
</iso:pattern>