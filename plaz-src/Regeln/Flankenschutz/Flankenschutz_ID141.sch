<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="96357E55-D150-494c-A838-D4F05F1A93D3" see="FlankenschutZ_ID141" id="ID141" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>Passfähigkeit Flankenschutz bietendes Element mit Angabe zur Lage</iso:title>
  <iso:p>
    <planpro:description>
      Wenn das Flankenschutz bietende Element ein Weichen-Element ist, muss die Lage der Flankenschutz bietenden Weiche definiert sein.
      
      Wenn Fla_Schutz.Fla_Schutz_W_Gsp.ID_Fla_W_Gsp_Element == W_Kr_Gsp_Element mit Attributgruppe "Weiche_Element", 
      muss Fla_Schutz.Fla_Schutz_W_Gsp.Fla_W_Lage gefüllt sein.
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Das Flankenschutz bietende Element ist ein Weichen-Element und die Lage der Flankenschutz bietenden Weiche ist definiert.
      </planpro:success>
      <planpro:error>
        Das Flankenschutz bietende Element ist ein Weichen-Element und die Lage der Flankenschutz bietenden Weiche ist nicht definiert.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fla_Schutz</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Fla_Schutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fla-141(current(), parent::*)]">
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Fla_Schutz_W_Gsp/Fla_W_Lage/Wert">Das Flankenschutz bietende Element ist ein Weichen-Element und die Lage der Flankenschutz bietenden Weiche ist nicht definiert.</iso:assert>	
  </iso:rule>
</iso:pattern>