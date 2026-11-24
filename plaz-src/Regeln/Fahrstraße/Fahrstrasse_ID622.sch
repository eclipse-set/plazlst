<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="B21E6550-C876-4128-934E-553C0A76CDFD" see="Fahrstrasse_ID622" id="ID622" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Bereichsende eines DWegs/Gefahrpunktabstands am WA</iso:title>
    <iso:p>
      <planpro:description>
      	Endet ein DWeg/Gefahrpunktabstand von der spitzen Seite der Weiche kommend am WA, muss die Verortung der referenzierten
      	Weichen-Komponente im Abstand Null zum Ende des zugehörigen Bereichsobjekts Fstr_Fahrweg liegen (Toleranz 0,01 m). Die Prüfung
      	beginnt bei einer der beiden TOP-Kanten, auf denen die Weichen-Komponente verortet ist. Ausgehend hiervon wird der zugehörige
      	TOP-Knoten ermittelt. Im Anschluss wird die TOP-Kante gesucht, die die Weichenspitze repräsentiert. Zuletzt wird geprüft, ob
      	das Bereichsobjekt DWeg/Gefahrpunktabstand (bzw. der zugehörige Fstr_Fahrweg) im Abstand Null zum TOP-Knoten endet.
      	
      	Wenn Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel == "Markanter_Punkt" und
      	Markanter_Punkt.ID_Markante_Stelle == W_Kr_Gsp_Komponente und W_Kr_Gsp_Komponente.ID_W_Kr_Gsp_Element
      	→ W_Kr_Gsp_Element.Weiche_Element vorhanden ist und W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.ID_TOP_Kante ist ungleich
      	Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante,
      	dann muss die Verortung des unter Markanter_Punkt.ID_Markante_Stelle
      	angegebenen Punktobjekts im Abstand Null zum Endes des Bereichsobjekts Fstr_Fahrweg liegen (Toleranz 0,01 m). Die Prüfung beginnt
      	bei einer der beiden TOP-Kanten, auf denen die Weichen-Komponente verortet ist. Ausgehend hiervon wird der zugehörige TOP-Knoten
      	ermittelt. Im Anschluss wird die TOP-Kante gesucht, die die Weichenspitze repräsentiert. Zuletzt wird geprüft, ob das Bereichsobjekt
      	DWeg/Gefahrpunktabstand (bzw. der zugehörige Fstr_Fahrweg) im Abstand Null zum TOP-Knoten endet. 
      </planpro:description>
      <planpro:comment/>
      <planpro:test>
        <planpro:success>
        	Der DWeg/Gefahrpunktabstand endet von der Spitze kommend am WA. Das zugehörige Bereichsobjekt endet im Abstand Null zur
        	referenzierten Weichen-Komponente.
		</planpro:success>
        <planpro:error>
        	Der DWeg/Gefahrpunktabstand endet von der Spitze kommend am WA. Das zugehörige Bereichsobjekt endet jedoch nicht im Abstand Null
        	zur referenzierten Weichen-Komponente. Die Verortung des DWegs/Gefahrpunktabstands ist zu korrigieren. 
		</planpro:error>
      </planpro:test>
      <planpro:output>Fstr_DWeg</planpro:output>
    </iso:p>
	<iso:rule role="error" context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-622(current(), parent::*)]">
		<iso:let name="genauigkeit" value="0.01"/>
		<iso:let name="FstrFahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*) "/>
		<iso:let name="Markante_Stelle" value="key('Markanter_Punkt', $FstrFahrweg/ID_Ziel/Wert, parent::*)/ID_Markante_Stelle/Wert"/>
		<iso:let name="W_Kr_Gsp_Komponente" value="key('W_Kr_Gsp_Komponente', $Markante_Stelle, parent::*)"/>
		<iso:let name="W_Kr_Gsp_Komponente-TOP_Kanten" value="$W_Kr_Gsp_Komponente/Punkt_Objekt_TOP_Kante/ID_TOP_Kante/Wert"/>
		<iso:let name="TOP_Kanten_Schenkel" value="key('TOP_Kante', $W_Kr_Gsp_Komponente-TOP_Kanten, /*)"/>
		<iso:let name="W_Kr_Gsp-TOP_Knoten" value="$TOP_Kanten_Schenkel[1]/(ID_TOP_Knoten_A|ID_TOP_Knoten_B)/Wert    [. = $TOP_Kanten_Schenkel[2]/(ID_TOP_Knoten_A|ID_TOP_Knoten_B)/Wert]"/>
		<iso:let name="TOP_Kante-Spitze" value="key('TOP_Kante', $FstrFahrweg/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert, /*)    [(ID_TOP_Knoten_A|ID_TOP_Knoten_B)/Wert = $W_Kr_Gsp-TOP_Knoten]"/>
		<iso:let name="Fahrweg_BOT_Spitze" value="$FstrFahrweg/Bereich_Objekt_Teilbereich[ID_TOP_Kante/Wert = $TOP_Kante-Spitze/Identitaet/Wert]"/>
		<iso:let name="BOT-Begrenzung_A" value="$Fahrweg_BOT_Spitze[$TOP_Kante-Spitze/ID_TOP_Knoten_A/Wert = $W_Kr_Gsp-TOP_Knoten]"/>
		<iso:let name="BOT-Begrenzung_B" value="$Fahrweg_BOT_Spitze[$TOP_Kante-Spitze/ID_TOP_Knoten_B/Wert = $W_Kr_Gsp-TOP_Knoten]"/>
		<iso:let name="Begrenzung_A" value="min($BOT-Begrenzung_A/Begrenzung_A/fx:number-or-zero(Wert))"/>
		<iso:let name="Begrenzung_B" value="max($BOT-Begrenzung_B/Begrenzung_B/fx:number-or-zero(Wert))"/>
		<iso:let name="TOP_Laenge" value="fx:number-or-zero($TOP_Kante-Spitze/*/TOP_Laenge/Wert)"/>
		
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="($BOT-Begrenzung_A and $Begrenzung_A le $genauigkeit) or     ($BOT-Begrenzung_B and abs($Begrenzung_B - $TOP_Laenge) le $genauigkeit)">Der DWeg/Gefahrpunktabstand endet von der Spitze kommend am WA. Das zugehörige Bereichsobjekt endet jedoch nicht im Abstand Null zur referenzierten Weichen-Komponente. Die Verortung des DWegs/Gefahrpunktabstands ist zu korrigieren.</iso:assert>
  </iso:rule>
</iso:pattern>