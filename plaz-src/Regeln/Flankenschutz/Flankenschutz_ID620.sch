<?xml version="1.0" encoding="UTF-8" standalone="no"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="8DEF1DA9-BB97-4145-B0F2-3CEC939C20E7" id="ID620" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3" see="Flankenschutz_ID620">
  <iso:title>Maßnahme "Verschluss/Ersatzschutz" nur bei echten Zwieschutzweichen</iso:title>
  <iso:p>
    <planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>  Wenn als Zwieschutz-Maßnahme "Verschluss/Ersatzschutz" gewählt wurde, muss es sich um eine echte Zwieschutzweiche handeln.
  
  Wenn Fla_Zwieschutz.Fla_Zwieschutz_Element.Massnahme_L oder Fla_Zwieschutz.Fla_Zwieschutz_Element.Massnahme_R  == 
  "Verschluss_Ersatzschutz", dann muss Fla_Zwieschutz.Zwieschutz_Art == "echt" oder "echt_eigen" sein.
</code></pre>
</planpro:description>
    <planpro:comment>
      Prüfung entfällt, falls:
      - relevante Zwieschutz_Art xsi:nil="true"
      - relevante Fla_Zwieschutz_Element.Massnahme_L xsi:nil="true"
      - relevante Fla_Zwieschutz_Element.Massnahme_R xsi:nil="true"
    </planpro:comment>
	  <planpro:test>
      <planpro:success>
        Die Zwieschutz-Maßnahme "Verschluss/Ersatzschutz" wird nur bei einer echten Zwieschutzweiche gewählt.
      </planpro:success>
      <planpro:error>
        Die Zwieschutz-Maßnahme "Verschluss/Ersatzschutz" wird bei einer Eigen-Zwieschutzweiche gewählt.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fla_Zwieschutz</planpro:output>
  </iso:p>
  <iso:rule context="Fla_Zwieschutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fla_Zwieschutz_Element/(Massnahme_L | Massnahme_R)/Wert = 'Verschluss_Ersatzschutz']     [fx:ignore-nil(Zwieschutz_Art)][fx:ignore-nil(Fla_Zwieschutz_Element/(Massnahme_L | Massnahme_R))]" role="error">
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Zwieschutz_Art/Wert = ('echt', 'echt_eigen')">Die Zwieschutz-Maßnahme "Verschluss/Ersatzschutz" wird bei einer Eigen-Zwieschutzweiche gewählt.</iso:assert>	
  </iso:rule>
</iso:pattern>