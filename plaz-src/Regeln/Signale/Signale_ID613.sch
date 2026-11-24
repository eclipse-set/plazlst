<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="63E58B5A-DEC9-4D03-8BD8-4F2C7F688CE7" see="Signale_ID613" id="ID613" planpro:arbeitspaket="Signale" planpro:version="1.10.0.3">
    <iso:title>Kaskadierte Signalbefestigungen</iso:title>
    <iso:p>
        <planpro:description>
            Eine Signalbefestigung darf nur auf eine andere Signalbefestigung verweisen. In der Verweiskette für Signalbefestigungen darf
            jede Signalbefestigung nur einmal erscheinen. Es darf keinen Rückverweis auf bereits in der Verweiskette enthaltene Signalbefestigungen geben.
            
            Für jede Signal_Befestigung, auch die über Signal_Befestigung.ID_Signal_Befestigung referenzierten, soll gelten:
            Signal_Befestigung.ID_Signal_Befestigung muss ≠ Signal_Befestigung.Identitaet sein.
        </planpro:description>
        <planpro:comment/>
        <planpro:test>
            <planpro:success>
                Die Signalbefestigung verweist auf eine andere Signalbefestigung.
            </planpro:success>
            <planpro:error>
                Die Signalbefestigung verweist auf sich selbst oder es gibt einen Selbstverweis in der Verweiskette. Es ist jedoch
                nur ein Verweis auf eine andere Signalbefestigung sinnvoll (z. B. Arbeitsbühne → Signalbrücke).
            </planpro:error>
        </planpro:test>
        <planpro:output>Signal_Befestigung</planpro:output>
    </iso:p>
    <iso:rule role="error" context="Signal_Befestigung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][ID_Signal_Befestigung]">
        <iso:let name="rekursive_Referenzen" value="fx:Sig-613('', current(), /*)"/>
        <iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$rekursive_Referenzen">Die Signalbefestigung verweist auf sich selbst oder es gibt einen Selbstverweis in der Verweiskette. Es ist jedoch nur ein Verweis auf eine andere Signalbefestigung sinnvoll (z. B. Arbeitsbühne -&gt; Signalbrücke).</iso:report>	
    </iso:rule>
</iso:pattern>