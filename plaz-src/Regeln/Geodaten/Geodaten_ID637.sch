<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="D6B243CA-2ADA-4793-A684-21E895A47A35" see="Geodaten_ID637" id="ID637" planpro:arbeitspaket="Geodaten" planpro:version="1.10.0.3">
	<iso:title>Referenz GEO-Punkt auf GEO-Knoten</iso:title>
	<iso:p>
		<planpro:description>
			Ein GEO-Knoten muss mindestens von einem GEO-Punkt referenziert werden.

			Wenn ein GEO_Knoten existiert, muss mindestens ein GEO_Punkt mittels GEO_Punkt.ID_GEO_Knoten hierauf verweisen.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Es existiert mindestens ein GEO-Punkt, der auf den GEO-Knoten verweist.
			</planpro:success>
			<planpro:error>
				Es existiert kein GEO-Punkt, der auf den GEO-Knoten verweist.
			</planpro:error>
		</planpro:test>
		<planpro:output>GEO_Knoten</planpro:output>
	</iso:p>
	<iso:rule role="error" context="GEO_Knoten[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:let name="GEO_Punkt" value="key('GEO_Punkt-fuerGEO_Knoten', Identitaet/Wert, parent::*)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$GEO_Punkt">Es existiert kein GEO-Punkt, der auf den GEO_Knoten verweist.</iso:assert>
  </iso:rule>
</iso:pattern>