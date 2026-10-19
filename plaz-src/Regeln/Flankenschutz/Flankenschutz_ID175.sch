<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="4D835BD4-65A7-4c63-BD63-8AC5DDACFCDA" see="Flankenschutz_ID175" id="ID175" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>Zirkelbezug bei Flankenschutz-Weitergabe</iso:title>
  <iso:p>
    <planpro:description>
      Bei Weitergabe der Flankenschutzanforderung im rechten/linken Strang darf nicht auf die betrachtete Instanz von Fla_Schutz verwiesen werden.
      
      Fla_Schutz.Identitaet muss ≠ Fla_Schutz.Fla_Schutz_Weitergabe.ID_Fla_Weitergabe_R → Fla_Schutz.Identitaet bzw.
      Fla_Schutz.Fla_Schutz_Weitergabe.ID_Fla_Weitergabe_L → Fla_Schutz.Identitaet sein.
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Unter Flankenschutz-Weitergabe im [rechten]/[linken] Strang wird nicht auf die betrachtete Instanz von Fla_Schutz verwiesen.
      </planpro:success>
      <planpro:error>
        Unter Flankenschutz-Weitergabe im [rechten]/[linken] Strang wird auf die betrachtete Instanz von Fla_Schutz verwiesen.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fla_Schutz</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Fla_Schutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
    <iso:let name="Fla_Schutz_ID" value="Identitaet/Wert"/>
    <iso:let name="Weitergabe_R" value="if (Fla_Schutz_Weitergabe/ID_Fla_Weitergabe_R[Wert = $Fla_Schutz_ID]) then ('rechten') else ()"/>
    <iso:let name="Weitergabe_L" value="if (Fla_Schutz_Weitergabe/ID_Fla_Weitergabe_L[Wert = $Fla_Schutz_ID]) then ('linken') else ()"/>
    <iso:let name="konjugation" value="if ($Weitergabe_R and $Weitergabe_L) then (' und ') else ()"/>
    <iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Weitergabe_R or $Weitergabe_L">Unter Flankenschutz-Weitergabe im <iso:value-of select="$Weitergabe_R"/><iso:value-of select="$konjugation"/><iso:value-of select="$Weitergabe_L"/> Strang wird auf die betrachtete Instanz von Fla_Schutz verwiesen.</iso:report>	
  </iso:rule>
</iso:pattern>