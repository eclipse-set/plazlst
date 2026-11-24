<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="AF4D279B-F5B0-474B-8E36-1FACB42A8EFE" see="Fahrstrasse_ID371" id="ID371" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
  <iso:title>Herstellerabhängigkeit beim Verschluss von Weichen im DWeg</iso:title>
  <iso:p>
    <planpro:description>
      Sofern eine Weiche im Durchrutschweg nicht verschlossen wird, soll eine Warnung erfolgen.

      Wenn Fstr_DWeg ← Fstr_DWeg_W_Kr.ID_Fstr_DWeg → Fstr_DWeg_W_Kr.Element_Verschluss == "false",
      dann soll eine Warnung erfolgen.
    </planpro:description>
    <planpro:comment>
      Der Nicht-Verschluss einzelner Weichen im DWeg ist nicht von allen Herstellern umsetzbar.
    </planpro:comment>
    <planpro:test>
      <planpro:success>
        Alle Weichen im Durchrutschweg sollen verschlossen werden.
      </planpro:success>
      <planpro:error>
        Es sollen nicht alle Weichen im Durchrutschweg verschlossen werden. Achtung, die Planung kann ggf. 
        durch die Signalbaufirma nicht umgesetzt werden.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fstr_DWeg</planpro:output>
  </iso:p>
  <iso:rule role="warning" context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-371(current(), parent::*)]">
    <iso:let name="Fstr_DWeg_W_Kr" value="key('Fstr_DWeg_W_Kr-fuerFstr_DWeg', Identitaet/Wert, parent::*)"/>
    <iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Fstr_DWeg_W_Kr/Element_Verschluss/Wert ='false'">Es sollen nicht alle Weichen im Durchrutschweg verschlossen werden. Achtung, die Planung kann ggf. durch die Signalbaufirma nicht umgesetzt werden.</iso:report>
  </iso:rule>
</iso:pattern>