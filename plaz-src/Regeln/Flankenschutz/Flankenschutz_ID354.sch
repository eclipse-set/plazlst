<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="312C24F6-3F99-4C4A-BDD0-E46823F5796D" see="Flankenschutz_ID354" id="ID354" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>Zwieschutzweiche soll in beiden Lagen Flankenschutz bieten</iso:title>
  <iso:p>
    <planpro:description>
      Wenn eine Weiche als Zwieschutzweiche definiert ist, soll sie sowohl in Links- wie auch in Rechtslage Flankenschutz bieten.
      
      Wenn eine Instanz Fla_Zwieschutz mittels Fla_Zwieschutz.ID_W_Element auf ein W_Kr_Gsp_Element verweist, dann müssen eine 
      Instanz Fla_Schutz mit Fla_Schutz.Fla_Schutz_W_Gsp.Fla_W_Lage == "links" und eine Instanz Fla_Schutz mit 
      Fla_Schutz.Fla_Schutz_W_Gsp.Fla_W_Lage == "rechts" mittels Fla_Schutz.Fla_Schutz_W_Gsp.ID_Fla_W_Gsp_Element auf dieses 
      W_Kr_Gsp_Element verweisen.
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Eine Weiche ist als Zwieschutzweiche definiert und soll in Links- und Rechtslage Flankenschutz bieten.
      </planpro:success>
      <planpro:error>
        Eine Weiche ist als Zwieschutzweiche definiert, soll jedoch nicht in Links- und Rechtslage Flankenschutz bieten.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fla_Zwieschutz</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Fla_Zwieschutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fla-354(current(), parent::*)]">
    <iso:let name="Fla_Schutz" value="key('Fla_Schutz-fuerW_Kr_Gsp_Element', ID_W_Element/Wert, parent::*)"/>
    <iso:let name="Fla_W_Lage" value="$Fla_Schutz/Fla_Schutz_W_Gsp/Fla_W_Lage/Wert"/>
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Fla_W_Lage = 'links' and $Fla_W_Lage = 'rechts'">Eine Weiche ist als Zwieschutzweiche definiert, soll jedoch nicht in Links- und Rechtslage Flankenschutz bieten.</iso:assert>	
  </iso:rule>
</iso:pattern>