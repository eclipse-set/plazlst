<?xml version="1.0" encoding="UTF-8"?>
<iso:diagnostics xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Zuarbeit von allgemeinen Elementinformationen, die für die Präsentation der Fehlermeldung im PDF-/HTML-Report nützlich sind.
         Sie werden nur im Fehlerfalle genutzt und durch die konkrete Information an der Fehlerstelle ersetzt -->

    <!-- Die Bezeichnungen werden nach folgendem Muster ausgegeben:
        
         '00'   s1 "s2"

         '01'   s1 "s2 s3"
         '02'   s1 "s2/s3"
         '03'   s1 "s2 (s3)"
         '04'   s1 "s2 - s3"
         '05'   s1 "s2s3"

         '10'   s1 "s2", s3 "s4"
         '11'   s1 "s2/s3 [s4]"
         '12'   s1 "s2/s3 (s4)"
         '13'   s1 "s2 s3/s4"
         '14'   s1 "s2 (s3/s4)"
         '15'   s1 "s2s3s4"
         '16'   s1 "s2 (s3 s4)"
         '17'   s1 "s2 s3 (s4)"
         '18'   s1 "s2 s3 s4"
         '19'   s1 "s2 - s3 s4"

         '20'   s1 "s2 s3, s4 s5"
         '21'   s1 "s2", s3 "s4 s5"
         '22'   s1 "s2 s3" (s4 s5)
         '23'   s1 "s2", s3 "s4 (s5)" [frei, nicht benutzt]
         '24'   s1 "s2/s3" s4 "s5"
         '25'   s1 "s2/s3 [s4] (s5)"
         '26'   s1 "s2 s3/s4 [s5]"
         '27'   s1 "s2 s3/s4 (s5)"
         '28'   s1 "s2/s3 (s4 s5)"
         '29'   s1 "s2 (s3s4s5)"
         '30'   s1 "s2 s3 (s4/s5)"

         '40'   s1 "s2, s3 s4, s5 s6"
         '41'   s1 "s2 s3/s4 [s5] (s6)"

         '50'   s1 "s2 (s3 s4 s5, s6 s7)"
         '51'   s1 "s2 - s3 (s4 s5, s6 s7)"
         '52'   s1 "s2 - s3 s4, s5 (s6, s7)"
         '53'   s1 "s2 - s3 s4, s5 (s6, s7)..."
         '54'   s1 "s2 s3, s4 s5, s6 s7"
         
    -->
    <iso:diagnostic id="guid">
        <xsl:choose>
            <xsl:when test="self::Container">
                <xsl:sequence select="../Identitaet/Wert/text()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="Identitaet/Wert/text()"/>
            </xsl:otherwise>
        </xsl:choose>
    </iso:diagnostic>
    <iso:diagnostic id="typ">
        <xsl:choose>
            <xsl:when test="self::Container">
                <xsl:sequence select="'Container'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="objekttyp" select="ancestor-or-self::*[parent::Container]"/>
                <xsl:sequence select="local-name($objekttyp)"/>
            </xsl:otherwise>
        </xsl:choose>
    </iso:diagnostic>    
    <iso:diagnostic id="bereich">
        <xsl:variable name="current-id" select="ancestor-or-self::*[parent::Container]/Identitaet/Wert"/>
        <xsl:choose>
            <xsl:when test="$planungsbereich and $betrachtungsbereich">
                <!-- beide XSL-Variablen ($planungsbereich, $betrachtungsbereich) kommen direkt aus der Regel
                    und werden für die relevanten Regeln mit dieser Benennung und Funktion implementiert
                    Dieser Fall wird benötigt, wenn der Regelkontext nicht auf oder in einem Objekt liegt,
                    für das die Zuordnung zu Planungs- oder Betrachtungsbereich unabhängig von der konkreten Regel
                    abgeleitet werden kann.
                    Beide XSL-Variablen werden entsprechend der Fehlerzuordnung innerhalb der Regel belegt. -->
                <xsl:sequence select="'Planung Betrachtung'"/>
            </xsl:when>            
            <xsl:when test="key('Planungsbereich', $current-id, /*) or $planungsbereich">
                <xsl:sequence select="'Planung'"/>
            </xsl:when>
            <xsl:when test="ancestor::LST_Planung">
                <xsl:sequence select="'Betrachtung'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Zustand'"/>
            </xsl:otherwise>
        </xsl:choose>
    </iso:diagnostic>
    <iso:diagnostic id="aufbau">
        <xsl:choose>
            <xsl:when test="self::Container">
                <xsl:sequence select="'00'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="objekttyp" select="ancestor-or-self::*[parent::Container]"/>
                <xsl:choose>
                    <xsl:when test="$objekttyp/self::Anhang">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Aussenelementansteuerung">
                        <xsl:sequence select="'01'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bahnsteig_Anlage |
                                    $objekttyp/self::Bahnsteig_Dach |
                                    $objekttyp/self::Bahnsteig_Kante">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bahnsteig_Zugang">
                        <xsl:sequence select="'10'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bedien_Standort">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bedien_Anzeige_Element">
                        <xsl:sequence select="'10'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bedien_Einrichtung_Oertlich">
                        <xsl:sequence select="'01'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Block_Anlage">
                        <xsl:sequence select="'01'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Block_Element">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Anlage |
                                    $objekttyp/self::BUE_Anlage_Strasse |
                                    $objekttyp/self::BUE_Anlage_V">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Ausschaltung |
                                    $objekttyp/self::BUE_Bedien_Anzeige_Element |
                                    $objekttyp/self::BUE_Einschaltung |
                                    $objekttyp/self::BUE_Gleisbezogener_Gefahrraum |
                                    $objekttyp/self::BUE_Kante">
                        <xsl:sequence select="'10'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Schnittstelle">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Spezifisches_Signal">
                        <xsl:variable name="current-signal" select="key('Signal', $objekttyp/ID_Signal/Wert, /*)"/>
                        <xsl:choose>
                            <xsl:when test="$current-signal/Bezeichnung">
                                <xsl:sequence select="'00'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'20'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Datenpunkt">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::ESTW_Zentraleinheit">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fla_Freimelde_Zuordnung">
                        <xsl:variable name="current-fla_schutz" select="key('Fla_Schutz', $objekttyp/ID_Fla_Schutz/Wert, $objekttyp/parent::*)"/>
                        <xsl:variable name="current-fla_schutz-anforderer" select="$current-fla_schutz/*/ID_Anforderer_Element/Wert"/>
                        <xsl:choose>
                            <xsl:when test="$current-fla_schutz/*/Fahrt_Ueber/Wert">
                                <xsl:sequence select="'01'"/>
                            </xsl:when>
                            <xsl:when test="key('NB_Zone_Grenze', $current-fla_schutz-anforderer, $objekttyp/parent::*)">
                                <xsl:sequence select="'30'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'00'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fla_Schutz">
                        <xsl:variable name="current-fla_schutz-anforderer" select="$objekttyp/*/ID_Anforderer_Element/Wert"/>
                        <xsl:choose>
                            <xsl:when test="$objekttyp/*/Fahrt_Ueber/Wert">
                                <xsl:sequence select="'01'"/>
                            </xsl:when>
                            <xsl:when test="key('NB_Zone_Grenze', $current-fla_schutz-anforderer, $objekttyp/parent::*)">
                                <xsl:sequence select="'30'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'00'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fla_Zwieschutz">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::FMA_Anlage |
                                    $objekttyp/self::FMA_Element">
                        <xsl:sequence select="'15'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::FMA_Komponente">
                        <xsl:choose>
                            <xsl:when test="$objekttyp/FMA_Komponente_Achszaehlpunkt">
                                <xsl:sequence select="'00'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'20'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Aneinander">
                        <!--                <xsl:variable name="current-fstr_fahrweg" select="$objekttyp/../Fstr_Fahrweg[Identitaet/Wert = $objekttyp/ID_Fstr_Fahrweg/Wert]"/>
                                        <xsl:variable name="current-dweg" select="$objekttyp/../Fstr_DWeg[Identitaet/Wert = $objekttyp/*/*/ID_Fstr_DWeg/Wert]"/>
                                        <xsl:choose>
                                            <xsl:when test="$current-dweg">
                                                <xsl:sequence select="'12'"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:sequence select="'02'"/>
                                            </xsl:otherwise>
                                        </xsl:choose>-->
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_DWeg">
                        <xsl:choose>
                            <xsl:when test="$objekttyp/Fstr_DWeg_Spezifisch">
                                <xsl:sequence select="'03'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'00'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Fahrweg">
                        <xsl:sequence select="'02'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Nichthaltfall |
                                    $objekttyp/self::Fstr_Umfahrpunkt">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Signalisierung">
                        <xsl:variable name="current-fstr_zug_rangier" select="key('Fstr_Zug_Rangier', $objekttyp/ID_Fstr_Zug_Rangier/Wert, $objekttyp/parent::*)"/>
                        <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $current-fstr_zug_rangier/ID_Fstr_Fahrweg/Wert, $objekttyp/parent::*)"/>
                        <xsl:variable name="current-fstr_umfahrpunkt" select="key('Fstr_Umfahrpunkt-fuerFstr_Fahrweg', $current-fstr_fahrweg/Identitaet/Wert, /*)"/>
                        <xsl:variable name="current-dweg" select="key('Fstr_DWeg', $current-fstr_zug_rangier/*/*/ID_Fstr_DWeg/Wert, $objekttyp/parent::*)"/>
                        <xsl:choose>
                            <xsl:when test="$current-fstr_umfahrpunkt and $current-dweg">
                                <xsl:sequence select="'41'"/>
                            </xsl:when>
                            <xsl:when test="$current-fstr_umfahrpunkt and not($current-dweg)">
                                <xsl:sequence select="'26'"/>
                            </xsl:when>
                            <xsl:when test="not($current-fstr_umfahrpunkt) and $current-dweg">
                                <xsl:sequence select="'27'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'13'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Zug_Rangier">
                        <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $objekttyp/ID_Fstr_Fahrweg/Wert, $objekttyp/parent::*)"/>
                        <xsl:variable name="current-fstr_umfahrpunkt" select="key('Fstr_Umfahrpunkt-fuerFstr_Fahrweg', $current-fstr_fahrweg/Identitaet/Wert, /*)"/>
                        <xsl:variable name="current-dweg" select="key('Fstr_DWeg', $objekttyp/*/*/ID_Fstr_DWeg/Wert, $objekttyp/parent::*)"/>
                        <xsl:choose>
                            <xsl:when test="$current-fstr_umfahrpunkt and $current-dweg">
                                <xsl:sequence select="'25'"/>
                            </xsl:when>
                            <xsl:when test="$current-fstr_umfahrpunkt and not($current-dweg)">
                                <xsl:sequence select="'11'"/>
                            </xsl:when>
                            <xsl:when test="not($current-fstr_umfahrpunkt) and $current-dweg">
                                <xsl:sequence select="'12'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'02'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::GEO_Kante">
                        <xsl:sequence select="'02'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::GEO_Knoten">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::GEO_Punkt">
                        <xsl:variable name="current-geo_knoten" select="key('GEO_Knoten', $objekttyp/ID_GEO_Knoten/Wert, $objekttyp/parent::*)"/>
                        <xsl:choose>
                            <xsl:when test="$current-geo_knoten/GEO_PAD/Wert">
                                <xsl:sequence select="'24'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'02'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Gleis_Abschluss">
                        <xsl:sequence select="'20'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Gleis_Abschnitt |
                                    $objekttyp/self::Gleis_Art |
                                    $objekttyp/self::Gleis_Bezeichnung |
                                    $objekttyp/self::Gleis_Lichtraum">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Hoehenlinie">
                        <xsl:sequence select="'02'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Hoehenpunkt">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Kabel">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Kabel_Verteilpunkt">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Lieferobjekt">
                        <xsl:sequence select="'01'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Luft_Telegramm">
                        <xsl:sequence select="'54'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Markanter_Punkt">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB_Bedien_Anzeige_Element">
                        <xsl:sequence select="'28'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB_Zone">
                        <xsl:sequence select="'02'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB_Zone_Element">
                        <xsl:sequence select="'14'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB_Zone_Grenze">
                        <xsl:sequence select="'14'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Oertlichkeit">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::PZB_Element">
                        <xsl:choose>
                            <xsl:when test="$objekttyp/not(PZB_Element_GUE)">
                                <xsl:sequence select="'03'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'20'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::PZB_Element_Zuordnung">
                        <xsl:variable name="current-pzb-elemente" select="key('PZB_Element-fuerPZB_Element_Zuordnung', $objekttyp/Identitaet/Wert, /*)"/>
                        <xsl:variable name="current-gleismagnete" select="$current-pzb-elemente/PZB_Art/Wert"/>
                        <xsl:variable name="current-gues" select="$current-pzb-elemente/PZB_Element_GUE"/>
                        <xsl:choose>
                            <xsl:when test="$current-gleismagnete and not($current-gues)">
                                <xsl:sequence select="'19'"/>
                            </xsl:when>
                            <xsl:when test="$current-gues and not ($current-gleismagnete)">
                                <!-- tritt nicht ein!!! -->
                                <xsl:sequence select="'51'"/>
                            </xsl:when>
                            <xsl:when test="$current-gleismagnete and count($current-gues) = 1">
                                <xsl:sequence select="'52'"/>
                            </xsl:when>
                            <xsl:when test="$current-gleismagnete and count($current-gues) > 1">
                                <xsl:sequence select="'53'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'00'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::PZB_Zuordnung_Signal">
                        <xsl:sequence select="'04'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schaltmittel_Zuordnung">
                        <xsl:variable name="current-schalter" select="$objekttyp/ID_Schalter/Wert"/>
                        <xsl:variable name="current-fma-komponente" select="key('FMA_Komponente', $current-schalter, /*)"/>
                        <xsl:choose>
                            <xsl:when test="key('FMA_Anlage', $current-schalter, /*)">
                                <xsl:sequence select="'29'"/>
                            </xsl:when>
                            <xsl:when test="$current-fma-komponente">
                                <xsl:choose>
                                    <xsl:when test="$current-fma-komponente/FMA_Komponente_Achszaehlpunkt">
                                        <xsl:sequence select="'16'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:sequence select="'50'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="key('Zugeinwirkung', $current-schalter, /*)">
                                <xsl:sequence select="'16'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'03'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schloss">
                        <xsl:choose>
                            <xsl:when test=" $objekttyp/Schloss_Sk |
                                             $objekttyp/Schloss_Sonderanlage">
                                <xsl:sequence select="'00'"/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/Schloss_Gsp">
                                <xsl:sequence select="'18'"/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/Schloss_BUE |
                                            $objekttyp/Schloss_Ssp">
                                <xsl:sequence select="'01'"/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/Schloss_W">
                                <xsl:sequence select="'05'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'00'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schlosskombination">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schluessel">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schluesselsperre">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schrankenantrieb">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Signal">
                        <xsl:variable name="current-signal-frame" select="key('Signal_Rahmen-fuerSignal',  $objekttyp/Identitaet/Wert, /*)"/>
                        <xsl:variable name="current-signal-term" select="key('Signal_Signalbegriff-fuerSignal_Rahmen', $current-signal-frame/Identitaet/Wert, /*)"/>
                        <xsl:choose>
                                <xsl:when test="$objekttyp/*/Bezeichnung_Tabelle/Wert or 
                                    $current-signal-term/Signalbegriff_ID/substring-after(@xsi:type, ':') = 'Ra_12'">
                                <xsl:sequence select="'00'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'40'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Signal_Befestigung">
                        <xsl:sequence select="'01'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Signal_Rahmen">
                        <xsl:sequence select="'01'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Signal_Signalbegriff">
                        <xsl:variable name="current-signal_rahmen" select="key('Signal_Rahmen', $objekttyp/ID_Signal_Rahmen/Wert, /*)"/>
                        <xsl:variable name="current-signal" select="key('Signal', $current-signal_rahmen/ID_Signal/Wert, /*)"/>
                        <xsl:variable name="current-term" select="$current-signal/*/Bezeichnung_Tabelle/Wert"/>
                        <xsl:variable name="current-symbol" select="$objekttyp/Signalbegriff_ID/Symbol"/>
                        <xsl:choose>
                            <xsl:when test="$current-term">
                                <xsl:choose>
                                    <xsl:when test="$current-symbol">
                                        <xsl:sequence select="'17'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:sequence select="'01'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'40'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Sonstiger_Punkt">
                        <xsl:variable name="current-beginn-bereich" select="$objekttyp/ID_Beginn_Bereich/Wert"/>
                        <xsl:choose>
                            <xsl:when test="key('Bahnsteig_Kante', $current-beginn-bereich, $objekttyp/parent::*)">
                                <xsl:sequence select="'00'"/>
                            </xsl:when>
                            <xsl:when test="key('BUE_Gleisbezogener_Gefahrraum', $current-beginn-bereich, /*)">
                                <xsl:sequence select="'20'"/>
                            </xsl:when>
                            <xsl:when test="key('Markanter_Punkt-fuerMarkante_Stelle', $objekttyp/Identitaet/Wert, /*)">
                                <xsl:sequence select="'00'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'20'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Stell_Bereich">
                        <xsl:sequence select="'01'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Strecke">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Strecke_Punkt">
                        <xsl:sequence select="'20'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Technik_Standort">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Technischer_Bereich">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Technischer_Punkt">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::TOP_Kante">
                        <xsl:sequence select="'02'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::TOP_Knoten">
                        <xsl:variable name="current_ID" select="$objekttyp/Identitaet/Wert"/>
                        <xsl:variable name="current_TOP_Kanten"
                            select="key('TOP_Kante-fuerTOP_Knoten_A', $current_ID, $objekttyp/parent::*)[*/TOP_Anschluss_A/Wert = ('Rechts', 'Links')] |
                            key('TOP_Kante-fuerTOP_Knoten_B', $current_ID, $objekttyp/parent::*)[*/TOP_Anschluss_B/Wert = ('Rechts', 'Links')]"/>
                        <xsl:variable name="current_W_Kr_Gsp_Komponente"
                            select="key('W_Kr_Gsp_Komponente_POT-fuerTOP_Kante', $current_TOP_Kanten/Identitaet/Wert, /*)"/>
                        <xsl:choose>
                            <xsl:when test="$current_W_Kr_Gsp_Komponente">
                                <xsl:sequence select="'16'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'00'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Trasse_Kante">
                        <xsl:sequence select="'13'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Trasse_Knoten">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Ueberhoehung">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Ueberhoehungslinie">
                        <xsl:sequence select="'02'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Unterbringung">
                        <xsl:variable name="current_ID" select="$objekttyp/Identitaet/Wert"/>
                        <xsl:choose>
                            <xsl:when test="key('Aussenelementansteuerung-fuerUnterbringung', $current_ID, /*) |
                                key('Bedien_Einrichtung_Oertlich-fuerUnterbringung', $current_ID, /*) |
                                key('Bedien_Platz-fuerUnterbringung', $current_ID, /*) |
                                key('Schlosskombination-fuerUnterbringung', $current_ID, /*) |
                                key('Schluesselsperre-fuerUnterbringung', $current_ID, /*) |
                                key('ZN-fuerUnterbringung', $current_ID, /*)">
                                <xsl:sequence select="'01'"/>
                                <!-- ZN_Unterstation fehlt nun, ist zu prüfen!!! -->
                            </xsl:when>
                            <xsl:when test="key('PZB_Element-fuerUnterbringung', $current_ID, /*)">
                                <xsl:sequence select="'40'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'00'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Verkehrszeichen">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::W_Kr_Anlage">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::W_Kr_Gsp_Element">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::W_Kr_Gsp_Komponente">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Weichenlaufkette">
                        <xsl:sequence select="'00'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Weichenlaufkette_Zuordnung">
                        <xsl:sequence select="'10'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Zugeinwirkung">
                        <xsl:sequence select="'01'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="'00'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </iso:diagnostic>
    <iso:diagnostic id="s1">
        <xsl:choose>
            <xsl:when test="self::Container">
                <xsl:choose>
                    <xsl:when test="ancestor::LST_Planung">
                        <xsl:sequence select="'Bauzustand'"/>                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="'Konkreter Zustand der LST-Anlage (ohne Planung)'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="objekttyp" select="ancestor-or-self::*[parent::Container]"/>
                <xsl:choose>
                    <xsl:when test="$objekttyp/self::Anhang">
                        <xsl:sequence select="'Anhang'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Aussenelementansteuerung">
                        <xsl:sequence select="'Außenelementansteuerung'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bahnsteig_Anlage">
                        <xsl:sequence select="'Bahnsteig'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bahnsteig_Dach">
                        <xsl:sequence select="'Bahnsteigdach zur Bahnsteigkante'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bahnsteig_Kante |
                                    $objekttyp/self::Bahnsteig_Zugang">
                        <xsl:sequence select="'Bahnsteigkante'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bedien_Standort">
                        <xsl:sequence select="'DSZ/BSO'"/> <!-- Digitale Steuer-Zentrale / Bedien-Standort -->
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bedien_Anzeige_Element">
                        <xsl:variable name="current-bedien_einrichtung" select="key('Bedien_Einrichtung_Oertlich', $objekttyp/ID_Bedien_Einrichtung_Oertlich/Wert, /*)"/>
                        <xsl:sequence select="$bedien-einricht-typ/planpro:bezeichnung[@kurz = $current-bedien_einrichtung/*/Bedien_Einricht_Bauart/Wert]/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bedien_Einrichtung_Oertlich">
                        <xsl:sequence select="'Bedieneinrichtung'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Block_Anlage">
                        <xsl:sequence select="'Block-Anlage'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Block_Element">
                        <xsl:sequence select="'Block-Endstelle'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Anlage">
                        <xsl:sequence select="'Bahnübergang'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Anlage_Strasse">
                        <xsl:sequence select="'Straßenbezogene Angaben zu Bahnübergang'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Anlage_V">
                        <xsl:sequence select="'Geschwindigkeitsbezogene Angaben zu Bahnübergang'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Ausschaltung |
                        $objekttyp/self::BUE_Einschaltung |
                        $objekttyp/self::BUE_Gleisbezogener_Gefahrraum">
                        <xsl:sequence select="'Bahnübergang'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Bedien_Anzeige_Element">
                        <xsl:variable name="current-bedien_anzeige_element" select="key('Bedien_Anzeige_Element', $objekttyp/*/ID_Bedien_Anzeige_Element/Wert, /*)"/>
                        <xsl:variable name="current-bedien_einrichtung" select="key('Bedien_Einrichtung_Oertlich', $current-bedien_anzeige_element/ID_Bedien_Einrichtung_Oertlich/Wert, /*)"/>
                        <xsl:sequence select="$bedien-einricht-typ/planpro:bezeichnung[@kurz = $current-bedien_einrichtung/*/Bedien_Einricht_Bauart/Wert]/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Kante">
                        <xsl:sequence select="'BÜ-Kante'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Schnittstelle">
                        <xsl:sequence select="'BÜ-Schnittstelle'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Spezifisches_Signal">
                        <xsl:sequence select="'BÜ-Signal'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Datenpunkt">
                        <xsl:sequence select="'Datenpunkt'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::ESTW_Zentraleinheit">
                        <xsl:sequence select="'ESTW-Zentraleinheit'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fla_Freimelde_Zuordnung">
                        <xsl:sequence select="'Freimeldung des Flankenschutzraums für'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fla_Schutz">
                        <xsl:sequence select="'Flankenschutz für'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fla_Zwieschutz">
                        <xsl:sequence select="'Zwieschutz'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::FMA_Anlage">
                        <xsl:sequence select="'Freimeldeabschnitt'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::FMA_Element">
                        <xsl:sequence select="$fma-typ/planpro:bezeichnung[@kurz = $objekttyp/*/FMA_Element_Art/Wert]/text()"/>
                        <xsl:sequence select="' FMA'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::FMA_Komponente">
                        <xsl:choose>
                            <xsl:when test="$objekttyp/FMA_Komponente_Achszaehlpunkt">
                                <xsl:sequence select="'Achszählpunkt'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="current-fma-art" select="$objekttyp/FMA_Komponente_Art/Wert"/>
                                <xsl:choose>
                                    <xsl:when test="contains($current-fma-art, 'Isolierstoss')">
                                        <xsl:sequence select="'Isolierstoß'"/>
                                    </xsl:when>
                                    <xsl:when test="contains($current-fma-art, 'Trennstoss')">
                                        <xsl:sequence select="'Elektrischer Trennstoß'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:sequence select="'Sonstiger Stoß'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Aneinander">
                        <xsl:sequence select="'Aneinander gereihte Fahrstraße'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_DWeg">
                        <xsl:choose>
                            <xsl:when test="$objekttyp/Fstr_DWeg_Spezifisch">
                                <xsl:sequence select="'Durchrutschweg'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'Gefahrpunktabstand'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Fahrweg">
                        <xsl:sequence select="'Fahrweg'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Nichthaltfall">
                        <xsl:sequence select="'Nichthaltfallabschnitt'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Signalisierung">
                        <xsl:sequence select="'Signalisierung für'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Umfahrpunkt">
                        <xsl:sequence select="'Umfahrpunkt'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Zug_Rangier">
                        <xsl:sequence select="$fstr-typ/planpro:bezeichnung[@kurz = $objekttyp/*/(Fstr_Rangier_Art|Fstr_Mittel_Art|Fstr_Zug_Art)/Wert]/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::GEO_Kante">
                        <xsl:variable name="current_geo-art" select="$objekttyp/ID_GEO_Art/Wert"/>
                        <xsl:choose>
                            <xsl:when test="key('TOP_Kante', $current_geo-art, $objekttyp/parent::*)">
                                <xsl:sequence select="'Gleis-Geo-Kante'"/>
                            </xsl:when>
                            <xsl:when test="key('Strecke', $current_geo-art, $objekttyp/parent::*)">
                                <xsl:sequence select="'Strecken-Geo-Kante'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'Sonstige Geo-Kante'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::GEO_Knoten">
                        <xsl:sequence select="'Geo-Knoten'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::GEO_Punkt">
                        <xsl:sequence select="'Geo-Punkt'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Gleis_Abschluss">
                        <xsl:sequence select="$gleisabschluss-typ/planpro:bezeichnung[@kurz = $objekttyp/Gleis_Abschluss_Art/Wert]/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Gleis_Abschnitt">
                        <xsl:sequence select="'Gleisabschnitt'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Gleis_Art">
                        <xsl:sequence select="'Gleisart'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Gleis_Bezeichnung">
                        <xsl:sequence select="'Bezeichnung Gleis'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Gleis_Lichtraum">
                        <xsl:sequence select="'Gleislichtraum'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Hoehenlinie">
                        <xsl:sequence select="'Höhenlinie'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Hoehenpunkt">
                        <xsl:sequence select="'Höhenpunkt'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Kabel">
                        <xsl:sequence select="'Kabel'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Kabel_Verteilpunkt">
                        <xsl:variable name="current-art" select="$objekttyp/Kabel_Verteilpunkt_Art/Wert"/>
                        <xsl:choose>
                            <xsl:when test="$current-art='sonstige'">
                                <xsl:variable name="current-bearbeitungsvermerk" 
                                    select="$objekttyp/Kabel_Verteilpunkt_Art/ID_Bearbeitungsvermerk/Wert"/>
                                <xsl:variable name="current-kurztext"
                                    select="(key('Bearbeitungsvermerk', $current-bearbeitungsvermerk, /*)/*/Kurztext/Wert)[1]"/>
                                <xsl:choose>
                                    <xsl:when test="$current-kurztext">
                                        <xsl:sequence select="$current-kurztext/text()"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:sequence select="'Sonstiger Kabelverteiler'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="$current-art/text()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Lieferobjekt">
                        <xsl:sequence select="'Lieferantenangaben zu'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Luft_Telegramm">
                        <xsl:sequence select="'Luft-Telegramm'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Markanter_Punkt">
                        <xsl:sequence select="'Markanter Punkt'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB">
                        <xsl:sequence select="'Nahbedienbereich'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB_Bedien_Anzeige_Element">
                        <xsl:variable name="current-typ" select="NB_Bedien_Anzeige_Funktionen/*"/>
                        <xsl:choose>
                            <xsl:when test="$current-typ/self::Taste_ANF">
                                <xsl:sequence select="'NB-Anforderungstaste'"/>
                            </xsl:when>
                            <xsl:when test="$current-typ/self::Taste_FGT">
                                <xsl:sequence select="'NB-Fertigmeldetaste'"/>
                            </xsl:when>
                            <xsl:when test="$current-typ/self::Taste_WGT">
                                <xsl:sequence select="'Weichengruppentaste'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'Sonstige NB-Taste'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB_Zone">
                        <xsl:sequence select="'NB-Zone'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB_Zone_Element">
                        <xsl:sequence select="'NB-Element'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB_Zone_Grenze">
                        <xsl:sequence select="'NB-Zonengrenze'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Oertlichkeit">
                        <xsl:sequence select="'Örtlichkeit'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::PZB_Element">
                        <xsl:choose>
                            <xsl:when test="not($objekttyp/PZB_Element_GUE)">
                                <xsl:sequence select="'PZB-Gleismagnet'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'GÜ'"/>
                                <xsl:sequence select="$objekttyp/*/Pruefgeschwindigkeit/Wert/text()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::PZB_Element_Zuordnung">
                        <xsl:sequence select="'PZB-Zuordnung'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::PZB_Zuordnung_Signal">
                        <xsl:sequence select="'PZB-Zuordnung'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schaltmittel_Zuordnung">
                        <xsl:sequence select="'Schaltmittel-Zuordnung'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schloss">
                        <xsl:sequence select="'Schloss'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schlosskombination">
                        <xsl:sequence select="'Schlosskombination'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schluessel">
                        <xsl:sequence select="'Schlüssel'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schluesselsperre">
                        <xsl:sequence select="$ssp-typ/planpro:bezeichnung[@kurz = $objekttyp/Bedienung_Art/Wert]/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schrankenantrieb">
                        <xsl:sequence select="'Schrankenantrieb'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Signal">
                        <xsl:variable name="current-signal-frame" select="key('Signal_Rahmen-fuerSignal',  $objekttyp/Identitaet/Wert, /*)"/>
                        <xsl:variable name="current-signal-term" select="key('Signal_Signalbegriff-fuerSignal_Rahmen', $current-signal-frame/Identitaet/Wert, /*)"/>
                        <xsl:choose>
                            <xsl:when test="$current-signal-term/Signalbegriff_ID[substring-after(@xsi:type, ':') = 'Ra_12']">
                                <xsl:sequence select="'Gz'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'Signal'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Signal_Befestigung">
                        <xsl:sequence select="'Signalbefestigung'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Signal_Rahmen">
                        <xsl:sequence select="'Signalrahmen'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Signal_Signalbegriff">
                        <xsl:sequence select="'Signalbegriff'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Sonstiger_Punkt">
                        <xsl:variable name="current-beginn-bereich" select="$objekttyp/ID_Beginn_Bereich/Wert"/>
                        <xsl:choose>
                            <xsl:when test="key('Bahnsteig_Kante', $current-beginn-bereich, $objekttyp/parent::*)">
                                <xsl:sequence select="'Beginn Bahnsteigkante'"/>
                            </xsl:when>
                            <xsl:when test="key('BUE_Gleisbezogener_Gefahrraum', $current-beginn-bereich, /*)">
                                <xsl:sequence select="'Beginn BÜ-Gefahrraum'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'Sonstiger Punkt'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Stell_Bereich">
                        <xsl:sequence select="'Stellbereich'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Strecke">
                        <xsl:sequence select="'Strecke'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Strecke_Punkt">
                        <xsl:sequence select="'Streckenpunkt'"/>
                    </xsl:when>
					<xsl:when test="$objekttyp/self::Technik_Standort">
                        <xsl:sequence select="'DTZ/TSO'"/> <!-- Digitale Technik-Zentrale / Technik-Standort -->
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Technischer_Bereich">
                        <xsl:variable name="current-tb-art" select="$objekttyp/TB_Art/Wert"/>
                        <xsl:choose>
                            <xsl:when test="$current-tb-art">
                                <xsl:sequence select="$tb-typ/planpro:bezeichnung[@kurz = $current-tb-art]/text()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="$tb-typ/planpro:bezeichnung[@kurz = 'sonstige']/text()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Technischer_Punkt">
                        <xsl:variable name="current-tp-art" select="$objekttyp/TP_Art/Wert"/>
                        <xsl:choose>
                            <xsl:when test="$current-tp-art">
                                <xsl:sequence select="$tp-typ/planpro:bezeichnung[@kurz = $current-tp-art]/text()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="$tp-typ/planpro:bezeichnung[@kurz = 'sonstige']/text()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::TOP_Kante">
                        <xsl:sequence select="'Top-Kante'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::TOP_Knoten">
                        <xsl:sequence select="'Top-Knoten'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Trasse_Kante">
                        <xsl:sequence select="'Trassen-Kante'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Trasse_Knoten">
                        <xsl:sequence select="'Trassen-Knoten'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Ueberhoehung">
                        <xsl:sequence select="'Überhöhung'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Ueberhoehungslinie">
                        <xsl:sequence select="'Überhöhungslinie'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Unterbringung">
                        <xsl:sequence select="'Unterbringung'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::W_Kr_Anlage">
                        <xsl:sequence select="$weichen-typ/planpro:bezeichnung[@kurz = $objekttyp/*/W_Kr_Art/Wert]/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::W_Kr_Gsp_Element">
                        <xsl:choose>
                            <xsl:when test="$objekttyp/Weiche_Element">
                                <xsl:variable name="current-w-kr-anlage" select="key('W_Kr_Anlage', $objekttyp/ID_W_Kr_Anlage/Wert, $objekttyp/parent::*)"/>
                                <xsl:sequence select="$current-w-kr-anlage/*/W_Kr_Art/Wert/text()"/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/Gleissperre_Element">
                                <xsl:sequence select="'Gsp'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'Sonstiges Weichen'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:value-of select="'-Element'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Verkehrszeichen">
                        <xsl:sequence select="'BÜ-Vz'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::W_Kr_Gsp_Komponente">
                        <xsl:choose>
                            <xsl:when test="$objekttyp/Entgleisungsschuh">
                                <xsl:sequence select="'Entgleisungsschuh'"/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/Kreuzung">
                                <xsl:sequence select="'Kr-Komponente'"/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/Zungenpaar">
                                <xsl:sequence select="'Zungenpaar'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'Sonstige Komponente'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:sequence select="'von'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Weichenlaufkette">
                        <xsl:sequence select="'Weichenlaufkette'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Weichenlaufkette_Zuordnung">
                        <xsl:sequence select="'Weichenlaufkette'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Zugeinwirkung">
                        <xsl:sequence select="'Zugeinwirkung'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="$objekttyp/name()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </iso:diagnostic>
    <iso:diagnostic id="s2">
        <xsl:choose>
            <xsl:when test="self::Container">
                <xsl:choose>
                    <xsl:when test="ancestor::LST_Planung">
                        <xsl:sequence select="key('LST_Planung_Einzel-fuerAusgabe_Fachdaten', ancestor::Ausgabe_Fachdaten/Identitaet/Wert, ancestor::LST_Planung)/descendant::Bauzustand_Kurzbezeichnung/Wert/text()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="'Erzeugt: ', format-dateTime(//PlanPro_Schnittstelle_Allg/Erzeugung_Zeitstempel/Wert, '[D].[M].[Y] [H]:[m]'), ' (UTC)'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="objekttyp" select="ancestor-or-self::*[parent::Container]"/>
                <xsl:choose>
                    <xsl:when test="$objekttyp/self::Anhang">
                        <xsl:sequence select="$objekttyp/*/Dateiname/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Aussenelementansteuerung">
                        <xsl:sequence select="$aussenelement-typ/planpro:bezeichnung[@kurz = $objekttyp/*/Aussenelementansteuerung_Art/Wert]/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bahnsteig_Anlage">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Bahnsteig_Anlage/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bahnsteig_Dach">
                        <xsl:sequence select="key('Bahnsteig_Kante', $objekttyp/ID_Bahnsteig_Kante/Wert, $objekttyp/parent::*)/*/Bezeichnung_Bahnsteig_Kante/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bahnsteig_Kante">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Bahnsteig_Kante/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bahnsteig_Zugang">
                        <xsl:value-of select="key('Bahnsteig_Kante-fuerBahnsteig_Anlage', $objekttyp/ID_Bahnsteig_Anlage/Wert, $objekttyp/parent::*)/*/Bezeichnung_Bahnsteig_Kante/Wert" separator=", "/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bedien_Anzeige_Element">
                        <xsl:variable name="current-bedien_einrichtung" select="key('Bedien_Einrichtung_Oertlich', $objekttyp/ID_Bedien_Einrichtung_Oertlich/Wert, /*)"/>
                        <xsl:sequence select="$current-bedien_einrichtung/*/Bedien_Einricht_Oertl_Bez/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bedien_Einrichtung_Oertlich">
                        <xsl:sequence select="$bedien-einricht-typ/planpro:bezeichnung[@kurz = $objekttyp/*/Bedien_Einricht_Bauart/Wert]/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Bedien_Standort">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_BSO/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Block_Anlage">
                        <xsl:sequence select="'Gleis'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Block_Element">
                        <xsl:sequence select="key('Signal', $objekttyp/ID_Signal/Wert, /*)/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Anlage">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Anlage_Strasse |
                                    $objekttyp/self::BUE_Anlage_V">
                        <xsl:sequence select="key('BUE_Anlage', $objekttyp/ID_BUE_Anlage/Wert, /*)/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Ausschaltung">
                        <xsl:variable name="current-gefahrraum" select="key('BUE_Gleisbezogener_Gefahrraum', $objekttyp/ID_BUE_Gleisbez_Gefahrraum/Wert, /*)"/>
                        <xsl:sequence select="key('BUE_Anlage', $current-gefahrraum/ID_BUE_Anlage/Wert, /*)/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Bedien_Anzeige_Element">
                        <xsl:variable name="current-bedien_anzeige_element" select="key('Bedien_Anzeige_Element', $objekttyp/*/ID_Bedien_Anzeige_Element/Wert, /*)"/>
                        <xsl:sequence select="key('Bedien_Einrichtung_Oertlich', $current-bedien_anzeige_element/ID_Bedien_Einrichtung_Oertlich/Wert, /*)/*/Bedien_Einricht_Oertl_Bez/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Einschaltung">
                        <xsl:variable name="current_bue-einschaltung-zuordnung" select="key('BUE_Einschaltung_Zuordnung-fuerBUE_Einschaltung', $objekttyp/Identitaet/Wert, /*)"/>
                        <xsl:variable name="current-gefahrraum" select="key('BUE_Gleisbezogener_Gefahrraum', $current_bue-einschaltung-zuordnung/ID_BUE_Gleisbez_Gefahrraum/Wert, /*)"/>
                        <xsl:value-of select="key('BUE_Anlage', $current-gefahrraum/ID_BUE_Anlage/Wert, /*)/*/Bezeichnung_Tabelle/Wert" separator=", "/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Gleisbezogener_Gefahrraum | self::BUE_Kante">
                        <xsl:sequence select="key('BUE_Anlage', $objekttyp/ID_BUE_Anlage/Wert, /*)/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Schnittstelle">
                        <xsl:value-of select="key('BUE_Anlage-fuerBUE_Schnittstelle', $objekttyp/Identitaet/Wert, /*)/*/Bezeichnung_Tabelle/Wert" separator=", "/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::BUE_Spezifisches_Signal">
                        <xsl:variable name="current-signal" select="key('Signal', $objekttyp/ID_Signal/Wert, /*)"/>
                        <xsl:choose>
                            <xsl:when test="$current-signal/Bezeichnung">
                                <xsl:sequence select="$current-signal/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'Strecke'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Datenpunkt">
                        <xsl:sequence select="$objekttyp/*/NID_BG/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::ESTW_Zentraleinheit">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_ESTW_ZE/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fla_Freimelde_Zuordnung">
                        <xsl:variable name="current-fla_schutz-anforderer" select="key('Fla_Schutz', $objekttyp/ID_Fla_Schutz/Wert, $objekttyp/parent::*)/*/ID_Anforderer_Element/Wert"/>
                        <xsl:variable name="W-element-anforderung" select="key('W_Kr_Gsp_Element', $current-fla_schutz-anforderer, $objekttyp/parent::*)"/>
                        <xsl:choose>
                            <xsl:when test="$W-element-anforderung">
                                <xsl:sequence select="$W-element-anforderung/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:when>
                            <xsl:when test="key('NB_Zone_Grenze', $current-fla_schutz-anforderer, $objekttyp/parent::*)">
                                <xsl:sequence select="'NB-Zonengrenze'"/>
        <!--                        <xsl:choose>
                                    <xsl:when test="$current-grenzelement/self::Signal">
                                        <xsl:sequence select="$current-grenzelement/*/Bezeichnung_Tabelle/Wert"/>
                                    </xsl:when>
                                    <xsl:when test="$current-grenzelement/self::W_Kr_Gsp_Komponente">
                                        <xsl:sequence select="$objekttyp/../W_Kr_Gsp_Element[Identitaet/Wert = $current-grenzelement/ID_W_Kr_Gsp_Element/Wert]/*/Bezeichnung_Tabelle/Wert"/>
                                    </xsl:when>
                                </xsl:choose>-->
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="(key('Identitaet', $current-fla_schutz-anforderer, /*)/../*/Bezeichnung_Tabelle/Wert/text())[1]"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fla_Schutz">
                        <xsl:variable name="current-fla_schutz-anforderer" select="$objekttyp/*/ID_Anforderer_Element/Wert"/>
                        <xsl:variable name="W-element-anforderung" select="key('W_Kr_Gsp_Element', $current-fla_schutz-anforderer, $objekttyp/parent::*)"/>
                        <xsl:choose>
                            <xsl:when test="$W-element-anforderung">
                                <xsl:sequence select="$W-element-anforderung/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:when>
                            <xsl:when test="key('NB_Zone_Grenze', $current-fla_schutz-anforderer, $objekttyp/parent::*)">
                                <xsl:sequence select="'NB-Zonengrenze'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="(key('Identitaet', $current-fla_schutz-anforderer, /*)/../*/Bezeichnung_Tabelle/Wert/text())[1]"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fla_Zwieschutz">
                        <xsl:sequence select="key('W_Kr_Gsp_Element', $objekttyp/ID_W_Element/Wert, $objekttyp/parent::*)/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::FMA_Anlage">
                        <xsl:sequence select="(key('Gleis_Abschnitt', $objekttyp/ID_Gleis_Abschnitt/Wert, $objekttyp/parent::*)/*/Kennzahl/Wert/text())[1]"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::FMA_Element">
                        <xsl:variable name="current-fma_anlage" select="key('FMA_Anlage', $objekttyp/ID_FMA_Anlage/Wert, $objekttyp/parent::*)"/>
                        <xsl:sequence select="(key('Gleis_Abschnitt', $current-fma_anlage/ID_Gleis_Abschnitt/Wert, $objekttyp/parent::*)/*/Kennzahl/Wert/text())[1]"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::FMA_Komponente">
                        <xsl:choose>
                            <xsl:when test="$objekttyp/FMA_Komponente_Achszaehlpunkt">
                                <xsl:sequence select="$objekttyp/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'Strecke'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Aneinander">
                        <xsl:sequence select="$objekttyp/Fstr_Aneinander_Bedienstring/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_DWeg">
                        <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $objekttyp/ID_Fstr_Fahrweg/Wert, $objekttyp/parent::*)"/>
                        <xsl:sequence select="key('Signal', $current-fstr_fahrweg/ID_Start/Wert, /*)/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Fahrweg">
                        <xsl:sequence select="key('Signal', $objekttyp/ID_Start/Wert, /*)/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Nichthaltfall">
                        <xsl:variable name="current-fma" select="key('FMA_Anlage', $objekttyp/ID_FMA_Anlage/Wert, $objekttyp/parent::*)"/>
                        <xsl:sequence select="key('Gleis_Abschnitt', $current-fma/ID_Gleis_Abschnitt/Wert, $objekttyp/parent::*)/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Signalisierung">
                        <xsl:variable name="current-fstr_zug_rangier" select="key('Fstr_Zug_Rangier', $objekttyp/ID_Fstr_Zug_Rangier/Wert, $objekttyp/parent::*)"/>
                        <xsl:sequence select="$fstr-typ/planpro:bezeichnung[@kurz = $current-fstr_zug_rangier/*/(Fstr_Rangier_Art|Fstr_Mittel_Art|Fstr_Zug_Art)/Wert]/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Umfahrpunkt">
                        <xsl:sequence select="(key('Identitaet', $objekttyp/ID_Umfahrpunkt/Wert, /*)/../*/Bezeichnung_Tabelle/Wert/text())[1]"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Fstr_Zug_Rangier">
                        <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $objekttyp/ID_Fstr_Fahrweg/Wert, $objekttyp/parent::*)"/>
                        <xsl:sequence select="key('Signal', $current-fstr_fahrweg/ID_Start/Wert, /*)/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::GEO_Kante">
                        <xsl:sequence select="key('GEO_Knoten', $objekttyp/ID_GEO_Knoten_A/Wert, $objekttyp/parent::*)/GEO_PAD/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::GEO_Knoten">
                        <xsl:sequence select="$objekttyp/GEO_PAD/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::GEO_Punkt">
                        <xsl:sequence select="$objekttyp/*/GK_X/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Gleis_Abschluss">
                        <xsl:sequence select="'Strecke'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Gleis_Abschnitt">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Gleis_Art">
                        <xsl:sequence select="$gleisart-typ/planpro:bezeichnung[@kurz = $objekttyp/Gleisart/Wert]/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Gleis_Bezeichnung">
                        <xsl:sequence select="$objekttyp/*/Bez_Gleis_Bezeichnung/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Gleis_Lichtraum">
                        <xsl:sequence select="$objekttyp/Lichtraumprofil/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Hoehenlinie">
                        <xsl:sequence select="key('Hoehenpunkt', $objekttyp/ID_Hoehenpunkt_A/Wert, $objekttyp/parent::*)/*/GEO_PAD/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Hoehenpunkt">
                        <xsl:sequence select="$objekttyp/*/GEO_PAD/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Kabel">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Kabel/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Kabel_Verteilpunkt">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Kabel_Verteilpunkt/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Lieferobjekt">
                        <xsl:variable name="Search-Objekt"
                            select="(key('Identitaet', $objekttyp/ID_LO_Einbau/Wert, /*)/..[Bezeichnung])[1]"/>
                        <xsl:sequence select="$Search-Objekt/local-name()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Luft_Telegramm">
                        <xsl:sequence select="'DP'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Markanter_Punkt">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Markanter_Punkt/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_NB/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB_Bedien_Anzeige_Element">
                        <xsl:variable name="current-nb-zone" select="key('NB_Zone', $objekttyp/ID_NB_Zone/Wert, $objekttyp/parent::*)"/>
                        <xsl:sequence select="key('NB', $current-nb-zone/ID_NB/Wert, $objekttyp/parent::*)/*/Bezeichnung_NB/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB_Zone">
                        <xsl:sequence select="key('NB', $objekttyp/ID_NB/Wert, $objekttyp/parent::*)/*/Bezeichnung_NB/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB_Zone_Element">
                        <xsl:variable name="current-typ" select="key('Identitaet', $objekttyp/ID_NB_Element/Wert, /*)/.."/>
                        <xsl:choose>
