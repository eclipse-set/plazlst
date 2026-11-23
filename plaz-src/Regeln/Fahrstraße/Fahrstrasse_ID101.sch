<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="D7B8859E-96BF-4695-AB38-7BF0A7E8030A" id="ID101-abstract" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3" see="Fahrstrasse_ID101"><iso:title>Fehlende Fahrleitung im befahrenen Teil einer Zugstraße</iso:title><iso:p>
			<planpro:description format="xhtml"><p xmlns="http://www.w3.org/1999/xhtml">Befindet sich am Zugstraßenstart eine Fahrleitung und im befahrenen Teil der Fahrstraße (egal wo) ein Bereich ohne Fahrleitung,
dann ist eine F-Bedienung zu projektieren.</p>
<p xmlns="http://www.w3.org/1999/xhtml">Wenn</p>
<ul xmlns="http://www.w3.org/1999/xhtml">
<li>Fahrstraße mit
<ul>
<li><code>Fstr_Zug_Rangier.Fstr_Zug</code> oder</li>
<li><code>Fstr_Zug_Rangier.Fstr_Mittel</code>, und</li>
</ul>
</li>
<li><code>Fstr_Zug_Rangier.ID_Fstr_Fahrweg</code> → <code>Fstr_Fahrweg</code> → <code>Fstr_Fahrweg.ID_Start</code> → <code>Signal</code> in
<code>Signal.Punkt_Objekt_TOP_Kante</code> für die <code>ID_TOP_Kante</code> durch
<code>Gleis_Schaltgruppe.Bereich_Objekt_Teilbereich</code> für <code>this.ID_TOP_Kante</code> überdeckt ist und</li>
<li><code>Fstr_Zug_Rangier.ID_Fstr_Fahrweg</code> → <code>Fstr_Fahrweg</code> weiterhin <strong>nicht</strong> vollständig durch
<code>Gleis_Schaltgruppe.Bereich_Objekt_Teilbereich</code> überdeckt ist (Toleranz 0,1 m),</li>
</ul>
<p xmlns="http://www.w3.org/1999/xhtml">dann muss <code>Fstr_Zug_Rangier.Fstr_Zug_Rangier_Allg.F_Bedienung</code> == <code>true</code> gesetzt sein.</p>
</planpro:description>
			<planpro:comment>
				Es ist eine Prüfstrategie zu finden für den Fall, dass der D-Weg einer Fahrstraße keine Fahrleitung hat. Der Durchrutschweg bleibt vorerst 
				unberücksichtigt. Der Planer kann das Attribut jederzeit bearbeiten und damit - wenn er will - den Durchrutschweg berücksichtigen.
			
				Prüfung entfällt, falls:
				- ID_Fstr_Fahrweg nil
				- referenzierter Fstr_Fahrweg fehlend
				- relevantes ID_Start nil
				- referenziertes Startsignal fehlend
				- keine übereinstimmenden TOP_Kanten zwischen referenziertem Startsignal und Fstr_Fahrweg.Bereich_Objekt_Teilbereich(en)
				- relevanter Abstand (im Startsignal) nil
				- F_Bedienung nil
				- relevante Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A nil
				- relevante Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_B nil
				- relevante Gleis_Schaltgruppe.Bereich_Objekt_Teilbereich.Begrenzung_A nil
				- relevante Gleis_Schaltgruppe.Bereich_Objekt_Teilbereich.Begrenzung_B nil 
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Für die Zugstraße ist eine F-Bedienung geplant und der Fahrweg ist nicht vollständig mit Fahrleitung versehen.
				</planpro:success>
				<planpro:error>
					Für die Zugstraße ist keine F-Bedienung geplant, trotz dass der Fahrweg 
					für die [TOP-Kante / TOP-Kanten] [nicht überdeckte TOP-Kanten-IDs] nicht vollständig mit Fahrleitung versehen ist. 
				</planpro:error>
			</planpro:test>
			<planpro:output>Fstr_Zug_Rangier</planpro:output>
		</iso:p><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_ID_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_F_Bedienung.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-miss_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_Signalreferenz.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-miss_Signal.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-miss_same_TOP_Kante.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_Signal-Abstand.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_Begrenzung_A_B.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_Gleis_Schaltgruppe-Begrenzung_A_B.xml"/><iso:rule context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][$relevanter-Fahrstrassentyp]" role="$Role">
			<iso:let name="genauigkeit" value="0.1"/>
			<iso:let name="Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
			<iso:let name="Fahrweg_BOT" value="$Fahrweg/Bereich_Objekt_Teilbereich"/>
		<!-- Ausblenden leerer Teilbereiche
			<iso:let name="Fahrweg_BOT" value="$Fahrweg/Bereich_Objekt_Teilbereich[fx:number-or-zero(Begrenzung_A/Wert) ne fx:number-or-zero(Begrenzung_B/Wert)]"/>
			-->
			<iso:let name="Startsignal" value="key('Signal', $Fahrweg/$Signal-Referenz/Wert, /*)"/>
			<iso:let name="Startsignal_TOP_Kante" value="$Startsignal/Punkt_Objekt_TOP_Kante      [ID_TOP_Kante/Wert = $Fahrweg_BOT/ID_TOP_Kante/Wert][1]"/>
			<iso:let name="Startsignal_Abstand" value="fx:number-or-zero($Startsignal_TOP_Kante/Abstand/Wert)"/>
			<iso:let name="Gleis_Schaltgruppe_BOT_Signal" value="key('Gleis_Schaltgruppe-fuerTOP_Kante', $Startsignal_TOP_Kante/ID_TOP_Kante/Wert, /*)"/>
			<iso:let name="Signal_ueberdeckender_Schaltgruppen_BOT" value="$Gleis_Schaltgruppe_BOT_Signal      [$Startsignal_Abstand + $genauigkeit ge fx:number-or-zero(Begrenzung_A/Wert) and       $Startsignal_Abstand - $genauigkeit le fx:number-or-zero(Begrenzung_B/Wert)]"/>
			<iso:let name="Gleis_Schaltgruppe_BOT_Fahrweg" value="key('Gleis_Schaltgruppe-fuerTOP_Kante', $Fahrweg_BOT/ID_TOP_Kante/Wert, /*)"/>
			<iso:let name="Fahrweg_ueberdeckende_Schaltgruppen_BOT" value="for $bot in $Fahrweg_BOT return      $Gleis_Schaltgruppe_BOT_Fahrweg[ID_TOP_Kante/Wert = $bot/ID_TOP_Kante/Wert and      fx:number-or-zero($bot/Begrenzung_B/Wert) + $genauigkeit ge fx:number-or-zero(Begrenzung_A/Wert) and      fx:number-or-zero($bot/Begrenzung_A/Wert) - $genauigkeit le fx:number-or-zero(Begrenzung_B/Wert)]"/>
			<iso:let name="nicht_vollstaendig_ueberdeckter_Fahrweg" value="      for $ein_fahrweg_BOT in $Fahrweg_BOT return      if (not(fx:check-coverage($ein_fahrweg_BOT/Begrenzung_A/Wert, $ein_fahrweg_BOT/Begrenzung_B/Wert,            $Fahrweg_ueberdeckende_Schaltgruppen_BOT[ID_TOP_Kante/Wert = $ein_fahrweg_BOT/ID_TOP_Kante/Wert],            $genauigkeit))) then $ein_fahrweg_BOT/ID_TOP_Kante/Wert else ()"/>
			<iso:let name="F_Bedienung" value="Fstr_Zug_Rangier_Allg/F_Bedienung/Wert"/>
	
	  	<!--Annahme: Anfang nicht überdeckt (dann interessiert Regel nicht) oder
						 Anfang und vollständig überdeckt (dann interessiert Regel nicht)
						 oder Anfang und nicht vollständig überdeckt und [$Fstr_Zug_Rangier_Allg/F_Bedienung/Wert= 'true']-->
	
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="not($Signal_ueberdeckender_Schaltgruppen_BOT) or      ($Signal_ueberdeckender_Schaltgruppen_BOT and not($nicht_vollstaendig_ueberdeckter_Fahrweg)) or      ($Signal_ueberdeckender_Schaltgruppen_BOT and $nicht_vollstaendig_ueberdeckter_Fahrweg and $F_Bedienung = 'true')">Für die Zugstraße ist keine F-Bedienung geplant, trotz dass der Fahrweg für die <iso:value-of select="if ($nicht_vollstaendig_ueberdeckter_Fahrweg[2]) then 'TOP-Kanten ' else 'TOP-Kante '"/> <iso:value-of select="string-join($nicht_vollstaendig_ueberdeckter_Fahrweg, ', ')"/> nicht vollständig mit Fahrleitung versehen ist.</iso:assert>			 
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID101" is-a="ID101-abstract"><iso:param name="Role" value="error"/><iso:param name="relevanter-Fahrstrassentyp" value="(Fstr_Zug | Fstr_Mittel)"/><iso:param name="relevante-Fahrstrassenart" value="()"/><iso:param name="allow-Gruppenausfahrt" value="true()"/><iso:param name="Signal-Referenz" value="ID_Start"/><iso:param name="ignore-Fahrstrassentyp" value="Fstr_Rangier"/></iso:pattern>
	
</planpro:pattern>