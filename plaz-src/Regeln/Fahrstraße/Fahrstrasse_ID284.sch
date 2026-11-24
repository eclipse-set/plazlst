<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="0E203E43-9FEF-4597-9F78-D0F491CDC25D" see="Fahrstrasse_ID284" id="ID284" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Reihenfolge bei Regelfahrstraßen = 0</iso:title>
	<iso:p>
		<planpro:description>
			Ist eine Fahrstraße keine Umfahrstraße, dann darf das Attribut "Fstr_Reihenfolge" lediglich mit dem Wert "0" gefüllt sein.

			Wenn (Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_Art ≠ "ZU", "ZUH" ∨ "ZTU") oder 
			(Fstr_Zug_Rangier.Fstr_Mittel.Fstr_Mittel_Art ≠ "ZUM") oder 
			(Fstr_Zug_Rangier.Fstr_Rangier.Fstr_Rangier_Art ≠ "RU" ∨ "RTU"),
			dann muss Fstr_Zug_Rangier.Fstr_Zug_Rangier_Allg.Fstr_Reihenfolge == "0" sein.
		</planpro:description>
		<planpro:comment>.
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Fahrstraße ist eine Regelfahrstraße und als Reihenfolge ist "0" angegeben.
			</planpro:success>
			<planpro:error>
				Die Fahrstraße ist eine Regelfahrstraße, als Reihenfolge ist jedoch nicht "0" angegeben.
				Nur bei Umfahrstraßen sind Werte &gt; 0 zulässig.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]   [not(*/(Fstr_Rangier_Art|Fstr_Mittel_Art|Fstr_Zug_Art)/Wert = ('RU', 'ZU', 'ZUH', 'ZUM', 'RTU', 'ZTU'))]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Fstr_Zug_Rangier_Allg[Fstr_Reihenfolge/Wert = '0']">Die Fahrstraße ist eine Regelfahrstraße, als Reihenfolge ist jedoch nicht "0" angegeben. Nur bei Umfahrstraßen sind Werte &gt; 0 zulässig.</iso:assert>
  </iso:rule>
</iso:pattern>