<!--                            <xsl:when test="$current-typ/self::Signal">
                                <xsl:sequence select="$current-typ/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:when>
                            wird mit "otherwise" bereits abgedeckt -->
                            <xsl:when test="$current-typ/self::W_Kr_Gsp_Komponente">
                                <xsl:sequence select="key('W_Kr_Gsp_Element', $current-typ/ID_W_Kr_Gsp_Element/Wert, $objekttyp/parent::*)/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:when>
                            <xsl:when test="$current-typ/self::Schluesselsperre">
                                <xsl:sequence select="'Ssp '"/>
                                <xsl:sequence select="$current-typ/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="$current-typ/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::NB_Zone_Grenze">
                        <xsl:sequence select="key('Markanter_Punkt', $objekttyp/ID_Markanter_Punkt/Wert, /*)/*/Bezeichnung_Markanter_Punkt/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Oertlichkeit">
                        <xsl:sequence select="$objekttyp/*/Oertlichkeit_Abkuerzung/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::PZB_Element">
                        <xsl:choose>
                            <xsl:when test="not($objekttyp/PZB_Element_GUE)">
                                <xsl:sequence select="$pzb-typ/planpro:bezeichnung[@kurz = $objekttyp/PZB_Art/Wert]/text()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'Strecke'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::PZB_Element_Zuordnung">
                        <xsl:variable name="current-typ" select="key('Identitaet', ($objekttyp/*/ID_PZB_Element_Bezugspunkt/Wert)[1], /*)/.."/>
                        <xsl:sequence select="$current-typ/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::PZB_Zuordnung_Signal">
                        <xsl:variable name="current-pzb-element-zuordnung" select="key('PZB_Element_Zuordnung', $objekttyp/ID_PZB_Element_Zuordnung/Wert, $objekttyp/parent::*)"/>
                        <xsl:variable name="current-typ" select="key('Identitaet', ($current-pzb-element-zuordnung/*/ID_PZB_Element_Bezugspunkt/Wert)[1], /*)/.."/>
                        <xsl:sequence select="$current-typ/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schaltmittel_Zuordnung">
                        <xsl:choose>
                            <xsl:when test="$objekttyp/Schaltmittel_Funktion">
                                <xsl:sequence select="$schaltmittel-funktion/planpro:bezeichnung[@kurz = $objekttyp/Schaltmittel_Funktion/Wert]/text()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="$schaltmittel-funktion/planpro:bezeichnung[@kurz = 'sonstige']/text()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schloss">
                        <xsl:choose>
                            <xsl:when test="$objekttyp/Schloss_BUE">
                                <xsl:sequence select="key('BUE_Anlage', $objekttyp/*/ID_BUE_Anlage/Wert, /*)/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/Schloss_Gsp">
                                <xsl:sequence select="'Gsp'"/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/Schloss_Sk">
                                <xsl:sequence select="key('Schlosskombination', $objekttyp/*/ID_Schlosskombination/Wert, /*)/*/Bezeichnung_Sk/Wert/text()"/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/Schloss_Sonderanlage">
                                <xsl:sequence select="'Sonderanlage'"/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/Schloss_Ssp">
                                <xsl:variable name="current-ssp" select="key('Schluesselsperre', $objekttyp/*/ID_Schluesselsperre/Wert, /*)"/>
                                <xsl:sequence select="$ssp-typ/planpro:bezeichnung[@kurz = $current-ssp/Bedienung_Art/Wert]/text()"/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/Schloss_W">
                                <xsl:variable name="current-w-kr-gsp-element" select="key('W_Kr_Gsp_Element', $objekttyp/Schloss_W/ID_W_Kr_Element/Wert, /*)"/>
                                <xsl:choose>
                                    <xsl:when test="$current-w-kr-gsp-element">
                                        <xsl:sequence select="$current-w-kr-gsp-element/*/Bezeichnung_Tabelle/Wert/text()"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:sequence select="''"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schlosskombination">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Sk/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schluessel">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Schluessel/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schluesselsperre">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Schrankenantrieb">
                        <xsl:sequence select="$objekttyp/*/Bez_Schrankenantrieb/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Signal">
                        <xsl:variable name="current-term" select="$objekttyp/*/Bezeichnung_Tabelle/Wert/text()"/>
                        <xsl:variable name="current-signal-frame" select="key('Signal_Rahmen-fuerSignal', $objekttyp/Identitaet/Wert, /*)"/>
                        <xsl:variable name="current-signal-term" select="key('Signal_Signalbegriff-fuerSignal_Rahmen', $current-signal-frame/Identitaet/Wert, /*)"/>
                            <xsl:choose>
                                <xsl:when test="$current-term">
                                    <xsl:sequence select="$current-term"/>
                                </xsl:when>
                                <xsl:when test="$current-signal-term/Signalbegriff_ID/substring-after(@xsi:type, ':') = 'Ra_12'">
                                    <xsl:variable name="current-w" select="key('W_Kr_Gsp_Element-fuerGrenzzeichen', $objekttyp/Identitaet/Wert, /*)"/>
                                    <xsl:sequence select="$current-w/*/Bezeichnung_Tabelle/Wert/text()"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each select="$current-signal-term/Signalbegriff_ID/@xsi:type">
                                        <xsl:sort select="current()" order="ascending" data-type="text"/>
                                        <xsl:variable name="current-signalbegriff-bezeichnung" select="$signalbegriff-typ/planpro:bezeichnung[@kurz = substring-after(current(), ':')]"/>
                                        <xsl:value-of select="fx:choose_signalbegriff($current-signalbegriff-bezeichnung)" separator=", "/>
                                     </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Signal_Befestigung">
                        <xsl:variable name="current-signal_rahmen" select="key('Signal_Rahmen-fuerSignal_Befestigung', $objekttyp/Identitaet/Wert, /*)"/>
                        <xsl:variable name="current-signal" select="key('Signal', $current-signal_rahmen/ID_Signal/Wert, /*)"/>
                        <xsl:variable name="current-signal-term" select="key('Signal_Signalbegriff-fuerSignal_Rahmen', $current-signal_rahmen/Identitaet/Wert, /*)"/>
                        <xsl:choose>
                            <xsl:when test="$current-signal/Bezeichnung">
                                <xsl:value-of select="$current-signal/*/Bezeichnung_Tabelle/Wert" separator=", "/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/*/Befestigung_Art/Wert = ('Fundament', 'Signalausleger', 'Signalbruecke', 'Arbeitsbuehne')">
                                <xsl:variable name="related-signal_befestigung" select="key('Signal_Befestigung', $objekttyp/ID_Signal_Befestigung/Wert, /*)"/>
                                <xsl:variable name="related-signal_rahmen" select="key('Signal_Rahmen-fuerSignal_Befestigung', $related-signal_befestigung/Identitaet/Wert, /*)"/>
                                <xsl:variable name="related-signal" select="key('Signal', $related-signal_rahmen/ID_Signal/Wert, /*)"/>
                                <xsl:value-of select="$related-signal/*/Bezeichnung_Tabelle/Wert" separator=", "/>
                            </xsl:when>
                            <xsl:when test="$current-signal-term/Signalbegriff_ID/substring-after(@xsi:type, ':') = 'Ra_12'">
                                <xsl:variable name="current-w" select="key('W_Kr_Gsp_Element-fuerGrenzzeichen', $current-signal_rahmen/ID_Signal/Wert, /*)"/>
                                <xsl:sequence select="'Gz ', $current-w/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:when>
                            
                        </xsl:choose>
                        
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Signal_Rahmen">
                        <xsl:variable name="current-signal" select="key('Signal', $objekttyp/ID_Signal/Wert, /*)"/>
                        <xsl:sequence select="($current-signal/*/Bezeichnung_Tabelle/Wert/text())[1]"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Signal_Signalbegriff">
                        <xsl:variable name="current-signal_rahmen" select="key('Signal_Rahmen', $objekttyp/ID_Signal_Rahmen/Wert, /*)"/>
                        <xsl:variable name="current-signal" select="key('Signal', $current-signal_rahmen/ID_Signal/Wert, /*)"/>
                        <xsl:variable name="current-term" select="($current-signal/*/Bezeichnung_Tabelle/Wert/text())[1]"/>
                        <xsl:choose>
                            <xsl:when test="$current-term">
                                <xsl:sequence select="$current-term"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="short-term" select="substring-after($objekttyp/Signalbegriff_ID/@xsi:type, ':')"/>
                                <xsl:variable name="current-signalbegriff-bezeichnung" select="$signalbegriff-typ/planpro:bezeichnung[@kurz = $short-term]"/>
                                <xsl:sequence select="fx:choose_signalbegriff($current-signalbegriff-bezeichnung)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Sonstiger_Punkt">
                        <xsl:variable name="current-typ" select="key('Identitaet', $objekttyp/ID_Beginn_Bereich/Wert, /*)/.."/>
                        <xsl:variable name="markanter-punkt" select="key('Markanter_Punkt-fuerMarkante_Stelle', $objekttyp/Identitaet/Wert, /*)"/>
                        <xsl:choose>
                            <xsl:when test="$current-typ/self::Bahnsteig_Kante">
                                <xsl:sequence select="$current-typ/*/Bezeichnung_Bahnsteig_Kante/Wert/text()"/>
                            </xsl:when>
                            <xsl:when test="$current-typ/self::BUE_Gleisbezogener_Gefahrraum">
                                <xsl:sequence select="'Bahnübergang'"/>
                            </xsl:when>
                            <xsl:when test="$markanter-punkt">
                                <xsl:sequence select="$markanter-punkt/*/Bezeichnung_Markanter_Punkt/Wert/text()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'Strecke'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Stell_Bereich">
                        <xsl:variable name="current-aea" select="key('Aussenelementansteuerung', $objekttyp/ID_Aussenelementansteuerung/Wert, $objekttyp/parent::*)"/>
                        <xsl:sequence select="$aussenelement-typ/planpro:bezeichnung[@kurz = $current-aea/*/Aussenelementansteuerung_Art/Wert]/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Strecke">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Strecke/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Strecke_Punkt">
                        <xsl:sequence select="'Strecke'"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Technik_Standort">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_TSO/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Technischer_Bereich">
                        <xsl:sequence select="$objekttyp/TB_Beschreibung/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Technischer_Punkt">
                        <xsl:sequence select="$objekttyp/TP_Beschreibung/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::TOP_Kante">
                        <xsl:sequence select="normalize-space((key('TOP_Knoten', $objekttyp/ID_TOP_Knoten_A/Wert, $objekttyp/parent::*)/Knotenname/Wert/text())[1])"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::TOP_Knoten">
                        <xsl:sequence select="normalize-space(($objekttyp/Knotenname/Wert/text())[1])"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Trasse_Kante">
                        <xsl:variable name="current-art" select="$objekttyp/Trasse_Kante_Art/Wert"/>
                        <xsl:choose>
                            <xsl:when test="$current-art='sonstige'">
                                <xsl:variable name="current-bearbeitungsvermerk" 
                                    select="$objekttyp/Trasse_Kante_Art/ID_Bearbeitungsvermerk/Wert"/>
                                <xsl:variable name="current-kurztext"
                                    select="key('Bearbeitungsvermerk', $current-bearbeitungsvermerk, /*)/*/Kurztext/Wert/text()"/>
                                <xsl:choose>
                                    <xsl:when test="$current-kurztext">
                                        <xsl:sequence select="$current-kurztext[1]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:sequence select="'Sonstige Trassen-Kante'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="$trasse-art/planpro:bezeichnung[@kurz = $current-art]/text()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Trasse_Knoten">
                        <xsl:choose>
                            <xsl:when test="$objekttyp/ID_Anschluss_Element/Wert">
                                <xsl:variable name="Search-Anschlusselement" select="key('Identitaet', $objekttyp/ID_Anschluss_Element/Wert, /*)/..[Bezeichnung]"/>
                                <xsl:sequence select="($Search-Anschlusselement/Bezeichnung/*/Wert/text())[1]"/>
                            </xsl:when>
                            <xsl:when test="$objekttyp/ID_GEO_Knoten/Wert">
                                <xsl:variable name="Search-Geoknoten"  select="key('GEO_Knoten', $objekttyp/ID_GEO_Knoten/Wert, /*)"/>
                                <xsl:sequence select="$Search-Geoknoten/GEO_PAD/Wert/text()"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:sequence select="normalize-space(($objekttyp/Knotenname/Wert/text())[1])"/>
                    </xsl:when>                    
                    <xsl:when test="$objekttyp/self::Ueberhoehung">
                        <xsl:sequence select="$objekttyp/*/GEO_PAD/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Ueberhoehungslinie">
                        <xsl:variable name="current-ueberhoehung" select="key('Ueberhoehung', $objekttyp/ID_Ueberhoehung_A/Wert, $objekttyp/parent::*)"/>
                        <xsl:sequence select="$current-ueberhoehung/*/GEO_PAD/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Unterbringung">
                        <xsl:variable name="current-typ" select="key('Objekt-fuerUnterbringung', $objekttyp/Identitaet/Wert, /*)"/>
                        <xsl:choose>
                            <xsl:when test="$current-typ/self::Aussenelementansteuerung">
                                <xsl:sequence select="$aussenelement-typ/planpro:bezeichnung[@kurz = $current-typ/*/Aussenelementansteuerung_Art/Wert]/text()"/>
                            </xsl:when>
                            <xsl:when test="$current-typ/self::Bedien_Einrichtung_Oertlich">
                                <xsl:sequence select="$bedien-einricht-typ/planpro:bezeichnung[@kurz = $current-typ/*/Bedien_Einricht_Bauart/Wert]/text()"/>
                            </xsl:when>
                            <xsl:when test="$current-typ/self::Bedien_Platz">
                                <xsl:sequence select="'Bedienplatz'"/>
                            </xsl:when>
                            <xsl:when test="$current-typ/self::ESTW_Zentraleinheit">
                                <xsl:sequence select="$current-typ/*/Bezeichnung_ESTW_ZE/Wert/text()"/>
                            </xsl:when>
                            <xsl:when test="$current-typ/self::PZB_Element">
                                <xsl:sequence select="'GÜ'"/>
                                <xsl:sequence select="$current-typ/*/Pruefgeschwindigkeit/Wert/text()"/>
                            </xsl:when>
                            <xsl:when test="$current-typ/self::Schlosskombination">
                                <xsl:sequence select="'Schlosskombination'"/>
                            </xsl:when>
                            <xsl:when test="$current-typ/self::Schluesselsperre">
                                <xsl:sequence select="'Schlüsselsperre'"/>
                            </xsl:when>
                            <xsl:when test="$current-typ/self::ZN">
                                <xsl:sequence select="'ZN'"/>
                            </xsl:when>
