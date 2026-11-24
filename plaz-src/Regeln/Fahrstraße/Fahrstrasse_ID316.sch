<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="14DBE97F-E786-439A-B711-E335D5446B98" see="Fahrstrasse_ID316" id="ID316" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Begrenzung des Fahrwegs einer MwTfstr (Ziel)</iso:title>
	<iso:p>
		<planpro:description>
			Prüfung, ob ein zu einer MwTfstr gehörender Fahrweg an den dafür vorgesehenen Signalen endet.
			
			Wenn Fstr_Zug_Rangier.Fstr_Mittel gefüllt ist, muss Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel
			ein Signal mit Signal.Signal_Real.Signal_Real_Aktiv_Schirm.Signal_Art == "Hauptsignal", "Hauptsperrsignal",
			"Hauptsperrsignal Ne 14 Ls", "Mehrabschnittssignal" oder "Mehrabschnittssperrsignal" oder
			Signal.Signal_Fiktiv.Fiktives_Signal_Funktion == "Zug_Start_Ziel_Ne_14_mit_Zs_1", "Zug_Start_Ziel_Ne_14_mit_Zs_7",
			"Zug_Start_Ziel_Ne_14_mit_Zs_8" oder 
			(Signal (∃ Signal.Signal_Real ∧ ∄ (Signal.Signal_Real.Signal_Real_Aktiv ∧ Signal.Signal_Real.Signal_Real_Aktiv_Schirm) ∧
			Signal ← Signal_Rahmen.ID_Signal ← Signal_Rahmen ← Signal_Signalbegriff.ID_Signal_Rahmen → 
			Signal_Signalbegriff.Signalbegriff_ID == ("Ne_14") sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Mittelweichenteilfahrstraße endet an einem Hauptsignal, Hauptsperrsignal, Hauptsperrsignal Ne 14 Ls,
				alleinstehenden Ne 14, Zug-Start/-Ziel Ne 14 mit Zs 1, Zug-Start/-Ziel Ne 14 mit Zs 7, Zug-Start/-Ziel Ne 14 mit Zs 8,
				Mehrabschnittssignal oder Mehrabschnittssperrsignal. 
			</planpro:success>
			<planpro:error>
				Die Mittelweichenteilfahrstraße endet nicht an einem Hauptsignal, Hauptsperrsignal, Hauptsperrsignal Ne 14 Ls,
				alleinstehenden Ne 14, , Zug-Start/-Ziel Ne 14 mit Zs 1, Zug-Start/-Ziel Ne 14 mit Zs 7, Zug-Start/-Ziel Ne 14 mit Zs 8, 
				Mehrabschnittssignal oder Mehrabschnittssperrsignal.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
  <iso:rule role="warning" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Mittel]">
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
  	<iso:let name="Signal_Real_Art_zulaessig" value="('Hauptsignal', 'Hauptsperrsignal', 'Hauptsperrsignal Ne 14 Ls',     'Mehrabschnittssignal', 'Mehrabschnittssperrsignal')"/>
  	<iso:let name="Signal_Fiktiv_Funktion_zulaessig" value="('Zug_Start_Ziel_Ne_14_mit_Zs_1', 'Zug_Start_Ziel_Ne_14_mit_Zs_7',     'Zug_Start_Ziel_Ne_14_mit_Zs_8')"/>
  	
  	<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Signal_Real_Art = $Signal_Real_Art_zulaessig or     $Signal_Fiktiv_Funktion = $Signal_Fiktiv_Funktion_zulaessig or     ($Signal_Real and $Signalbegriff_Typ = 'Ne_14')">Die Mittelweichenteilfahrstraße endet nicht an einem Hauptsignal, Hauptsperrsignal, Hauptsperrsignal Ne 14 Ls, alleinstehenden Ne 14, , Zug-Start/-Ziel Ne 14 mit Zs 1, Zug-Start/-Ziel Ne 14 mit Zs 7, Zug-Start/-Ziel Ne 14 mit Zs 8, Mehrabschnittssignal oder Mehrabschnittssperrsignal.</iso:assert>
  </iso:rule>
</iso:pattern>