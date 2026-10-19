<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="BA431C30-016C-41b4-8FE4-69D2F00C7FB9" see="Flankenschutz_ID135" id="ID135" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>Nachlaufverhinderung für Eigenzwieschutzweichen</iso:title>
  <iso:p>
    <planpro:description>
      In der Regel wird für Eigenzwieschutzweichen eine Nachlaufverhinderung projektiert.
      
      Es soll eine Warnung erfolgen, wenn Fla_Zwieschutz.Zwieschutz_Art == "eigen" und
      Fla_Zwieschutz.Fla_Zwieschutz_Element.Nachlaufverhinderung == "false" ist. 
    </planpro:description>
    <planpro:comment>
      Prüfung entfällt, falls:
      - relevante Fla_Zwieschutz.Zwieschutz_Art xsi:nil="true"
      - relevante Fla_Zwieschutz_Element.Nachlaufverhinderung xsi:nil="true"
    </planpro:comment>
    <planpro:test>
      <planpro:success>
        Für die Eigenzwieschutzweiche ist eine Nachlaufverhinderung vorgesehen.
      </planpro:success>
      <planpro:error>
        Für die Eigenzwieschutzweiche ist keine Nachlaufverhinderung vorgesehen.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fla_Zwieschutz</planpro:output>
  </iso:p>
  <iso:rule role="warning" context="Fla_Zwieschutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fla_Zwieschutz_Element/Nachlaufverhinderung/Wert = 'false']     [fx:ignore-nil(Zwieschutz_Art)]">
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Zwieschutz_Art/Wert != 'eigen'">Für die Eigenzwieschutzweiche ist keine Nachlaufverhinderung vorgesehen.</iso:assert>
  </iso:rule>
</iso:pattern>