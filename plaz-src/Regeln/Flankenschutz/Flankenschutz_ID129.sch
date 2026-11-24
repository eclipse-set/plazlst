<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="4D39900D-9268-4bca-BC8B-60CC0E994813" see="Flankenschutz_ID129" id="ID129" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>Verschluss der Eigenzwieschutzweiche nur in einer Lage</iso:title>
  <iso:p>
    <planpro:description>
      Eine Eigenzwieschutzweiche kann nicht gleichzeitig in Links- und Rechtslage verschlossen sein.
      
      Somit dürfen in einer Instanz von Fla_Zwieschutz mit Fla_Zwieschutz.Zwieschutz_Art == "eigen" nicht gleichzeitig 
      Fla_Zwieschutz.Fla_Zwieschutz_Element.Massnahme_L == "Verschluss" und
      Fla_Zwieschutz.Fla_Zwieschutz_Element.Massnahme_R == "Verschluss" vorhanden sein.
    </planpro:description>
    <planpro:comment>
      Prüfung entfällt, falls:
      - relevantes Fla_Zwieschutz.Zwieschutz_Art xsi:nil="true"
      - relevantes Fla_Zwieschutz_Element.Massnahme_L xsi:nil="true"
      - relevantes Fla_Zwieschutz_Element.Massnahme_R xsi:nil="true"
    </planpro:comment>
	  <planpro:test>
      <planpro:success>
        Die Eigenzwieschutzweiche wird nicht gleichzeitig in Links- und Rechtslage verschlossen.
      </planpro:success>
      <planpro:error>
        Die Eigenzwieschutzweiche wird gleichzeitig in der Links- und Rechtslage verschlossen.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fla_Zwieschutz</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Fla_Zwieschutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Zwieschutz_Art/Wert = 'eigen'][fx:ignore-nil(Fla_Zwieschutz_Element/(Massnahme_L | Massnahme_R))]">
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Fla_Zwieschutz_Element/(Massnahme_L | Massnahme_R)/Wert != 'Verschluss'">Die Eigenzwieschutzweiche wird gleichzeitig in der Links- und Rechtslage verschlossen.</iso:assert>	
  </iso:rule>
</iso:pattern>