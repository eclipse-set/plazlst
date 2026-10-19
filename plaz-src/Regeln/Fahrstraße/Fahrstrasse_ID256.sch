<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="0F7F823C-0DAF-4e8b-9776-DE9D824CA89B" see="Fahrstrasse_ID256" id="ID256" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Bereichsende Fahrweg bei Wirkrichtung des Zielsignals in Topologierichtung</iso:title>
	<iso:p>
		<planpro:description>
			Ist die Wirkrichtung des Zielsignals des Fahrwegs identisch mit der Topologierichtung, muss der Wert von Begrenzung_B
			dem Abstand des Zielsignals vom Anfang der TOP_Kante entsprechen (Toleranz ± 0,01 m).  Sind mehrere Teilbereiche 
			vorhanden, muss im betrachteten Teilbereich außerdem für das Attribut Begrenzung_A der Wert "0.000" definiert sein.
			
			Wenn Fstr_Fahrweg.ID_Ziel → Signal.Punkt_Objekt_TOP_Kante.Wirkrichtung == "in", dann muss für Bereichsobjekte dieser
			TOP_Kante [max(Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_B)  == Signal.Punkt_Objekt_TOP_Kante.Abstand]
			und, wenn Anzahl Fstr_Fahrweg.Bereich_Objekt_Teilbereich (für verschiedene TOP_Kanten)&gt; 1, dann muss für selbige
			TOP_Kante [min(Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A) == "0.000"] sein (Toleranz ± 0,01 m).
		</planpro:description>
		<planpro:comment>
			Um bei Signalen mit mehreren punktförmigen Verortungen die relevante punktförmige Verortung herauszufiltern:
			Signal.Punkt_Objekt_TOP_Kante.ID_TOP_Kante muss einer Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante entsprechen.
			
			Prüfung entfällt, falls
			- relevantes ID_Ziel nil
			- fehlendes referenziertes Signal
			- referenziertes Signal mit Wirkrichtung "gegen"
			- keine übereinstimmenden TOP_Kante zwischen referenziertem Signal und Fstr_Fahrweg.Bereich_Objekt_Teilbereich(en)
			- relevanter Abstand (im Signal) nil
			- relevante Begrenzung_A (in Fstr_Fahrweg.Bereich_Objekt_Teilbereich) nil
			- relevante Begrenzung_B (in Fstr_Fahrweg.Bereich_Objekt_Teilbereich) nil
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Wirkrichtung des Zielsignals des Fahrwegs stimmt mit der Topologierichtung überein und im betrachteten
				Teilbereich von Fstr_Fahrweg ist der Wert von Begrenzung_B gleich dem Abstand des Zielsignals vom Anfang 
				der TOP_Kante (Toleranz ± 0,01 m).
				Sofern ein weiterer Teilbereich existiert, ist für das Attribut Begrenzung_A der Wert "0.000" definiert.
			</planpro:success>
			<planpro:error>
				Die Wirkrichtung des Zielsignals des Fahrwegs stimmt mit der Topologierichtung überein, im betrachteten
				Teilbereich von Fstr_Fahrweg ist der Wert von Begrenzung_B jedoch ungleich dem Abstand des Zielsignals 
				vom Anfang der TOP_Kante (Toleranz ± 0,01 m) und/oder trotz der Existenz eines weiteren Teilbereichs ist 
				für das Attribut Begrenzung_A nicht der Wert "0.000" definiert.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Fahrweg</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-256(current(), /*)]">
		<iso:let name="Zielsignal" value="key('Signal', ID_Ziel/Wert, /*)[1]"/>
		<iso:let name="POT_Signal" value="$Zielsignal/Punkt_Objekt_TOP_Kante[Wirkrichtung/Wert = 'in']    [ID_TOP_Kante/Wert = current()/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert][1]"/>
		<iso:let name="BOT_Fahrweg" value="Bereich_Objekt_Teilbereich[ID_TOP_Kante/Wert = $POT_Signal/ID_TOP_Kante/Wert]"/>
		<iso:let name="Fahrweg_verschiedene_BOT_TOP-Kanten" value="distinct-values(Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert)"/>
		<iso:let name="genauigkeit" value="0.01"/>

		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="abs(max($BOT_Fahrweg/Begrenzung_B/fx:number-or-zero(Wert)) - fx:number-or-zero($POT_Signal/Abstand/Wert)) le $genauigkeit and    (count($Fahrweg_verschiedene_BOT_TOP-Kanten) = 1 or min($BOT_Fahrweg/Begrenzung_A/fx:number-or-zero(Wert)) = 0)">Die Wirkrichtung des Zielsignals des Fahrwegs stimmt mit der Topologierichtung überein, im betrachteten Teilbereich von Fstr_Fahrweg ist der Wert von Begrenzung_B jedoch ungleich dem Abstand des Zielsignals vom Anfang der TOP_Kante (Toleranz +/- 0,01 m) und/oder trotz der Existenz eines weiteren Teilbereichs ist für das Attribut Begrenzung_A nicht der Wert "0.000" definiert.</iso:assert>
	</iso:rule>
</iso:pattern>