<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="75778518-9EE6-4474-87DC-0B64495D19D6" see="ETCS_ID653" id="ID653" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3">
	<iso:title>Allgemeine Angaben zu Fachtelegrammen nur bei Nicht-ESG-Datenpunkt</iso:title>
	<iso:p>
		<planpro:description>
			Wenn im Datenpunkt die allgemeinen Angaben zu Fachtelegrammen und Anschaltbedingungen enthalten sind,
			darf der Datenpunkt nicht für ETCS signalgeführt verwendet werden.
			
			Wenn Datenpunkt.DP_Telegramm existiert, darf Datenpunkt.DP_Typ.DP_Typ_GESG nicht vorhanden sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Der Datenpunkt enthält die allgemeinen Angaben zu Fachtelegrammen und Anschaltbedingungen und 
				wird nicht für ETCS signalgeführt genutzt.
			</planpro:success>
			<planpro:error>
				Der Datenpunkt enthält die allgemeinen Angaben zu Fachtelegrammen und Anschaltbedingungen, 
				wird allerdings für ETCS signalgeführt genutzt. Bei ESG sind spezifische Angaben zu Fachtelegrammen
				und Anschaltbedingungen erforderlich! 
			</planpro:error>
		</planpro:test>
		<planpro:output>Datenpunkt</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][DP_Telegramm]">
		<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="DP_Typ/DP_Typ_GESG">Der Datenpunkt enthält die allgemeinen Angaben zu Fachtelegrammen und Anschaltbedingungen, wird allerdings für ETCS signalgeführt genutzt. Bei ESG sind spezifische Angaben zu Fachtelegrammen und Anschaltbedingungen erforderlich!</iso:report>
	</iso:rule>
</iso:pattern>