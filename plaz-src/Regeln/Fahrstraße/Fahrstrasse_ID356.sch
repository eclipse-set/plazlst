<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="972A34EA-FF64-411B-9614-CC76E705E926" see="Fahrstrasse_ID356" id="ID356" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
  <iso:title>Verwendung bestehender Instanzen von Markanter Punkt</iso:title>
  <iso:p>
    <planpro:description>      
      Wenn ein Markanter Punkt existiert, so muss auf diesen von Datenpunkt, ETCS-Signal, ETCS-W/Kr, Komponente einer Freimeldeanlage, 
      Durchrutschweg, Fahrweg, NB-Zonengrenze, Element der punktförmigen Zugbeeinflussung oder Zugeinwirkung verwiesen werden. 
      
      Wenn ein Markanter_Punkt existiert, so muss auf diesen von
      Datenpunkt.DP_Bezug_Funktional.ID_DP_Bezug_Funktional oder
      Datenpunkt.DP_Typ.DP_Typ_GETCS.ID_DP_Bezug_Funktional oder
      Datenpunkt.Datenpunkt_Einmesspunkt.ID_Einmesspunkt oder
      ETCS_Signal.ID_ETCS_Gefahrpunkt oder
      ETCS_Signal.ID_ETCS_Gefahrpunkt_2 oder
      ETCS_W_Kr.ID_ETCS_Gefahrpunkt_Nebengleis oder
      FMA_Komponente.ID_Bezugspunkt oder
      Fstr_DWeg.ID_PZB_Gefahrpunkt oder
      Fstr_Fahrweg.ID_Ziel oder
      NB_Zone_Grenze.ID_Markanter_Punkt oder
      PZB_Element_Zuordnung.PZB_Element_Zuordnung_BP.INA_Gefahrstelle.ID_Markanter_Punkt oder
      Zugeinwirkung.ID_Bezugspunkt
      verwiesen werden.
    </planpro:description>
    <planpro:comment/>
    <planpro:test>
      <planpro:success>
        Es existiert ein Verweis auf den Markanten Punkt von Datenpunkt, ETCS-Signal, ETCS-W/Kr, Komponente einer Freimeldeanlage, 
        Durchrutschweg, Fahrweg, NB-Zonengrenze, Element der punktförmigen Zugbeeinflussung oder Zugeinwirkung.
      </planpro:success>
      <planpro:error>
        Es existiert kein Verweis auf den Markanten Punkt von Datenpunkt, ETCS-Signal, ETCS-W/Kr, Komponente einer Freimeldeanlage, 
        Durchrutschweg, Fahrweg, NB-Zonengrenze, Element der punktförmigen Zugbeeinflussung oder Zugeinwirkung.
      </planpro:error>
    </planpro:test>
    <planpro:output>Markanter_Punkt</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Markanter_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
    <iso:let name="MP-ID" value="Identitaet/Wert"/>
    <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="key('Datenpunkt-fuerBezug_Funktional', $MP-ID, /*) or key('Datenpunkt-fuerGETCS_Bezug_Funktional', $MP-ID, /*) or        key('Datenpunkt-fuerEinmesspunkt', $MP-ID, /*) or key('ETCS_Signal-fuerETCS_Gefahrpunkt', $MP-ID, /*) or        key('ETCS_W_Kr-fuerETCS_Gefahrpunkt_Nebengleis', $MP-ID, /*) or key('FMA_Komponente-fuerBezugspunkt', $MP-ID, parent::*) or       key('Fstr_DWeg-fuerPZB_Gefahrpunkt', $MP-ID, parent::*) or key('Fstr_Fahrweg-fuerZiel', $MP-ID, parent::*) or         key('NB_Zone_Grenze-fuerMarkanter_Punkt', $MP-ID, parent::*) or key('PZB_Element_Zuordnung-fuerINA_Gefahrstelle', $MP-ID, /*) or       key('Zugeinwirkung-fuerBezugspunkt', $MP-ID, /*)">Es existiert kein Verweis auf den Markanten Punkt von Datenpunkt, ETCS-Signal, ETCS-W/Kr, Komponente einer Freimeldeanlage, Durchrutschweg, Fahrweg, NB-Zonengrenze, Element der punktförmigen Zugbeeinflussung oder Zugeinwirkung.</iso:assert>	
  </iso:rule>
</iso:pattern>