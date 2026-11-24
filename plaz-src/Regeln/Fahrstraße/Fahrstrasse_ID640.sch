<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="BDA784CC-DE4D-4239-8DDA-3A1D1E7FA674" see="Fahrstrasse_ID640" id="ID640" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Ungenutzter DWeg/GPA</iso:title>
	<iso:p>
		<planpro:description>
			Es soll eine Warnung ausgegeben werden, wenn ein DWeg/GPA nicht von einer Zugstraße referenziert wird.

			Es soll eine Warnung ausgegeben werden, wenn ∄ Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_DWeg.ID_Fstr_DWeg ← Fstr_DWeg.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Der DWeg/GPA wird von einer Zugstraße referenziert.
			</planpro:success>
			<planpro:error>
				Der DWeg/GPA wird nicht von einer Zugstraße referenziert.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_DWeg</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:let name="Fstr_Zug_Rangier" value="key('Fstr_Zug_Rangier-fuerFstr_Zug_DWeg', Identitaet/Wert, parent::*)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Fstr_Zug_Rangier">Der DWeg/GPA wird nicht von einer Zugstraße referenziert.</iso:assert>
	</iso:rule>
</iso:pattern>