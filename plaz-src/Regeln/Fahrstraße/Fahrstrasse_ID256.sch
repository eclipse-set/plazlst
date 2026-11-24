<?xml version="1.0" encoding="UTF-8"?><planpro:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur">
	<iso:pattern fpi="0F7F823C-0DAF-4E8B-9776-DE9D824CA89B" see="Fahrstrasse_ID256" id="ID256-abstract" abstract="true" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3"><iso:title>Bereichsende Fahrweg bei Wirkrichtung des Zielsignals in Topologierichtung</iso:title><iso:p>
			<planpro:description>
				Ist die Wirkrichtung des Zielsignals des Fahrwegs identisch mit der Topologierichtung, 
				muss der Wert von Begrenzung-B dem Abstand des Zielsignals vom Anfang der TOP-Kante entsprechen (Toleranz ± 0,01 m).
				Sofern ein weiterer Teilbereich für den Fahrweg existiert, 
				muss der Wert Begrenzung-A im betrachteten Teilbereich gleich "0.000" sein. 
				
				Wenn Fstr_Fahrweg.ID_Ziel → Signal.Punkt_Objekt_TOP_Kante.Wirkrichtung == "in", 
				dann muss für Signal.Punkt_Objekt_TOP_Kante.ID_TOP_Kante → TOP_Kante 
				← Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante gelten: 
				Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_B == Signal.Punkt_Objekt_TOP_Kante.Abstand (Toleranz ± 0,01 m).
				Wenn Anzahl Fstr_Fahrweg.Bereich_Objekt_Teilbereich für verschiedene TOP_Kanten &gt; 1, 
				dann muss für Signal.Punkt_Objekt_TOP_Kante.ID_TOP_Kante → TOP_Kante 
				← Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante gelten: 
				Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A == "0.000".  
			</planpro:description>
			<planpro:comment>
				Um bei Signalen mit mehreren punktförmigen Verortungen die relevante punktförmige Verortung herauszufiltern:
				Signal.Punkt_Objekt_TOP_Kante.ID_TOP_Kante muss einer Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante entsprechen.
				
				Bei mehreren Teilbereichen des Fahrwegs auf der betroffenen TOP-Kante wird das Minimum von Begrenzung_A und 
				das Maximum von Begrenzung_B gebildet: 
				[min(Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A)] und 
				[max(Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_B)] 
	
				Prüfung entfällt, falls
				- relevantes ID_Ziel nil
				- referenziertes Signal fehlend
				- keine übereinstimmenden TOP_Kante zwischen referenziertem Signal und Fstr_Fahrweg.Bereich_Objekt_Teilbereich(en)
				- relevante Wirkrichtung (im Signal) nil
				- relevanter Abstand (im Signal) nil
				- relevante Begrenzung_A (in Fstr_Fahrweg.Bereich_Objekt_Teilbereich) nil
				- relevante Begrenzung_B (in Fstr_Fahrweg.Bereich_Objekt_Teilbereich) nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Signalverortung und Fahrwegdefinition sind konsistent. 
					Die Wirkrichtung des Zielsignals des Fahrwegs stimmt mit der Topologierichtung überein und
					der Wert von Begrenzung-B entspricht dem Abstand des Zielsignals vom Anfang der TOP-Kante (Toleranz ± 0,01 m).
					Bei Existenz eines weiteren Teilbereichs für den Fahrweg auf einer weiteren TOP-Kante ist der Wert von Begrenzung-A im betrachteten Teilbereich gleich "0.000". 
				</planpro:success>
				<planpro:error>
					Signalverortung und Fahrwegdefinition sind inkonsistent. 
					Die Wirkrichtung des Zielsignals des Fahrwegs stimmt mit der Topologierichtung überein, 
					jedoch entspricht der Wert von Begrenzung-B nicht dem Abstand des Zielsignals vom Anfang der TOP-Kante (Toleranz ± 0,01 m).
					[Der Wert von Begrenzung-A im betrachteten Teilbereich ist trotz Existenz eines weiteren Teilbereichs nicht "0.000".] 
				</planpro:error>
			</planpro:test>
			<planpro:output>Fstr_Fahrweg</planpro:output>
		</iso:p><iso:include href="../incomplete/Fstr_Fahrweg-nil_Signalreferenz.xml"/><iso:include href="../incomplete/Fstr_Fahrweg-miss_Signal.xml"/><iso:include href="../incomplete/Fstr_Fahrweg-miss_same_TOP_Kante.xml"/><iso:include href="../incomplete/Fstr_Fahrweg-nil_Signal-Wirkrichtung.xml"/><iso:include href="../incomplete/Fstr_Fahrweg-nil_Signal-Abstand.xml"/><iso:include href="../incomplete/Fstr_Fahrweg-nil_Begrenzung_A_B.xml"/><iso:rule role="$Role" context="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-255(current(), /*, $Signal-Referenz, $Wirkrichtung)]">
			<iso:let name="Signal" value="key('Signal', $Signal-Referenz/Wert, /*)[1]"/>
			<iso:let name="POT_Signal" value="$Signal/Punkt_Objekt_TOP_Kante[Wirkrichtung/Wert = $Wirkrichtung]     [ID_TOP_Kante/Wert = current()/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert][1]"/>
			<iso:let name="BOT_Fahrweg" value="Bereich_Objekt_Teilbereich[ID_TOP_Kante/Wert = $POT_Signal/ID_TOP_Kante/Wert]"/>
			<iso:let name="Fahrweg_verschiedene_BOT_TOP-Kanten" value="distinct-values(Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert)"/>
			<iso:let name="genauigkeit" value="0.01"/>
			<iso:let name="weitereBOT-Afalsch" value="count($Fahrweg_verschiedene_BOT_TOP-Kanten) != 1 and min($BOT_Fahrweg/Begrenzung_A/fx:number-or-zero(Wert)) != 0"/>
	
			<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="abs(max($BOT_Fahrweg/Begrenzung_B/fx:number-or-zero(Wert)) - fx:number-or-zero($POT_Signal/Abstand/Wert)) gt $genauigkeit or     $weitereBOT-Afalsch">Signalverortung und Fahrwegdefinition sind inkonsistent. Die Wirkrichtung des Zielsignals des Fahrwegs stimmt mit der Topologierichtung überein, jedoch entspricht der Wert von Begrenzung-B nicht dem Abstand des Zielsignals vom Anfang der TOP-Kante (Toleranz +/- 0,01 m).<iso:value-of select="if ($weitereBOT-Afalsch) then ' Der Wert von Begrenzung-A im betrachteten Teilbereich ist trotz Existenz eines weiteren Teilbereichs nicht 0.000.' else ''"/></iso:report>
		</iso:rule></iso:pattern>
	
	<iso:pattern is-a="ID256-abstract" id="ID256"><iso:param name="Role" value="warning"/><iso:param name="Signal-Referenz" value="ID_Ziel"/><iso:param name="Wirkrichtung" value="'in'"/><iso:param name="ignore-Wirkrichtung" value="('gegen', 'beide')"/></iso:pattern>
</planpro:pattern>