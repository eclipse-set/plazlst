<?xml version="1.0" encoding="UTF-8" standalone="no"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="35CFECB1-DC0B-447A-B2D0-341D958C8DE3" id="ID346" planpro:arbeitspaket="Schluesselabhaengigkeiten" planpro:version="1.10.0.3" see="Schluesselabhaengigkeiten_ID346">
  <iso:title>Je Schlüssel zwei Schlösser</iso:title>
  <iso:p>
    <planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>  Existiert ein Schlüssel, so müssen mindestens zwei Schlösser hierauf verweisen.
  
  Wenn ein Schlüssel existiert,
  dann müssen mindestens zwei Schlösser mittels Schloss.ID_Schluessel hierauf verweisen.
</code></pre>
</planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Je Schlüssel existieren mind. zwei Schlösser, die auf den Schlüssel verweisen.
      </planpro:success>
      <planpro:error>
        Dem Schlüssel sind nicht mind. zwei Schlösser zugeordnet.
      </planpro:error>
    </planpro:test>
    <planpro:output>Schluessel</planpro:output>
  </iso:p>
  <iso:rule context="Schluessel[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="error">
    <iso:let name="Schloss" value="key('Schloss-fuerSchluessel', Identitaet/Wert, /*)"/>
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="count($Schloss) ge 2">Dem Schlüssel sind nicht mind. zwei Schlösser zugeordnet.</iso:assert>
  </iso:rule>
</iso:pattern>