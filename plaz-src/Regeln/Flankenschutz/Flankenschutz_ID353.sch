<?xml version="1.0" encoding="UTF-8" standalone="no"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="FCDB50D8-0736-4339-8B53-36890F3F35A7" id="ID353" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3" see="Flankenschutz_ID353">
  <iso:title>Passfähigkeit der Angaben Lage und Flankenschutz bietendes Element</iso:title>
  <iso:p>
    <planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>  Wenn die Lage der Flankenschutz bietenden Weiche definiert ist, muss als Flankenschutz bietendes Element ein Weichen-Element angegeben sein.
  
  Wenn Fla_Schutz.Fla_Schutz_W_Gsp.Fla_W_Lage gefüllt ist,
  muss Fla_Schutz.Fla_Schutz_W_Gsp.ID_Fla_W_Gsp_Element == W_Kr_Gsp_Element mit Attributgruppe Weiche_Element sein.
</code></pre>
</planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Die Lage der Flankenschutz bietenden Weiche ist definiert und als Flankenschutz bietendes Element ist ein Weichen-Element angegeben.
      </planpro:success>
      <planpro:error>
        Die Lage der Flankenschutz bietenden Weiche ist definiert und als Flankenschutz bietendes Element ist kein Weichen-Element angegeben.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fla_Schutz</planpro:output>
  </iso:p>
  <iso:rule context="Fla_Schutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fla_Schutz_W_Gsp/Fla_W_Lage]" role="error">
    <iso:let name="W_Kr_Gsp_Element" value="key('W_Kr_Gsp_Element', Fla_Schutz_W_Gsp/ID_Fla_W_Gsp_Element/Wert, parent::*)"/>
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$W_Kr_Gsp_Element/Weiche_Element">Die Lage der Flankenschutz bietenden Weiche ist definiert und als Flankenschutz bietendes Element ist kein Weichen-Element angegeben.</iso:assert>	
  </iso:rule>
</iso:pattern>