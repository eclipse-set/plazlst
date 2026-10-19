<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="37A51815-C854-4E54-AE8E-B19A738874D9" see="Flankenschutz_ID355" id="ID355" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>Kennzeichnung des Kreuzungsanteils nur bei Flankenschutzbetrachtung für Einfache Kreuzungsweichen</iso:title>
  <iso:p>
    <planpro:description>
      Die Kennzeichnung des Kreuzungsanteils einer Einfachen Kreuzungsweiche für die Flankenschutzbetrachtung darf nur angegeben sein,
      wenn der Flankenschutz-Anforderer auch eine Einfache Kreuzungsweiche ist.
      
      Fla_Schutz.Fla_Schutz_Anforderer.EKW_Kr_Anteil == "true" darf nur vorhanden sein, wenn
      Fla_Schutz.Fla_Schutz_Anforderer.ID_Anforderer_Element == W_Kr_Gsp_Element und in der dazugehörigen
      W_Kr_Anlage (W_Kr_Gsp_Element.ID_W_Kr_Anlage) W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "EKW", "EBKW", "EIBKW" oder "EABKW" ist. 
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Die Flankenschutzbetrachtung bezieht sich auf den Kreuzungsanteil einer Einfachen Kreuzungsweiche
        und der Flankenschutz-Anforderer ist eine Einfache Kreuzungsweiche. 
      </planpro:success>
      <planpro:error>
        Die Flankenschutzbetrachtung bezieht sich auf den Kreuzungsanteil einer Einfachen Kreuzungsweiche,
        als Flankenschutz-Anforderer ist jedoch keine Einfache Kreuzungsweiche angegeben.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fla_Schutz</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Fla_Schutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fla_Schutz_Anforderer/EKW_Kr_Anteil/Wert = 'true']">
    <iso:let name="W_Kr_Gsp_Element" value="key('W_Kr_Gsp_Element', Fla_Schutz_Anforderer/ID_Anforderer_Element/Wert, parent::*)"/>
    <iso:let name="W_Kr_Anlage" value="key('W_Kr_Anlage', $W_Kr_Gsp_Element/ID_W_Kr_Anlage/Wert, parent::*)"/>
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$W_Kr_Anlage/W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('EKW', 'EBKW', 'EIBKW', 'EABKW')">Die Flankenschutzbetrachtung bezieht sich auf den Kreuzungsanteil einer Einfachen Kreuzungsweiche, als Flankenschutz-Anforderer ist jedoch keine Einfache Kreuzungsweiche angegeben.</iso:assert>	
  </iso:rule>
</iso:pattern>