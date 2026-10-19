<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="0BDC6978-4783-44F0-93D9-A0F75113C8A5" see="Fahrstrasse_ID357" id="ID357" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Fehlende Fahrleitung im befahrenen Teil einer Rangierstraße</iso:title>
	<iso:p>
		<planpro:description>
			Es muss eine Warnung erfolgen, wenn Fstr_Zug_Rangier.Fstr_Rangier vorhanden (gefüllt) ist und der zugehörige Fahrweg
			(Fstr_Zug_Rangier.ID_Fstr_Fahrweg) am Beginn durch ein Bereichsobjekt Gleis_Schaltgruppe überdeckt ist
			und Fstr_Fahrweg weiterhin nicht vollständig durch Bereichsobjekte Gleis_Schaltgruppe überdeckt ist (Toleranz 0,1 m)
			und Fstr_Zug_Rangier.Fstr_Zug_Rangier_Allg.F_Bedienung == "false" gesetzt oder nicht vorhanden ist. 
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls:
			- fehlender referenzierter Fahrweg
			- relevantes ID_Start nil
			- fehlendes referenziertes Startsignal
			- keine übereinstimmenden TOP_Kanten zwischen referenziertem Startsignal und Fstr_Fahrweg.Bereich_Objekt_Teilbereich(en)
			- relevanter Abstand (im Startsignal) nil
			- Startsignal nicht mit Gleisschaltgruppe überdeckt
			- keine vollständige Überdeckung des Fahrwegs, aber F-Bedienung
			- vollständige Überdeckung des Fahrwegs
			- nicht vollständig überdeckt, F_Bedienung nil
			- relevante Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A nil
			- relevante Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_B nil
			- relevante Gleis_Schaltgruppe.Bereich_Objekt_Teilbereich.Begrenzung_A nil
			- relevante Gleis_Schaltgruppe.Bereich_Objekt_Teilbereich.Begrenzung_B nil 
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Der Fahrweg ist nicht vollständig mit Fahrleitung versehen und für die Rangierstraße ist eine F-Bedienung geplant.
			</planpro:success>
			<planpro:error>
				Der Fahrweg ist nicht vollständig mit Fahrleitung versehen und für die Rangierstraße ist keine F-Bedienung geplant.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
  <iso:rule role="warning" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Fstr_Rangier]">
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
  	<iso:let name="Gleis_Schaltgruppe_BOT_Fahrweg" value="key('Gleis_Schaltgruppe-fuerTOP_Kante', $Fahrweg_BOT/ID_TOP_Kante/Wert, parent::*)"/>
  	<iso:let name="Fahrweg_ueberdeckende_Schaltgruppen_BOT" value="for $bot in $Fahrweg_BOT return     $Gleis_Schaltgruppe_BOT_Fahrweg[ID_TOP_Kante/Wert = $bot/ID_TOP_Kante/Wert and     fx:number-or-zero($bot/Begrenzung_B/Wert) + $genauigkeit ge fx:number-or-zero(Begrenzung_A/Wert) and     fx:number-or-zero($bot/Begrenzung_A/Wert) - $genauigkeit le fx:number-or-zero(Begrenzung_B/Wert)]"/>
  	<iso:let name="vollstaendig_ueberdeckter_Fahrweg" value="for $ein_fahrweg_BOT in $Fahrweg_BOT return     fx:check-coverage($ein_fahrweg_BOT/Begrenzung_A/Wert, $ein_fahrweg_BOT/Begrenzung_B/Wert,           $Fahrweg_ueberdeckende_Schaltgruppen_BOT[ID_TOP_Kante/Wert = $ein_fahrweg_BOT/ID_TOP_Kante/Wert],           $genauigkeit)"/>
  	<iso:let name="F_Bedienung" value="Fstr_Zug_Rangier_Allg/F_Bedienung/Wert"/>
  	
  	<!--Annahme: Anfang nicht überdeckt (dann interessiert Regel nicht) oder
					 Anfang und vollständig überdeckt (dann interessiert Regel nicht)
					 oder Anfang und nicht vollständig überdeckt und [$Fstr_Zug_Rangier_Allg/F_Bedienung/Wert= 'true']-->
  	
  	<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="not($Signal_ueberdeckender_Schaltgruppen_BOT) or     ($Signal_ueberdeckender_Schaltgruppen_BOT and not($vollstaendig_ueberdeckter_Fahrweg = false())) or     ($Signal_ueberdeckender_Schaltgruppen_BOT and $vollstaendig_ueberdeckter_Fahrweg = false() and $F_Bedienung = 'true')">Der Fahrweg ist nicht vollständig mit Fahrleitung versehen und für die Rangierstraße ist keine F-Bedienung geplant.</iso:assert>
  </iso:rule>
</iso:pattern>