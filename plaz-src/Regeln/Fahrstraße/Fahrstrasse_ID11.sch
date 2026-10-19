<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="6F74B453-53A2-4EBF-8E9F-7515DE42C8F0" see="Fahrstrasse_ID11" id="ID11" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Fstr_V_Hg bei befahrenem Fstr_Fahrweg</iso:title>
	<iso:p>
		<planpro:description>
			Fstr_V_Hg muss gefüllt sein, wenn dieser Fahrweg als befahrener Teil einer Zugstraße dient.

			Wenn Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg und Fstr_Zug_Rangier.Fstr_Zug existiert,
			dann muss auch Fstr_Fahrweg.Fstr_V_Hg vorhanden sein. 
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Fstr_V_Hg ist gefüllt, wenn dieser Fahrweg als befahrener Teil einer Zugstraße dient.
			</planpro:success>
			<planpro:error>
				Fstr_V_Hg ist nicht gefüllt, obwohl dieser Fahrweg als befahrener Teil einer Zugstraße dient.
				Die Angabe ist erforderlich!
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Fahrweg</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-11(current(), parent::*)]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Fstr_V_Hg">Fstr_V_Hg ist nicht gefüllt, obwohl dieser Fahrweg als befahrener Teil einer Zugstraße dient. Die Angabe ist erforderlich!</iso:assert>
  </iso:rule>
</iso:pattern>