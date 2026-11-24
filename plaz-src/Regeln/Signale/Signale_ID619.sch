<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="914DCC56-A7DF-473B-9FAD-8E0E94D127A4" see="Signale_ID619" id="ID619" planpro:arbeitspaket="Signale" planpro:version="1.10.0.3">
    <iso:title>Signalanordnung mit Fundament</iso:title>
    <iso:p>
        <planpro:description>
            Eine Signalbefestigung der Art "Fundament" darf nicht auf eine andere Signalbefestigung verweisen.

            Wenn Signal_Befestigung.Signal_Befestigung_Allg.Befestigung_Art == "Fundament",
            dann darf Signal_Befestigung.ID_Signal_Befestigung nicht gefüllt sein.
        </planpro:description>
        <planpro:comment/>
        <planpro:test>
            <planpro:success>
                Die Signalbefestigung "Fundament" verweist nicht auf eine andere Signalbefestigung.
            </planpro:success>
            <planpro:error>
                Die Signalbefestigung "Fundament" verweist auf eine andere Signalbefestigung. Bei Signalanordnungen mit Fundament
                muss jedoch von der Befestigung, die den Signalaufbau abbildet, auf die Befestigung "Fundament" verwiesen werden.
            </planpro:error>
        </planpro:test>
        <planpro:output>Signal_Befestigung</planpro:output>
    </iso:p>
    <iso:rule role="error" context="Signal_Befestigung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Signal_Befestigung_Allg/Befestigung_Art/Wert = 'Fundament']">
        <iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="ID_Signal_Befestigung">Die Signalbefestigung "Fundament" verweist auf eine andere Signalbefestigung. Bei Signalanordnungen mit Fundament muss jedoch von der Befestigung, die den Signalaufbau abbildet, auf die Befestigung "Fundament" verwiesen werden.</iso:report>	
    </iso:rule>
</iso:pattern>