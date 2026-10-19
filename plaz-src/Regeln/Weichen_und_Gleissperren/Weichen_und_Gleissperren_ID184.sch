<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="CD163825-9E2B-4fd3-8E62-719F406C8DDE" see="Weichen_und_Gleissperren_ID184" id="ID184" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
  <iso:title>Kein Zungenprüfkontakt ohne Weichenantrieb</iso:title>
  <iso:p>
    <planpro:description>
      Sofern für eine Weiche (ohne Rückfallweichen oder Zungen- und herzstücklose Abzweigungen) kein elektrischer Weichenantrieb vorgesehen ist,
      darf auch kein Zungenprüfkontakt geplant werden. 
      
      Wenn W_Kr_Gsp_Element.W_Kr_Gsp_Element_Allg.W_Kr_Gsp_Stellart ≠ "Rueckfallweiche" oder "ZHA"
      und in den dazugehörigen W_Kr_Gsp_Komponente W_Kr_Gsp_Komponente.Zungenpaar.Elektrischer_Antrieb_Anzahl == "0",
      muss auch jeweils W_Kr_Gsp_Komponente.Zungenpaar.Zungenpruefkontakt_Anzahl == "0" sein.
  	</planpro:description>
    <planpro:comment>
      Prüfung entfällt, falls
      - W_Kr_Gsp_Element_Allg.W_Kr_Gsp_Stellart xsi:nil="true"
      - ID_W_Kr_Gsp_Element xsi:nil="true"
      - fehlendes referenziertes W_Kr_Gsp_Element
      - Zungenpaar.Elektrischer_Antrieb_Anzahl xsi:nil="true"
      - Zungenpaar.Zungenpruefkontakt_Anzahl xsi:nil="true"
    </planpro:comment>
    <planpro:test>
      <planpro:success>
        Die Weichen-Komponenten haben keinen elektrischen Antrieb und die Anzahl der Zungenprüfkontakte ist Null.
      </planpro:success>
      <planpro:error>
        Mindestens eine Weichen-Komponente hat keinen elektrischen Antrieb, jedoch ist die Anzahl der Zungenprüfkontakte ungleich Null.
      </planpro:error>
    </planpro:test>
    <planpro:output>W_Kr_Gsp_Komponente</planpro:output>
  </iso:p>
  <iso:rule role="error" context="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:WGsp-184(current(), parent::*)]     [fx:ignore-nil(Zungenpaar/Zungenpruefkontakt_Anzahl)]">
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Zungenpaar/Zungenpruefkontakt_Anzahl/Wert = '0'">Mindestens eine Weichen-Komponente hat keinen elektrischen Antrieb, jedoch ist die Anzahl der Zungenprüfkontakte ungleich Null.</iso:assert>	
  </iso:rule>
</iso:pattern>