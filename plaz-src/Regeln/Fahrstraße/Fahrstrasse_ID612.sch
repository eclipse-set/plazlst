<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="F78F4830-AEBC-441D-9169-51038C9F0555" see="Fahrstrasse_ID612" id="ID612" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Bereichsende Fahrweg bei Wirkrichtung des Startsignals entgegen Topologierichtung</iso:title>
	<iso:p>
		<planpro:description>
			Ist die Wirkrichtung des Startsignals des Fahrwegs nicht identisch mit der Topologierichtung und sind mehrere
			Teilbereiche vorhanden, muss im betrachteten Teilbereich für das Attribut Begrenzung_A der Wert "0.000" 
			definiert sein. Außerdem muss der Wert von Begrenzung_B dem Abstand des Startsignals vom Anfang der TOP_Kante
			entsprechen (Toleranz ± 0,01 m). 
			
			Wenn Fstr_Fahrweg.ID_Start → Signal.Punkt_Objekt_TOP_Kante.Wirkrichtung == "gegen", dann muss für Bereichsobjekte
			dieser TOP_Kante [max(Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_B) == Signal.Punkt_Objekt_TOP_Kante.Abstand]
			und, wenn Anzahl Fstr_Fahrweg.Bereich_Objekt_Teilbereich (für verschiedene TOP_Kanten) &gt; 1, dann muss für selbige TOP_Kante 
			[min(Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A) == "0.000"] sein (Toleranz ± 0,01 m).
		</planpro:description>
		<planpro:comment>
			Um bei Signalen mit mehreren punktförmigen Verortungen die relevante punktförmige Verortung herauszufiltern:
			Signal.Punkt_Objekt_TOP_Kante.ID_TOP_Kante muss einer Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante entsprechen.
			
			Prüfung entfällt, falls
			- relevantes ID_Start nil
			- fehlendes referenziertes Signal
			- referenziertes Signal mit Wirkrichtung "in"
			- keine übereinstimmenden TOP_Kante zwischen referenziertem Signal und Fstr_Fahrweg.Bereich_Objekt_Teilbereich(en)
			- relevanter Abstand (im Signal) nil
			- relevante Begrenzung_A (in Fstr_Fahrweg.Bereich_Objekt_Teilbereich) nil
			- relevante Begrenzung_B (in Fstr_Fahrweg.Bereich_Objekt_Teilbereich) nil 
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Wirkrichtung des Startsignals des Fahrwegs stimmt mit der Topologierichtung nicht überein und bei Existenz
				eines weiteren Teilbereichs ist der Wert von Begrenzung_A im betrachteten Teilbereich des Fstr_Fahrwegs gleich
				"0.000". Außerdem entspricht der Wert von Begrenzung_B dem Abstand des Startsignals vom Anfang der TOP_Kante
				(Toleranz ± 0,01 m).
			</planpro:success>
			<planpro:error>
				Die Wirkrichtung des Startsignals des Fahrwegs stimmt mit der Topologierichtung nicht überein, jedoch ist trotz
				Existenz eines weiteren Teilbereichs der Wert von Begrenzung_A im betrachteten Teilbereich des Fahrwegs nicht
				gleich "0.000" und/oder der Wert von Begrenzung_B entspricht nicht dem Abstand des Startsignals vom Anfang
				der TOP_Kante (Toleranz ± 0,01 m).
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Fahrweg</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-612(current(), /*)]">
		<iso:let name="Startsignal" value="key('Signal', ID_Start/Wert, /*)[1]"/>
		<iso:let name="POT_Signal" value="$Startsignal/Punkt_Objekt_TOP_Kante[Wirkrichtung/Wert = 'gegen']    [ID_TOP_Kante/Wert = current()/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert][1]"/>
		<iso:let name="BOT_Fahrweg" value="Bereich_Objekt_Teilbereich[ID_TOP_Kante/Wert = $POT_Signal/ID_TOP_Kante/Wert]"/>
		<iso:let name="Fahrweg_verschiedene_BOT_TOP-Kanten" value="distinct-values(Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert)"/>
		<iso:let name="genauigkeit" value="0.01"/>
		
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="abs(max($BOT_Fahrweg/Begrenzung_B/fx:number-or-zero(Wert)) - fx:number-or-zero($POT_Signal/Abstand/Wert)) le $genauigkeit and    (count($Fahrweg_verschiedene_BOT_TOP-Kanten) = 1 or min($BOT_Fahrweg/Begrenzung_A/fx:number-or-zero(Wert)) = 0)">Die Wirkrichtung des Startsignals des Fahrwegs stimmt mit der Topologierichtung nicht überein, jedoch ist trotz Existenz eines weiteren Teilbereichs der Wert von Begrenzung_A im betrachteten Teilbereich des Fahrwegs nicht gleich "0.000" und/oder der Wert von Begrenzung_B entspricht nicht dem Abstand des Startsignals vom Anfang der TOP_Kante (Toleranz +/- 0,01 m).</iso:assert>
	</iso:rule>
</iso:pattern>