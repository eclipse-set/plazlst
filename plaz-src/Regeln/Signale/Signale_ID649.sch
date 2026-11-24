<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" fpi="D7C46658-35D6-4507-A758-7E113872BF02" see="Signale_ID649" id="ID649" planpro:arbeitspaket="Signale" planpro:version="1.10.0.3">
    <iso:title>Passfähigkeit Befestigung_Art vs. Signal_Befestigungsart</iso:title>
    <iso:p>
        <planpro:description>
            Es soll eine Warnung erfolgen, wenn Signal_Befestigung.Signal_Befestigung_Allg.Befestigung_Art == x
            und Signal_Befestigung.Identitaet ← Signal_Rahmen.ID_Signal_Befestigung → Signal_Rahmen.ID_Signal
            → Signal.Signal_Real.Signal_Befestigungsart ≠ y ist. 
            
            (x -- y)
            
            (andere -- andere); 
            (andere Sonderkonstruktion -- andere);
            (Arbeitsbuehne -- Signalausleger | Signalbruecke); 
            (Bahnsteig -- Sonderkonstruktion);
            (Dach_Decke -- Sonderkonstruktion);
            (Fundament -- Fundament);
            (Konstruktionsteil -- Sonderkonstruktion);
            (OL_Kettenwerk -- andere);
            (OL_Mast -- andere);
            (Pfahl -- andere);
            (Pfosten_hoch -- Mast);
            (Pfosten_niedrig -- Mast);
            (Prellbock -- andere);
            (Rahmen -- andere);
            (Regelanordnung_Mast_hoch -- Mast);
            (Regelanordnung_Mast_niedrig -- Mast);
            (Regelanordnung_Sonstige_hoch -- Mast);
            (Regelanordnung_Sonstige_niedrig -- Mast);
            (Schienenfuss -- andere);
            (Signalausleger -- Signalausleger);
            (Signalbruecke -- Signalbruecke);
            (Sonderanordnung_Mast_hoch -- Mast);
            (Sonderanordnung_Mast_niedrig -- Mast);
            (sonstige -- andere);
            (Wand -- Sonderkonstruktion).
        </planpro:description>
        <planpro:comment/>
        <planpro:test>
            <planpro:success>
                Die angegebene Art der Signalbefestigung passt zur Angabe der grundsätzlichen Befestigungsart
                im dazugehörigen Signal.
            </planpro:success>
            <planpro:error>
                Die angegebene Art der Signalbefestigung passt nicht zur Angabe der grundsätzlichen Befestigungsart
                im dazugehörigen Signal.
                Signalbefestigung: x
                Signal: y
            </planpro:error>
        </planpro:test>
        <planpro:output>Signal_Befestigung</planpro:output>
    </iso:p>
    <iso:rule role="warning" context="Signal_Befestigung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Signal_Befestigung_Allg/Befestigung_Art/Wert = $signalbefestigung-art/planpro:signal_befestigung/@art]">
        <iso:let name="Signalbefestigung_Art" value="Signal_Befestigung_Allg/Befestigung_Art/Wert"/>
        <iso:let name="vorgesehene_Signalbefestigungsart" value="$signalbefestigung-art/planpro:signal_befestigung[@art = $Signalbefestigung_Art]"/>
        <iso:let name="Signal_Rahmen" value="key('Signal_Rahmen-fuerSignal_Befestigung', Identitaet/Wert, /*)"/>
        <iso:let name="Signal" value="key('Signal', $Signal_Rahmen/ID_Signal/Wert, /*)"/>
        <iso:let name="Signalbefestigungsart" value="$Signal/Signal_Real/Signal_Befestigungsart/Wert"/>
        <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="every $x in $Signalbefestigungsart satisfies $x = $vorgesehene_Signalbefestigungsart">Die angegebene Art der Signalbefestigung passt nicht zur Angabe der grundsätzlichen Befestigungsart im dazugehörigen Signal. Signalbefestigung: <iso:value-of select="$Signalbefestigung_Art"/>, Signal: <xsl:value-of select="$Signalbefestigungsart" separator=" / "/></iso:assert>	
    </iso:rule>
</iso:pattern>