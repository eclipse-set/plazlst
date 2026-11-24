<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="01BD4ACB-30E0-4737-B742-AEC58CF2FC0C" see="ETCS_ID631" id="ID631" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3">
	<iso:title>ESG-spezifische Angaben zu Fachtelegrammen nur bei ESG-Datenpunkt</iso:title>
	<iso:p>
		<planpro:description>
			Wenn ESG-spezifische Angaben zu Fachtelegrammen und Anschaltbedingungen enthalten sind, muss der Datenpunkt
			auch für ETCS signalgeführt verwendet werden.

			Wenn Datenpunkt.DP_Telegramm_ESG existiert, muss auch Datenpunkt.DP_Typ.DP_Typ_GESG vorhanden sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				ESG-spezifische Angaben zu Fachtelegrammen und Anschaltbedingungen sind nur bei einem ESG-Datenpunkt vorhanden.
			</planpro:success>
			<planpro:error>
				ESG-spezifische Angaben zu Fachtelegrammen und Anschaltbedingungen sind bei einem ESG-Datenpunkt vorhanden,
				der nicht für ETCS signalgeführt verwendet wird.
			</planpro:error>
		</planpro:test>
		<planpro:output>Datenpunkt</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][DP_Telegramm_ESG]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="DP_Typ/DP_Typ_GESG">ESG-spezifische Angaben zu Fachtelegrammen und Anschaltbedingungen sind bei einem ESG-Datenpunkt vorhanden, der nicht für ETCS signalgeführt verwendet wird.</iso:assert>
	</iso:rule>
</iso:pattern>