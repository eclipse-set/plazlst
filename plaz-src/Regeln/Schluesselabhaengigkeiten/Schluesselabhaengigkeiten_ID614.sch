<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="3B1DCEF3-884B-4747-B502-C948B01D188F" see="Schluesselabhaengigkeiten_ID614" id="ID614" planpro:arbeitspaket="Schluesselabhaengigkeiten" planpro:version="1.10.0.3">
  <iso:title>Nur ein Hauptschloss je Schlosskombination</iso:title>
  <iso:p>
    <planpro:description>
      Von allen Schlössern, die auf eine Schlosskombination verweisen, muss genau ein Schloss als Hauptschloss definiert sein.
      
      Von allen Schlössern, die mittels Schloss.Schloss_Sk.ID_Schlosskombination auf eine Schlosskombination verweisen,
      muss genau ein Schloss mit Schloss.Schloss_Sk.Hauptschloss == "true" vorhanden sein.
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Für die Schlosskombination ist ein Schloss als Hauptschloss definiert.
      </planpro:success>
      <planpro:error>
        Für die Schlosskombination [ist kein Schloss/sind mehrere Schlösser] als Hauptschloss definiert.
      </planpro:error>
    </planpro:test>
    <planpro:output>Schlosskombination</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Schlosskombination[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
    <iso:let name="Schloss" value="key('Schloss-fuerSchlosskombination', Identitaet/Wert, /*)"/>
    <iso:let name="AnzahlHauptschloesser" value="count($Schloss[Schloss_Sk/Hauptschloss/Wert = 'true'])"/>
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$AnzahlHauptschloesser = 1">Für die Schlosskombination <iso:value-of select="if ($AnzahlHauptschloesser = 0)       then 'ist kein Schloss' else 'sind mehrere Schlösser'"/> als Hauptschloss definiert.</iso:assert>
  </iso:rule>
</iso:pattern>