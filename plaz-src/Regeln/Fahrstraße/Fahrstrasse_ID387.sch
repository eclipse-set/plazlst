<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="1C9338D4-2C53-44A6-872C-B4B12403425A" see="Fahrstrasse_ID387" id="ID387" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
  <iso:title>Ende eines Fahrwegs am Signal</iso:title>
  <iso:p>
    <planpro:description>
      Sofern ein Fahrweg den befahrenen Teil einer Fahrstraße abbildet, muss das Ende des Fahrwegs durch ein Signal definiert werden.
      
      Wenn auf Fstr_Fahrweg mittels Fstr_Zug_Rangier.ID_Fstr_Fahrweg verwiesen wird, muss Fstr_Fahrweg.ID_Ziel == "Signal" sein.
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Der Fahrweg bildet den befahrenen Teil einer Fahrstraße ab und wird durch ein Signal begrenzt.
      </planpro:success>
      <planpro:error>
        Der Fahrweg bildet den befahrenen Teil einer Fahrstraße ab, wird jedoch nicht durch ein Signal begrenzt.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fstr_Zug_Rangier</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-387(current(), parent::*)]">
    <iso:let name="ID_Ziel" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)/ID_Ziel/Wert"/>	
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="key('Signal', $ID_Ziel, /*)">Der Fahrweg wird als Fahrstraße genutzt, jedoch nicht durch ein Signal begrenzt.</iso:assert>	
  </iso:rule>
</iso:pattern>