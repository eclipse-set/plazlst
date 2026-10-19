<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="5C6C2564-F674-441C-95E3-710BE9B71951" see="ETCS_ID630" id="ID630" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3">
	<iso:title>ESG-Datenpunkt mit ESG-spezifischen Angaben zu Fachtelegrammen</iso:title>
	<iso:p>
		<planpro:description>
			Wenn ein Datenpunkt für ETCS signalgeführt (ESG) verwendet wird, müssen auch die ESG-spezifischen Angaben
			zu Fachtelegrammen und Anschaltbedingungen enthalten sein.

			Wenn Datenpunkt.DP_Typ.DP_Typ_GESG vorhanden ist, muss auch Datenpunkt.DP_Telegramm_ESG existieren.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Der ESG-Datenpunkt enthält die ESG-spezifischen Angaben zu Fachtelegrammen und Anschaltbedingungen.
			</planpro:success>
			<planpro:error>
				Der ESG-Datenpunkt enthält nicht die ESG-spezifischen Angaben zu Fachtelegrammen und Anschaltbedingungen.
			</planpro:error>
		</planpro:test>
		<planpro:output>Datenpunkt</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][DP_Typ/DP_Typ_GESG]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="DP_Telegramm_ESG">Der ESG-Datenpunkt enthält nicht die ESG-spezifischen Angaben zu Fachtelegrammen und Anschaltbedingungen.</iso:assert>
	</iso:rule>
</iso:pattern>