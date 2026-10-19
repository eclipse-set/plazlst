<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="C9BD51A8-6BE8-4129-AD49-E822F8E989E6" see="Fahrstrasse_ID374" id="ID374" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>2. Teil-Zugstraße mit DWeg</iso:title>
	<iso:p>
		<planpro:description>
			Bei zwei folgeabhängigen Teil-Zugstraßen (Start-Signal der 2. Teil-Zugstraße = Ziel-Signal der 1. Teil-Zugstraße)
			muss für die zweite Teil-Zugstraße ein D-Weg definiert sein,
			sofern es sich nicht um eine Ausfahrzugstraße auf die Strecke oder zu einer Awanst handelt.
			
			Wenn zwei Fstr_Zug_Rangier mit Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_Art == "ZT" ∨ "ZTU" gefunden werden, 
			bei denen Fstr_Zug_Rangier2.ID_Fstr_Fahrweg → Fahrweg.ID_Start == Fstr_Zug_Rangier1.ID_Fstr_Fahrweg
			→ Fstr_Fahrweg.ID_Ziel und Fstr_Fahrweg.ID_Ziel == Signal mit Signal.Signal_Fiktiv.Fiktives_Signal_Funktion ≠
			"Zug_Ziel_Awanst" ∨ "Zug_Ziel_Strecke",
			dann muss Fstr_Zug_Rangier2.Fstr_Zug.Fstr_Zug_DWeg vorhanden sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Es wurden zwei folgeabhängige Teil-Zugstraßen definiert und für die zweite Teil-Zugstraße ist ein Durchrutschweg angegeben.
			</planpro:success>
			<planpro:error>
				Es wurden zwei folgeabhängige Teil-Zugstraßen definiert und für die zweite Teil-Zugstraße ist kein Durchrutschweg angegeben.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-374(current(), /*)]">
  	<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Fstr_Zug/Fstr_Zug_DWeg">Es wurden zwei folgeabhängige Teil-Zugstraßen definiert und für die zweite Teil-Zugstraße ist kein Durchrutschweg angegeben.</iso:assert>
  </iso:rule>
</iso:pattern>