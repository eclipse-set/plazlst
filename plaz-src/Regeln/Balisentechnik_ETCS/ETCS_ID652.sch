<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="690198EF-03B1-44F6-A0A2-1B230AD1C7DF" see="ETCS_ID652" id="ID652" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3">
	<iso:title>Nicht-ESG-Datenpunkt mit allgemeinen Angaben zu Fachtelegrammen</iso:title>
	<iso:p>
		<planpro:description>
			Wenn ein Datenpunkt nicht für ETCS signalgeführt verwendet wird, müssen die allgemeinen Angaben
			zu Fachtelegrammen und Anschaltbedingungen enthalten sein.
			
			Wenn Datenpunkt.DP_Typ.DP_Typ_GESG nicht vorhanden ist, muss Datenpunkt.DP_Telegramm existieren.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Der Datenpunkt wird nicht für ETCS signalgeführt genutzt und enthält die allgemeinen Angaben
				zu Fachtelegrammen und Anschaltbedingungen. 
			</planpro:success>
			<planpro:error>
				Der Datenpunkt wird nicht für ETCS signalgeführt genutzt, enthält jedoch nicht die allgemeinen
				Angaben zu Fachtelegrammen und Anschaltbedingungen.
			</planpro:error>
		</planpro:test>
		<planpro:output>Datenpunkt</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][not(DP_Typ/DP_Typ_GESG)]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="DP_Telegramm">Der Datenpunkt wird nicht für ETCS signalgeführt genutzt, enthält jedoch nicht die allgemeinen Angaben zu Fachtelegrammen und Anschaltbedingungen.</iso:assert>
	</iso:rule>
</iso:pattern>