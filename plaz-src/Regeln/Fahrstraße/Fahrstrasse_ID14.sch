<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="FED21216-FC8D-45A1-AF1B-59521C23674A" see="Fahrstrasse_ID14" id="ID14" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Begrenzung des Fahrwegs einer Zugstraße (Start)</iso:title>
	<iso:p>
		<planpro:description>
			Prüfung, ob ein zu einer Zugstraße gehörender Fahrweg an den dafür vorgesehenen Signalen beginnt
			(ohne Blockabschnitt und Gruppenausfahrt).
			
			Wenn Fstr_Zug_Rangier.Fstr_Zug gefüllt und Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_Art ≠ "B" und
			Fstr_Zug_Rangier.Fstr_Zug.ID_Signal_Gruppenausfahrt nicht vohanden ist,
			
			dann muss Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Start ein Signal mit
			Signal.Signal_Real.Signal_Real_Aktiv_Schirm.Signal_Art == "Hauptsignal", "Hauptsperrsignal",
			"Hauptsperrsignal Ne 14 Ls", "Mehrabschnittssignal", "Mehrabschnittssperrsignal",
			("Sperrsignal" mit Signal.Signal_Real.Funktion_Ohne_Signal == "ZS"),
			(Signal (∃ Signal.Signal_Real ∧ ∄ (Signal.Signal_Real.Signal_Real_Aktiv ∧ Signal.Signal_Real.Signal_Real_Aktiv_Schirm) ∧ 
			Signal ← Signal_Rahmen.ID_Signal ← Signal_Rahmen ← Signal_Signalbegriff.ID_Signal_Rahmen
			→ Signal_Signalbegriff.Signalbegriff_ID == ("Ne_14" ∨ "Oz_Bk")
			oder Signal.Signal_Fiktiv.Fiktives_Signal_Funktion == "FAP_Start",  "Zentralblock_Start", "Zug_Start_Awanst",
			"Zug_Start_ohne_Signal", "Zug_Start_Ziel_Bk", "Zug_Start_Ziel_Bk_mit_Zs_1", "Zug_Start_Ziel_Bk_mit_Zs_7",
			"Zug_Start_Ziel_Ne_14", "Zug_Start_Ziel_Ne_14_mit_Zs_1", "Zug_Start_Ziel_Ne_14_mit_Zs_7", "Zug_Start_Ziel_Ne_14_mit_Zs_8"
			oder "sonstige" sein.
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls
			- relevante Fstr_Zug_Art nil
			- relevante ID_Fstr_Fahrweg nil
			- fehlender referenzierter Fstr_Fahrweg
			- relevantes ID_Start nil
			- fehlendes referenziertes Signal
			- relevante Signal_Art nil
			- relevante Fiktives_Signal_Funktion nil
			- fehlender relevanter Signal_Rahmen
			- vorhandene ID_Signal_Gruppenausfahrt
			- relevante ID_Signal_Gruppenausfahrt nil
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Zugstraße (ohne Blockabschnitt und Gruppenausfahrt) beginnt an einem Hauptsignal, Hauptsperrsignal, 
				Hauptsperrsignal Ne 14 + Ls, alleinstehenden Ne 14, Mehrabschnittssignal, Mehrabschnittssperrsignal, Blockkennzeichen oder 
				einem Rangiersignal mit Funktion ohne Signal "ZS" oder einem fiktiven Signal mit der Funktion FAP-Start, Zentralblock-Start,
				Zug-Start Awanst, Zug-Start ohne Signal, Zug-Start/-Ziel Bk, Zug-Start/-Ziel Bk mit Zs 1, Zug-Start/-Ziel Bk mit Zs 7, 
				Zug-Start/-Ziel Ne 14, Zug-Start/-Ziel Ne 14 mit Zs 1, Zug-Start/-Ziel Ne 14 mit Zs 7, Zug-Start/-Ziel Ne 14 mit Zs 8
				oder sonstige. 
			</planpro:success>
			<planpro:error>
				Die Zugstraße (ohne Blockabschnitt und Gruppenausfahrt) beginnt nicht an einem Hauptsignal, Hauptsperrsignal, 
				Hauptsperrsignal Ne 14 + Ls, alleinstehenden Ne 14, Mehrabschnittssignal, Mehrabschnittssperrsignal, Blockkennzeichen oder 
				einem Rangiersignal mit Funktion ohne Signal "ZS" oder einem fiktiven Signal mit der Funktion FAP-Start, Zentralblock-Start,
				Zug-Start Awanst, Zug-Start ohne Signal, Zug-Start/-Ziel Bk, Zug-Start/-Ziel Bk mit Zs 1, Zug-Start/-Ziel Bk mit Zs 7,
				Zug-Start/-Ziel Ne 14, Zug-Start/-Ziel Ne 14 mit Zs 1, Zug-Start/-Ziel Ne 14 mit Zs 7, Zug-Start/-Ziel Ne 14 mit Zs 8
				oder sonstige.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Zug][Fstr_Zug/Fstr_Zug_Art/Wert != 'B'][not(Fstr_Zug/ID_Signal_Gruppenausfahrt)]">
		<iso:let name="current_Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>		
		<iso:let name="Start_Signal" value="key('Signal', $current_Fahrweg/ID_Start/Wert, /*)"/>	  	
		
		<!-- gefundene Signalarten -->
		<iso:let name="Signal_Real_Art" value="$Start_Signal/Signal_Real/Signal_Real_Aktiv_Schirm/Signal_Art/Wert"/>
		<iso:let name="Signal_Fiktiv_Funktion" value="$Start_Signal/Signal_Fiktiv/Fiktives_Signal_Funktion/Wert"/>
		<iso:let name="Signal_Real" value="$Start_Signal/Signal_Real[not(Signal_Real_Aktiv|Signal_Real_Aktiv_Schirm)]"/>
		<iso:let name="Signal_Rahmen" value="key('Signal_Rahmen-fuerSignal', $Start_Signal/Identitaet/Wert, /*)"/>
		<iso:let name="Signal_Begriff" value="key('Signal_Signalbegriff-fuerSignal_Rahmen', $Signal_Rahmen/Identitaet/Wert, /*)"/>
		<iso:let name="Signalbegriff_Typ" value="$Signal_Begriff/Signalbegriff_ID/substring-after(@xsi:type,':')"/>
		
    	<!-- gesuchte Signalarten -->
		<iso:let name="Signal_Real_Art_zulaessig" value="('Hauptsignal', 'Hauptsperrsignal', 'Hauptsperrsignal Ne 14 Ls',    'Mehrabschnittssignal', 'Mehrabschnittssperrsignal')"/>
		<iso:let name="Signal_Fiktiv_Funktion_zulaessig" value="('FAP_Start', 'Zentralblock_Start', 'Zug_Start_Awanst',    'Zug_Start_ohne_Signal', 'Zug_Start_Ziel_Bk', 'Zug_Start_Ziel_Bk_mit_Zs_1', 'Zug_Start_Ziel_Bk_mit_Zs_7',     'Zug_Start_Ziel_Ne_14', 'Zug_Start_Ziel_Ne_14_mit_Zs_1', 'Zug_Start_Ziel_Ne_14_mit_Zs_7', 'Zug_Start_Ziel_Ne_14_mit_Zs_8',    'sonstige')"/>
		
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Signal_Real_Art = $Signal_Real_Art_zulaessig or             $Signal_Fiktiv_Funktion = $Signal_Fiktiv_Funktion_zulaessig or            ($Signal_Real_Art = 'Sperrsignal' and $Start_Signal/Signal_Real/Funktion_Ohne_Signal/Wert = 'ZS') or            ($Signal_Real and $Signalbegriff_Typ = ('Ne_14', 'Oz_Bk'))">Die Zugstraße (ohne Blockabschnitt und Gruppenausfahrt) beginnt nicht an einem Hauptsignal, Hauptsperrsignal, Hauptsperrsignal Ne 14 + Ls, alleinstehenden Ne 14, Mehrabschnittssignal, Mehrabschnittssperrsignal, Blockkennzeichen oder einem Rangiersignal mit Funktion ohne Signal "ZS" oder einem fiktiven Signal mit der Funktion FAP-Start, Zentralblock-Start, Zug-Start Awanst, Zug-Start ohne Signal, Zug-Start/-Ziel Bk, Zug-Start/-Ziel Bk mit Zs 1, Zug-Start/-Ziel Bk mit Zs 7, Zug-Start/-Ziel Ne 14, Zug-Start/-Ziel Ne 14 mit Zs 1, Zug-Start/-Ziel Ne 14 mit Zs 7, Zug-Start/-Ziel Ne 14 mit Zs 8 oder sonstige.</iso:assert>	
  </iso:rule>
</iso:pattern>