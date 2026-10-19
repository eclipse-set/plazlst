<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="12B1CBB2-5352-4885-828E-CD862552028B" see="Fahrstrasse_ID372" id="ID372" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
  <iso:title>Füllung Fstr_V nur bei Zugstraßen</iso:title>
  <iso:p>
    <planpro:description>
      Fstr_Zug_Rangier.Fstr_Zug_Rangier_Allg.Fstr_V darf nur vorhanden sein, wenn Fstr_Zug_Rangier.Fstr_Zug oder
      Fstr_Zug_Rangier.Fstr_Mittel gefüllt sind.
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Das Attribut Fstr_V ist gefüllt und es handelt sich um eine Zugstraße.
      </planpro:success>
      <planpro:error>
        Das Attribut Fstr_V ist gefüllt, es handelt sich jedoch nicht um eine Zugstraße.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fstr_Zug_Rangier</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Zug_Rangier_Allg/Fstr_V]">
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Fstr_Mittel or Fstr_Zug">Das Attribut Fstr_V ist gefüllt, es handelt sich jedoch nicht um eine Zugstraße.</iso:assert>
  </iso:rule>
</iso:pattern>