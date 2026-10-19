<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="FA08C1D9-1BC0-484D-9218-0F560DCB2FCC" see="Schluesselabhaengigkeiten_ID349" id="ID349" planpro:arbeitspaket="Schluesselabhaengigkeiten" planpro:version="1.10.0.3">
  <iso:title>Ein Schloss je Schlüsselsperre</iso:title>
  <iso:p>
    <planpro:description>
      Einer Schlüsselsperre soll genau ein Schloss zugeordnet sein.
      
      Es soll eine Warnung erfolgen, wenn einer Schlüsselsperre kein oder mehr als ein Schloss mittels
      Schloss.Schloss_Ssp.ID_Schluesselsperre zugeordnet ist.
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Der Schlüsselsperre ist genau ein Schloss zugeordnet.
      </planpro:success>
      <planpro:error>
        Der Schlüsselsperre [ist kein Schloss / sind mehrere Schlösser] zugeordnet.
      </planpro:error>
    </planpro:test>
    <planpro:output>Schluesselsperre</planpro:output>
  </iso:p>
  <iso:rule role="warning" context="Schluesselsperre[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
    <iso:let name="Schloss" value="key('Schloss-fuerSchluesselsperre', Identitaet/Wert, /*)"/>
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="count($Schloss) = 1">Der Schlüsselsperre <iso:value-of select="if (not($Schloss))       then 'ist kein Schloss' else 'sind mehrere Schlösser'"/> zugeordnet.</iso:assert>
  </iso:rule>
</iso:pattern>