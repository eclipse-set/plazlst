<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="F3F51471-2300-45A2-87A3-DDBA8EFBCD78" see="Flankenschutz_ID359" id="ID359" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>Verschluss der echten Zwieschutzweiche nur in einer Lage</iso:title>
  <iso:p>
    <planpro:description>
      Es soll eine Warnung erfolgen, wenn eine echte Zwieschutzweiche gleichzeitig in Links- und Rechtslage verschlossen ist. 
      
      Somit soll die Warnung erfolgen, wenn in einer Instanz von Fla_Zwieschutz mit
      Fla_Zwieschutz.Zwieschutz_Art == "echt" oder "echt_eigen" gleichzeitig
      Fla_Zwieschutz.Fla_Zwieschutz_Element.Massnahme_L == "Verschluss" und Fla_Zwieschutz.Fla_Zwieschutz_Element.Massnahme_R == "Verschluss"
      vorhanden sind.
    </planpro:description>
    <planpro:comment>
      Prüfung entfällt, falls:
      - relevante Fla_Zwieschutz.Zwieschutz_Art xsi:nil="true"
      - relevante Fla_Zwieschutz_Element.Massnahme_L xsi:nil="true"
      - relevante Fla_Zwieschutz_Element.Massnahme_R xsi:nil="true"
    </planpro:comment>
    <planpro:test>
      <planpro:success>
        Die echte Zwieschutzweiche wird nicht gleichzeitig in Links- und Rechtslage verschlossen.
      </planpro:success>
      <planpro:error>
        Die echte Zwieschutzweiche wird gleichzeitig in der Links- und Rechtslage verschlossen.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fla_Zwieschutz</planpro:output>
  </iso:p>
  <iso:rule role="warning" context="Fla_Zwieschutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Zwieschutz_Art/Wert = ('echt', 'echt_eigen')]     [fx:ignore-nil(Fla_Zwieschutz_Element/(Massnahme_L | Massnahme_R))]">
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Fla_Zwieschutz_Element/(Massnahme_L | Massnahme_R)/Wert != 'Verschluss'">Die echte Zwieschutzweiche wird gleichzeitig in der Links- und Rechtslage verschlossen.</iso:assert>	
  </iso:rule>
</iso:pattern>