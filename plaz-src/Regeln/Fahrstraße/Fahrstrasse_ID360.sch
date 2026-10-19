<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="6E151C63-EBFD-4AC1-8BE5-7EACA62D5737" see="Fahrstrasse_ID360" id="ID360" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
    <iso:title>Begrenzung des Fahrwegs einer Gruppenausfahrzugstraße (Start)</iso:title>
    <iso:p>
        <planpro:description>
            Prüfung, ob ein zu einer Gruppenausfahrzugstraße gehörender Fahrweg an den dafür vorgesehenen Signalen beginnt.
            
            Wenn Fstr_Zug_Rangier.Fstr_Zug gefüllt und Fstr_Zug_Rangier.Fstr_Zug.ID_Signal_Gruppenausfahrt vohanden ist,    
            dann muss Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Start ein Signal mit 
            Signal.Signal_Real.Signal_Real_Aktiv_Schirm.Signal_Art == "Sperrsignal" sein.
        </planpro:description>
        <planpro:comment/>
        <planpro:test>
            <planpro:success>
                Die Gruppenausfahrzugstraße beginnt an einem Sperrsignal.
            </planpro:success>
            <planpro:error>
                Die Gruppenausfahrzugstraße beginnt nicht an einem Sperrsignal.
            </planpro:error>
        </planpro:test>
        <planpro:output>Fstr_Zug_Rangier</planpro:output>
    </iso:p>
    <iso:rule role="error" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Zug/ID_Signal_Gruppenausfahrt]">
        <iso:let name="Fstr_Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
        <iso:let name="Signalart" value="key('Signal', $Fstr_Fahrweg/ID_Start/Wert, /*)/Signal_Real/Signal_Real_Aktiv_Schirm/Signal_Art/Wert"/>
        <iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Signalart = 'Sperrsignal'">Die Gruppenausfahrzugstraße beginnt nicht an einem Sperrsignal.</iso:assert>
    </iso:rule>
</iso:pattern>