<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="8516FF94-B81C-4309-9D46-E0A6D7909392" see="Fahrstrasse_ID390" id="ID390" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Warnung bei Rangierstraßenstart oder -ziel am Zugdeckungssignal</iso:title>
	<iso:p>
		<planpro:description>
			Prüfung, ob ein zu einer Rangierstraße gehörender Fahrweg an einem Zugdeckungssignal beginnt oder endet.

			Es soll eine Warnung erfolgen, wenn Fstr_Zug_Rangier.Fstr_Rangier gefüllt ist und (Fstr_Zug_Rangier.ID_Fstr_Fahrweg 
			→ Fstr_Fahrweg.ID_Start oder Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel)
			ein Signal mit Signal.Signal_Real.Signal_Real_Aktiv_Schirm.Signal_Art == "Zugdeckungssignal" ist.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Rangierstraße beginnt oder endet nicht an einem Zugdeckungssignal.
			</planpro:success>
			<planpro:error>
				Die Rangierstraße beginnt oder endet an einem Zugdeckungssignal.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
    <iso:rule role="warning" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Rangier]">
    	<iso:let name="Fstr_Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
    	<iso:let name="Signal" value="key('Signal', $Fstr_Fahrweg/(ID_Start | ID_Ziel)/Wert, /*)"/>
    	<iso:let name="Signal_Art" value="$Signal/Signal_Real/Signal_Real_Aktiv_Schirm/Signal_Art/Wert"/>
    	<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Signal_Art = 'Zugdeckungssignal'">Die Rangierstraße beginnt oder endet an einem Zugdeckungssignal.</iso:report>
  </iso:rule>
</iso:pattern>