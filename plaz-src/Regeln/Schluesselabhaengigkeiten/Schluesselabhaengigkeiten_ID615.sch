<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="9CCC26CC-AF17-4F3F-AF74-96587E834568" see="Schluesselabhaengigkeiten_ID615" id="ID615" planpro:arbeitspaket="Schluesselabhaengigkeiten" planpro:version="1.10.0.3">
  <iso:title>Aufbewahrung des Schlüssels beim Technisch Berechtigten</iso:title>
  <iso:p>
    <planpro:description>
      Das Attribut Schloss.Technisch_Berechtigter darf nur den Wert "true" annehmen, um die Aufbewahrung des Schlüssels
      beim Technisch Berechtigten abzubilden.
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Zur Aufbewahrung des Schlüssels beim Technisch Berechtigten ist ein Schloss mit Technisch_Berechtigter == "true" angelegt worden.
      </planpro:success>
      <planpro:error>
        Das Schloss wurde mit Technisch_Berechtigter == "false" angelegt. Diese Angabe ist nicht sinnvoll.
        Zur Aufbewahrung des Schlüssels beim Technisch Berechtigten ist ein Schloss mit Technisch_Berechtigter == "true" zu erstellen.
      </planpro:error>
    </planpro:test>
    <planpro:output>Schloss</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Schloss[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Technisch_Berechtigter]">
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Technisch_Berechtigter/Wert = 'true'">Das Schloss wurde mit Technisch_Berechtigter == "false" angelegt. Diese Angabe ist nicht sinnvoll. Zur Aufbewahrung des Schlüssels beim Technisch Berechtigten ist ein Schloss mit Technisch_Berechtigter == "true" zu erstellen.</iso:assert>
  </iso:rule>
</iso:pattern>