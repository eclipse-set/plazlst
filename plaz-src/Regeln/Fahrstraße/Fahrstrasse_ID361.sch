<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="FC8964E1-D626-41B2-9D33-E618C8E9E8DF" see="Fahrstrasse_ID361" id="ID361" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Korrekter Bedienstring einer Zugstraße</iso:title>
	<iso:p>
		<planpro:description>
			Die Bezeichnung einer Zugstrasse muss das Zeichen "." enthalten, z. B. 60A.60N2.
			
			Wenn Fstr_Zug_Rangier.Fstr_Zug vorhanden und Fstr_Zug_Rangier.Fstr_Zug_Rangier_Allg.Fstr_Bedienstring gefüllt ist,
			muss der Wert das Zeichen "." beinhalten.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Der Bedienstring der Zugstraße beinhaltet das Zeichen '.'.
			</planpro:success>
			<planpro:error>
				Der Bedienstring der Zugstraße beinhaltet nicht das Zeichen '.'.
				Hinweis: Die Festlegung des Bedienstrings ist nicht Bestandteil des PT 1 ESTW.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Zug][Fstr_Zug_Rangier_Allg/Fstr_Bedienstring]">
		<iso:let name="Bedienstring" value="Fstr_Zug_Rangier_Allg/Fstr_Bedienstring/Wert"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="contains($Bedienstring, '.')">Der Bedienstring der Zugstraße beinhaltet nicht das Zeichen '.'. Hinweis: Die Festlegung des Bedienstrings ist nicht Bestandteil des PT 1 ESTW. </iso:assert>
	</iso:rule>
</iso:pattern>