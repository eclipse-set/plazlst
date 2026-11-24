<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="11282A7F-B10A-4C88-AD97-59AC80F48EAA" see="Flankenschutz_ID679" id="ID679" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>"Fahrt über" nur bei Weiche/Kreuzung als Flankenschutz-Anforderer</iso:title>
  <iso:p>
    <planpro:description>
      Die Angabe "Fahrt über" darf nur vorhanden sein, wenn als Flankenschutz-Anforderer eine Weiche oder Kreuzung 
      ausgewählt wurde.
      
      Wenn Fla_Schutz.Fla_Schutz_Anforderer.Fahrt_Ueber vorhanden ist, dann muss
      Fla_Schutz.Fla_Schutz_W_Gsp.ID_Fla_W_Gsp_Element → W_Kr_Gsp_Element.Weiche_Element existieren. 
    </planpro:description>
    <planpro:comment>
      Prüfung entfällt, falls
      - Fahrt_Ueber nil
      - ID_Fla_W_Gsp_Element nil
      - referenziertes W_Kr_Gsp_Element fehlend
    </planpro:comment>
    <planpro:test>
      <planpro:success>
        Die Angabe "Fahrt über" ist vorhanden und als Flankenschutz-Anforderer ist eine Weiche oder Kreuzung angegeben. 
      </planpro:success>
      <planpro:error>
        Die Angabe "Fahrt über" ist vorhanden, als Flankenschutz-Anforderer ist jedoch keine Weiche oder Kreuzung angegeben. 
      </planpro:error>
    </planpro:test>
    <planpro:output>W_Kr_Gsp_Element</planpro:output>
  </iso:p>
  
  <iso:include href="../incomplete/Fla_Schutz-nil_Fahrt_ueber-E.xml"/>
  <iso:include href="../incomplete/Fla_Schutz-nil_ID_Fla_W_Gsp_Element-E.xml"/>
  <iso:include href="../incomplete/Fla_Schutz-miss_W_Kr_Gsp_Element-E.xml"/>
  
  <iso:rule role="error" context="Fla_Schutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fla_Schutz_Anforderer/Fahrt_Ueber]">
    <iso:let name="w-kr-gsp-element" value="key('W_Kr_Gsp_Element', Fla_Schutz_W_Gsp/ID_Fla_W_Gsp_Element/Wert, parent::*)"/>
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$w-kr-gsp-element/Weiche_Element">Die Angabe "Fahrt über" ist vorhanden, als Flankenschutz-Anforderer ist jedoch keine Weiche oder Kreuzung angegeben.</iso:assert>	
  </iso:rule>
  
  
</iso:pattern>