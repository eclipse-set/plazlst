<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="D0C4F2B1-3E84-45C1-B9B5-CC091881A2CD" see="Fahrstrasse_ID641" id="ID641" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Keine automatische Einstellung bei F-Bedienung</iso:title>
	<iso:p>
		<planpro:description>
			Wenn für die Fahrstraße eine F-Bedienung erforderlich ist, darf keine automatische Einstellung vorgesehen werden.

			Wenn Fstr_Zug_Rangier.Fstr_Zug_Rangier_Allg.F_Bedienung == "true", dann dürfen
			Fstr_Zug_Rangier.Fstr_Zug.Automatische_Einstellung oder
			Fstr_Zug_Rangier.Fstr_Rangier.Automatische_Einstellung nicht vorhanden sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Für die Fahrstraße mit F-Bedienung ist keine automatische Einstellung vorgesehen.
			</planpro:success>
			<planpro:error>
				Für die Fahrstraße mit F-Bedienung ist eine automatische Einstellung vorgesehen.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Zug_Rangier_Allg/F_Bedienung/Wert = 'true']">
		<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="(Fstr_Zug | Fstr_Rangier)/Automatische_Einstellung">Für die Fahrstraße mit F-Bedienung ist eine automatische Einstellung vorgesehen.</iso:report>
	</iso:rule>
</iso:pattern>