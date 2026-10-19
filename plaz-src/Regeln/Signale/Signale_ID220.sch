<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="3C9E6086-9B70-4e3e-BF8F-F2646CB32E2F" see="Signale_ID220" id="ID220" planpro:arbeitspaket="Signale" planpro:version="1.10.0.3">
	<iso:title>Anschaltdauer für geschalteten Signalbegriff</iso:title>
	<iso:p>
		<planpro:description>
			Wenn ein Signalbegriff geschaltet wird, muss auch eine Anschaltdauer angegeben werden.

			Wenn Signal_Signalbegriff.Signal_Signalbegriff_Allg.Geschaltet == "true", dann muss
			Signal_Signalbegriff.Signal_Signalbegriff_Allg.Anschaltdauer vorhanden sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Für den geschalteten Signalbegriff wurde eine Anschaltdauer angegeben.
			</planpro:success>
			<planpro:error>
				Für den geschalteten Signalbegriff wurde keine Anschaltdauer angegeben.
			</planpro:error>
		</planpro:test>
		<planpro:output>Signal_Signalbegriff</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Signal_Signalbegriff[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Signal_Signalbegriff_Allg/Geschaltet/Wert = 'true']">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Signal_Signalbegriff_Allg/Anschaltdauer">Für den geschalteten Signalbegriff wurde keine Anschaltdauer angegeben.</iso:assert>
	</iso:rule>
</iso:pattern>