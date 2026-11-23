<?xml version="1.0" encoding="UTF-8" standalone="no"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="812B0641-0D3B-48D1-B26D-C9948FE56A87" id="ID648" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3" see="Fahrstrasse_ID648">
	<iso:title>Reihenfolge bei Umfahrstraßen &gt; 0</iso:title>
	<iso:p>
		<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>		Ist eine Fahrstraße eine Umfahrstraße, dann darf das Attribut "Fstr_Reihenfolge" nicht mit dem Wert "0" gefüllt sein.

		Wenn (Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_Art == "ZU", "ZUH", ∨ "ZTU") oder (Fstr_Zug_Rangier.Fstr_Mittel.Fstr_Mittel_Art == "ZUM")
		oder (Fstr_Zug_Rangier.Fstr_Rangier.Fstr_Rangier_Art == "RU" ∨ "RTU"),
		dann muss Fstr_Zug_Rangier.Fstr_Zug_Rangier_Allg.Fstr_Reihenfolge ≠ "0" sein.
</code></pre>
</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Fahrstraße ist eine Umfahrstraße und als Reihenfolge ist nicht "0" angegeben.
			</planpro:success>
			<planpro:error>
				Die Fahrstraße ist eine Umfahrstraße, als Reihenfolge ist jedoch "0" angegeben. Nur bei Regelfahrstraßen ist der Wert "0" zulässig.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
	<iso:rule context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][*/(Fstr_Rangier_Art|Fstr_Mittel_Art|Fstr_Zug_Art)/Wert = ('RU', 'ZU', 'ZUH', 'ZUM', 'RTU', 'ZTU')]" role="error">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Fstr_Zug_Rangier_Allg/Fstr_Reihenfolge/Wert != '0'">Die Fahrstraße ist eine Umfahrstraße, als Reihenfolge ist jedoch "0" angegeben. Nur bei Regelfahrstraßen ist der Wert "0" zulässig.</iso:assert>
  </iso:rule>
</iso:pattern>