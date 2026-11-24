<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="8C3022F4-3943-4CF3-8B05-902F97EB8084" see="Fahrstrasse_ID313" id="ID313" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Begrenzung des Fahrwegs einer Rangierstraße (Start)</iso:title>
	<iso:p>
		<planpro:description>
			Prüfung, ob ein zu einer Rangierstraße gehörender Fahrweg an den dafür vorgesehenen 
			Signalen beginnt.
			
			Wenn Fstr_Zug_Rangier.Fstr_Rangier gefüllt ist, muss Fstr_Zug_Rangier.ID_Fstr_Fahrweg
			→ Fstr_Fahrweg.ID_Start ein Signal mit (Signal.Signal_Real.Signal_Real_Aktiv_Schirm.Signal_Art ==
			"Hauptsperrsignal", "Hauptsperrsignal Ne 14 Ls", "Mehrabschnittssperrsignal", "Sperrsignal", "Zugdeckungssignal", 
			("Hauptsignal" mit Signal.Signal_Real.Funktion_Ohne_Signal == "RS"),
			("Mehrabschnittssignal" mit Signal.Signal_Real.Funktion_Ohne_Signal == "RS"),
			Signal.Signal_Fiktiv.Fiktives_Signal_Funktion == 
			("FAP_Start", "Zug_Start_Mittelweiche", "Rangier_Start_Ziel_ohne_Signal", "Rangier_Start_Ziel_Ne_14" oder "sonstige") oder
			Signal (∃ Signal.Signal_Real ∧ ∄ (Signal.Signal_Real.Signal_Real_Aktiv ∧ Signal.Signal_Real.Signal_Real_Aktiv_Schirm) ∧
			Signal ← Signal_Rahmen.ID_Signal ← Signal_Rahmen ← Signal_Signalbegriff.ID_Signal_Rahmen
			→ Signal_Signalbegriff.Signalbegriff_ID == "Ne_14") sein. 			
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Rangierstraße beginnt an einem Hauptsperrsignal, Hauptsperrsignal Ne 14 Ls, alleinstehenden Ne 14,
				Hauptsignal oder Mehrabschnittssignal mit Funktion Rangier-Start, Mehrabschnittssperrsignal, Sperrsignal,
				Zugdeckungssignal oder einem fiktiven Signal mit der Funktion FAP-Start, Mwtfstr-Start, Rangier-Start/Ziel Ne14
				oder Rangier-Start/Ziel ohne Signal.
			</planpro:success>
			<planpro:error>
				Die Rangierstraße beginnt nicht an einem Hauptsperrsignal, Hauptsperrsignal Ne 14 Ls, alleinstehenden Ne 14,
				Hauptsignal oder Mehrabschnittssignal mit Funktion Rangier-Start, Mehrabschnittssperrsignal, Sperrsignal,
				Zugdeckungssignal oder einem fiktiven Signal mit der Funktion FAP-Start, Mwtfstr-Start, Rangier-Start/Ziel Ne14 
				oder Rangier-Start/Ziel ohne Signal. 
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
  <iso:rule role="warning" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Rangier]">
  	<iso:let name="current_Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>		
  	<iso:let name="Start_Signal" value="key('Signal', $current_Fahrweg/ID_Start/Wert, /*)"/>	  	
  	<!-- gefundene Signalarten -->
  	<iso:let name="Signal_Real_Art" value="$Start_Signal/Signal_Real/Signal_Real_Aktiv_Schirm/Signal_Art/Wert"/>
  	<iso:let name="Signal_Real_Funktion_Ohne_Signal" value="$Start_Signal/Signal_Real/Funktion_Ohne_Signal/Wert"/>
  	<iso:let name="Signal_Fiktiv_Funktion" value="$Start_Signal/Signal_Fiktiv/Fiktives_Signal_Funktion/Wert"/>
  	
  	<iso:let name="Signal_Real" value="$Start_Signal/Signal_Real[not(Signal_Real_Aktiv|Signal_Real_Aktiv_Schirm)]"/>
  	<iso:let name="Signal_Rahmen" value="key('Signal_Rahmen-fuerSignal', $Start_Signal/Identitaet/Wert, /*)"/>
  	<iso:let name="Signal_Begriff" value="key('Signal_Signalbegriff-fuerSignal_Rahmen', $Signal_Rahmen/Identitaet/Wert, /*)"/>
  	<iso:let name="Signalbegriff_Typ" value="$Signal_Begriff/Signalbegriff_ID/substring-after(@xsi:type,':')"/>
    <!-- gesuchte Signalarten -->
  	<iso:let name="Signal_Real_Art_zulaessig" value="('Hauptsperrsignal', 'Hauptsperrsignal Ne 14 Ls', 'Mehrabschnittssperrsignal',     'Sperrsignal', 'Zugdeckungssignal')"/>
  	<iso:let name="Signal_Fiktiv_Funktion_zulaessig" value="('FAP_Start', 'Zug_Start_Mittelweiche',     'Rangier_Start_Ziel_ohne_Signal', 'Rangier_Start_Ziel_Ne_14', 'sonstige')"/>
  	
  	<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Signal_Real_Art = $Signal_Real_Art_zulaessig or     $Signal_Fiktiv_Funktion = $Signal_Fiktiv_Funktion_zulaessig or     ($Signal_Real_Art = ('Hauptsignal', 'Mehrabschnittssignal') and $Signal_Real_Funktion_Ohne_Signal = 'RS') or     ($Signal_Real and $Signalbegriff_Typ = 'Ne_14')">Die Rangierstraße beginnt nicht an einem Hauptsperrsignal, Hauptsperrsignal Ne 14 Ls, alleinstehenden Ne 14, Hauptsignal oder Mehrabschnittssignal mit Funktion Rangier-Start, Mehrabschnittssperrsignal, Sperrsignal, Zugdeckungssignal oder einem fiktivem Signal mit der Funktion FAP-Start, Mwtfstr-Start oder Rangier-Start/Ziel ohne Signal.</iso:assert>
  </iso:rule>
</iso:pattern>