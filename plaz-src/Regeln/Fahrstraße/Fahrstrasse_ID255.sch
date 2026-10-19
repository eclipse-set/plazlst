<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" fpi="4D550DE9-494C-471c-A487-B880860E7461" see="Fahrstrasse_ID255" id="ID255" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Bereichsende Fahrweg bei Wirkrichtung des Startsignals in Topologierichtung</iso:title>
	<iso:p>
		<planpro:description>
			Ist die Wirkrichtung des Startsignals des Fahrwegs identisch mit der Topologierichtung, muss für den entsprechenden
			Teilbereich des Fahrwegs das Attribut Begrenzung_A dem Abstand des Startsignals vom Anfang der TOP_Kante entsprechen.
			Sofern ein weiterer Teilbereich für den Fahrweg existiert, muss außerdem der Wert von Begrenzung_B im betrachteten
			Teilbereich gleich der Länge der TOP_Kante sein (Toleranz ± 0,01 m).
			
			Wenn Fstr_Fahrweg.ID_Start → Signal.Punkt_Objekt_TOP_Kante.Wirkrichtung == "in", dann muss für Bereichsobjekte dieser
			TOP_Kante [min(Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A) == Signal.Punkt_Objekt_TOP_Kante.Abstand
			(Toleranz ± 0,01 m)] und,
			wenn Anzahl Fstr_Fahrweg.Bereich_Objekt_Teilbereich (für verschiedene TOP_Kanten) &gt; 1,
			dann muss für selbige TOP_Kante[max(Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_B) == 
			Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante → TOP_Kante.TOP_Kante_Allg.TOP_Laenge] (Toleranz ± 0,01 m)
			sein.
		</planpro:description>
		<planpro:comment>
			Um bei Signalen mit mehreren punktförmigen Verortungen die relevante punktförmige Verortung herauszufiltern: 
			Signal.Punkt_Objekt_TOP_Kante.ID_TOP_Kante muss einer Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante entsprechen.
			
			Prüfung entfällt, falls
			- relevantes ID_Start nil
			- fehlendes referenziertes Signal
			- keine übereinstimmenden TOP_Kante zwischen referenziertem Signal und Fstr_Fahrweg.Bereich_Objekt_Teilbereich(en)
			- relevante Wirkrichtung (im Signal) nil
			- relevanter Abstand (im Signal) nil
			- relevante Begrenzung_A (in Fstr_Fahrweg.Bereich_Objekt_Teilbereich) nil
			- relevante Begrenzung_B (in Fstr_Fahrweg.Bereich_Objekt_Teilbereich) nil
			- fehlende referenzierte TOP_Kante
			- relevante TOP_Laenge (in TOP_Kante_Allg) nil
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Wirkrichtung des Startsignals des Fahrwegs stimmt mit der Topologierichtung überein und in Fstr_Fahrweg ist der Wert von 
				Begrenzung_A gleich dem Abstand des Startsignals vom Anfang der TOP_Kante. Sofern ein weiterer Teilbereich existiert, muss der Wert von 
				Begrenzung_B im betrachteten Teilbereich der Länge der TOP_Kante (Toleranz ± 0,01 m) entsprechen.
			</planpro:success>
			<planpro:error>
				Die Wirkrichtung des Startsignals des Fahrwegs stimmt mit der Topologierichtung überein, jedoch ist in Fstr_Fahrweg der Wert von 
				Begrenzung_A nicht gleich dem Abstand des Startsignals vom Anfang der TOP_Kante und/oder der Wert von Begrenzung_B im betrachteten Teilbereich 
				entspricht trotz Vorhandensein eines weiteren Teilbereichs nicht der Länge der TOP_Kante (Toleranz ± 0,01 m).
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Fahrweg</planpro:output>
	</iso:p>
	
	<iso:include href="../incomplete/Fstr_Fahrweg-nil_ID_Start-W.xml"/>
	<iso:include href="../incomplete/Fstr_Fahrweg-miss_Start_Signal-W.xml"/>
	<iso:include href="../incomplete/Fstr_Fahrweg-miss_same_TOP_Kante-W.xml"/>
	<iso:include href="../incomplete/Fstr_Fahrweg-nil_Start_Signal_POT_Wirkrichtung-W.xml"/>
	<iso:include href="../incomplete/Fstr_Fahrweg-nil_Start_Signal_POT_Abstand-W.xml"/>
	<iso:include href="../incomplete/Fstr_Fahrweg-nil_BOT_Begrenzung_A_Begrenzung_B-W.xml"/>
	<iso:include href="../incomplete/Fstr_Fahrweg-miss_TOP_Kante-W.xml"/>
	<iso:include href="../incomplete/Fstr_Fahrweg-nil_TOP_Laenge-W.xml"/>
		
	<iso:rule role="warning" context="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-255(current(), /*)]">
		<iso:let name="Startsignal" value="key('Signal', ID_Start/Wert, /*)[1]"/>
		<iso:let name="POT_Signal" value="$Startsignal/Punkt_Objekt_TOP_Kante[Wirkrichtung/Wert = 'in']    [ID_TOP_Kante/Wert = current()/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert][1]"/>
		<iso:let name="BOT_Fahrweg" value="Bereich_Objekt_Teilbereich[ID_TOP_Kante/Wert = $POT_Signal/ID_TOP_Kante/Wert]"/>
		<iso:let name="TOP_Kante_Signal" value="key('TOP_Kante', $POT_Signal/ID_TOP_Kante/Wert, /*)"/>
		<iso:let name="Fahrweg_verschiedene_BOT_TOP-Kanten" value="distinct-values(Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert)"/>
		<iso:let name="genauigkeit" value="0.01"/>

		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="abs(min($BOT_Fahrweg/Begrenzung_A/fx:number-or-zero(Wert)) - fx:number-or-zero($POT_Signal/Abstand/Wert)) le $genauigkeit and              (count($Fahrweg_verschiedene_BOT_TOP-Kanten) = 1 or              abs(max($BOT_Fahrweg/Begrenzung_B/fx:number-or-zero(Wert)) - fx:number-or-zero($TOP_Kante_Signal/TOP_Kante_Allg/TOP_Laenge/Wert)) le $genauigkeit)">Die Wirkrichtung des Startsignals des Fahrwegs stimmt mit der Topologierichtung überein, jedoch ist in Fstr_Fahrweg der Wert von Begrenzung_A nicht gleich dem Abstand des Startsignals vom Anfang der TOP_Kante und/oder der Wert von Begrenzung_B im betrachteten Teilbereich entspricht trotz Vorhandensein eines weiteren Teilbereichs nicht der Länge der TOP_Kante (Toleranz +/- 0,01 m).</iso:assert>
	</iso:rule>
	
	
	
	
</iso:pattern>