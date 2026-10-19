<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="EB1EC8F9-3899-4C85-90A6-B76BEA99FBDB" see="Fahrstrasse_ID312" id="ID312" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Begrenzung des Fahrwegs einer Zugstraße (Ziel)</iso:title>
	<iso:p>
		<planpro:description>
			Prüfung, ob ein zu einer Zugstraße gehörender Fahrweg an den dafür vorgesehenen Signalen endet.
			
			Wenn Fstr_Zug_Rangier.Fstr_Zug gefüllt ist, muss Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel 
			ein Signal mit Signal.Signal_Real.Signal_Real_Aktiv_Schirm.Signal_Art == "Hauptsignal", "Hauptsperrsignal",
			"Hauptsperrsignal Ne 14 Ls", "Mehrabschnittssignal", "Mehrabschnittssperrsignal", "Zugdeckungssignal",
			("Sperrsignal" mit Signal.Signal_Real.Signal_Funktion == "Zug_Ziel_Signal"),
			(Signal (∃ Signal.Signal_Real ∧ ∄ (Signal.Signal_Real.Signal_Real_Aktiv ∧ Signal.Signal_Real.Signal_Real_Aktiv_Schirm) ∧
			Signal ← Signal_Rahmen.ID_Signal ← Signal_Rahmen ← Signal_Signalbegriff.ID_Signal_Rahmen
			→ Signal_Signalbegriff.Signalbegriff_ID == ("Ne_14" ∨ "Oz_Bk") oder
			Signal.Signal_Fiktiv.Fiktives_Signal_Funktion == "FAP_Ziel", "sonstige", "Zentralblock_Ziel", "Zug_Ziel_Awanst",
			"Zug_Ziel_ohne_Signal", "Zug_Ziel_Strecke", "Zug_Start_Ziel_Bk", "Zug_Start_Ziel_Bk_mit_Zs_1", "Zug_Start_Ziel_Bk_mit_Zs_7"
			oder "Zug_Start_Ziel_Ne_14", "Zug_Start_Ziel_Ne_14_mit_Zs_1", "Zug_Start_Ziel_Ne_14_mit_Zs_7", "Zug_Start_Ziel_Ne_14_mit_Zs_8" sein).
		</planpro:description>
		<comment/>
		<planpro:test>
			<planpro:success>
				Die Zugstraße endet an einem Hauptsignal, Hauptsperrsignal, Hauptsperrsignal Ne 14 Ls, alleinstehenden Ne 14,
				Mehrabschnittssignal, Mehrabschnittssperrsignal, Sperrsignal mit Funktion Zug-Ziel-Signal, Zugdeckungssignal,
				Blockkennzeichen oder fiktiven Signal mit der Funktion FAP-Ziel, sonstige, Zug-Ziel Awanst, Zug-Ziel ohne Signal,
				Zug-Ziel Strecke, Zug-Start/-Ziel Bk oder Zug-Start/-Ziel Ne 14.  
			</planpro:success>
			<planpro:error>
				Die Zugstraße endet nicht an einem Hauptsignal, Hauptsperrsignal, Hauptsperrsignal Ne 14 Ls, alleinstehenden Ne 14,
				Mehrabschnittssignal, Mehrabschnittssperrsignal, Sperrsignal mit Funktion Zug-Ziel-Signal, Zugdeckungssignal,
				Blockkennzeichen oder fiktiven Signal mit der Funktion FAP-Ziel, sonstige,  Zentralblock-Ziel, Zug-Ziel Awanst,
				Zug-Ziel ohne Signal, Zug-Ziel Strecke, Zug-Start/-Ziel Bk, Zug-Start/-Ziel Bk mit Zs 1, Zug-Start/-Ziel Bk mit Zs 7
				oder Zug-Start/-Ziel Ne 14, Zug-Start/-Ziel Ne 14 mit Zs 1, Zug-Start/-Ziel Ne 14 mit Zs 7 oder Zug-Start/-Ziel Ne 14 mit Zs 8.			
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
  <iso:rule role="warning" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Zug]">
  	<iso:let name="current_Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>		
  	<iso:let name="Ziel_Signal" value="key('Signal', $current_Fahrweg/ID_Ziel/Wert, /*)"/>	  	
  	<!-- gefundene Signalarten -->
  	<iso:let name="Signal_Real_Art" value="$Ziel_Signal/Signal_Real/Signal_Real_Aktiv_Schirm/Signal_Art/Wert"/>
  	<iso:let name="Signal_Fiktiv_Funktion" value="$Ziel_Signal/Signal_Fiktiv/Fiktives_Signal_Funktion/Wert"/>
  	<iso:let name="Signal_Real" value="$Ziel_Signal/Signal_Real[not(Signal_Real_Aktiv|Signal_Real_Aktiv_Schirm)]"/>
  	<iso:let name="Signal_Rahmen" value="key('Signal_Rahmen-fuerSignal', $Ziel_Signal/Identitaet/Wert, /*)"/>
  	<iso:let name="Signal_Begriff" value="key('Signal_Signalbegriff-fuerSignal_Rahmen', $Signal_Rahmen/Identitaet/Wert, /*)"/>
  	<iso:let name="Signalbegriff_Typ" value="$Signal_Begriff/Signalbegriff_ID/substring-after(@xsi:type,':')"/>
  	<!-- gesuchte Signalarten -->
  	<iso:let name="Signal_Real_Art_zulaessig" value="('Hauptsignal', 'Hauptsperrsignal', 'Hauptsperrsignal Ne 14 Ls', 'Mehrabschnittssignal',     'Mehrabschnittssperrsignal', 'Zugdeckungssignal')"/>
  	<iso:let name="Signal_Fiktiv_Funktion_zulaessig" value="('Zug_Ziel_Strecke','Zug_Ziel_ohne_Signal','Zug_Ziel_Awanst',     'FAP_Ziel', 'sonstige', 'Zentralblock_Ziel', 'Zug_Start_Ziel_Bk', 'Zug_Start_Ziel_Bk_mit_Zs_1', 'Zug_Start_Ziel_Bk_mit_Zs_7',     'Zug_Start_Ziel_Ne_14', 'Zug_Start_Ziel_Ne_14_mit_Zs_1', 'Zug_Start_Ziel_Ne_14_mit_Zs_7', 'Zug_Start_Ziel_Ne_14_mit_Zs_8')"/>
  	<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Signal_Real_Art = $Signal_Real_Art_zulaessig or     $Signal_Fiktiv_Funktion = $Signal_Fiktiv_Funktion_zulaessig or     ($Signal_Real_Art = 'Sperrsignal' and $Ziel_Signal/Signal_Real/Signal_Funktion/Wert = 'Zug_Ziel_Signal') or     ($Signal_Real and $Signalbegriff_Typ = ('Ne_14', 'Oz_Bk'))">Die Zugstraße endet nicht an einem Hauptsignal, Hauptsperrsignal, Hauptsperrsignal Ne 14 Ls, alleinstehenden Ne 14, Mehrabschnittssignal, Mehrabschnittssperrsignal, Sperrsignal mit Funktion Zug-Ziel-Signal, Zugdeckungssignal, Blockkennzeichen oder fiktiven Signal mit der Funktion FAP-Ziel, sonstige,  Zentralblock-Ziel, Zug-Ziel Awanst, Zug-Ziel ohne Signal, Zug-Ziel Strecke, Zug-Start/-Ziel Bk, Zug-Start/-Ziel Bk mit Zs 1, Zug-Start/-Ziel Bk mit Zs 7 oder Zug-Start/-Ziel Ne 14, Zug-Start/-Ziel Ne 14 mit Zs 1, Zug-Start/-Ziel Ne 14 mit Zs 7 oder Zug-Start/-Ziel Ne 14 mit Zs 8.</iso:assert>	
  </iso:rule>
</iso:pattern>