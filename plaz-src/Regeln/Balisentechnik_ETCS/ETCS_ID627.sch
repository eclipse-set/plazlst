<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="42511E68-D2B7-18DB-D77E-4D0366A74EAA" see="ETCS_ID627" id="ID627" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3">
	<iso:title>Kennzeichnung des primären DP-Typs</iso:title>
	<iso:p>
		<planpro:description>
			Der Wert "primaer" soll nicht zur Kennzeichnung des primären Anwendungssystems verwendet werden und
			darf daher im Export nicht erscheinen.

			Datenpunkt.DP_Typ.DP_Typ_Art == "primaer" darf im Export nicht vorhanden sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Der Wert "primaer" wird nicht zur Kennzeichnung des primären Anwendungssystems verwendet.
			</planpro:success>
			<planpro:error>
				Der Wert "primaer" wird zur Kennzeichnung des primären Anwendungssystems verwendet.
				In diesem Fall soll das Attribut DP_Typ_Art jedoch entfallen.
			</planpro:error>
		</planpro:test>
		<planpro:output>Datenpunkt</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][DP_Typ/DP_Typ_Art]">
		<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="DP_Typ/DP_Typ_Art/Wert = 'primaer'">Der Wert "primaer" wird zur Kennzeichnung des primären Anwendungssystems verwendet. In diesem Fall soll das Attribut DP_Typ_Art jedoch entfallen.</iso:report>
  </iso:rule>
</iso:pattern>