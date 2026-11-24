<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" fpi="AED12B2D-7747-4966-9156-9F6161323325" see="Basisobjekte_ID642" id="ID642" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3">
	<iso:title>Bearbeitungsvermerk bei ENUM-Wert "sonstige"</iso:title>
	<iso:p>
		<planpro:description>
			Wenn für ein ENUM-Attribut der Wert "sonstige" ausgewählt wurde, muss ein Bearbeitungsvermerk angefügt sein,
			der die gewünschte Information enthält.

			Wenn Basis_Objekt.Attributname.Wert == "sonstige", dann muss Basis_Objekt.Attributname.ID_Bearbeitungsvermerk
			vorhanden sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Bei Auswahl des ENUM-Werts "sonstige" wurde für [das Attribut/die Attribute] "[Attributname]" ein Bearbeitungsvermerk angefügt.
			</planpro:success>
			<planpro:error>
				Bei Auswahl des ENUM-Werts "sonstige" wurde für [das Attribut/die Attribute] "[Attributname]" kein Bearbeitungsvermerk angefügt.
			</planpro:error>
		</planpro:test>
		<planpro:output>Basis_Objekt</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Container[parent::LST_Zustand_Ziel | parent::LST_Zustand]/*[descendant::Wert = 'sonstige']">
		<iso:let name="Attribut_ohne_Vermerk" value="descendant::*[Wert = 'sonstige'][not(ID_Bearbeitungsvermerk)]"/>
		<iso:let name="eins_oder_mehr" value="if (count($Attribut_ohne_Vermerk) = 1) then 'das Attribut ' else 'die Attribute '"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="not($Attribut_ohne_Vermerk)">Bei Auswahl des ENUM-Werts "sonstige" wurde für <iso:value-of select="$eins_oder_mehr"/> <xsl:value-of select="for $i in $Attribut_ohne_Vermerk return concat('&#34;', /local-name($i), '&#34;')" separator=", "/> kein Bearbeitungsvermerk angefügt.</iso:assert>
  </iso:rule>
</iso:pattern>