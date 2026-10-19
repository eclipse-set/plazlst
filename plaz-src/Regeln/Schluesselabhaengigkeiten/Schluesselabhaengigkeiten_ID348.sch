<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="6C5D8188-F521-427C-A92F-6D4553E18BF5" see="Schluesselabhaengigkeiten_ID348" id="ID348" planpro:arbeitspaket="Schluesselabhaengigkeiten" planpro:version="1.10.0.3">
  <iso:title>Mind. drei Schlösser je Schlosskombination</iso:title>
  <iso:p>
    <planpro:description>
      Eine Schlosskombination soll mindestens drei Schlössern zugeordnet sein.

      Es soll eine Warnung erfolgen, wenn auf eine Schlosskombination weniger als drei Schlösser mittels
      Schloss.Schloss_Sk.ID_Schlosskombination verweisen. 
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Der Schlosskombination wurden mindestens drei Schlösser zugeordnet. 
      </planpro:success>
      <planpro:error>
        Der Schlosskombination wurden weniger als drei Schlösser zugeordnet. Dies ist nur übergangsweise im Rahmen von Umbaumaßnahmen sinnvoll.
      </planpro:error>
    </planpro:test>
    <planpro:output>Schlosskombination</planpro:output>
  </iso:p>
  <iso:rule role="warning" context="Schlosskombination[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
    <iso:let name="Schloss" value="key('Schloss-fuerSchlosskombination', Identitaet/Wert, /*)"/>
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="count($Schloss) ge 3">Der Schlosskombination wurden weniger als drei Schlösser zugeordnet. Dies ist nur übergangsweise im Rahmen von Umbaumaßnahmen sinnvoll.</iso:assert>	
  </iso:rule>
</iso:pattern>