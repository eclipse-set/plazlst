<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="8CCBE631-E296-474C-855F-4FA397D21AAF" see="Fahrstrasse_ID366" id="ID366" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
  <iso:title>Ende eines DWegs/Gefahrpunktabstands am Markanten Punkt</iso:title>
  <iso:p>
    <planpro:description>
      Bei Durchrutschwegen bzw. Gefahrpunktabständen muss das Ende durch einen Markanten Punkt definiert werden.
      
      Wenn Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg vorhanden ist, muss Fstr_Fahrweg.ID_Ziel == "Markanter_Punkt" sein.
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Das Ende des Durchrutschwegs bzw. Gefahrpunktabstands wird durch einen Markanten Punkt definiert. 
      </planpro:success>
      <planpro:error>
        Das Ende des Durchrutschwegs bzw. Gefahrpunktabstands wird nicht durch einen Markanten Punkt definiert. 
      </planpro:error>
    </planpro:test>
    <planpro:output>Fstr_DWeg</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-387(current(), parent::*)]">
    <iso:let name="Fstr_Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
    <iso:let name="ID_Ziel" value="$Fstr_Fahrweg/ID_Ziel/Wert"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="key('Markanter_Punkt', $ID_Ziel, parent::*)">Der Fahrweg wird als Durchrutschweg bzw. Gefahrpunktabstand genutzt, jedoch nicht durch einen Markanten Punkt begrenzt.</iso:assert>	
  </iso:rule>
</iso:pattern>