<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="050099E0-A600-4CFC-9E3A-9C0AFB216C9E" see="Fahrstrasse_ID377" id="ID377" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Korrektes Zs 3 für Zugstraße - Restriktionen DWeg</iso:title>
	<iso:p>
		<planpro:description>
			Die mittels Zs 3 gezeigte Geschwindigkeit am Fahrstraßenstart (im Fall ohne alleinstehendes Zs 3 im Fahrweg) darf nicht
			größer sein als die im DWeg hinterlegte Geschwindigkeit (Prüfung erfolgt nur bei Fahrt auf Halt-zeigendes Zielsignal).
			
			Wenn Fstr_Signalisierung.ID_Signal_Signalbegriff → Signal_Signalbegriff.Signalbegriff_ID == "Zs_3" ∧
			∃ Signal_Signalbegriff ← Signal_Rahmen → Signal ← Fstr_Fahrweg.ID_Start
			∧
			∄ (Fstr_Signalisierung.ID_Fstr_Zug_Rangier → Fstr_Zug_Rangier ← Fstr_Signalisierung.ID_Signal_Signalbegriff →
			Signal_Signalbegriff.Signalbegriff_ID == "Zs_3" ∧
			∄ Signal_Signalbegriff ← Signal_Rahmen → Signal ← Fstr_Fahrweg.ID_Start)
			∧ 
			((∄ Fstr_Signalisierung.ID_Signal_Signalbegriff_Ziel ∧ ∄ Fstr_Signalisierung.ID_Fstr_Zug_Rangier → Fstr_Zug_Rangier ←
			Fstr_Signalisierung.ID_Fstr_Zug_Rangier mit Fstr_Signalisierung.ID_Signal_Signalbegriff_Ziel → 
			Signal_Signalbegriff.Signalbegriff_ID == "Hp_0")
			∨
			Fstr_Signalisierung.ID_Signal_Signalbegriff_Ziel → Signal_Signalbegriff.Signalbegriff_ID == "Hp_0")
			∧
			∃ Fstr_Signalisierung.ID_Fstr_Zug_Rangier → Fstr_Zug_Rangier.Fstr_Zug.Fstr_DWeg 
			∧
			∃ Fstr_Signalisierung.ID_Fstr_Zug_Rangier → Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_DWeg.ID_Fstr_DWeg →
			Fstr_DWeg.Fstr_DWeg_Spezifisch.DWeg_V, 
			
			dann muss Zs_3.Symbol * 10 ≤ Fstr_Signalisierung.ID_Fstr_Zug_Rangier → Fstr_Zug_Rangier.Fstr_Zug_DWeg.ID_Fstr_DWeg → 
			Fstr_DWeg.Fstr_DWeg_Spezifisch.DWeg_V sein. 
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die am Fahrstraßenstart (im Fall ohne alleinstehendes Zs 3 im Fahrweg) geplante Geschwindigkeit (Zs 3) ist nicht
				größer als die im Durchrutschweg hinterlegte Geschwindigkeit. 
			</planpro:success>
			<planpro:error>
				Die am Fahrstraßenstart (im Fall ohne alleinstehendes Zs 3 im Fahrweg) geplante Geschwindigkeit (Zs 3) ist größer
				als die im Durchrutschweg hinterlegte Geschwindigkeit.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Signalisierung</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_Signalisierung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-377(current(), /*)]">
		<iso:let name="Symbol" value="key('Signal_Signalbegriff', ID_Signal_Signalbegriff/Wert, /*)/Signalbegriff_ID/Symbol"/>
		<iso:let name="Fstr_Zug_Rangier" value="key('Fstr_Zug_Rangier', ID_Fstr_Zug_Rangier/Wert, parent::*)"/>
		<iso:let name="DWeg_V" value="key('Fstr_DWeg', $Fstr_Zug_Rangier/Fstr_Zug/*/ID_Fstr_DWeg/Wert, parent::*)/*/DWeg_V/Wert"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="number($DWeg_V) ge 10*$Symbol">Die am Fahrstraßenstart (im Fall ohne alleinstehendes Zs 3 im Fahrweg) geplante Geschwindigkeit (Zs 3) ist größer als die im Durchrutschweg hinterlegte Geschwindigkeit.</iso:assert>
	</iso:rule>
</iso:pattern>