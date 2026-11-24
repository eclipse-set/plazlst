<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="1EAC4DE9-1D58-4FAB-A506-0CC9178CD5D0" see="Fahrstrasse_ID624" id="ID624" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Bereichsende DWeg/GPA bei Wirkrichtung des Startsignals entgegen Topologierichtung</iso:title>
	<iso:p>
		<planpro:description>
			Ist die Wirkrichtung des Startsignals des DWegs/Gefahrpunktabstands nicht identisch mit der Topologierichtung und
			sind mehrere Teilbereiche im zugehörigen Fstr_Fahrweg vorhanden, muss im betrachteten Teilbereich für das Attribut
			Begrenzung_A der Wert "0.000" definiert sein. Außerdem muss der Wert von Begrenzung_B dem Abstand des Startsignals
			vom Anfang der TOP_Kante entsprechen (Toleranz ± 0,01 m).
			
			Wenn Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Start → Signal.Punkt_Objekt_TOP_Kante.Wirkrichtung == "gegen",
			dann muss für diese TOP_Kante [Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_B == Signal.Punkt_Objekt_TOP_Kante.Abstand]
			und, wenn Anzahl Fstr_Fahrweg.Bereich_Objekt_Teilbereich &gt; 1, dann muss für selbige TOP_Kante
			[Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A == "0.000"] sein (Toleranz ± 0,01 m). 
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Wirkrichtung des Startsignals des DWegs/Gefahrpunktabstands stimmt mit der Topologierichtung nicht überein
				und bei Existenz eines weiteren Teilbereichs ist der Wert von Begrenzung_A im betrachteten Teilbereich des
				zugehörigen Fstr_Fahrwegs gleich "0.000". Außerdem entspricht der Wert von Begrenzung_B dem Abstand des
				Startsignals vom Anfang der TOP_Kante (Toleranz ± 0,01 m). 
			</planpro:success>
			<planpro:error>
				Die Wirkrichtung des Startsignals des DWegs/Gefahrpunktabstands stimmt mit der Topologierichtung nicht überein,
				jedoch ist trotz Existenz eines weiteren Teilbereichs der Wert von Begrenzung_A im betrachteten Teilbereich
				des zugehörigen Fstr_Fahrwegs nicht gleich "0.000" und/oder der Wert von Begrenzung_B entspricht nicht dem
				Abstand des Startsignals vom Anfang der TOP_Kante (Toleranz ± 0,01 m). 
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_DWeg</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-624(current(), /*)]">
		<iso:let name="Fstr_Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
		<iso:let name="Startsignal" value="key('Signal', $Fstr_Fahrweg/ID_Start/Wert, /*)[1]"/>
		<iso:let name="POT_Startsignal" value="$Startsignal/Punkt_Objekt_TOP_Kante[Wirkrichtung/Wert = 'gegen']    [ID_TOP_Kante/Wert = $Fstr_Fahrweg/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert][1]"/>
		<iso:let name="BOT_Fahrweg" value="$Fstr_Fahrweg/Bereich_Objekt_Teilbereich[ID_TOP_Kante/Wert = $POT_Startsignal/ID_TOP_Kante/Wert]"/>
		<iso:let name="Fahrweg_verschiedene_BOT_TOP-Kanten" value="distinct-values($Fstr_Fahrweg/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert)"/>
		<iso:let name="genauigkeit" value="0.01"/>
		
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="abs(max($BOT_Fahrweg/Begrenzung_B/fx:number-or-zero(Wert)) - fx:number-or-zero($POT_Startsignal/Abstand/Wert)) le $genauigkeit and    (count($Fahrweg_verschiedene_BOT_TOP-Kanten) = 1 or min($BOT_Fahrweg/Begrenzung_A/fx:number-or-zero(Wert)) = 0)">Die Wirkrichtung des Startsignals des DWegs/Gefahrpunktabstands stimmt mit der Topologierichtung nicht überein, jedoch ist trotz Existenz eines weiteren Teilbereichs der Wert von Begrenzung_A im betrachteten Teilbereich des zugehörigen Fstr_Fahrwegs nicht gleich "0.000" und/oder der Wert von Begrenzung_B entspricht nicht dem Abstand des Startsignals vom Anfang der TOP_Kante (Toleranz +/- 0,01 m).</iso:assert>
	</iso:rule>
</iso:pattern>