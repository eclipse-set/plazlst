<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="7F9D13EA-AFB7-40da-A314-189F1593856A" see="Flankenschutz_ID125" id="ID125" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>Flankenschutzdefinition für stellwerksbediente Weichen</iso:title>
  <iso:p>
    <planpro:description>
      Für jede stellwerksbediente Weiche im Planungsbereich muss für eine Fahrt über den linken und rechten Strang Flankenschutz geplant sein.
      
      Wenn W_Kr_Gsp_Element.Identitaet == Planung_Einzel.LST_Objekte_Planungsbereich.ID_LST_Objekt_Planungsbereich und
      W_Kr_Gsp_Element.W_Kr_Gsp_Element_Allg.W_Kr_Gsp_Stellart == "elektrisch_ferngestellt" und die Attributgruppe Weiche_Element gefüllt ist,
      dann müssen eine Instanz Fla_Schutz mit Fla_Schutz.Fla_Schutz_Anforderer.Fahrt_Ueber == "links" sowie eine Instanz 
      Fla_Schutz mit Fla_Schutz.Fla_Schutz_Anforderer.Fahrt_Ueber == "rechts" mittels 
      Fla_Schutz.Fla_Schutz_Anforderer.ID_Anforderer_Element auf dieses W_Kr_Gsp_Element verweisen.
    </planpro:description>
    <planpro:comment>
      Prüfung entfällt, falls
      - relevantes W_Kr_Gsp_Element_Allg.W_Kr_Gsp_Stellart xsi:nil="true"
      - relevantes Fla_Schutz.Fahrt_Ueber xsi:nil="true" 
    </planpro:comment>
    <planpro:test>
      <planpro:success>
        Für die stellwerksbediente Weiche im Planungsbereich ist für eine Fahrt über den [linken] und [rechten] Strang Flankenschutz geplant.
      </planpro:success>
      <planpro:error>
        Für die stellwerksbediente Weiche im Planungsbereich ist für eine Fahrt über den [linken]/[rechten] Strang kein Flankenschutz geplant.
      </planpro:error>
    </planpro:test>
    <planpro:output>W_Kr_Gsp_Element</planpro:output>
  </iso:p>
  <iso:rule role="warning" context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][W_Kr_Gsp_Element_Allg/W_Kr_Gsp_Stellart/Wert = 'elektrisch_ferngestellt'][Weiche_Element][key('Planungsbereich', Identitaet/Wert, /*)]     [fx:ignore-nil(key('Fla_Schutz-fuerAnforderer', Identitaet/Wert, parent::*)/Fla_Schutz_Anforderer/Fahrt_Ueber)]">
    <!-- [fx:ignore-nil(W_Kr_Gsp_Element_Allg/W_Kr_Gsp_Stellart)] wird nicht im context aufgeführt, da das implizit in der Prüfung auf
    [Wert = 'elektrisch_ferngestellt'] enthalten ist -->
    <!-- zusätzlich wird xsi:nil für Fla_Schutz/Fla_Schutz_Anforderer/Fahrt_Ueber/Wert geprüft -->
    <iso:let name="FlaSchutz" value="key('Fla_Schutz-fuerAnforderer', Identitaet/Wert, parent::*)"/>
    <iso:let name="FahrtUeber" value="$FlaSchutz/Fla_Schutz_Anforderer/Fahrt_Ueber/Wert"/>
    <iso:let name="FlaSchutz_R" value="if ($FahrtUeber = 'rechts') then () else ('rechten')"/>
    <iso:let name="FlaSchutz_L" value="if ($FahrtUeber = 'links') then () else ('linken')"/>
    <iso:let name="konjugation" value="if ($FlaSchutz_R and $FlaSchutz_L) then (' und ') else ()"/>
    <iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$FlaSchutz_R or $FlaSchutz_L">Für die stellwerksbediente Weiche im Planungsbereich ist für eine Fahrt über den <iso:value-of select="$FlaSchutz_R"/><iso:value-of select="$konjugation"/><iso:value-of select="$FlaSchutz_L"/> Strang kein Flankenschutz geplant.</iso:report>	
  </iso:rule>
</iso:pattern>