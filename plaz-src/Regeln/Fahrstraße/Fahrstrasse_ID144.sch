<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="A57438A7-59C7-45C1-AFD1-A43B000A17FC" see="Fahrstrasse_ID144" id="ID144" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Freimeldung des DWegs/Gefahrpunktabstands</iso:title>
	<iso:p>
		<planpro:description>
			Es soll eine Warnung ausgegeben werden, wenn für einen DWeg/Gefahrpunktabstand mit einer Länge ≥ 30.000 m 
			kein freizumeldender Freimeldeabschnitt angegeben ist, obwohl am Startsignal des DWegs/Gefahrpunktabstands 
			keine Zentralblockfahrstraße beginnt.
			
			Es soll eine Warnung ausgegeben werden, wenn Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg ≥ 30.000 m ist und
			am Startsignal dieses Fstr_Fahrweg (Fstr_Fahrweg.ID_Start) kein weiterer Fstr_Fahrweg beginnt, der mittels 
			Fstr_Zug_Rangier.Fstr_Fahrweg von einer Fstr_Zug_Rangier mit Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_Art == "ZZ" 
			referenziert wird und Fstr_DWeg.ID_FMA_Anlage_Freimeldung nicht gefüllt ist. 
		</planpro:description>
		<planpro:comment>
			30 m ist die Mindestlänge von Gleisfreimeldeabschnitten. Bei Zentralblockfahrstraßen ist kein eigener 
			Gleisfreimeldeabschnitt für den Gefahrpunktabstand (Fstr_DWeg) vorhanden.
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Länge des DWegs bzw. Gefahrpunktabstands ist größer gleich 30 m, am Startsignal des DWegs bzw. 
				Gefahrpunktabstands beginnt keine Zentralblockfahrstraße und eine Angabe zur Freimeldung ist vorhanden.
			</planpro:success>
			<planpro:error>
				Die Länge des DWegs bzw. Gefahrpunktabstands ist größer gleich 30 m und am Startsignal des DWegs 
				bzw. Gefahrpunktabstands beginnt keine Zentralblockfahrstraße, jedoch ist keine Angabe zur Freimeldung vorhanden.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_DWeg</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-144(current(), parent::*)]">
		<iso:let name="Fstr_Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
		<iso:let name="weitererFahrweg" value="key('Fstr_Fahrweg-fuerStart', $Fstr_Fahrweg/ID_Start/Wert, parent::*) except $Fstr_Fahrweg"/>
		<iso:let name="weitereFstrZugRangier" value="key('Fstr_Zug_Rangier-fuerFstr_Fahrweg', $weitererFahrweg/Identitaet/Wert, parent::*)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$weitereFstrZugRangier/Fstr_Zug/Fstr_Zug_Art/Wert = 'ZZ' or ID_FMA_Anlage_Freimeldung">Die Länge des DWegs bzw. Gefahrpunktabstands ist größer gleich 30 m und am Startsignal des DWegs bzw. Gefahrpunktabstands beginnt keine Zentralblockfahrstraße, jedoch ist keine Angabe zur Freimeldung vorhanden.</iso:assert>
  </iso:rule>
</iso:pattern>