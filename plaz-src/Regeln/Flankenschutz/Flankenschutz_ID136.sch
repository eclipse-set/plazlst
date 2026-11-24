<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="DEAC8563-AB37-4756-8607-F5BF26E5AADA" see="FlankenschutZ_ID136" id="ID136" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>Definition einer Zwieschutzweiche</iso:title>
  <iso:p>
    <planpro:description>      
      Wenn eine Weiche sowohl in Links- wie auch in Rechtslage Flankenschutz bietet, muss sie als Zwieschutzweiche definiert werden.
      
      Wenn eine Instanz Fla_Schutz mit Fla_Schutz.Fla_Schutz_W_Gsp.Fla_W_Lage == "links" und eine Instanz Fla_Schutz mit
      Fla_Schutz.Fla_Schutz_W_Gsp.Fla_W_Lage == "rechts" mit identischem Wert Fla_Schutz.Fla_Schutz_W_Gsp.ID_Fla_W_Gsp_Element existieren,
      dann muss auf dieses W_Kr_Gsp_Element ebenfalls mittels Fla_Zwieschutz.ID_W_Element verwiesen werden.
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Eine Weiche soll in Links- und Rechtslage Flankenschutz bieten und ist als Zwieschutzweiche definiert. 
      </planpro:success>
      <planpro:error>
        Eine Weiche soll in Links- und Rechtslage Flankenschutz bieten und ist nicht als Zwieschutzweiche definiert. 
      </planpro:error>
    </planpro:test>
    <planpro:output>W_Kr_Gsp_Element</planpro:output>
  </iso:p>
  <iso:rule role="error" context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]     [key('Fla_Schutz-fuerW_Kr_Gsp_Element', Identitaet/Wert, parent::*)[Fla_Schutz_W_Gsp/Fla_W_Lage/Wert = 'links']]     [key('Fla_Schutz-fuerW_Kr_Gsp_Element', Identitaet/Wert, parent::*)[Fla_Schutz_W_Gsp/Fla_W_Lage/Wert = 'rechts']]">
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="key('Fla_Zwieschutz-fuerW_Element', Identitaet/Wert, parent::*)">Eine Weiche soll in Links- und Rechtslage Flankenschutz bieten und ist nicht als Zwieschutzweiche definiert.</iso:assert>	
  </iso:rule>
</iso:pattern>