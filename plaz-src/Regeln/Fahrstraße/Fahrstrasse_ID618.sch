<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="9677F87C-6992-40DB-92A6-0FC47241B485" see="Fahrstrasse_ID618" id="ID618" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Korrektes Zs 3 für Zugstraße - Restriktionen Fahrweg</iso:title>
	<iso:p>
		<planpro:description>
			Die mittels Zs 3 gezeigte Geschwindigkeit am Fahrstraßenstart darf nicht größer sein als die im befahrenen Teil
			(Fstr_V_Hg, Weichen-/Kreuzungs-Komponenten, Gleisabschnitte) hinterlegten Geschwindigkeiten.
			
			Wenn Fstr_Signalisierung.ID_Signal_Signalbegriff → Signal_Signalbegriff.Signalbegriff_ID == "Zs_3" ∧
			this.Signal_Signalbegriff.ID_Signal_Rahmen → Signal_Rahmen.ID_Signal → Signal ← Fstr_Fahrweg.ID_Start ←
			Fstr_Zug_Rangier.ID_Fstr_Fahrweg ∧ ∃ Fstr_Zug_Rangier.Fstr_Zug, 
			
			dann muss 10 * Zs_3.Symbol ≤
			{Fstr_Signalisierung.ID_Fstr_Zug_Rangier → Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.Fstr_V_Hg;
			Gleis_Abschnitt.Geschwindigkeit (für alle Gleis_Abschnitt, die durch Fstr_Fahrweg (Fstr_Zug_Rangier.ID_Fstr_Fahrweg)
			überdeckt werden);
			W_Kr_Gsp_Komponente.Zungenpaar.Geschwindigkeit_L;
			W_Kr_Gsp_Komponente.Zungenpaar.Geschwindigkeit_R;
			W_Kr_Gsp_Komponente.Kreuzung.Geschwindigkeit_L;
			W_Kr_Gsp_Komponente.Kreuzung.Geschwindigkeit_R 
			[für alle W_Kr_Gsp_Komponente, deren topologische Verortung 
			(ermittelbar über W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.ID_TOP_Kante / W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Abstand)
			innerhalb eines Teilbereichs von Fstr_Fahrweg liegt]} 
			sein.
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls
			- relevante ID_Signal_Signalbegriff nil
			- referenziertes Signal_Signalbegriff fehlend
			- referenzierte Signalbegriff_ID nicht 'Zs_3'
			- relevante ID_Fstr_Zug_Rangier nil
			- referenziertes Fstr_Zug_Rangier fehlend
			- relevante ID_Fstr_Fahrweg nil
			- referenziertes Fstr_Fahrweg fehlend
			- relevantes Fstr_V_Hg fehlend
			- kein Gleis_Abschnitt auf TOP_Kante aus Fstr_Fahrweg
			- in Gleis_Abschnitt oder Fstr_Fahrweg Begrenzung_A oder Begrenzung_B nil
			- in Gleis_Abschnitt Geschwindigkeit nicht vorhanden
			- in W_Kr_Gsp_Komponente Abstand nil
			- in TOP_Kante TOP_Anschluss_A oder TOP_Anschluss_B nil
			- in W_Kr_Gsp_Komponente Geschwindigkeit_L oder Geschwindigkeit_R nil
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist nicht größer als die im befahrenen Teil (Fahrweg) bzw. den 
				zugehörigen Fahrwegelementen und Gleisabschnitten hinterlegten Geschwindigkeiten.
			</planpro:success>
			<planpro:error>
				Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist größer als die im befahrenen Teil (Fahrweg) bzw. den 
				zugehörigen Fahrwegelementen und Gleisabschnitten hinterlegten Geschwindigkeiten.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Signalisierung</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_Signalisierung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-639(current(), /*)]">
		<iso:let name="Symbol" value="key('Signal_Signalbegriff', ID_Signal_Signalbegriff/Wert, /*)/Signalbegriff_ID/Symbol"/>
		<iso:let name="Fstr_Zug_Rangier" value="key('Fstr_Zug_Rangier', ID_Fstr_Zug_Rangier/Wert, parent::*)"/>
		<iso:let name="Fstr_Fahrweg" value="key('Fstr_Fahrweg', $Fstr_Zug_Rangier/ID_Fstr_Fahrweg/Wert, parent::*)"/>
		<iso:let name="Fstr_Fahrweg_BOT" value="$Fstr_Fahrweg/Bereich_Objekt_Teilbereich"/>
		<iso:let name="Fahrweg_V" value="$Fstr_Fahrweg/Fstr_V_Hg"/>
		<iso:let name="Gleis_Abschnitt_BOT" value="key('Gleis_Abschnitt_BOT-fuerTOP_Kante',     $Fstr_Fahrweg_BOT/ID_TOP_Kante/Wert, parent::*)"/>
		
		<!-- alle Gleisabschnitte/BOT unter der Bedingung, dass die ID_TOP_Kanten mit den Fahrweg/TOP_Kanten übereinstimmen
			 und für diese betroffenen Teilbereiche zusätzlich gilt, dass sie teilweise den Fahrweg-Teilbereich überdecken -->
		<iso:let name="Gleisabschnitt_ueberdeckt" value="for $i in $Gleis_Abschnitt_BOT return    $i[ID_TOP_Kante = $Fstr_Fahrweg_BOT    [(fx:number-or-zero(Begrenzung_A/Wert) le fx:number-or-zero($i/Begrenzung_A/Wert) and      fx:number-or-zero(Begrenzung_B/Wert) ge fx:number-or-zero($i/Begrenzung_A/Wert)) or     (fx:number-or-zero(Begrenzung_B/Wert) ge fx:number-or-zero($i/Begrenzung_B/Wert) and      fx:number-or-zero(Begrenzung_A/Wert) le fx:number-or-zero($i/Begrenzung_B/Wert))]/ID_TOP_Kante]"/>

		<iso:let name="Gleisabschnitt_Geschwindigkeiten" value="$Gleisabschnitt_ueberdeckt/../Geschwindigkeit"/>

		<!-- alle betroffenen TOP_Kanten unter der Bedingung, dass in Fahrweg/Bereich_Objekt_Teilbereich/Begrenzung_A = 0 und
			TOP_Anschluss_A gleich Rechts oder Links -->
		<iso:let name="Fstr_Fahrweg_BOT_TOP_Kanten" value="$Fstr_Fahrweg_BOT[fx:number-or-zero(Begrenzung_A) = 0.000]/ID_TOP_Kante/Wert"/>
		<iso:let name="betroffene_TOP_Kanten" value="key('TOP_Kante', $Fstr_Fahrweg_BOT_TOP_Kanten, /*)"/>
		<iso:let name="betroffene-TOP_Kanten-Anfaenge" value="$betroffene_TOP_Kanten[*/TOP_Anschluss_A/Wert = ('Rechts', 'Links')]"/>
		
		<!-- alle W_Kr-Komponenten bzw. deren Geschwindigkeiten unter der Bedingung,
			dass Punkt_Objekt_TOP_Kante in betroffenen TOP_Kanten enthalten und darin auch Abstand = 0 ist,
			dann darin bei TOP_Anschluss_A Rechts bzw. Links die Geschwindigkeit_R bzw. Geschwindigkeit_L auswählen -->

		<iso:let name="W_Kr_-Geschwindigkeiten-amKnotenAnfang" value="for $i in $betroffene-TOP_Kanten-Anfaenge return    key('W_Kr_Gsp_Komponente_POT-fuerTOP_Kante', $i/Identitaet/Wert, /*)    [fx:number-or-zero(Abstand/Wert) = 0.000]/../(Zungenpaar|Kreuzung)/    (Geschwindigkeit_L[$i/*/TOP_Anschluss_A/Wert = 'Links'] | Geschwindigkeit_R[$i/*/TOP_Anschluss_A/Wert = 'Rechts'])"/>


		<!-- alle betroffenen TOP_Kanten unter der Bedingung, dass in Fahrweg/Bereich_Objekt_Teilbereich/Begrenzung_B = (Zahl) 
			und TOP_Kante/TOP_Laenge/Wert = (Zahl) und TOP_Anschluss_B gleich Rechts oder Links -->
		<iso:let name="betroffene-TOP_Kanten-Enden" value="for $i in $Fstr_Fahrweg_BOT return     key('TOP_Kante', $i/ID_TOP_Kante/Wert, /*)     [fx:number-or-zero(*/TOP_Laenge/Wert) = fx:number-or-zero($i/Begrenzung_B/Wert)]     [*/TOP_Anschluss_B/Wert = ('Rechts', 'Links')]"/>
		
		<!-- alle W_Kr-Komponenten bzw. deren Geschwindigkeiten unter der Bedingung,
			dass Punkt_Objekt_TOP_Kante in betroffenen TOP_Kanten enthalten und darin auch Abstand = TOP_Laenge ist,
			dann darin bei TOP_Anschluss_B Rechts bzw. Links die Geschwindigkeit_R bzw. Geschwindigkeit_L auswählen -->
		<iso:let name="W_Kr_-Geschwindigkeiten-amKnotenEnde" value="for $i in $betroffene-TOP_Kanten-Enden return    key('W_Kr_Gsp_Komponente_POT-fuerTOP_Kante', $i/Identitaet/Wert, /*)    [fx:number-or-zero(Abstand/Wert) = fx:number-or-zero($i/*/TOP_Laenge/Wert)]/../(Zungenpaar|Kreuzung)/    (Geschwindigkeit_L[$i/*/TOP_Anschluss_B/Wert = 'Links'] | Geschwindigkeit_R[$i/*/TOP_Anschluss_B/Wert = 'Rechts'])"/>
		
		<!-- Zusammenfassung der Geschwindigkeiten für befahrene Weichenschenkel -->
		<iso:let name="Weichen_Geschwindigkeiten" value="$W_Kr_-Geschwindigkeiten-amKnotenAnfang | $W_Kr_-Geschwindigkeiten-amKnotenEnde"/>
		
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="every $i in ($Fahrweg_V | $Gleisabschnitt_Geschwindigkeiten | $Weichen_Geschwindigkeiten)/Wert satisfies      fx:number-or-zero($i) ge 10*fx:number-or-zero($Symbol)">Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist größer als die im befahrenen Teil (Fahrweg) bzw. den zugehörigen Fahrwegelementen und Gleisabschnitten hinterlegten Geschwindigkeiten.</iso:assert>
  </iso:rule>
</iso:pattern>