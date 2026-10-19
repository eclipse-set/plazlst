<?xml version="1.0" encoding="UTF-8"?><planpro:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur">
	<iso:pattern fpi="09EB3268-EAEA-4371-BB90-890E5B5ACF17" see="Fahrstrasse_ID611" id="ID611-abstract" abstract="true" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3"><iso:title>Bereichsende Fahrweg bei Wirkrichtung des Zielsignals entgegen Topologierichtung</iso:title><iso:p>
			<planpro:description>
				Ist die Wirkrichtung des Zielsignals des Fahrwegs nicht identisch mit der Topologierichtung, 
				muss der Wert von Begrenzung-A dem Abstand des Zielsignals vom Anfang der TOP-Kante entsprechen (Toleranz ± 0,01 m).
				Sofern ein weiterer Teilbereich für den Fahrweg existiert,
				muss der Wert Begrenzung-B im betrachteten Teilbereich gleich der Länge der TOP-Kante sein (Toleranz ± 0,01 m). 
				
				Wenn Fstr_Fahrweg.ID_Ziel → Signal.Punkt_Objekt_TOP_Kante.Wirkrichtung == "gegen", 
				dann muss für Signal.Punkt_Objekt_TOP_Kante.ID_TOP_Kante → TOP_Kante 
				← Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante gelten: 
				Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A == Signal.Punkt_Objekt_TOP_Kante.Abstand (Toleranz ± 0,01 m).
				Wenn Anzahl Fstr_Fahrweg.Bereich_Objekt_Teilbereich für verschiedene TOP_Kanten &gt; 1,
				dann muss für Signal.Punkt_Objekt_TOP_Kante.ID_TOP_Kante → TOP_Kante 
				← Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante gelten: 
				Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_B == Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante → TOP_Kante.TOP_Kante_Allg.TOP_Laenge] (Toleranz ± 0,01 m). 
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
				- referenzierte TOP_Kante fehlend
				- relevante TOP_Laenge (in TOP_Kante_Allg) nil 
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Signalverortung und Fahrwegdefinition sind konsistent. 
					Die Wirkrichtung des Zielsignals des Fahrwegs stimmt nicht mit der Topologierichtung überein und
					der Wert von Begrenzung-A entspricht dem Abstand des Startsignals vom Anfang der TOP-Kante (Toleranz ± 0,01 m).
					Bei Existenz eines weiteren Teilbereichs für den Fahrweg auf einer weiteren TOP-Kante ist der Wert von 
					Begrenzung-B im betrachteten Teilbereich gleich der Länge der TOP-Kante (Toleranz ± 0,01 m). 
				</planpro:success>
				<planpro:error>
					Signalverortung und Fahrwegdefinition sind inkonsistent. 
					Die Wirkrichtung des Zielsignals des Fahrwegs stimmt mit der Topologierichtung nicht überein,
					jedoch entspricht der Wert von Begrenzung-A nicht dem Abstand des Zielsignals vom Anfang der TOP-Kante (Toleranz ± 0,01 m).
					[Der Wert von Begrenzung-B im betrachteten Teilbereich entspricht trotz Existenz eines weiteren Teilbereichs 
					nicht der Länge der TOP-Kante (Toleranz ± 0,01 m).] 
				</planpro:error>
			</planpro:test>
			<planpro:output>Fstr_Fahrweg</planpro:output>
		</iso:p><iso:include href="../incomplete/Fstr_Fahrweg-nil_Signalreferenz.xml"/><iso:include href="../incomplete/Fstr_Fahrweg-miss_Signal.xml"/><iso:include href="../incomplete/Fstr_Fahrweg-miss_same_TOP_Kante.xml"/><iso:include href="../incomplete/Fstr_Fahrweg-nil_Signal-Wirkrichtung.xml"/><iso:include href="../incomplete/Fstr_Fahrweg-nil_Signal-Abstand.xml"/><iso:include href="../incomplete/Fstr_Fahrweg-nil_Begrenzung_A_B.xml"/><iso:include href="../incomplete/Fstr_Fahrweg-miss_Signal-TOP_Kante.xml"/><iso:include href="../incomplete/Fstr_Fahrweg-nil_TOP_Laenge.xml"/><iso:rule role="$Role" context="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-255(current(), /*, $Signal-Referenz, $Wirkrichtung)]">
			<iso:let name="Signal" value="key('Signal', $Signal-Referenz/Wert, /*)[1]"/>
			<iso:let name="POT_Signal" value="$Signal/Punkt_Objekt_TOP_Kante[Wirkrichtung/Wert = $Wirkrichtung]     [ID_TOP_Kante/Wert = current()/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert][1]"/>
			<iso:let name="BOT_Fahrweg" value="Bereich_Objekt_Teilbereich[ID_TOP_Kante/Wert = $POT_Signal/ID_TOP_Kante/Wert]"/>
			<iso:let name="TOP_Kante_Signal" value="key('TOP_Kante', $POT_Signal/ID_TOP_Kante/Wert, /*)"/>
			<iso:let name="Fahrweg_verschiedene_BOT_TOP-Kanten" value="distinct-values(Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert)"/>
			<iso:let name="genauigkeit" value="0.01"/>
			<iso:let name="weitereBOT-Bfalsch" value="count($Fahrweg_verschiedene_BOT_TOP-Kanten) != 1 and      abs(max($BOT_Fahrweg/Begrenzung_B/fx:number-or-zero(Wert)) - fx:number-or-zero($TOP_Kante_Signal/TOP_Kante_Allg/TOP_Laenge/Wert)) gt $genauigkeit"/>
			
			<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="abs(min($BOT_Fahrweg/Begrenzung_A/fx:number-or-zero(Wert)) - fx:number-or-zero($POT_Signal/Abstand/Wert)) gt $genauigkeit or      $weitereBOT-Bfalsch">Signalverortung und Fahrwegdefinition sind inkonsistent. Die Wirkrichtung des Zielsignals des Fahrwegs stimmt mit der Topologierichtung nicht überein, jedoch entspricht der Wert von Begrenzung-A nicht dem Abstand des Zielsignals vom Anfang der TOP-Kante (Toleranz +/- 0,01 m).<iso:value-of select="if ($weitereBOT-Bfalsch) then ' Der Wert von Begrenzung-B im betrachteten Teilbereich entspricht trotz Existenz eines weiteren Teilbereichs nicht der Länge der TOP-Kante (Toleranz +/- 0,01 m).' else ''"/></iso:report>
		</iso:rule></iso:pattern>
	
	<iso:pattern is-a="ID611-abstract" id="ID611"><iso:param name="Role" value="warning"/><iso:param name="Signal-Referenz" value="ID_Ziel"/><iso:param name="Wirkrichtung" value="'gegen'"/><iso:param name="ignore-Wirkrichtung" value="('in', 'beide')"/></iso:pattern>
</planpro:pattern>