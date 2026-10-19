<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="A59B3A00-FBBA-4C46-9A12-6BB951CE561A" see="Fahrstrasse_ID315" id="ID315" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Begrenzung des Fahrwegs einer MwTfstr (Start)</iso:title>
	<iso:p>
		<planpro:description>
			Prüfung, ob ein zu einer MwTfstr gehörender Fahrweg an den dafür vorgesehenen Signalen beginnt.
			
			Wenn Fstr_Zug_Rangier.Fstr_Mittel gefüllt ist, dann muss Fstr_Zug_Rangier.ID_Fstr_Fahrweg → 
			Fstr_Fahrweg.ID_Start ein Signal mit Signal.Signal_Fiktiv.Fiktives_Signal_Funktion == "Zug_Start_Mittelweiche"
			oder "sonstige" sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Mittelweichenteilfahrstraße beginnt an einem fiktiven Signal (Bedienpunkt) mit der Funktion
				"Zug-Start Mittelweiche" oder "sonstige".  
			</planpro:success>
			<planpro:error>
				Die Mittelweichenteilfahrstraße beginnt nicht an einem fiktiven Signal (Bedienpunkt) mit der Funktion
				"Zug-Start Mittelweiche" oder "sonstige".  
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
  <iso:rule role="error" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Mittel]">
  	<iso:let name="ID_Start" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)/ID_Start/Wert"/>	
    <!-- gefundene Signalarten -->
  	<iso:let name="Signal_Fiktiv_Art" value="key('Signal', $ID_Start, /*)/Signal_Fiktiv/Fiktives_Signal_Funktion/Wert"/>
    <!-- gesuchte Signalarten -->
  	<iso:let name="Signal_Fiktiv_Art_zulaessig" value="('Zug_Start_Mittelweiche', 'sonstige')"/>   
  	<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Signal_Fiktiv_Art = $Signal_Fiktiv_Art_zulaessig">Die Mittelweichenteilfahrstraße beginnt nicht an einem fiktiven Signal (Bedienpunkt) mit der Funktion "Zug-Start Mittelweiche" oder "sonstige".</iso:assert>
  </iso:rule>
</iso:pattern>