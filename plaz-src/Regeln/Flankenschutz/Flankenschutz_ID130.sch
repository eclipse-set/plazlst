<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="CF642B94-B686-4e65-AB86-D6423F91C176" see="Flankenschutz_ID130" id="ID130" planpro:arbeitspaket="Flankenschutz" planpro:version="1.10.0.3">
  <iso:title>Existenz der Ersatzschutzmaßnahme bei Ersatzschutz</iso:title>
  <iso:p>
    <planpro:description>
      Wenn für den Strang einer Zwieschutzweiche "Ersatzschutz" oder "Verschluss_Ersatzschutz" definiert ist, muss auch eine
      entsprechende Ersatzschutzmaßnahme angegeben sein.
      
      Wenn Fla_Zwieschutz.Fla_Zwieschutz_Element.Massnahme_L (bzw. ..._R) == "Ersatzschutz" oder "Verschluss_Ersatzschutz",
      dann muss der Verweis Fla_Zwieschutz.Fla_Zwieschutz_Element.ID_Fla_Schutz_L (bzw. ..._R) gefüllt sein.
    </planpro:description>
    <planpro:comment>
      Prüfung entfällt, falls:
      - relevante Fla_Zwieschutz_Element.Massnahme_L xsi:nil="true"
      - relevante Fla_Zwieschutz_Element.Massnahme_R xsi:nil="true" 
    </planpro:comment>
    <planpro:test>
      <planpro:success>
        Als Schutzmaßnahme ist im (rechten) (und) (linken) Strang der Zwieschutzweiche "Ersatzschutz" oder "Verschluss_Ersatzschutz" projektiert.
        Der Verweis auf die Ersatzschutzmaßnahme ist vorhanden.        
      </planpro:success>
      <planpro:error>
        Als Schutzmaßnahme ist im (rechten) (und) (linken) Strang der Zwieschutzweiche "Ersatzschutz" oder "Verschluss_Ersatzschutz" projektiert.
        Der Verweis auf die Ersatzschutzmaßnahme(n) ist jedoch nicht vorhanden.
      </planpro:error>
    </planpro:test>
    <planpro:output>Fla_Zwieschutz</planpro:output>
  </iso:p>
  <iso:rule role="error" context="Fla_Zwieschutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fla_Zwieschutz_Element/(Massnahme_L | Massnahme_R)/Wert = ('Ersatzschutz', 'Verschluss_Ersatzschutz')]     [fx:ignore-nil(Fla_Zwieschutz_Element/(Massnahme_L | Massnahme_R))]">
    <iso:let name="FlaSchutz_R" value="if (Fla_Zwieschutz_Element[Massnahme_R/Wert = ('Ersatzschutz', 'Verschluss_Ersatzschutz')]                                                                  [not(ID_Fla_Schutz_R)]) then 'rechten' else ()"/>
    <iso:let name="FlaSchutz_L" value="if (Fla_Zwieschutz_Element[Massnahme_L/Wert = ('Ersatzschutz', 'Verschluss_Ersatzschutz')]                                                                  [not(ID_Fla_Schutz_L)]) then 'linken' else ()"/>
    <iso:let name="konjugation" value="if ($FlaSchutz_R and $FlaSchutz_L) then ' und ' else ()"/>
    <iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$FlaSchutz_L or $FlaSchutz_R">Als Schutzmaßnahme ist im <iso:value-of select="$FlaSchutz_R"/><iso:value-of select="$konjugation"/><iso:value-of select="$FlaSchutz_L"/> Strang der Zwieschutzweiche "Ersatzschutz" oder "Verschluss_Ersatzschutz" projektiert. Der Verweis auf die Ersatzschutzmassnahme<iso:value-of select="if ($konjugation) then 'n' else ()"/> ist jedoch nicht vorhanden.</iso:report>
  </iso:rule>
</iso:pattern>