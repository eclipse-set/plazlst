<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="7684A43E-10E2-459D-899B-2D90F85010A3" see="Fahrstrasse_ID623" id="ID623" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Bereichsende DWeg/GPA bei Wirkrichtung des Startsignals in Topologierichtung</iso:title>
	<iso:p>
		<planpro:description>
			Ist die Wirkrichtung des Startsignals des DWegs/Gefahrpunktabstands identisch mit der Topologierichtung, muss für den
			entsprechenden Teilbereich des zugehörigen Fahrwegs das Attribut Begrenzung_A dem Abstand des Startsignals vom Anfang
			der TOP_Kante entsprechen. Sofern ein weiterer Teilbereich für den Fahrweg existiert, muss außerdem der Wert von
			Begrenzung_B im betrachteten Teilbereich gleich der Länge der TOP_Kante sein (Toleranz ± 0,01 m). 
			
			Wenn Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Start → Signal.Punkt_Objekt_TOP_Kante.Wirkrichtung == "in",
			dann muss für diese TOP_Kante [Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A == Signal.Punkt_Objekt_TOP_Kante.Abstand
			(Toleranz ± 0,01 m)] und, wenn Anzahl Fstr_Fahrweg.Bereich_Objekt_Teilbereich &gt; 1, dann muss für selbige TOP_Kante
			[Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_B == Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante → 
			TOP_Kante.TOP_Kante_Allg.TOP_Laenge] (Toleranz ± 0,01 m) sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Wirkrichtung des Startsignals des DWegs/Gefahrpunktabstands stimmt mit der Topologierichtung überein und im
				zugehörigen Fstr_Fahrweg ist der Wert von Begrenzung_A gleich dem Abstand des Startsignals vom Anfang der TOP_Kante.
				Sofern ein weiterer Teilbereich existiert, muss der Wert von Begrenzung_B im betrachteten Teilbereich der Länge der
				TOP_Kante (Toleranz ± 0,01 m) entsprechen. 
			</planpro:success>
			<planpro:error>
				Die Wirkrichtung des Startsignals des DWegs/Gefahrpunktabstands stimmt mit der Topologierichtung überein, jedoch
				ist im zugehörigen Fstr_Fahrweg der Wert von Begrenzung_A nicht gleich dem Abstand des Startsignals vom Anfang
				der TOP_Kante und/oder der Wert von Begrenzung_B im betrachteten Teilbereich entspricht trotz Vorhandensein eines
				weiteren Teilbereichs nicht der Länge der TOP_Kante (Toleranz ± 0,01 m). 
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_DWeg</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-623(current(), /*)]">
		<iso:let name="Fstr_Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
		<iso:let name="Startsignal" value="key('Signal', $Fstr_Fahrweg/ID_Start/Wert, /*)[1]"/>
		<iso:let name="POT_Startsignal" value="$Startsignal/Punkt_Objekt_TOP_Kante[Wirkrichtung/Wert = 'in']    [ID_TOP_Kante/Wert = $Fstr_Fahrweg/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert][1]"/>
		<iso:let name="BOT_Fahrweg" value="$Fstr_Fahrweg/Bereich_Objekt_Teilbereich[ID_TOP_Kante/Wert = $POT_Startsignal/ID_TOP_Kante/Wert]"/>
		<iso:let name="TOP_Kante_Startsignal" value="key('TOP_Kante', $POT_Startsignal/ID_TOP_Kante/Wert, /*)"/>
		<iso:let name="Fahrweg_verschiedene_BOT_TOP-Kanten" value="distinct-values($Fstr_Fahrweg/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert)"/>
		<iso:let name="genauigkeit" value="0.01"/>
		
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="abs(min($BOT_Fahrweg/Begrenzung_A/fx:number-or-zero(Wert)) - fx:number-or-zero($POT_Startsignal/Abstand/Wert)) le $genauigkeit and              (count($Fahrweg_verschiedene_BOT_TOP-Kanten) = 1 or              abs(max($BOT_Fahrweg/Begrenzung_B/fx:number-or-zero(Wert)) - fx:number-or-zero($TOP_Kante_Startsignal/TOP_Kante_Allg/TOP_Laenge/Wert))              le $genauigkeit)">Die Wirkrichtung des Startsignals des DWegs/Gefahrpunktabstands stimmt mit der Topologierichtung überein, jedoch ist im zugehörigen Fstr_Fahrweg der Wert von Begrenzung_A nicht gleich dem Abstand des Startsignals vom Anfang der TOP_Kante und/oder der Wert von Begrenzung_B im betrachteten Teilbereich entspricht trotz Vorhandensein eines weiteren Teilbereichs nicht der Länge der TOP_Kante (Toleranz +/- 0,01 m).</iso:assert>
	</iso:rule>
</iso:pattern>