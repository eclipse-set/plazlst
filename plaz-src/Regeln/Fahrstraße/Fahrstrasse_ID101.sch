<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="D7B8859E-96BF-4695-AB38-7BF0A7E8030A" see="Fahrstrasse_ID101" id="ID101" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Fehlende Fahrleitung im befahrenen Teil einer Zugstraße</iso:title>
	<iso:p>
		<planpro:description>
			Wenn Fstr_Zug_Rangier.Fstr_Zug oder Fstr_Zug_Rangier.Fstr_Mittel vorhanden (gefüllt) ist und 
			der zugehörige Fahrweg (Fstr_Zug_Rangier.ID_Fstr_Fahrweg) am Beginn durch ein Bereichsobjekt Gleis_Schaltgruppe überdeckt ist
			und Fstr_Fahrweg weiterhin nicht vollständig durch Bereichsobjekte Gleis_Schaltgruppe überdeckt ist (Toleranz 0,1 m),
			muss Fstr_Zug_Rangier.Fstr_Zug_Rangier_Allg.F_Bedienung == "true" gesetzt sein.
		</planpro:description>
		<planpro:comment>
			Es ist eine Prüfstrategie zu finden für den Fall, dass der D-Weg einer Fahrstraße keine Fahrleitung hat. Bisher wurde für die 
			Planungsunterstützung folgende Regelung festgelegt: Befindet sich am Fahrstraßenstart eine Fahrleitung und im befahrenen Teil 
			der Fahrstraße (egal wo) ein Bereich ohne Fahrleitung, dann ist das Attribut zu setzen. Der Durchrutschweg bleibt vorerst 
			unberücksichtigt. Der Planer kann das Attribut jederzeit bearbeiten und damit - wenn er will - den Durchrutschweg berücksichtigen.
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Der Fahrweg ist nicht vollständig mit Fahrleitung versehen und für die Zugstraße ist eine F-Bedienung geplant.
			</planpro:success>
			<planpro:error>
				Der Fahrweg ist nicht vollständig mit Fahrleitung versehen und für die Zugstraße ist keine F-Bedienung geplant.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Zug|Fstr_Mittel][fx:ignore-nil(Fstr_Zug_Rangier_Allg/F_Bedienung)]">
		<iso:let name="genauigkeit" value="0.1"/>
		<iso:let name="Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
		<iso:let name="Fahrweg_BOT" value="$Fahrweg/Bereich_Objekt_Teilbereich"/>
	<!-- Ausblenden leerer Teilbereiche
		<iso:let name="Fahrweg_BOT" value="$Fahrweg/Bereich_Objekt_Teilbereich[fx:number-or-zero(Begrenzung_A/Wert) ne fx:number-or-zero(Begrenzung_B/Wert)]"/>
		-->
		<iso:let name="Startsignal" value="key('Signal', $Fahrweg/ID_Start/Wert, /*)"/>
		<iso:let name="Startsignal_TOP_Kante" value="$Startsignal/Punkt_Objekt_TOP_Kante     [ID_TOP_Kante/Wert = $Fahrweg_BOT/ID_TOP_Kante/Wert][1]"/>
		<iso:let name="Startsignal_Abstand" value="fx:number-or-zero($Startsignal_TOP_Kante/Abstand/Wert)"/>
		<iso:let name="Gleis_Schaltgruppe_BOT_Signal" value="key('Gleis_Schaltgruppe-fuerTOP_Kante', $Startsignal_TOP_Kante/ID_TOP_Kante/Wert, /*)"/>
		<iso:let name="Signal_ueberdeckender_Schaltgruppen_BOT" value="$Gleis_Schaltgruppe_BOT_Signal     [$Startsignal_Abstand + $genauigkeit ge fx:number-or-zero(Begrenzung_A/Wert) and      $Startsignal_Abstand - $genauigkeit le fx:number-or-zero(Begrenzung_B/Wert)]"/>
		<iso:let name="Gleis_Schaltgruppe_BOT_Fahrweg" value="key('Gleis_Schaltgruppe-fuerTOP_Kante', $Fahrweg_BOT/ID_TOP_Kante/Wert, /*)"/>
		<iso:let name="Fahrweg_ueberdeckende_Schaltgruppen_BOT" value="for $bot in $Fahrweg_BOT return     $Gleis_Schaltgruppe_BOT_Fahrweg[ID_TOP_Kante/Wert = $bot/ID_TOP_Kante/Wert and     fx:number-or-zero($bot/Begrenzung_B/Wert) + $genauigkeit ge fx:number-or-zero(Begrenzung_A/Wert) and     fx:number-or-zero($bot/Begrenzung_A/Wert) - $genauigkeit le fx:number-or-zero(Begrenzung_B/Wert)]"/>
		<iso:let name="vollstaendig_ueberdeckter_Fahrweg" value="     for $ein_fahrweg_BOT in $Fahrweg_BOT return     fx:check-coverage($ein_fahrweg_BOT/Begrenzung_A/Wert, $ein_fahrweg_BOT/Begrenzung_B/Wert,           $Fahrweg_ueberdeckende_Schaltgruppen_BOT[ID_TOP_Kante/Wert = $ein_fahrweg_BOT/ID_TOP_Kante/Wert],           $genauigkeit)"/>
		<iso:let name="F_Bedienung" value="Fstr_Zug_Rangier_Allg/F_Bedienung/Wert"/>

  	<!--Annahme: Anfang nicht überdeckt (dann interessiert Regel nicht) oder
					 Anfang und vollständig überdeckt (dann interessiert Regel nicht)
					 oder Anfang und nicht vollständig überdeckt und [$Fstr_Zug_Rangier_Allg/F_Bedienung/Wert= 'true']-->

		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="not($Signal_ueberdeckender_Schaltgruppen_BOT) or     ($Signal_ueberdeckender_Schaltgruppen_BOT and not($vollstaendig_ueberdeckter_Fahrweg = false())) or     ($Signal_ueberdeckender_Schaltgruppen_BOT and $vollstaendig_ueberdeckter_Fahrweg = false() and $F_Bedienung = 'true')">Der Fahrweg ist nicht vollständig mit Fahrleitung versehen und für die Zugstraße ist keine F-Bedienung geplant.</iso:assert>			 
	</iso:rule>
</iso:pattern>