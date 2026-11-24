<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="EBE51BED-7413-4CE4-BB92-6ADF9C79E8FE" see="Fahrstrasse_ID7" id="ID7" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Vergleich Soll-/Ist-Länge des DWegs bzw. Gefahrpunktabstands</iso:title>
	<iso:p>
		<planpro:description> 
			Die Ist-Länge des Durchrutschwegs bzw. Gefahrpunktabstands muss gleich oder größer sein als die Solllänge.
			Toleranz: 0,1 m.
			
			Summe der Längen aller Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.Bereich_Objekt_Teilbereich ≥ 
			Fstr_DWeg.Fstr_DWeg_Allg.Laenge_Soll (Toleranz: 0,1 m)
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Ist-Länge des DWegs bzw. Gefahrpunktabstands ist gleich oder größer als die Solllänge.
			</planpro:success>
			<planpro:error>
				Die Ist-Länge des DWegs bzw. Gefahrpunktabstands ist nicht gleich oder größer als die Solllänge.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_DWeg</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:let name="DWeg_Laenge" value="fx:number-or-zero(Fstr_DWeg_Allg/Laenge_Soll/Wert)"/>
		<iso:let name="BOT" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)/Bereich_Objekt_Teilbereich"/>
		<iso:let name="Begrenzung_A" value="sum($BOT/Begrenzung_A/fx:number-or-zero(Wert))"/>
		<iso:let name="Begrenzung_B" value="sum($BOT/Begrenzung_B/fx:number-or-zero(Wert))"/>
		<iso:let name="Diff" value="abs($Begrenzung_B - $Begrenzung_A)"/>
		<iso:let name="Toleranz" value="0.1"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Diff + $Toleranz ge $DWeg_Laenge">Die Ist-Länge des DWegs bzw. Gefahrpunktabstands ist nicht gleich oder größer als die Solllänge.</iso:assert>
	</iso:rule>
</iso:pattern>