<!--                            <xsl:when test="$current-typ/self::ZN_Unterstation">
                                <xsl:sequence select="$current-typ/*/ZN_Unterstation_Art/Wert"/>
                            </xsl:when>-->
                            <xsl:otherwise>
                                <xsl:sequence select="$current-typ/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Verkehrszeichen">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Verkehrszeichen/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::W_Kr_Anlage">
                        <xsl:variable name="current-w-bezeichnung" select="(key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', $objekttyp/Identitaet/Wert, $objekttyp/parent::*)/*/Bezeichnung_Tabelle/Wert/text())[1]"/>
                        <xsl:variable name="corrected-w-bezeichnung" select="replace($current-w-bezeichnung, 'AB|CD|A|B', '')"/>
                        <xsl:sequence select="$corrected-w-bezeichnung"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::W_Kr_Gsp_Element">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::W_Kr_Gsp_Komponente">
                        <xsl:sequence select="key('W_Kr_Gsp_Element', $objekttyp/ID_W_Kr_Gsp_Element/Wert, $objekttyp/parent::*)/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Weichenlaufkette">
                        <xsl:sequence select="$objekttyp/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Weichenlaufkette_Zuordnung">
                        <xsl:variable name="current-weichenlaufkette" select="key('Weichenlaufkette', $objekttyp/ID_Weichenlaufkette/Wert, $objekttyp/parent::*)"/>
                        <xsl:sequence select="$current-weichenlaufkette/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/self::Zugeinwirkung">
                        <xsl:sequence select="$zugeinwirkung-typ/planpro:bezeichnung[@kurz = $objekttyp/*/Zugeinwirkung_Art/Wert]/text()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="($objekttyp/Bezeichnung/*/Wert/text())[1]"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </iso:diagnostic>
    <iso:diagnostic id="s3">
        <xsl:variable name="objekttyp" select="ancestor-or-self::*[parent::Container]"/>
        <xsl:choose>
            <xsl:when test="$objekttyp/self::Aussenelementansteuerung">
                <xsl:variable name="AEA-Bezeichnung" select="$objekttyp/*/Bezeichnung_AEA/Wert/text()"/>
                <xsl:choose>
                    <xsl:when test="$objekttyp/*/Aussenelementansteuerung_Art/Wert = 'FeAk' and not($AEA-Bezeichnung)">
                        <xsl:variable name="Stellelement" select="key('Stellelement-fuerAussenelementansteuerung', $objekttyp/Identitaet/Wert, /*)"/>
                        <xsl:variable name="Signal" select="key('Signal-fuerStellelement', $Stellelement/Identitaet/Wert, /*)"/>
                        <xsl:variable name="W_Kr_Gsp_Element" select="key('W_Kr_Gsp_Element-fuerStellelement', $Stellelement/Identitaet/Wert, /*)"/>
                        <xsl:sequence select="($Signal | $W_Kr_Gsp_Element)/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="$AEA-Bezeichnung"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Bahnsteig_Zugang">
                <xsl:sequence select="'Bahnsteigzugang'"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Bedien_Anzeige_Element">
                <xsl:sequence select="'Bedien-/Anzeige-Element'"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Bedien_Einrichtung_Oertlich">
                <xsl:sequence select="$objekttyp/*/Bedien_Einricht_Oertl_Bez/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Block_Anlage">
                <xsl:variable name="Gleis_Bezeichnung" select="key('Gleis_Bezeichnung', $objekttyp/ID_Gleis_Bezeichnung/Wert, $objekttyp/parent::*)"/>
                <xsl:sequence select="$Gleis_Bezeichnung/*/Bez_Gleis_Bezeichnung/Wert/text()"/><!-- statt Bezeichnung_Tabelle -->
            </xsl:when>
            <xsl:when test="$objekttyp/self::BUE_Ausschaltung">
                <xsl:sequence select="'BÜ-Ausschaltung'"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::BUE_Bedien_Anzeige_Element">
                <xsl:sequence select="'BÜ-Handschalteinrichtung'"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::BUE_Einschaltung">
                <xsl:sequence select="'BÜ-Einschaltung'"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::BUE_Gleisbezogener_Gefahrraum">
                <xsl:sequence select="'Gleis'"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::BUE_Kante">
                <xsl:sequence select="'km'"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::BUE_Spezifisches_Signal">
                <xsl:variable name="current-signal" select="key('Signal', $objekttyp/ID_Signal/Wert, /*)"/>
                <xsl:if test="not($current-signal/Bezeichnung)">
                    <xsl:variable name="current-strecke" select="key('Strecke', $current-signal/(*/ID_Strecke/Wert)[1], /*)"/>
                    <xsl:sequence select="$current-strecke/*/Bezeichnung_Strecke/Wert/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Fla_Freimelde_Zuordnung">
                <xsl:variable name="current-fla_schutz" select="key('Fla_Schutz', $objekttyp/ID_Fla_Schutz/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-fla_schutz-anforderer" select="$current-fla_schutz/*/ID_Anforderer_Element/Wert"/>
                <xsl:variable name="nb-zonengrenzen-anforderung" select="key('NB_Zone_Grenze', $current-fla_schutz-anforderer, $objekttyp/parent::*)"/>
                <xsl:variable name="fahrt-ueber" select="$current-fla_schutz/*/Fahrt_Ueber/Wert/text()"/>
                <xsl:choose>
                    <xsl:when test="$fahrt-ueber">
                        <xsl:sequence select="$fahrt-ueber"/>
                    </xsl:when>
                    <xsl:when test="$nb-zonengrenzen-anforderung">
                        <xsl:sequence select="key('Markanter_Punkt', $nb-zonengrenzen-anforderung/ID_Markanter_Punkt/Wert, $objekttyp/parent::*)/*/Bezeichnung_Markanter_Punkt/Wert/text()"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Fla_Schutz">
                <xsl:variable name="current-fla_schutz-anforderer" select="$objekttyp/*/ID_Anforderer_Element/Wert"/>
                <xsl:variable name="fahrt-ueber" select="$objekttyp/*/Fahrt_Ueber/Wert"/>
                <xsl:variable name="W-element-anforderung" select="key('W_Kr_Gsp_Element', $current-fla_schutz-anforderer, $objekttyp/parent::*)"/>
                <xsl:variable name="nb-zonengrenzen-anforderung" select="key('NB_Zone_Grenze', $current-fla_schutz-anforderer, $objekttyp/parent::*)"/>
                <xsl:choose>
                    <xsl:when test="$W-element-anforderung and $fahrt-ueber">
                        <xsl:sequence select="$lage-typ/planpro:bezeichnung[@kurz = $fahrt-ueber]/text()"/>
                    </xsl:when>
                    <xsl:when test="$nb-zonengrenzen-anforderung">
                        <xsl:sequence select="key('Markanter_Punkt', $nb-zonengrenzen-anforderung/ID_Markanter_Punkt/Wert, $objekttyp/parent::*)/*/Bezeichnung_Markanter_Punkt/Wert/text()"/>
<!--                        <xsl:variable name="current-grenzelement" select="$objekttyp/../*[Identitaet/Wert = $current-fla_schutz-anforderer/ID_Grenzelement/Wert]"/>
                        <xsl:choose>
                            <xsl:when test="$current-grenzelement/self::Signal">
                                <xsl:value-of select="$current-grenzelement/*/Bezeichnung_Tabelle/Wert"/>
                            </xsl:when>
                            <xsl:when test="$current-grenzelement/self::W_Kr_Gsp_Komponente">
                                <xsl:value-of select="$objekttyp/../W_Kr_Gsp_Element[Identitaet/Wert = $current-grenzelement/ID_W_Kr_Gsp_Element/Wert]/*/Bezeichnung_Tabelle/Wert"/>
                            </xsl:when>
                        </xsl:choose>
-->                    </xsl:when>
                </xsl:choose>  
            </xsl:when>
            <xsl:when test="$objekttyp/self::FMA_Anlage">
                <xsl:sequence select="$objekttyp/*/Bezeichnung_Kennbuchstabe/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::FMA_Element">
                <xsl:variable name="current-fma_anlage" select="key('FMA_Anlage', $objekttyp/ID_FMA_Anlage/Wert, $objekttyp/parent::*)"/> 
                <xsl:sequence select="$current-fma_anlage/*/Bezeichnung_Kennbuchstabe/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::FMA_Komponente">
                <xsl:variable name="current-azp" select="$objekttyp/FMA_Komponente_Achszaehlpunkt"/>
                <xsl:if test="not($current-azp)">
                    <xsl:variable name="current-strecke" select="key('Strecke', $objekttyp/(*/ID_Strecke/Wert)[1], /*)"/>
                    <xsl:sequence select="$current-strecke/*/Bezeichnung_Strecke/Wert/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Fstr_DWeg">
            	<xsl:choose>
            		<xsl:when test="$objekttyp/Fstr_DWeg_Spezifisch"> 
                		 <xsl:sequence select="$objekttyp/*/Bezeichnung_Fstr_DWeg/Wert/text()"/>
                	</xsl:when>
             	</xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Fstr_Fahrweg">
                <xsl:variable name="current-ziel" select="$objekttyp/ID_Ziel/Wert"/>
                <xsl:variable name="ziel-signal" select="key('Signal', $current-ziel, /*)"/>
                <xsl:variable name="ziel-markanter-punkt" select="key('Markanter_Punkt', $current-ziel, /*)"/>
                <xsl:choose>
                    <xsl:when test="$ziel-signal">
                        <xsl:sequence select="$ziel-signal/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$ziel-markanter-punkt">
                        <xsl:sequence select="$ziel-markanter-punkt/*/Bezeichnung_Markanter_Punkt/Wert/text()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="''"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Fstr_Signalisierung">
                <xsl:variable name="current-fstr_zug_rangier" select="key('Fstr_Zug_Rangier', $objekttyp/ID_Fstr_Zug_Rangier/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $current-fstr_zug_rangier/ID_Fstr_Fahrweg/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-signal" select="key('Signal', $current-fstr_fahrweg/ID_Start/Wert, /*)"/>
                <xsl:sequence select="$current-signal/*/Bezeichnung_Tabelle/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Fstr_Zug_Rangier">
                <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $objekttyp/ID_Fstr_Fahrweg/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-ziel" select="$current-fstr_fahrweg/ID_Ziel/Wert"/>
                <xsl:variable name="ziel-signal" select="key('Signal', $current-ziel, /*)"/>
                <xsl:variable name="ziel-markanter-punkt" select="key('Markanter_Punkt', $current-ziel, /*)"/>
                <xsl:choose>
                    <xsl:when test="$ziel-signal">
                        <xsl:sequence select="$ziel-signal/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$ziel-markanter-punkt">
                        <xsl:sequence select="$ziel-markanter-punkt/*/Bezeichnung_Markanter_Punkt/Wert/text()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="''"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::GEO_Kante">
                <xsl:variable name="GEO-knoten" select="key('GEO_Knoten', $objekttyp/ID_GEO_Knoten_B/Wert, $objekttyp/parent::*)"/>
                <xsl:sequence select="$GEO-knoten/GEO_PAD/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::GEO_Punkt">
                <xsl:sequence select="$objekttyp/*/GK_Y/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Gleis_Abschluss">
                <xsl:variable name="current-strecke" select="key('Strecke', $objekttyp/(*/ID_Strecke/Wert)[1], /*)"/>
                <xsl:sequence select="$current-strecke/*/Bezeichnung_Strecke/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Hoehenlinie">
                <xsl:variable name="current-hoehenpunkt" select="key('Hoehenpunkt', $objekttyp/ID_Hoehenpunkt_B/Wert, $objekttyp/parent::*)"/>
                <xsl:sequence select="$current-hoehenpunkt/*/GEO_PAD/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Lieferobjekt">
                <xsl:variable name="Search-Objekt" select="(key('Identitaet', $objekttyp/ID_LO_Einbau/Wert, /*)/../Bezeichnung/Bezeichnung_Tabelle)[1]"/>
                <xsl:sequence select="$Search-Objekt/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Luft_Telegramm">
                <xsl:variable name="current-balise" select="key('Balise', $objekttyp/ID_Balise_Uebertragung/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-datenpunkt" select="key('Datenpunkt', $current-balise/ID_Datenpunkt/Wert, $objekttyp/parent::*)"/>
                <xsl:sequence select="$current-datenpunkt/DP_ETCS_Adresse/NID_BG/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::NB_Bedien_Anzeige_Element">
                <xsl:variable name="NB-zone" select="key('NB_Zone', $objekttyp/ID_NB_Zone/Wert, $objekttyp/parent::*)"/>
                <xsl:sequence select="$NB-zone/*/Bezeichnung_NB_Zone/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::NB_Zone">
                <xsl:sequence select="$objekttyp/*/Bezeichnung_NB_Zone/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::NB_Zone_Element|
                            $objekttyp/self::NB_Zone_Grenze">
                <xsl:variable name="current-nb-zone" select="key('NB_Zone', $objekttyp/ID_NB_Zone/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-nb" select="key('NB', $current-nb-zone/ID_NB/Wert, $objekttyp/parent::*)"/>
                <xsl:sequence select="$current-nb/*/Bezeichnung_NB/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::PZB_Element">
                <xsl:variable name="current-gue" select="$objekttyp/PZB_Element_GUE"/>
                <xsl:choose>
                    <xsl:when test="not($current-gue)">
                        <xsl:variable name="current-pzb-zuordnung" select="key('PZB_Element_Zuordnung', $objekttyp/ID_PZB_Element_Zuordnung/Wert, /*)"/>
                        <xsl:variable name="pzb-element-bezugspunkt" select="($current-pzb-zuordnung/PZB_Element_Zuordnung_BP/ID_PZB_Element_Bezugspunkt/Wert)[1]"/>
                        <xsl:variable name="signal" select="key('Signal', $pzb-element-bezugspunkt, /*)"/>
                        <xsl:variable name="w_element" select="key('W_Kr_Gsp_Element', $pzb-element-bezugspunkt, /*)"/>
                        <xsl:variable name="bezugselement" select="key('Identitaet', $pzb-element-bezugspunkt, /*)/.."/>
                        <xsl:choose>
                            <xsl:when test="$signal">
                                <xsl:sequence select="$signal/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:when>
                            <xsl:when test="$w_element">
                                <xsl:sequence select="$w_element/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="$bezugselement/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="current-strecke" select="key('Strecke', $objekttyp/(*/ID_Strecke/Wert)[1], /*)"/>
                        <xsl:sequence select="$current-strecke/*/Bezeichnung_Strecke/Wert/text()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::PZB_Element_Zuordnung">
                <xsl:variable name="current-pzb-elemente" select="key('PZB_Element-fuerPZB_Element_Zuordnung', $objekttyp/Identitaet/Wert, /*)"/>
                <xsl:variable name="current-gleismagnete" select="$current-pzb-elemente/PZB_Art/Wert"/>
                <xsl:variable name="current-gues" select="$current-pzb-elemente/PZB_Element_GUE"/>
                <xsl:choose>
                    <xsl:when test="$current-gleismagnete">
                        <xsl:choose>
                            <xsl:when test="count($current-gleismagnete) = 1">
                                <xsl:sequence select="'PZB-Gleismagnet'"/>        
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'PZB-Gleismagnete'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$current-gues and not ($current-gleismagnete)">
                        <xsl:sequence select="'GÜ'"/>
                        <xsl:value-of select="$current-pzb-elemente/*/Pruefgeschwindigkeit/Wert" separator=", GÜ"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::PZB_Zuordnung_Signal">
                <xsl:variable name="current-signal" select="key('Signal', $objekttyp/ID_Signal/Wert, /*)"/>
                <xsl:variable name="current-vorsignal" select="starts-with($current-signal/*/Signal_Real_Aktiv_Schirm/Signal_Art/Wert, 'Vorsignal')"/>
                <xsl:variable name="current-signal-rahmen" select="key('Signal_Rahmen-fuerSignal', $current-signal/Identitaet/Wert, /*)"/>
                <xsl:variable name="current-signalbegriff" select="key('Signal_Signalbegriff-fuerSignal_Rahmen', $current-signal-rahmen/Identitaet/Wert, /*)"/>
                <xsl:variable name="current-haltetafel" select="$current-signalbegriff/Signalbegriff_ID[substring-after(@xsi:type, ':') = 'Ne_5']"/>
                <xsl:choose>
                    <xsl:when test="$current-vorsignal">
                        <xsl:sequence select="$current-signal/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$current-haltetafel">
                        <xsl:variable name="current-signalbegriff-bezeichnung" select="$signalbegriff-typ/planpro:bezeichnung[@kurz = 'Ne_5']"/>
                        <xsl:sequence select="$current-signalbegriff-bezeichnung/planpro:bezeichnung_ds/text()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="'unbekannte PZB-Signalzuordnung'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Schaltmittel_Zuordnung">
                <xsl:variable name="current-schalter" select="$objekttyp/ID_Schalter/Wert"/>
                <xsl:variable name="fma-anlage" select="key('FMA_Anlage', $current-schalter, /*)"/>
                <xsl:variable name="fma-komponente" select="key('FMA_Komponente', $current-schalter, /*)"/>
                <xsl:variable name="zugeinwirkung" select="key('Zugeinwirkung', $current-schalter, /*)"/>
                <xsl:variable name="Search-Objekt" select="key('Identitaet', $current-schalter, /*)/.."/>
                <xsl:choose>
                    <xsl:when test="$fma-anlage">
                        <xsl:variable name="gleis-abschnitt" select="key('Gleis_Abschnitt', $fma-anlage/ID_Gleis_Abschnitt/Wert, /*)"/>
                        <xsl:sequence select="$gleis-abschnitt/*/Kennzahl/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$fma-komponente">
                        <xsl:variable name="current-azp" select="$fma-komponente/FMA_Komponente_Achszaehlpunkt"/>
                        <xsl:choose>
                            <xsl:when test="$current-azp">
                                <xsl:sequence select="'Achszählpunkt'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="current-fma-art" select="$fma-komponente/FMA_Komponente_Art/Wert"/>
                                <xsl:choose>
                                    <xsl:when test="contains($current-fma-art, 'Isolierstoss')">
                                        <xsl:sequence select="'Isolierstoß'"/>
                                    </xsl:when>
                                    <xsl:when test="contains($current-fma-art, 'Trennstoss')">
                                        <xsl:sequence select="'Elektrischer Trennstoß'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:sequence select="'Sonstiger Stoß'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$zugeinwirkung">
                        <xsl:sequence select="$zugeinwirkung-typ/planpro:bezeichnung[@kurz = $zugeinwirkung/*/Zugeinwirkung_Art/Wert]/text()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="$Search-Objekt/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Schloss">
                <xsl:choose>
                    <xsl:when test="$objekttyp/Schloss_Gsp">
                        <xsl:variable name="w-kr-gsp-element" select="key('W_Kr_Gsp_Element', $objekttyp/*/ID_Gsp_Element/Wert, /*)"/>
                        <xsl:sequence select="$w-kr-gsp-element/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/Schloss_Ssp">
                        <xsl:variable name="current-ssp" select="key('Schluesselsperre', $objekttyp/*/ID_Schluesselsperre/Wert, /*)"/>
                        <xsl:sequence select="$current-ssp/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/Schloss_W">
                         <xsl:sequence select="$lage-typ/planpro:bezeichnung[@kurz = $objekttyp/*/W_Lage/Wert]/text()"/>
                    </xsl:when>
                    <xsl:when test="$objekttyp/Schloss_BUE">
                         <xsl:sequence select="$objekttyp/Schloss_BUE/BUE_Lage/Wert/text()"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
             <xsl:when test="$objekttyp/self::Signal">
                 <xsl:if test="not($objekttyp/*/Bezeichnung_Tabelle/Wert)">
                	   <xsl:sequence select="'Strecke'"/>
                	</xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Signal_Befestigung">
                <xsl:sequence select="$signalbefestigung-typ/planpro:bezeichnung[@kurz = $objekttyp/*/Befestigung_Art/Wert]/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Signal_Rahmen">
                <xsl:sequence select="$signalrahmen-typ/planpro:bezeichnung[@kurz = $objekttyp/Rahmen_Art/Wert]/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Signal_Signalbegriff">
                <xsl:variable name="current-signal_rahmen" select="key('Signal_Rahmen', $objekttyp/ID_Signal_Rahmen/Wert, /*)"/>
                <xsl:variable name="current-signal" select="key('Signal', $current-signal_rahmen/ID_Signal/Wert, /*)"/>
                <xsl:variable name="current-term" select="$current-signal/*/Bezeichnung_Tabelle/Wert"/>
                <xsl:variable name="current-signalbegriff_id" select="$objekttyp/Signalbegriff_ID/substring-after(@xsi:type, ':')"/>
                <xsl:variable name="current-signalbegriff-bezeichnung" select="$signalbegriff-typ/planpro:bezeichnung[@kurz = $current-signalbegriff_id]"/>
                <xsl:choose>
                    <xsl:when test="$current-term">
                        <xsl:sequence select="fx:choose_signalbegriff($current-signalbegriff-bezeichnung)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="'Strecke'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Sonstiger_Punkt">
                <xsl:variable name="bue-gleisbezogener-gefahrraum" select="key('BUE_Gleisbezogener_Gefahrraum', $objekttyp/ID_Beginn_Bereich/Wert, /*)"/>
                <xsl:variable name="markanter-punkt" select="key('Markanter_Punkt-fuerMarkante_Stelle', $objekttyp/Identitaet/Wert, /*)"/>
                <xsl:variable name="bahnsteig-kante" select="key('Bahnsteig_Kante', $objekttyp/ID_Beginn_Bereich/Wert, $objekttyp/parent::*)"/>
                        
                <xsl:choose>
                    <xsl:when test="$bue-gleisbezogener-gefahrraum">
                        <xsl:variable name="current-bue_anlage" select="key('BUE_Anlage', $bue-gleisbezogener-gefahrraum/ID_BUE_Anlage/Wert, /*)"/>
                        <xsl:sequence select="$current-bue_anlage/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="not($markanter-punkt) and not($bahnsteig-kante)">
                        <xsl:variable name="current-strecke" select="key('Strecke', $objekttyp/(*/ID_Strecke/Wert)[1], /*)"/>
                        <xsl:sequence select="$current-strecke/*/Bezeichnung_Strecke/Wert/text()"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Stell_Bereich">
                <xsl:variable name="aussenelementansteuerung" select="key('Aussenelementansteuerung', $objekttyp/ID_Aussenelementansteuerung/Wert, /*)"/>
                <xsl:sequence select="$aussenelementansteuerung/*/Bezeichnung_AEA/Wert/text()"/>
            </xsl:when>
			<xsl:when test="$objekttyp/self::Strecke_Punkt">
			    <xsl:variable name="current-strecke" select="key('Strecke', $objekttyp/ID_Strecke/Wert, $objekttyp/parent::*)"/>
			    <xsl:sequence select="$current-strecke/*/Bezeichnung_Strecke/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::TOP_Kante">
                <xsl:variable name="top-knoten" select="key('TOP_Knoten', $objekttyp/ID_TOP_Knoten_B/Wert, $objekttyp/parent::*)"/>
                <xsl:sequence select="$top-knoten/Knotenname/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::TOP_Knoten">
                <xsl:variable name="current_ID" select="$objekttyp/Identitaet/Wert"/>
                <xsl:variable name="current_TOP_Kante_AnschlussA" select="key('TOP_Kante-fuerTOP_Knoten_A', $current_ID, $objekttyp/parent::*)[TOP_Kante_Allg/TOP_Anschluss_A/Wert = ('Rechts', 'Links')]"/>
                <xsl:variable name="current_TOP_Kante_AnschlussB" select="key('TOP_Kante-fuerTOP_Knoten_B', $current_ID, $objekttyp/parent::*)[TOP_Kante_Allg/TOP_Anschluss_B/Wert = ('Rechts', 'Links')]"/>
                <xsl:variable name="current-W-Kr-Gsp-Komponente" select="fx:W_Kr_Gsp_Komponente-for-TOP_Knoten($current_ID, ($current_TOP_Kante_AnschlussA | $current_TOP_Kante_AnschlussB))/.."/>
                <xsl:if test="$current-W-Kr-Gsp-Komponente">
                    <xsl:choose>
                        <xsl:when test="$current-W-Kr-Gsp-Komponente/Entgleisungsschuh">
                            <xsl:sequence select="'Entgleisungsschuh'"/>
                        </xsl:when>
                        <xsl:when test="$current-W-Kr-Gsp-Komponente/Kreuzung">
                            <xsl:sequence select="'Kr-Komponente'"/>
                        </xsl:when>
                        <xsl:when test="$current-W-Kr-Gsp-Komponente/Zungenpaar">
                            <xsl:sequence select="'Zungenpaar'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:sequence select="'Sonstige Komponente'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:sequence select="'von'"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Trasse_Kante">
                <xsl:variable name="Trasse_Knoten_A" select="key('Trasse_Knoten', $objekttyp/ID_Trasse_Knoten_A/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="Anschlusselement_A" select="$Trasse_Knoten_A/ID_Anschluss_Element/Wert"/>
                <xsl:variable name="Geo-Knoten_A" select="$Trasse_Knoten_A/ID_GEO_Knoten/Wert"/>
                <xsl:choose>
                    <xsl:when test="$Anschlusselement_A">
                        <xsl:variable name="Search-Anschlusselement" select="(key('Identitaet', $Anschlusselement_A, /*)[../Bezeichnung])[1]"/>
                        <xsl:sequence select="$Search-Anschlusselement/../Bezeichnung/*/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$Geo-Knoten_A">
                        <xsl:variable name="Search-Geoknoten" select="(key('GEO_Knoten', $Geo-Knoten_A, /*))[1]"/>
                        <xsl:sequence select="$Search-Geoknoten/GEO_PAD/Wert/text()"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:sequence select="$objekttyp/*/Knotenname/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Ueberhoehungslinie">
                <xsl:variable name="current-ueberhoehung" select="key('Ueberhoehung', $objekttyp/ID_Ueberhoehung_B/Wert, $objekttyp/parent::*)"/>
                <xsl:sequence select="$current-ueberhoehung/*/GEO_PAD/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Unterbringung">
                <xsl:variable name="current-id" select="$objekttyp/Identitaet/Wert"/>
                <xsl:variable name="aussenelementansteuerung" select="key('Aussenelementansteuerung-fuerUnterbringung', $current-id, /*)"/>
                <xsl:variable name="bedien-einrichtung-oertlich" select="key('Bedien_Einrichtung_Oertlich-fuerUnterbringung', $current-id, /*)"/>
                <xsl:variable name="bedien-platz" select="key('Bedien_Platz-fuerUnterbringung', $current-id, /*)"/>
                <xsl:variable name="pzb-element" select="key('PZB_Element-fuerUnterbringung', $current-id, /*)"/>
                <xsl:variable name="schlosskombination" select="key('Schlosskombination-fuerUnterbringung', $current-id, /*)"/>
                <xsl:variable name="schluesselsperre" select="key('Schluesselsperre-fuerUnterbringung', $current-id, /*)"/>
                <xsl:variable name="zn" select="key('ZN-fuerUnterbringung', $current-id, /*)"/>
                <xsl:choose>
                    <xsl:when test="$aussenelementansteuerung">
                        <xsl:sequence select="$aussenelementansteuerung/*/Bezeichnung_AEA/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$bedien-einrichtung-oertlich">
                        <xsl:sequence select="$bedien-einrichtung-oertlich/*/Bedien_Einricht_Oertl_Bez/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$bedien-platz">
                        <xsl:sequence select="$bedien-platz/*/Bedienplatzbezeichnung/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$pzb-element">
                        <xsl:sequence select="'Strecke'"/>
                    </xsl:when>
                    <xsl:when test="$schlosskombination">
                        <xsl:sequence select="$schlosskombination/*/Bezeichnung_Sk/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$schluesselsperre">
                        <xsl:sequence select="$schluesselsperre/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$zn">
                        <xsl:variable name="estw-zentraleinheit" select="key('ESTW_Zentraleinheit', $zn/ID_ESTW_Zentraleinheit/Wert, /*)"/>
                        <xsl:sequence select="$estw-zentraleinheit/*/Bezeichnung_ESTW_ZE/Wert/text()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="''"/>
                    </xsl:otherwise>
                 </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Weichenlaufkette_Zuordnung">
                <xsl:sequence select="'Zuordnung Signal'"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Zugeinwirkung">
                <xsl:sequence select="$objekttyp/*/Bezeichnung_Tabelle/Wert/text()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="''"/>
            </xsl:otherwise>
        </xsl:choose>
    </iso:diagnostic>
    <iso:diagnostic id="s4">
        <xsl:variable name="objekttyp" select="ancestor-or-self::*[parent::Container]"/>
        <xsl:choose>
            <xsl:when test="$objekttyp/self::Bahnsteig_Zugang">
                <xsl:sequence select="$objekttyp/*/Bahnsteig_Zugang_Art/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Bedien_Anzeige_Element">
                <xsl:sequence select="$objekttyp/*/Bez_Bed_Anzeige_Element/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::BUE_Ausschaltung">
                <xsl:sequence select="'Gleis '"/>
                <xsl:variable name="current-gefahrraum" select="key('BUE_Gleisbezogener_Gefahrraum', $objekttyp/ID_BUE_Gleisbez_Gefahrraum/Wert, /*)"/>
                <xsl:value-of select="$current-gefahrraum/Gleis_Am_Bue/Wert" separator=", "/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::BUE_Bedien_Anzeige_Element">
                <xsl:sequence select="$objekttyp/*/BUE_Handschalteinrichtung/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::BUE_Einschaltung">
                <xsl:sequence select="'Gleis '"/>
                <xsl:variable name="current_bue-einschaltung-zuordnung" select="key('BUE_Einschaltung_Zuordnung-fuerBUE_Einschaltung', $objekttyp/Identitaet/Wert, /*)"/>
                <xsl:variable name="current-gefahrraum" select="key('BUE_Gleisbezogener_Gefahrraum', $current_bue-einschaltung-zuordnung/ID_BUE_Gleisbez_Gefahrraum/Wert, /*)"/>
                <xsl:value-of select="$current-gefahrraum/Gleis_Am_Bue/Wert" separator=", "/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::BUE_Gleisbezogener_Gefahrraum">
                <xsl:sequence select="$objekttyp/Gleis_Am_Bue/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::BUE_Kante">
                <xsl:sequence select="$objekttyp/Punkt_Objekt_Strecke[1]/Strecke_Km/Wert/text()"/>
            </xsl:when>
             <xsl:when test="$objekttyp/self::BUE_Spezifisches_Signal">
                 <xsl:variable name="current-signal" select="key('Signal', $objekttyp/ID_Signal/Wert, /*)"/>
                 <xsl:if test="not($current-signal/Bezeichnung)">
                    <xsl:sequence select="'Km'"/>
                </xsl:if>
            </xsl:when>
           <xsl:when test="$objekttyp/self::Fla_Schutz">
               <xsl:variable name="current-fla_schutz-anforderer" select="$objekttyp/*/ID_Anforderer_Element/Wert"/>
               <xsl:variable name="nb-zonengrenzen-anforderung" select="key('NB_Zone_Grenze', $current-fla_schutz-anforderer, $objekttyp/parent::*)"/>
               <xsl:if test="$nb-zonengrenzen-anforderung">
                   <xsl:variable name="current-nb-zone" select="key('NB_Zone', $nb-zonengrenzen-anforderung/ID_NB_Zone/Wert, $objekttyp/parent::*)"/>
                   <xsl:variable name="current-nb" select="key('NB', $current-nb-zone/ID_NB/Wert, $objekttyp/parent::*)"/>
                   <xsl:sequence select="$current-nb/*/Bezeichnung_NB/Wert/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::FMA_Anlage">
                <xsl:variable name="current-gleis-abschnitt" select="key('Gleis_Abschnitt', $objekttyp/ID_Gleis_Abschnitt/Wert, $objekttyp/parent::*)"/>
                <xsl:sequence select="$current-gleis-abschnitt/*/Oertlicher_Elementname/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::FMA_Element">
                <xsl:variable name="current-fma_anlage" select="key('FMA_Anlage', $objekttyp/ID_FMA_Anlage/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-gleis-abschnitt" select="key('Gleis_Abschnitt', $current-fma_anlage/ID_Gleis_Abschnitt/Wert, $objekttyp/parent::*)"/>
                <xsl:sequence select="$current-gleis-abschnitt/*/Oertlicher_Elementname/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::FMA_Komponente">
                <xsl:if test="not($objekttyp/FMA_Komponente_Achszaehlpunkt)">
                    <xsl:sequence select="'Km'"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Fstr_Signalisierung">
                <xsl:variable name="current-fstr_zug_rangier" select="key('Fstr_Zug_Rangier', $objekttyp/ID_Fstr_Zug_Rangier/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $current-fstr_zug_rangier/ID_Fstr_Fahrweg/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-signal" select="key('Signal', $current-fstr_fahrweg/ID_Ziel/Wert, /*)"/>
                <xsl:sequence select="$current-signal/*/Bezeichnung_Tabelle/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Fstr_Zug_Rangier">
                <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $objekttyp/ID_Fstr_Fahrweg/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-fstr_umfahrpunkt" select="key('Fstr_Umfahrpunkt-fuerFstr_Fahrweg', $current-fstr_fahrweg/Identitaet/Wert, /*)"/>
                <xsl:variable name="current-dweg" select="key('Fstr_DWeg', $objekttyp/*/*/ID_Fstr_DWeg/Wert, $objekttyp/parent::*)"/>
                <xsl:choose>
                    <xsl:when test="$current-fstr_umfahrpunkt">
                        <xsl:variable name="Search-umfahrpunkt" select="(key('Identitaet', $current-fstr_umfahrpunkt/ID_Umfahrpunkt/Wert, /*)[../Bezeichnung])[1]"/>
                        <xsl:sequence select="$Search-umfahrpunkt/../*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$current-dweg">
                        <xsl:sequence select="$current-dweg/*/Bezeichnung_Fstr_DWeg/Wert/text()"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::GEO_Punkt">
                <xsl:variable name="current-geo_knoten-id" select="$objekttyp/ID_GEO_Knoten/Wert"/>
                <xsl:variable name="current-geo_knoten" select="key('GEO_Knoten', $current-geo_knoten-id, $objekttyp/parent::*)"/>
                <xsl:if test="$current-geo_knoten-id and $current-geo_knoten/GEO_PAD/Wert">
                    <xsl:sequence select="'zu Geo-Knoten'"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Gleis_Abschluss">
                <xsl:sequence select="'Km'"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Luft_Telegramm">
                <xsl:sequence select="'DP-Typ'"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::NB_Bedien_Anzeige_Element">
                <xsl:variable name="current-bedien-anzeige-element" select="key('Bedien_Anzeige_Element', $objekttyp/ID_Bedien_Anzeige_Element/Wert, /*)"/>
                <xsl:variable name="current-bedien_einrichtung" select="key('Bedien_Einrichtung_Oertlich', $current-bedien-anzeige-element/ID_Bedien_Einrichtung_Oertlich/Wert, /*)"/>
                <xsl:sequence select="$bedien-einricht-typ/planpro:bezeichnung[@kurz = $current-bedien_einrichtung/*/Bedien_Einricht_Bauart/Wert]/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::NB_Zone_Element |
                            $objekttyp/self::NB_Zone_Grenze">
                <xsl:variable name="current-nb-zone" select="key('NB_Zone', $objekttyp/ID_NB_Zone/Wert, $objekttyp/parent::*)"/>
                <xsl:sequence select="$current-nb-zone/*/Bezeichnung_NB_Zone/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::PZB_Element">
                <xsl:if test="$objekttyp/PZB_Element_GUE">
                    <xsl:sequence select="'Km'"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::PZB_Element_Zuordnung">
                <xsl:variable name="current-pzb-elemente" select="key('PZB_Element-fuerPZB_Element_Zuordnung', $objekttyp/Identitaet/Wert, /*)"/>
                <xsl:variable name="current-gleismagnete" select="$current-pzb-elemente/PZB_Art/Wert"/>
                <xsl:for-each-group select="$current-gleismagnete" group-by=".">
                    <xsl:sort select="string-length(current())" order="ascending" data-type="text"/>
                    <xsl:sort select="current()" order="ascending" data-type="text"/>
                    <xsl:sequence select="$pzb-typ/planpro:bezeichnung[@kurz = current()]/text()"/>
                    <xsl:if test="position() != last()">
                        <xsl:sequence select="', '"/>
                    </xsl:if>
                </xsl:for-each-group>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Schaltmittel_Zuordnung">
                <xsl:variable name="current-schalter" select="$objekttyp/ID_Schalter/Wert"/>
                <xsl:variable name="fma-anlage" select="key('FMA_Anlage', $current-schalter, /*)"/>
                <xsl:variable name="fma-komponente" select="key('FMA_Komponente', $current-schalter, /*)"/>
                <xsl:variable name="zugeinwirkung" select="key('Zugeinwirkung', $current-schalter, /*)"/>
                <xsl:choose>
                    <xsl:when test="$fma-anlage">
                        <xsl:sequence select="$fma-anlage/*/Bezeichnung_Kennbuchstabe/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$fma-komponente">
                        <xsl:choose>
                            <xsl:when test="$fma-komponente/FMA_Komponente_Achszaehlpunkt">
                                <xsl:sequence select="$fma-komponente/*/Bezeichnung_Tabelle/Wert/text()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="'Strecke'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$zugeinwirkung">
                        <xsl:sequence select="$zugeinwirkung/*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Schloss">
                <xsl:if test="$objekttyp/Schloss_Gsp">
                    <xsl:sequence select="$objekttyp/Schloss_Gsp/Gsp_Lage/Wert/text()"/>
                </xsl:if>
            </xsl:when>
             <xsl:when test="$objekttyp/self::Signal">
                 <xsl:if test="not($objekttyp/*/Bezeichnung_Tabelle/Wert)">
                     <xsl:variable name="current-strecke" select="key('Strecke', $objekttyp/(*/ID_Strecke/Wert)[1], /*)"/>
                     <xsl:sequence select="$current-strecke/*/Bezeichnung_Strecke/Wert/text()"/>
                 </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Signal_Signalbegriff">
                <xsl:variable name="current-signal_rahmen" select="key('Signal_Rahmen', $objekttyp/ID_Signal_Rahmen/Wert, /*)"/>
                <xsl:variable name="current-signal" select="key('Signal', $current-signal_rahmen/ID_Signal/Wert, /*)"/>
                <xsl:variable name="current-term" select="$current-signal/*/Bezeichnung_Tabelle/Wert"/>
                <xsl:variable name="current-symbol" select="$objekttyp/Signalbegriff_ID/Symbol"/>
                <xsl:choose>
                    <xsl:when test="$current-term and $current-symbol">
                        <xsl:sequence select="$current-symbol/text()"/>    
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="current-strecke" select="key('Strecke', $current-signal/(*/ID_Strecke/Wert)[1], /*)"/>
                        <xsl:sequence select="$current-strecke/*/Bezeichnung_Strecke/Wert/text()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Sonstiger_Punkt">
                <xsl:variable name="bue-gleisbezogener-gefahrraum" select="key('BUE_Gleisbezogener_Gefahrraum', $objekttyp/ID_Beginn_Bereich/Wert, /*)"/>
                <xsl:variable name="markanter-punkt" select="key('Markanter_Punkt-fuerMarkante_Stelle', $objekttyp/Identitaet/Wert, /*)"/>
                <xsl:variable name="bahnsteig-kante" select="key('Bahnsteig_Kante', $objekttyp/ID_Beginn_Bereich/Wert, $objekttyp/parent::*)"/>
                
                <xsl:choose>
                    <xsl:when test="$bue-gleisbezogener-gefahrraum">
                        <xsl:sequence select="'Gleis'"/>
                    </xsl:when>
                    <xsl:when test="not($markanter-punkt) and not($bahnsteig-kante)">
                        <xsl:sequence select="'Km'"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Strecke_Punkt">
                <xsl:sequence select="'Km'"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::TOP_Knoten">
                <xsl:variable name="current_ID" select="$objekttyp/Identitaet/Wert"/>
                <xsl:variable name="current_TOP_Kante_AnschlussA" 
                    select="key('TOP_Kante-fuerTOP_Knoten_A', $current_ID, $objekttyp/parent::*)[TOP_Kante_Allg/TOP_Anschluss_A/Wert = ('Rechts', 'Links')]"/>
                <xsl:variable name="current_TOP_Kante_AnschlussB" 
                    select="key('TOP_Kante-fuerTOP_Knoten_B', $current_ID, $objekttyp/parent::*)[TOP_Kante_Allg/TOP_Anschluss_B/Wert = ('Rechts', 'Links')]"/>
                <xsl:variable name="current-W-Kr-Gsp-Komponente" select="fx:W_Kr_Gsp_Komponente-for-TOP_Knoten($current_ID, ($current_TOP_Kante_AnschlussA | $current_TOP_Kante_AnschlussB))/.."/>
                <xsl:if test="$current-W-Kr-Gsp-Komponente">
                    <xsl:variable name="current-w-kr-gsp-element" select="key('W_Kr_Gsp_Element', $current-W-Kr-Gsp-Komponente/ID_W_Kr_Gsp_Element/Wert, /*)"/>
                    <xsl:sequence select="$current-w-kr-gsp-element/*/Bezeichnung_Tabelle/Wert/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Trasse_Kante">
                <xsl:variable name="Trasse_Knoten_B" select="key('Trasse_Knoten', $objekttyp/ID_Trasse_Knoten_B/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="Anschlusselement_B" select="$Trasse_Knoten_B/ID_Anschluss_Element/Wert"/>
                <xsl:variable name="Geo-Knoten_B" select="$Trasse_Knoten_B/ID_GEO_Knoten/Wert"/>
                <xsl:choose>
                    <xsl:when test="$Anschlusselement_B">
                        <xsl:variable name="Search-Anschlusselement" select="(key('Identitaet', $Anschlusselement_B, /*)[../Bezeichnung])[1]"/>
                        <xsl:sequence select="$Search-Anschlusselement/../Bezeichnung/*/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$Geo-Knoten_B">
                        <xsl:variable name="Search-Geoknoten" select="(key('GEO_Knoten', $Geo-Knoten_B, /*))[1]"/>
                        <xsl:sequence select="$Search-Geoknoten/GEO_PAD/Wert/text()"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Unterbringung">
                <xsl:variable name="pzb-element" select="key('PZB_Element-fuerUnterbringung', $objekttyp/Identitaet/Wert, /*)"/>
                <xsl:if test="$pzb-element">
                    <xsl:variable name="current-strecke" select="key('Strecke', $pzb-element/(*/ID_Strecke/Wert)[1], /*)"/>
                    <xsl:sequence select="$current-strecke/*/Bezeichnung_Strecke/Wert/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Weichenlaufkette_Zuordnung">
                <xsl:variable name="current-signal-zuordnung" select="key('Signal', $objekttyp/ID_Signal/Wert, /*)"/>
                <xsl:sequence select="$current-signal-zuordnung/*/Bezeichnung_Tabelle/Wert/text()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="''"/>
            </xsl:otherwise>
        </xsl:choose>
    </iso:diagnostic>
    <iso:diagnostic id="s5">
        <xsl:variable name="objekttyp" select="ancestor-or-self::*[parent::Container]"/>
        <xsl:choose>
             <xsl:when test="$objekttyp/self::BUE_Spezifisches_Signal">
                 <xsl:variable name="current-signal" select="key('Signal', $objekttyp/ID_Signal/Wert, /*)"/>
                 <xsl:if test="not($current-signal/Bezeichnung)">
                     <xsl:sequence select="$current-signal/(*/Strecke_Km/Wert)[1]/text()"/>
                 </xsl:if>
            </xsl:when>
             <xsl:when test="$objekttyp/self::Fla_Schutz">
                 <xsl:variable name="current-fla_schutz-anforderer" select="$objekttyp/*/ID_Anforderer_Element/Wert"/>
                 <xsl:variable name="nb-zonengrenzen-anforderung" select="key('NB_Zone_Grenze', $current-fla_schutz-anforderer, $objekttyp/parent::*)"/>
                 <xsl:if test="$nb-zonengrenzen-anforderung">
                     <xsl:variable name="current-nb-zone" select="key('NB_Zone', $nb-zonengrenzen-anforderung/ID_NB_Zone/Wert, $objekttyp/parent::*)"/>
                     <xsl:sequence select="$current-nb-zone/*/Bezeichnung_NB_Zone/Wert/text()"/>
                 </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::FMA_Komponente">
                <xsl:if test="not($objekttyp/FMA_Komponente_Achszaehlpunkt)">
                    <xsl:sequence select="$objekttyp/(*/Strecke_Km/Wert)[1]/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Fstr_Signalisierung">
                <xsl:variable name="current-fstr_zug_rangier" select="key('Fstr_Zug_Rangier', $objekttyp/ID_Fstr_Zug_Rangier/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $current-fstr_zug_rangier/ID_Fstr_Fahrweg/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-fstr_umfahrpunkt" select="key('Fstr_Umfahrpunkt-fuerFstr_Fahrweg', $current-fstr_fahrweg/Identitaet/Wert, /*)"/>
                <xsl:variable name="current-dweg" select="key('Fstr_DWeg', $current-fstr_zug_rangier/*/*/ID_Fstr_DWeg/Wert, $objekttyp/parent::*)"/>
                <xsl:choose>
                    <xsl:when test="$current-fstr_umfahrpunkt">
                        <xsl:variable name="Search-umfahrpunkt" select="(key('Identitaet', $current-fstr_umfahrpunkt/ID_Umfahrpunkt/Wert, /*)[../Bezeichnung])[1]"/>
                        <xsl:sequence select="$Search-umfahrpunkt/../*/Bezeichnung_Tabelle/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$current-dweg">
                        <xsl:sequence select="$current-dweg/*/Bezeichnung_Fstr_DWeg/Wert/text()"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Fstr_Zug_Rangier">
                <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $objekttyp/ID_Fstr_Fahrweg/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-fstr_umfahrpunkt" select="key('Fstr_Umfahrpunkt-fuerFstr_Fahrweg', $current-fstr_fahrweg/Identitaet/Wert, /*)"/>
                <xsl:variable name="current-dweg" select="key('Fstr_DWeg', $objekttyp/*/*/ID_Fstr_DWeg/Wert, $objekttyp/parent::*)"/>
                <xsl:if test="$current-fstr_umfahrpunkt and $current-dweg">
                    <xsl:sequence select="$current-dweg/*/Bezeichnung_Fstr_DWeg/Wert/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::GEO_Punkt">
                <xsl:variable name="current-geo_knoten-id" select="$objekttyp/ID_GEO_Knoten/Wert"/>
                <xsl:variable name="current-geo_knoten" select="key('GEO_Knoten', $current-geo_knoten-id, $objekttyp/parent::*)"/>
                <xsl:variable name="current-geo-pad" select="$current-geo_knoten/GEO_PAD/Wert/text()"/>
                <xsl:if test="$current-geo_knoten-id and $current-geo-pad">
                    <xsl:sequence select="$current-geo-pad"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Gleis_Abschluss">
                <xsl:sequence select="$objekttyp/(*/Strecke_Km/Wert)[1]/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Luft_Telegramm">
                <xsl:variable name="current-balise" select="key('Balise', $objekttyp/ID_Balise_Uebertragung/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-datenpunkt" select="key('Datenpunkt', $current-balise/ID_Datenpunkt/Wert, $objekttyp/parent::*)"/>
                <xsl:value-of select="$current-datenpunkt/DP_Typ/*/DP_Typ_ETCS/Wert" separator=", "/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::NB_Bedien_Anzeige_Element">
                <xsl:variable name="current-bedien-anzeige-element" select="key('Bedien_Anzeige_Element', $objekttyp/ID_Bedien_Anzeige_Element/Wert, /*)"/>
                <xsl:variable name="current-bedien_einrichtung" select="key('Bedien_Einrichtung_Oertlich', $current-bedien-anzeige-element/ID_Bedien_Einrichtung_Oertlich/Wert, /*)"/>
                <xsl:sequence select="$current-bedien_einrichtung/*/Bedien_Einricht_Oertl_Bez/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::PZB_Element">
                <xsl:variable name="current-gue" select="$objekttyp/PZB_Element_GUE"/>
                <xsl:if test="$current-gue">
                    <xsl:sequence select="$objekttyp/(*/Strecke_Km/Wert)[1]/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::PZB_Element_Zuordnung">
                <xsl:variable name="current-pzb-elemente" select="key('PZB_Element-fuerPZB_Element_Zuordnung', $objekttyp/Identitaet/Wert, /*)"/>
                <xsl:variable name="current-gues" select="$current-pzb-elemente/PZB_Element_GUE"/>
                <xsl:if test="$current-gues">
                    <xsl:sequence select="'GÜ'"/>
                    <xsl:value-of select="$current-pzb-elemente/*/Pruefgeschwindigkeit/Wert" separator=", GÜ"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Schaltmittel_Zuordnung">
                <xsl:variable name="current-schalter" select="$objekttyp/ID_Schalter/Wert"/>
                <xsl:variable name="fma-anlage" select="key('FMA_Anlage', $current-schalter, /*)"/>
                <xsl:variable name="fma-komponente" select="key('FMA_Komponente', $current-schalter, /*)"/>
                <xsl:choose>
                    <xsl:when test="$fma-anlage">
                        <xsl:variable name="current-gleis-abschnitt" select="key('Gleis_Abschnitt', $fma-anlage/ID_Gleis_Abschnitt/Wert, /*)"/>
                        <xsl:sequence select="$current-gleis-abschnitt/*/Oertlicher_Elementname/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="$fma-komponente">
                        <xsl:if test="not($fma-komponente/FMA_Komponente_Achszaehlpunkt)">
                            <xsl:variable name="current-strecke" select="key('Strecke', $fma-komponente/(*/ID_Strecke/Wert)[1], /*)"/>
                            <xsl:sequence select="$current-strecke/*/Bezeichnung_Strecke/Wert/text()"/>
                        </xsl:if>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Signal">
                 <xsl:if test="not($objekttyp/*/Bezeichnung_Tabelle/Wert)">
                	<xsl:sequence select="'Km'"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Signal_Signalbegriff">
                <xsl:variable name="current-signal_rahmen" select="key('Signal_Rahmen', $objekttyp/ID_Signal_Rahmen/Wert, /*)"/>
                <xsl:variable name="current-signal" select="key('Signal', $current-signal_rahmen/ID_Signal/Wert, /*)"/>
                <xsl:variable name="current-term" select="$current-signal/*/Bezeichnung_Tabelle/Wert"/>
                <xsl:if test="not($current-term)">
                    <xsl:sequence select="'Km'"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Sonstiger_Punkt">
                <xsl:variable name="bue-gleisbezogener-gefahrraum" select="key('BUE_Gleisbezogener_Gefahrraum', $objekttyp/ID_Beginn_Bereich/Wert, /*)"/>
                <xsl:variable name="markanter-punkt" select="key('Markanter_Punkt-fuerMarkante_Stelle', $objekttyp/Identitaet/Wert, /*)"/>
                <xsl:variable name="bahnsteig-kante" select="key('Bahnsteig_Kante', $objekttyp/ID_Beginn_Bereich/Wert, $objekttyp/parent::*)"/>
                
                <xsl:choose>
                    <xsl:when test="$bue-gleisbezogener-gefahrraum">
                        <xsl:sequence select="$bue-gleisbezogener-gefahrraum/Gleis_Am_Bue/Wert/text()"/>
                    </xsl:when>
                    <xsl:when test="not($markanter-punkt) and not($bahnsteig-kante)">
                        <xsl:sequence select="$objekttyp/(*/Strecke_Km/Wert)[1]/text()"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Strecke_Punkt">
                <xsl:sequence select="format-number($objekttyp/Strecke_Meter/Wert div 1000, '0,000', 'd')"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Unterbringung">
                <xsl:variable name="pzb-element" select="key('PZB_Element-fuerUnterbringung', $objekttyp/Identitaet/Wert, /*)"/>
                <xsl:if test="$pzb-element">
                    <xsl:sequence select="'Km'"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="''"/>
            </xsl:otherwise>
        </xsl:choose>
    </iso:diagnostic>
    <iso:diagnostic id="s6">
        <xsl:variable name="objekttyp" select="ancestor-or-self::*[parent::Container]"/>
        <xsl:choose>
            <xsl:when test="$objekttyp/self::Fstr_Signalisierung">
                <xsl:variable name="current-fstr_zug_rangier" select="key('Fstr_Zug_Rangier', $objekttyp/ID_Fstr_Zug_Rangier/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $current-fstr_zug_rangier/ID_Fstr_Fahrweg/Wert, $objekttyp/parent::*)"/>
                <xsl:variable name="current-fstr_umfahrpunkt" select="key('Fstr_Umfahrpunkt-fuerFstr_Fahrweg', $current-fstr_fahrweg/Identitaet/Wert, /*)"/>
                <xsl:variable name="current-dweg" select="key('Fstr_DWeg', $current-fstr_zug_rangier/*/*/ID_Fstr_DWeg/Wert, $objekttyp/parent::*)"/>
                <xsl:if test="$current-fstr_umfahrpunkt and $current-dweg">
                    <xsl:sequence select="$current-dweg/*/Bezeichnung_Fstr_DWeg/Wert/text()"/>                    
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Luft_Telegramm">
                <xsl:sequence select="'Balise'"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::PZB_Element_Zuordnung">
                <xsl:variable name="current-pzb-elemente" select="key('PZB_Element-fuerPZB_Element_Zuordnung', $objekttyp/Identitaet/Wert, /*)"/>
                <xsl:variable name="current-gues" select="$current-pzb-elemente/PZB_Element_GUE"/>
                <xsl:if test="$current-gues">
                    <xsl:variable name="current-strecke" select="key('Strecke', $current-pzb-elemente[1]/(*/ID_Strecke/Wert)[1], /*)"/>
                    <xsl:sequence select="'Strecke '"/>
                    <xsl:sequence select="$current-strecke/*/Bezeichnung_Strecke/Wert/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Schaltmittel_Zuordnung">
                <xsl:variable name="current-schalter" select="$objekttyp/ID_Schalter/Wert"/>
                <xsl:variable name="fma-komponente" select="key('FMA_Komponente', $current-schalter, /*)"/>
                <xsl:if test="$fma-komponente and not($fma-komponente/FMA_Komponente_Achszaehlpunkt)">
                    <xsl:sequence select="'Km'"/>
                </xsl:if>
            </xsl:when>
             <xsl:when test="$objekttyp/self::Signal">
                 <xsl:if test="not($objekttyp/*/Bezeichnung_Tabelle/Wert)">
                     <xsl:sequence select="$objekttyp/(*/Strecke_Km/Wert)[1]/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Signal_Signalbegriff">
                <xsl:variable name="current-signal_rahmen" select="key('Signal_Rahmen', $objekttyp/ID_Signal_Rahmen/Wert, /*)"/>
                <xsl:variable name="current-signal" select="key('Signal', $current-signal_rahmen/ID_Signal/Wert, /*)"/>
                <xsl:variable name="current-term" select="$current-signal/*/Bezeichnung_Tabelle/Wert"/>
                <xsl:if test="not($current-term)">
                    <xsl:sequence select="$current-signal/(*/Strecke_Km/Wert)[1]/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Unterbringung">
                <xsl:variable name="pzb-element" select="key('PZB_Element-fuerUnterbringung', $objekttyp/Identitaet/Wert, /*)"/>
                <xsl:if test="$pzb-element">
                    <xsl:sequence select="$pzb-element/(*/Strecke_Km/Wert)[1]/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="''"/>
            </xsl:otherwise>
        </xsl:choose>
    </iso:diagnostic>
    <iso:diagnostic id="s7">
        <xsl:variable name="objekttyp" select="ancestor-or-self::*[parent::Container]"/>
        <xsl:choose>
            <xsl:when test="$objekttyp/self::Luft_Telegramm">
                <xsl:variable name="current-balise" select="key('Balise', $objekttyp/ID_Balise_Uebertragung/Wert, parent::*)"/>
                <xsl:sequence select="$current-balise/Balise_Allg/Anordnung_Im_DP/Wert/text()"/>
            </xsl:when>
            <xsl:when test="$objekttyp/self::PZB_Element_Zuordnung">
                <xsl:variable name="current-pzb-elemente" select="key('PZB_Element-fuerPZB_Element_Zuordnung', $objekttyp/Identitaet/Wert, /*)"/>
                <xsl:variable name="current-gues" select="$current-pzb-elemente/PZB_Element_GUE"/>
                <xsl:if test="$current-gues">
                    <xsl:sequence select="'Km '"/>
                    <xsl:sequence select="$current-pzb-elemente[1]/(*/Strecke_Km/Wert)[1]/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$objekttyp/self::Schaltmittel_Zuordnung">
                <xsl:variable name="current-schalter" select="$objekttyp/ID_Schalter/Wert"/>
                <xsl:variable name="fma-komponente" select="key('FMA_Komponente', $current-schalter, /*)"/>
                <xsl:if test="$fma-komponente and not($fma-komponente/FMA_Komponente_Achszaehlpunkt)">
                    <xsl:sequence select="$fma-komponente/(*/Strecke_Km/Wert)[1]/text()"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="''"/>
            </xsl:otherwise>
        </xsl:choose>
    </iso:diagnostic>
</iso:diagnostics>
