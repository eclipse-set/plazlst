<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="1982EABE-F2E4-48AA-95DF-2285C02BC174" see="Flankenschutz_ID53" id="ID53" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>Kommentar bei Verzicht auf Flankenschutz</iso:title>
  <iso:p>
    <planpro:description>
      Wenn ein Flankenschutzverzicht geplant wurde, muss der Grund mittels Bearbeitungsvermerk dokumentiert werden.
      
      Wenn Fla_Schutz.Fla_Verzicht == "true", dann muss Fla_Schutz.ID_Bearbeitungsvermerk oder 
      Fla_Schutz.Fla_Verzicht.ID_Bearbeitungsvermerk vorhanden sein.
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Es ist ein Flankenschutzverzicht geplant und dazu ein Bearbeitungsvermerk vorhanden.
      </planpro:success>
      <planpro:error>
        Es ist ein Flankenschutzverzicht geplant, jedoch dazu kein Bearbeitungsvermerk vorhanden.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fla_Schutz</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Fla_Schutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fla_Verzicht/Wert = 'true']">
	  <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="ID_Bearbeitungsvermerk | Fla_Verzicht/ID_Bearbeitungsvermerk">Es ist ein Flankenschutzverzicht geplant, jedoch dazu kein Bearbeitungsvermerk vorhanden.</iso:assert>	
  </iso:rule>
</iso:pattern>