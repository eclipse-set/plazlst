<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="7C54EEE8-BB86-4f12-9FF6-279F13D7FBB5" see="Fahrstrasse_ID270" id="ID270" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Korrekter Bedienstring einer Rangierstraße</iso:title>
	<iso:p>
		<planpro:description>
			Der Bedienstring einer Rangierstraße muss das Zeichen "-" enthalten, z. B. 60L12X-60G22X.
			
			Wenn Fstr_Zug_Rangier.Fstr_Rangier vorhanden und Fstr_Zug_Rangier.Fstr_Zug_Rangier_Allg.Fstr_Bedienstring
			gefüllt ist, muss der Wert das Zeichen "-" beinhalten.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Der Bedienstring der Rangierstraße beinhaltet das Zeichen '-'.
			</planpro:success>
			<planpro:error>
				Der Bedienstring der Rangierstraße beinhaltet nicht das Zeichen '-'.
				Hinweis: Die Festlegung des Bedienstrings ist nicht Bestandteil des PT 1 ESTW.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Rangier][Fstr_Zug_Rangier_Allg/Fstr_Bedienstring]">
		<iso:let name="Bedienstring" value="Fstr_Zug_Rangier_Allg/Fstr_Bedienstring/Wert"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="contains($Bedienstring, '-')">Der Bedienstring der Rangierstraße beinhaltet nicht das Zeichen '-'. Hinweis: Die Festlegung des Bedienstrings ist nicht Bestandteil des PT 1 ESTW. </iso:assert>
	</iso:rule>
</iso:pattern>