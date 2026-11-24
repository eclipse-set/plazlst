<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="9D5CC472-0BB1-4D99-8A39-0CE7E8C49F2E" see="Flankenschutz_ID375" id="ID375" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>Angabe "Ersatzschutz" bei definierter Ersatzschutzmaßnahme</iso:title>
  <iso:p>
    <planpro:description>
      Wenn eine Ersatzschutzmaßnahme für die Flankenschutzanforderung in einer bestimmten Lage angegeben ist, muss als Maßnahme
      für diese Lage "Ersatzschutz" oder "Verschluss_Ersatzschutz" projektiert sein.
      
      Wenn der Verweis Fla_Zwieschutz.Fla_Zwieschutz_Element.ID_Fla_Schutz_L (bzw. ..._R) gefüllt ist, muss
      Fla_Zwieschutz.Fla_Zwieschutz_Element.Massnahme_L (bzw. ..._R) == "Ersatzschutz" oder "Verschluss_Ersatzschutz" sein.
    </planpro:description>
    <planpro:comment>
      Eine Leerbefüllung von Fla_Zwieschutz.Fla_Zwieschutz_Element.Massnahme_L (bzw. ..._R) ist als Fehler zu werten.
    </planpro:comment>
    <planpro:test>
      <planpro:success>
        Es ist eine Ersatzschutzmaßnahme für die Flankenschutzanforderung in [Linkslage]/[Rechtslage] angegeben und als Maßnahme ist
        "Ersatzschutz" oder "Verschluss_Ersatzschutz" projektiert.
      </planpro:success>
      <planpro:error>
        Es ist eine Ersatzschutzmaßnahme für die Flankenschutzanforderung in [Linkslage]/[Rechtslage] angegeben, als Maßnahme ist
        jedoch nicht "Ersatzschutz" oder "Verschluss_Ersatzschutz" projektiert.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fla_Zwieschutz</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Fla_Zwieschutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fla_Zwieschutz_Element/(ID_Fla_Schutz_L | ID_Fla_Schutz_R)]">
    <iso:let name="zulaessige_Massnahmen" value="('Ersatzschutz', 'Verschluss_Ersatzschutz')"/>
    <iso:let name="Element_R" value="if (Fla_Zwieschutz_Element/ID_Fla_Schutz_R/Wert and       not(Fla_Zwieschutz_Element/Massnahme_R/Wert = $zulaessige_Massnahmen)) then 'Rechtslage' else ()"/>
    <iso:let name="Element_L" value="if (Fla_Zwieschutz_Element/ID_Fla_Schutz_L/Wert and       not(Fla_Zwieschutz_Element/Massnahme_L/Wert = $zulaessige_Massnahmen)) then 'Linkslage' else ()"/>
    <iso:let name="konjugation" value="if ($Element_R and $Element_L) then ' und ' else ()"/>
    <iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Element_R or $Element_L">Es ist eine Ersatzschutzmaßnahme für die Flankenschutzanforderung in <iso:value-of select="$Element_R"/><iso:value-of select="$konjugation"/><iso:value-of select="$Element_L"/> angegeben, als Maßnahme ist jedoch nicht "Ersatzschutz" oder "Verschluss_Ersatzschutz" projektiert.</iso:report>	
  </iso:rule>
</iso:pattern>