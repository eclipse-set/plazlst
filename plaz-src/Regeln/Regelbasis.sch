<?xml version='1.0' encoding='UTF-8'?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:fx="http://tu-dresden.de/vlp/schematron/functions" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2" schemaVersion="ISO19757-3"><title>Regelbasis für PlanPro-PlaZ</title>
   <!--Namensraum-Deklaration für die PlanPro-spezifischen Attribute wird benötigt, um sie in nachgelagerten Schematron-Prozessen korrekt weiterzugeben.-->
   <ns uri="http://www.plan-pro.org/regeln/struktur" prefix="planpro"/>
   <!--Namensraum-Deklaration für die PlanPro-spezifischen XSL-Funktionen wird benötigt, um sie in nachgelagerten Schematron-Prozessen korrekt weiterzugeben.-->
   <ns uri="http://tu-dresden.de/vlp/schematron/functions" prefix="fx"/>
   <!--Namensraum-Deklaration für 'xsi' wird benötigt, um jegliche Testbedingungen in nachgelagerten Schematron-Prozessen korrekt zu behandeln.-->
   <ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
   <!--Definition von Regelgruppen ("phases")-->
   <!--Gruppierung nach "Arbeitspaket"-->
   <phase id="ANSTEUERUNG_ELEMENT">
      <active pattern="ID116"/>
      <active pattern="ID344"/>
      <active pattern="ID345"/>
      <active pattern="ID632"/>
      </phase>
   <phase id="BAHNSTEIGE">
      <active pattern="ID343"/>
      <active pattern="ID65"/>
      </phase>
   <phase id="BALISENTECHNIK_ETCS">
      <active pattern="ID625"/>
      <active pattern="ID626"/>
      <active pattern="ID627"/>
      <active pattern="ID628"/>
      <active pattern="ID630"/>
      <active pattern="ID631"/>
      <active pattern="ID638"/>
      <active pattern="ID652"/>
      <active pattern="ID653"/>
      <active pattern="ID667"/>
      <active pattern="ID671"/>
      </phase>
   <phase id="BASISOBJEKTE">
      <active pattern="ID178"/>
      <active pattern="ID642"/>
      <active pattern="ID643"/>
      <active pattern="ID655"/>
      <active pattern="ID656"/>
      <active pattern="ID657"/>
      <active pattern="ID658"/>
      <active pattern="ID659"/>
      <active pattern="ID660"/>
      <active pattern="ID661"/>
      <active pattern="ID662"/>
      <active pattern="ID663"/>
      <active pattern="ID664"/>
      </phase>
   <phase id="FAHRSTRASSE">
      <active pattern="ID101"/>
      <active pattern="ID11"/>
      <active pattern="ID14"/>
      <active pattern="ID144"/>
      <active pattern="ID255"/>
      <active pattern="ID256"/>
      <active pattern="ID259"/>
      <active pattern="ID270"/>
      <active pattern="ID272"/>
      <active pattern="ID278"/>
      <active pattern="ID284"/>
      <active pattern="ID312"/>
      <active pattern="ID313"/>
      <active pattern="ID314"/>
      <active pattern="ID315"/>
      <active pattern="ID316"/>
      <active pattern="ID356"/>
      <active pattern="ID357"/>
      <active pattern="ID360"/>
      <active pattern="ID361"/>
      <active pattern="ID366"/>
      <active pattern="ID371"/>
      <active pattern="ID372"/>
      <active pattern="ID374"/>
      <active pattern="ID377"/>
      <active pattern="ID387"/>
      <active pattern="ID388"/>
      <active pattern="ID389"/>
      <active pattern="ID390"/>
      <active pattern="ID408"/>
      <active pattern="ID59"/>
      <active pattern="ID611"/>
      <active pattern="ID612"/>
      <active pattern="ID616"/>
      <active pattern="ID617"/>
      <active pattern="ID618"/>
      <active pattern="ID622"/>
      <active pattern="ID623"/>
      <active pattern="ID624"/>
      <active pattern="ID639"/>
      <active pattern="ID640"/>
      <active pattern="ID641"/>
      <active pattern="ID645"/>
      <active pattern="ID648"/>
      <active pattern="ID665"/>
      <active pattern="ID666"/>
      <active pattern="ID7"/>
      <active pattern="ID76"/>
      <active pattern="ID88"/>
      </phase>
   <phase id="FLANKENSCHUTZ">
      <active pattern="ID125"/>
      <active pattern="ID129"/>
      <active pattern="ID130"/>
      <active pattern="ID135"/>
      <active pattern="ID136"/>
      <active pattern="ID141"/>
      <active pattern="ID175"/>
      <active pattern="ID353"/>
      <active pattern="ID354"/>
      <active pattern="ID355"/>
      <active pattern="ID359"/>
      <active pattern="ID375"/>
      <active pattern="ID53"/>
      <active pattern="ID620"/>
      <active pattern="ID679"/>
      </phase>
   <phase id="GEODATEN">
      <active pattern="ID633"/>
      <active pattern="ID637"/>
      </phase>
   <phase id="GLEIS">
      <active pattern="ID634"/>
      </phase>
   <phase id="ORTUNG">
      <active pattern="ID654"/>
      </phase>
   <phase id="SCHLUESSELABHAENGIGKEITEN">
      <active pattern="ID346"/>
      <active pattern="ID348"/>
      <active pattern="ID349"/>
      <active pattern="ID614"/>
      <active pattern="ID615"/>
      </phase>
   <phase id="SIGNALE">
      <active pattern="ID220"/>
      <active pattern="ID613"/>
      <active pattern="ID619"/>
      <active pattern="ID649"/>
      </phase>
   <phase id="WEICHEN_UND_GLEISSPERREN">
      <active pattern="ID184"/>
      <active pattern="ID188"/>
      <active pattern="ID193"/>
      <active pattern="ID194"/>
      <active pattern="ID195"/>
      <active pattern="ID244"/>
      <active pattern="ID249"/>
      <active pattern="ID28"/>
      <active pattern="ID281"/>
      <active pattern="ID335"/>
      <active pattern="ID336"/>
      <active pattern="ID337"/>
      <active pattern="ID338"/>
      <active pattern="ID341"/>
      <active pattern="ID422"/>
      <active pattern="ID423"/>
      <active pattern="ID424"/>
      <active pattern="ID621"/>
      <active pattern="ID635"/>
      <active pattern="ID636"/>
      <active pattern="ID644"/>
      <active pattern="ID646"/>
      <active pattern="ID647"/>
      <active pattern="ID651"/>
      <active pattern="ID72"/>
      <active pattern="ID73"/>
      <active pattern="ID74"/>
      <active pattern="ID75"/>
      </phase>
   <!--Gruppierung nach "Schweregrad (= Fehlertyp)"-->
   <phase id="ERROR">
      <active pattern="ID116"/>
      <active pattern="ID344"/>
      <active pattern="ID632"/>
      <active pattern="ID343"/>
      <active pattern="ID65"/>
      <active pattern="ID625"/>
      <active pattern="ID626"/>
      <active pattern="ID627"/>
      <active pattern="ID628"/>
      <active pattern="ID630"/>
      <active pattern="ID631"/>
      <active pattern="ID652"/>
      <active pattern="ID653"/>
      <active pattern="ID667"/>
      <active pattern="ID671"/>
      <active pattern="ID178"/>
      <active pattern="ID642"/>
      <active pattern="ID643"/>
      <active pattern="ID101"/>
      <active pattern="ID11"/>
      <active pattern="ID270"/>
      <active pattern="ID272"/>
      <active pattern="ID278"/>
      <active pattern="ID284"/>
      <active pattern="ID315"/>
      <active pattern="ID356"/>
      <active pattern="ID360"/>
      <active pattern="ID361"/>
      <active pattern="ID366"/>
      <active pattern="ID372"/>
      <active pattern="ID377"/>
      <active pattern="ID387"/>
      <active pattern="ID388"/>
      <active pattern="ID59"/>
      <active pattern="ID616"/>
      <active pattern="ID617"/>
      <active pattern="ID618"/>
      <active pattern="ID622"/>
      <active pattern="ID641"/>
      <active pattern="ID648"/>
      <active pattern="ID665"/>
      <active pattern="ID666"/>
      <active pattern="ID7"/>
      <active pattern="ID76"/>
      <active pattern="ID88"/>
      <active pattern="ID129"/>
      <active pattern="ID130"/>
      <active pattern="ID136"/>
      <active pattern="ID141"/>
      <active pattern="ID175"/>
      <active pattern="ID353"/>
      <active pattern="ID354"/>
      <active pattern="ID355"/>
      <active pattern="ID375"/>
      <active pattern="ID53"/>
      <active pattern="ID620"/>
      <active pattern="ID679"/>
      <active pattern="ID637"/>
      <active pattern="ID654"/>
      <active pattern="ID346"/>
      <active pattern="ID614"/>
      <active pattern="ID615"/>
      <active pattern="ID220"/>
      <active pattern="ID613"/>
      <active pattern="ID619"/>
      <active pattern="ID184"/>
      <active pattern="ID188"/>
      <active pattern="ID193"/>
      <active pattern="ID194"/>
      <active pattern="ID195"/>
      <active pattern="ID244"/>
      <active pattern="ID249"/>
      <active pattern="ID281"/>
      <active pattern="ID335"/>
      <active pattern="ID336"/>
      <active pattern="ID337"/>
      <active pattern="ID341"/>
      <active pattern="ID422"/>
      <active pattern="ID423"/>
      <active pattern="ID424"/>
      <active pattern="ID621"/>
      <active pattern="ID636"/>
      <active pattern="ID644"/>
      <active pattern="ID647"/>
      <active pattern="ID651"/>
      <active pattern="ID72"/>
      <active pattern="ID73"/>
      <active pattern="ID74"/>
      <active pattern="ID75"/>
      </phase>
   <phase id="WARNING">
      <active pattern="ID345"/>
      <active pattern="ID638"/>
      <active pattern="ID655"/>
      <active pattern="ID656"/>
      <active pattern="ID657"/>
      <active pattern="ID658"/>
      <active pattern="ID659"/>
      <active pattern="ID660"/>
      <active pattern="ID661"/>
      <active pattern="ID662"/>
      <active pattern="ID663"/>
      <active pattern="ID664"/>
      <active pattern="ID14"/>
      <active pattern="ID144"/>
      <active pattern="ID255"/>
      <active pattern="ID256"/>
      <active pattern="ID259"/>
      <active pattern="ID312"/>
      <active pattern="ID313"/>
      <active pattern="ID314"/>
      <active pattern="ID316"/>
      <active pattern="ID357"/>
      <active pattern="ID371"/>
      <active pattern="ID374"/>
      <active pattern="ID389"/>
      <active pattern="ID390"/>
      <active pattern="ID408"/>
      <active pattern="ID611"/>
      <active pattern="ID612"/>
      <active pattern="ID623"/>
      <active pattern="ID624"/>
      <active pattern="ID639"/>
      <active pattern="ID640"/>
      <active pattern="ID645"/>
      <active pattern="ID125"/>
      <active pattern="ID135"/>
      <active pattern="ID359"/>
      <active pattern="ID633"/>
      <active pattern="ID634"/>
      <active pattern="ID348"/>
      <active pattern="ID349"/>
      <active pattern="ID649"/>
      <active pattern="ID28"/>
      <active pattern="ID338"/>
      <active pattern="ID635"/>
      <active pattern="ID646"/>
      </phase>
   <!--Variablen für gleichartige Bezeichnungen-->
   <xsl:variable name="aussenelement-typ">
      <!-- alte Bezeichnungen (vor 1.10.0.1) -->     
      <planpro:bezeichnung kurz="Relaisstellwerk">Relaisstellwerk</planpro:bezeichnung>
      <!-- aktuelle Bezeichnungen (ab 1.10.0.1) -->
      <planpro:bezeichnung kurz="BUE_Anschaltung">BÜ-Anschaltung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ESTW_A">ESTW-A</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Gleisfreimelde_Innenanlage">Gleisfreimelde-Innenanlage</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Objektcontroller">Objektcontroller</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">sonstige AEA</planpro:bezeichnung>
      <planpro:bezeichnung kurz="virtuelle_Aussenelementansteuerung">virtuelle AEA</planpro:bezeichnung>
      <planpro:bezeichnung kurz="FeAk">FEAK</planpro:bezeichnung>
      <planpro:bezeichnung kurz="GFK">GFK</planpro:bezeichnung>
      <planpro:bezeichnung kurz="FeAS">FEAS</planpro:bezeichnung>
      <!-- neue Bezeichnungen (ab 1.10.0.3) -->
      <planpro:bezeichnung kurz="EEA_Modul">EEA Modul</planpro:bezeichnung>
      <planpro:bezeichnung kurz="GVD">GVD</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="bedien-einricht-typ">
      <planpro:bezeichnung kurz="Bedienpult">Bedienpult</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bediensaeule">Bediensäule</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bedientablett">Bedientablett</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bedientafel">Bedientafel</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Stellpult">Stellpult</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Stelltisch">Stelltisch</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstige Bedieneinrichtung</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="etcs-knoten-art">
      <planpro:bezeichnung kurz="Gleisabschluss">Gleisabschluss</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Grenze_Ausruestungsbereich">Grenze des Ausrüstungsbereiches</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Grenze_LZB_La_Eingabe">LZB-Grenze für La-Eingabe</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Km_Sprung">Kilometrierungssprung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Knotenverschmelzung">Knotenverschmelzung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="KrW">Kreuzungsweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Streckenende">Streckenende</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Streckenwechsel">Streckenwechsel</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstiger ETCS-Knoten</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="fma-typ">
      <planpro:bezeichnung kurz="Anschlussseile">Anschlussseile</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Drosselspule">Drosselspule</planpro:bezeichnung>
      <planpro:bezeichnung kurz="S_Verbinder">S-Verbinder</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Endverbinder">Endverbinder</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Endverbinder_modifiziert">Modifizierter Endverbinder</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Kurzschlussverbinder">Kurzschlussverbinder</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ueberlagerungsverbinder">Überlagerungsverbinder</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Potentialausgleichsverbinder">Potentialausgleichsverbinder</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstiges FMA-Element</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="fstr-typ">
      <!-- alte Bezeichnungen (vor 1.10.0.1) -->     
      <planpro:bezeichnung kurz="ZB">Zug-Zentralblockfahrstraße</planpro:bezeichnung>
      <!-- aktuelle Bezeichnungen (ab 1.10.0.1) -->
      <planpro:bezeichnung kurz="B">Blockabschnitt</planpro:bezeichnung>
      <planpro:bezeichnung kurz="RR">Rangier-Regelfahrstraße</planpro:bezeichnung>
      <planpro:bezeichnung kurz="RT">Rangier-Teilfahrstraße</planpro:bezeichnung>
      <planpro:bezeichnung kurz="RTU">Rangier-Teilumfahrfahrstraße</planpro:bezeichnung>
      <planpro:bezeichnung kurz="RU">Rangier-Umfahrstraße</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ZH">Zug-Hilfsfahrstraße</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ZM">Zug-Mittelweichenteilfahrstraße</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ZR">Zug-Regelfahrstraße</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ZT">Zug-Teilfahrstraße</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ZTU">Zug-Teilumfahrfahrstraße</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ZU">Zug-Umfahrstraße</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ZUH">Zug-Umfahrhilfsfahrstraße</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ZUM">Zug-Umfahrmittelweichenteilfahrstraße</planpro:bezeichnung><!-- Zug-Umfahr-Mwtfstr -->
      <planpro:bezeichnung kurz="ZZ">Zug-Zentralblockfahrstraße</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="gleisabschluss-typ">
      <planpro:bezeichnung kurz="Drehscheibe">Drehscheibe</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Faehranleger">Fähranleger</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Festprellbock">Festprellbock</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Infrastrukturgrenze">Infrastrukturgrenze</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Kopframpe">Kopframpe</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Schiebebuehne">Schiebebühne</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Schwellenkreuz">Schwellenkreuz</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bremsprellbock">Bremsprellbock</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstiger Gleisabschluss</planpro:bezeichnung>
      <!-- neue Bezeichnung (ab 1.10.0.3) -->
      <planpro:bezeichnung kurz="fiktiv">Fiktiver Gleischabschluss</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="gleisart-typ">
      <planpro:bezeichnung kurz="Anschlussgleis">Anschlussgleis</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Durchgehendes_Hauptgleis">Durchgehendes Hauptgleis</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hauptgleis">Hauptgleis</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Nebengleis">Nebengleis</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Streckengleis">Streckengleis</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstige Gleisart</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="handschalteinrichtung-typ">
      <planpro:bezeichnung kurz="AT">Ausschalttaste</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ET">Einschalttaste</planpro:bezeichnung>
      <planpro:bezeichnung kurz="HAT">Hilfsausschalttaste</planpro:bezeichnung>
      <planpro:bezeichnung kurz="HET">Hilfseinschalttaste</planpro:bezeichnung>
      <planpro:bezeichnung kurz="RS">Rangierschalter</planpro:bezeichnung>
      <planpro:bezeichnung kurz="RT_ein_aus">1. Tastendruck=EIN, 2. Tastendruck=AUS</planpro:bezeichnung>
      <planpro:bezeichnung kurz="RT_ein_RT_aus">jeweils ein Taster für EIN und AUS</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstige Handschalteinrichtung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="UT">Unwirksamkeitstaste</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="lage-typ">
      <planpro:bezeichnung kurz="rechts">R</planpro:bezeichnung>
      <planpro:bezeichnung kurz="links">L</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Spitze">Spitze</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="lichtraumprofil">
      <planpro:bezeichnung kurz="1SMDR">1 SM DR</planpro:bezeichnung>
      <planpro:bezeichnung kurz="GC">GC</planpro:bezeichnung>
      <planpro:bezeichnung kurz="SBahn_80003">S-Bahn 80003</planpro:bezeichnung>
      <planpro:bezeichnung kurz="SBahn_Berlin">S-Bahn Berlin</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstiger Gleislichtraum</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="pzb-typ">
      <planpro:bezeichnung kurz="1000_2000_Hz">1000/2000 Hz</planpro:bezeichnung>
      <planpro:bezeichnung kurz="1000_Hz">1000 Hz</planpro:bezeichnung>
      <planpro:bezeichnung kurz="2000_Hz">2000 Hz</planpro:bezeichnung>
      <planpro:bezeichnung kurz="500_Hz">500 Hz</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="schaltmittel-funktion">
      <planpro:bezeichnung kurz="ARM">ARM</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Aus_BUE">Aus BÜ</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Awanst">Awanst</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ein_BUE">Ein Bü</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Haltfall">Haltfall</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Raeumungspruefung">Räumungsprüfung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstige Funktion</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ZL_Anstoss">ZL Anstoß</planpro:bezeichnung>
      <!-- neue Bezeichnung (ab 1.10.0.3) -->
      <planpro:bezeichnung kurz="ARV">ARV</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="signalbefestigung-typ">
      <!-- alte Bezeichnungen (vor 1.10.0.1) -->
      <planpro:bezeichnung kurz="Mast">Mast</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Signal_Anordnung_Arbeitsbuehne">Signal-Anordnung Arbeitsbühne</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Signal_Anordnung_Mast">Signal-Anordnung Mast</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Signal_Anordnung_Sonstige">Signal-Anordnung sonstige</planpro:bezeichnung>
      <!-- aktuelle Bezeichnungen (ab 1.10.0.1) -->
      <planpro:bezeichnung kurz="andere">andere</planpro:bezeichnung>
      <planpro:bezeichnung kurz="andere Sonderkonstruktion">andere Sonderkonstruktion</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Arbeitsbuehne">Arbeitsbühne</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bahnsteig">Bahnsteig</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Dach_Decke">Dach Decke</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Fundament">Fundament</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Konstruktionsteil">Konstruktionsteil</planpro:bezeichnung>
      <planpro:bezeichnung kurz="OL_Kettenwerk">OL Kettenwerk</planpro:bezeichnung>
      <planpro:bezeichnung kurz="OL_Mast">OL Mast</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Pfahl">Pfahl</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Pfosten_hoch">Pfosten hoch</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Pfosten_niedrig">Pfosten niedrig</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Prellbock">Prellbock</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Rahmen">Rahmen</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Regelanordnung_Mast_hoch">Regelanordnung Mast hoch</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Regelanordnung_Mast_niedrig">Regelanordnung Mast niedrig</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Regelanordnung_Sonstige_hoch">Regelanordnung Sonstige hoch</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Regelanordnung_Sonstige_niedrig">Regelanordnung Sonstige niedrig</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Schienenfuss">Schienenfuß</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Signalausleger">Signalausleger</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Signalbruecke">Signalbrücke</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sonderanordnung_Mast_hoch">Sonderanordnung Mast hoch</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sonderanordnung_Mast_niedrig">Sonderanordnung Mast niedrig</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">sonstige</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Wand">Wand</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="signalbegriff-typ">
      <planpro:bezeichnung kurz="So_20">
         <planpro:bezeichnung_ds>So 20 (Zuordnungstafel)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>So 20 (Zuordnungstafel)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ms_ws_rt_ws">
         <planpro:bezeichnung_ds>ws-rt-ws</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>ws-rt-ws</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ms_rt">
         <planpro:bezeichnung_dv>rt</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ms_ws_ge_ws">
         <planpro:bezeichnung_ds>ws-ge-ws</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>ws-ge-ws</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ms_ws_sw_ws">
         <planpro:bezeichnung_ds>ws-sw-ws-sw-ws</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>ws-sw-ws-sw-ws</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ms_ws_2swP">
         <planpro:bezeichnung_dv>Sp</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ukr">
         <planpro:bezeichnung_ds>Ungültigkeitskreuz</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ungültigkeitskreuz</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hp_0">
         <planpro:bezeichnung_ds>Hp 0</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Hp 0</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hp_0_2Lp">
         <planpro:bezeichnung_ds>Hp 0</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Hp 0</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hp_1">
         <planpro:bezeichnung_ds>Hp 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Hp 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hp_2">
         <planpro:bezeichnung_ds>Hp 2</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Hp 2</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ms_ge_D">
         <planpro:bezeichnung_ds>V</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>V</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zl_o">
         <planpro:bezeichnung_ds>Zusatzlicht</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zusatzlicht</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zl_u">
         <planpro:bezeichnung_ds>Zusatzlicht</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zusatzlicht</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Kl">
         <planpro:bezeichnung_ds>Kennlicht</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Kennlicht</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ks_1">
         <planpro:bezeichnung_ds>Ks 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ks 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ks_2">
         <planpro:bezeichnung_ds>Ks 2</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ks 2</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_1">
         <planpro:bezeichnung_dv>Hl 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_2">
         <planpro:bezeichnung_dv>Hl 2</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_3a">
         <planpro:bezeichnung_dv>Hl 3a</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_3b">
         <planpro:bezeichnung_dv>Hl 3b</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_4">
         <planpro:bezeichnung_dv>Hl 4</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_5">
         <planpro:bezeichnung_dv>Hl 5</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_6a">
         <planpro:bezeichnung_dv>Hl 6a</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_6b">
         <planpro:bezeichnung_dv>Hl 6b</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_7">
         <planpro:bezeichnung_dv>Hl 7</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_8">
         <planpro:bezeichnung_dv>Hl 8</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_9a">
         <planpro:bezeichnung_dv>Hl 9a</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_9b">
         <planpro:bezeichnung_dv>Hl 9b</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_10">
         <planpro:bezeichnung_dv>Hl 10</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_11">
         <planpro:bezeichnung_dv>Hl 11</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_12a">
         <planpro:bezeichnung_dv>Hl 12a</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Hl_12b">
         <planpro:bezeichnung_dv>Hl 12b</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sv_0">
         <planpro:bezeichnung_ds>Sv 0</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sv_1">
         <planpro:bezeichnung_ds>Sv 1</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sv_2">
         <planpro:bezeichnung_ds>Sv 2</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sv_3">
         <planpro:bezeichnung_ds>Sv 3</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sv_4">
         <planpro:bezeichnung_ds>Sv 4</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sv_5">
         <planpro:bezeichnung_ds>Sv 5</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sv_6">
         <planpro:bezeichnung_ds>Sv 6</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sv_wPf">
         <planpro:bezeichnung_ds>Pfeil ws (Sv)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Pfeil ws (Sv)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ms_Vw">
         <planpro:bezeichnung_dv>Tafel VSigWdh</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Wvs">
         <planpro:bezeichnung_ds>Wärtervorsignal</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Wärtervorsignal</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Vr_0">
         <planpro:bezeichnung_ds>Vr 0</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Vr 0</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Vr_1">
         <planpro:bezeichnung_ds>Vr 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Vr 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Vr_2">
         <planpro:bezeichnung_ds>Vr 2</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Vr 2</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_1">
         <planpro:bezeichnung_ds>Zs 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zs 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_1_A">
         <planpro:bezeichnung_ds>Zs 1 (A)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zs 1 (A)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_2">
         <planpro:bezeichnung_ds>Zs 2</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zs 2</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_2v">
         <planpro:bezeichnung_ds>Zs 2v</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zs 2v</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_3">
         <planpro:bezeichnung_ds>Zs 3</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zs 3</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_3v">
         <planpro:bezeichnung_ds>Zs 3v</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zs 3v</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_6">
         <planpro:bezeichnung_ds>Zs 6</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zs 6</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_7">
         <planpro:bezeichnung_ds>Zs 7</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zs 7</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_8_A">
         <planpro:bezeichnung_ds>Zs 8 (A)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zs 8 (A)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_8">
         <planpro:bezeichnung_ds>Zs 8</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zs 8</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_9">
         <planpro:bezeichnung_dv>Zs 9 (Bahnübergangstafel)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_10">
         <planpro:bezeichnung_ds>Zs 10</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_12">
         <planpro:bezeichnung_ds>Zs 12</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zs 12</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_13">
         <planpro:bezeichnung_ds>Zs 13</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zs 13</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zs_103">
         <planpro:bezeichnung_dv>Zs 103 (Rautentafel)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ts_1">
         <planpro:bezeichnung_ds>Ts 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ts 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ts_2">
         <planpro:bezeichnung_ds>Ts 2</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ts 2</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ts_3">
         <planpro:bezeichnung_ds>Ts 3</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ts 3</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_1">
         <planpro:bezeichnung_ds>Lf 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Lf 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_1_2">
         <planpro:bezeichnung_dv>Lf 1/2</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_2">
         <planpro:bezeichnung_ds>Lf 2</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Lf 2</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_3">
         <planpro:bezeichnung_ds>Lf 3</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Lf 3</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_4_DS">
         <planpro:bezeichnung_ds>Lf 4</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_4_DV">
         <planpro:bezeichnung_dv>Lf 4</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_5_DS">
         <planpro:bezeichnung_ds>Lf 5</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_5_DV">
         <planpro:bezeichnung_dv>Lf 5</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_6">
         <planpro:bezeichnung_ds>Lf 6</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Lf 6</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_7">
         <planpro:bezeichnung_ds>Lf 7</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Lf 7</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sh_0">
         <planpro:bezeichnung_ds>Sh 0</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Sh 0</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sh_1">
         <planpro:bezeichnung_ds>Sh 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ra 12</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sh_2">
         <planpro:bezeichnung_ds>Sh 2</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Sh 2</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ra_10">
         <planpro:bezeichnung_ds>Ra 10</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ra 10</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ra_11">
         <planpro:bezeichnung_ds>Ra 11</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ra 11a</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ra_11b">
         <planpro:bezeichnung_dv>Ra 11b</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ra_12">
         <planpro:bezeichnung_ds>Ra 12</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>So 12</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ra_13">
         <planpro:bezeichnung_ds>Ra 13 (Isolierzeichen)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ra 13 (Isolierzeichen)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Wn_1">
         <planpro:bezeichnung_ds>Wn 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Wn 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Wn_2">
         <planpro:bezeichnung_ds>Wn 2</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Wn 2</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Wn_3">
         <planpro:bezeichnung_ds>Wn 3</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Wn 3</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Wn_4">
         <planpro:bezeichnung_ds>Wn 4</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Wn 4</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Wn_5">
         <planpro:bezeichnung_ds>Wn 5</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Wn 5</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Wn_6">
         <planpro:bezeichnung_ds>Wn 6</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Wn 6</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Wn_7">
         <planpro:bezeichnung_ds>Wn 7</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Wn 7</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zp_6">
         <planpro:bezeichnung_ds>Zp 6</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zp 6</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zp_7">
         <planpro:bezeichnung_ds>Zp 7</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zp 7</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zp_8">
         <planpro:bezeichnung_ds>Zp 8</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zp 8</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zp_9">
         <planpro:bezeichnung_ds>Zp 9</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zp 9</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zp_9_Ls">
         <planpro:bezeichnung_ds>Zp 9</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zp 9</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zp_10_Ls">
         <planpro:bezeichnung_ds>Zp 10</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zp 10</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zp_10">
         <planpro:bezeichnung_ds>Zp 10 (T)</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_1v">
         <planpro:bezeichnung_ds>El 1v</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>El 1v</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_1">
         <planpro:bezeichnung_ds>El 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>El 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_2">
         <planpro:bezeichnung_ds>El 2</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>El 2</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_T_DC">
         <planpro:bezeichnung_ds>Gleichstrom-Anfang</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Gleichstrom-Anfang</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_T_AC">
         <planpro:bezeichnung_ds>Wechselstrom-Anfang</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Wechselstrom-Anfang</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_3">
         <planpro:bezeichnung_ds>El 3</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>El 3</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_4">
         <planpro:bezeichnung_ds>El 4</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>El 4</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_5">
         <planpro:bezeichnung_ds>El 5</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>El 5</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_6">
         <planpro:bezeichnung_ds>El 6</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>El 6</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_Pf_o">
         <planpro:bezeichnung_ds>El-Pfeil oben</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>El-Pfeil oben</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_Pf_r">
         <planpro:bezeichnung_ds>El-Pfeil rechts</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>El-Pfeil rechts</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_Pf_l">
         <planpro:bezeichnung_ds>El-Pfeil links</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>El-Pfeil links</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="El_Pf_b">
         <planpro:bezeichnung_ds>El-Pfeil doppelt</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>El-Pfeil doppelt</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_1">
         <planpro:bezeichnung_ds>Ne 1 (Trapeztafel)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 1 (Trapeztafel)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_2">
         <planpro:bezeichnung_ds>Ne 2 (VSig-Tafel)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 2 (VSig-Tafel)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_2_vRVA">
         <planpro:bezeichnung_dv>VSig-Tafel verkürzt</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_3_1str">
         <planpro:bezeichnung_ds>Ne 3 (1-str)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 3 (1-str)</planpro:bezeichnung_dv>
<!--         <planpro:bezeichnung_ds>VSig-Bake 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>VSig-Bake 1</planpro:bezeichnung_dv>-->
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_3_2str">
         <planpro:bezeichnung_ds>Ne 3 (2-str)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 3 (2-str)</planpro:bezeichnung_dv>
         <!--         <planpro:bezeichnung_ds>VSig-Bake 2</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>VSig-Bake 2</planpro:bezeichnung_dv>-->
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_3_3str">
         <planpro:bezeichnung_ds>Ne 3 (3-str)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 3 (3-str)</planpro:bezeichnung_dv>
         <!--         <planpro:bezeichnung_ds>VSig-Bake 3</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>VSig-Bake 3</planpro:bezeichnung_dv>-->
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_3_4str">
         <planpro:bezeichnung_ds>Ne 3 (4-str)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 3 (4-str)</planpro:bezeichnung_dv>
         <!--         <planpro:bezeichnung_ds>VSig-Bake 4</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>VSig-Bake 4</planpro:bezeichnung_dv>-->
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_3_5str">
         <planpro:bezeichnung_ds>Ne 3 (5-str)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 3 (5-str)</planpro:bezeichnung_dv>
         <!--         <planpro:bezeichnung_ds>VSig-Bake 5</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>VSig-Bake 5</planpro:bezeichnung_dv>-->
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="BS_vRVA">
         <planpro:bezeichnung_ds>Dreieck verk RVA</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Dreieck verk RVA</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_4">
         <planpro:bezeichnung_ds>Ne 4 (Schachbretttafel)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 4 (Schachbretttafel)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_5">
         <planpro:bezeichnung_ds>Ne 5 (Haltetafel)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 5 (Haltetafel)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_6">
         <planpro:bezeichnung_ds>Ne 6 (Haltepunkttafel)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 6 (Haltepunkttafel)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_7a">
         <planpro:bezeichnung_ds>Ne 7 (Schneepflugtafel - Heben)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 7 (Schneepflugtafel - Heben)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_7b">
         <planpro:bezeichnung_ds>Ne 7 (Schneepflugtafel - Senken)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 7 (Schneepflugtafel - Senken)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="So_1">
         <planpro:bezeichnung_dv>So 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_12">
         <planpro:bezeichnung_ds>Ne 12</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 12</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_13a">
         <planpro:bezeichnung_ds>Ne 13a</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 13a</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_13b">
         <planpro:bezeichnung_ds>Ne 13b</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 13b</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="So_19_1P">
         <planpro:bezeichnung_dv>So 19 (HSig-Bake 1)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="So_19_2P">
         <planpro:bezeichnung_dv>So 19 (HSig-Bake 2)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="So_19_3P">
         <planpro:bezeichnung_dv>So 19 (HSig-Bake 3)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="So_106">
         <planpro:bezeichnung_dv>So 106 (Kreuztafel)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_Pf">
         <planpro:bezeichnung_ds>Richtungspfeil</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Richtungspfeil</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ms_UES_Wdh">
         <planpro:bezeichnung_ds>Mastschild ÜS-Wdh</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Mastschild ÜS-Wdh</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_0_1S">
         <planpro:bezeichnung_ds>Bü 0</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Bü 0</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_0_2S">
         <planpro:bezeichnung_ds>Bü 0</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Bü 0</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_0_2Lp">
         <planpro:bezeichnung_ds>Bü 0</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Bü 0</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_0_1Lp">
         <planpro:bezeichnung_ds>Bü 0</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_0_0Lp">
         <planpro:bezeichnung_ds>Bü 0</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_1_1S_bli">
         <planpro:bezeichnung_ds>Bü 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Bü 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_1_2S_st">
         <planpro:bezeichnung_ds>Bü 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Bü 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_1_2Lp_st">
         <planpro:bezeichnung_ds>Bü 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Bü 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_1_1Lp_bli">
         <planpro:bezeichnung_ds>Bü 1</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_1_0Lp_bli">
         <planpro:bezeichnung_ds>Bü 1</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_2">
         <planpro:bezeichnung_ds>Bü 2 (Rautentafel 4)</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_2_3R">
         <planpro:bezeichnung_ds>Bü 2 (Rautentafel 3)</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_2_2R">
         <planpro:bezeichnung_ds>Bü 2 (Rautentafel 2)</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_2_1R">
         <planpro:bezeichnung_ds>Bü 2 (Rautentafel 1)</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="So_15">
         <planpro:bezeichnung_dv>So 15</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_3">
         <planpro:bezeichnung_ds>Bü 3 (Merktafel)</planpro:bezeichnung_ds>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="So_14">
         <planpro:bezeichnung_dv>So 14 (Merkpfahl)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_AT">
         <planpro:bezeichnung_ds>Bü-Ankündetafel</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Bü-Ankündetafel</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_KT">
         <planpro:bezeichnung_ds>Bü-Kennzeichentafel</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Bü-Kennzeichentafel</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_4">
         <planpro:bezeichnung_ds>Bü 4 (Pfeiftafel)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Bü 4 (Pfeiftafel)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Pf_2">
         <planpro:bezeichnung_dv>Pf 2 (Pfeiftafel)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_5">
         <planpro:bezeichnung_ds>Bü 5 (Läutetafel)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Bü 5 (Läutetafel)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_Zf">
         <planpro:bezeichnung_ds>Zugfunktafel</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zugfunktafel</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_ICE">
         <planpro:bezeichnung_ds>ICE-Zeichen</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>ICE-Zeichen</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_Auto_HET">
         <planpro:bezeichnung_ds>Tafel Auto-HET</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Tafel Auto-HET</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_HET">
         <planpro:bezeichnung_ds>Tafel HET</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Tafel HET</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_Auto_ET">
         <planpro:bezeichnung_ds>Tafel Auto-ET</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Tafel Auto-ET</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_ET">
         <planpro:bezeichnung_ds>Tafel ET</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Tafel ET</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_Fa">
         <planpro:bezeichnung_ds>Fahrtanzeiger</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Fahrtanzeiger</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_LZB-Ber">
         <planpro:bezeichnung_ds>LZB-Bereichskennzeichen</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>LZB-Bereichskennzeichen</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_Bk">
         <planpro:bezeichnung_ds>Blockkennzeichen</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Blockkennzeichen</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_HM">
         <planpro:bezeichnung_ds>Signalhaltmelder</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Signalhaltmelder</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_14">
         <planpro:bezeichnung_ds>Ne 14</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Ne 14</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_OB_Grenze">
         <planpro:bezeichnung_ds>Tafel OB</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Tafel OB</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="BS_vA_UES">
         <planpro:bezeichnung_ds>Dreieck verk ÜS</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Dreieck verk ÜS</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="BS_Wdh">
         <planpro:bezeichnung_ds>Wiederholungszeichen</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Wiederholungszeichen</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="BS_Zusatz">
         <planpro:bezeichnung_ds>Zusatzschild</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zusatzschild</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_Pf_r">
         <planpro:bezeichnung_ds>Richtungspfeil nach rechts</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Richtungspfeil nach rechts</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_Pf_l">
         <planpro:bezeichnung_ds>Richtungspfeil nach links</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Richtungspfeil nach links</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lf_1_Wdh">
         <planpro:bezeichnung_ds>Lf 1 (Wiederholer)</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Lf 1 (Wiederholer)</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_PZB_BUE">
         <planpro:bezeichnung_ds>PZB BÜ</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>PZB BÜ</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_Fak">
         <planpro:bezeichnung_ds>Fahrtankünder</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Fahrtankünder</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_Zugl">
         <planpro:bezeichnung_ds>Zuglänge</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zuglänge</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Oz_GSM-R">
         <planpro:bezeichnung_ds>GSM-R-Funknetztafel</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>GSM-R-Funknetztafel</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ms_Sk_rt">
         <planpro:bezeichnung_ds>Mastschild rot</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Mastschild rot</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ms_Sk_ge">
         <planpro:bezeichnung_ds>Mastschild gelb</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Mastschild gelb</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sk_1">
         <planpro:bezeichnung_ds>Sk 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv/>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sk_2">
         <planpro:bezeichnung_ds>Sk 2</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv/>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bue_AT_Zusatz">
         <planpro:bezeichnung_ds>Zusatzschild "Bü/Bü"</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>Zusatzschild "Bü/Bü"</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="BS_ZBS-Ber">
         <planpro:bezeichnung_ds>ZBS-Bereichskennzeichen</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>ZBS-Bereichskennzeichen</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="signalrahmen-typ">
      <planpro:bezeichnung kurz="Bezeichnungsschild">Bezeichnungsschild</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Blechtafel">Blechtafel</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Keramikkoerper">Keramikkörper</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Schirm">Schirm</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zusatzanzeiger">Zusatzanzeiger</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">sonstige</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="ssp-typ">
      <planpro:bezeichnung kurz="aussen">Außen-Schlüsselsperre</planpro:bezeichnung>
      <planpro:bezeichnung kurz="aussen_Awanst">Awanst-Außen-Schlüsselsperre</planpro:bezeichnung>
      <planpro:bezeichnung kurz="innen">Innen-Schlüsselsperre</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="tb-typ">
      <!-- alte Bezeichnungen (vor 1.10.0.1) -->
      <planpro:bezeichnung kurz="Bruecke">Brücke</planpro:bezeichnung>      
      <planpro:bezeichnung kurz="Schutzwand">Schutzwand</planpro:bezeichnung>
      <!-- aktuelle Bezeichnungen (ab 1.10.0.1) -->
      <planpro:bezeichnung kurz="Bahnsteig_ungenutzt">Ungenutzter Bahnsteig</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Personenunterfuehrung">Personenunterführung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bahnsteigabsenkung">Bahnsteigabsenkung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Durchlass">Durchlass</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Eisenbahnkreuzungsbauwerk_oben">Eisenbahnkreuzungsbauwerk (oben)</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Eisenbahnkreuzungsbauwerk_unten">Eisenbahnkreuzungsbauwerk (unten)</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Eisenbahnueberfuehrung">Eisenbahnüberführung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Schutzwand_links">Schutzwand links</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Schutzwand_rechts">Schutzwand rechts</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstiger Technischer Bereich</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Tunnel">Tunnel</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ueberfuehrung_ueber_Eisenbahn">Überführung über die Eisenbahn</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="tp-typ">
      <planpro:bezeichnung kurz="Gebaeude">Gebäude</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Mast">Mast</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstiger Technischer Punkt</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bahnsteigmonitor">Bahnsteigmonitor</planpro:bezeichnung>
      <planpro:bezeichnung kurz="FBOA">Fernbeobachtungsanlage</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Bahnsteigspiegel">Bahnsteigspiegel</planpro:bezeichnung>
      <planpro:bezeichnung kurz="HOA">Heißläuferortungsanlage</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Zughaltesensor">Zughaltesensor</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="trasse-art">
      <planpro:bezeichnung kurz="Erdtrasse">Erdtrasse</planpro:bezeichnung>
      <planpro:bezeichnung kurz="frei">Freitrasse</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Kabelgestell_Tunnel">Kabelgestell im Tunnel</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Lufttrasse">Lufttrasse</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Rohrtrasse">Rohrtrasse</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Trogtrasse">Trogtrasse</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Trogtrasse_aufgestaendert">aufgeständerte Trogtrasse</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Trogtrasse_Behelf">Behelfs-Trogtrasse</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstige Trasse</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="ueberhoehungslinien-form">
      <planpro:bezeichnung kurz="gleichbleibend">gleichbleibende Rampe</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Rampe_Bloss">Bloss-Rampe</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Rampe_gerade">gerade Rampe</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Rampe_S">S-förmige Rampe</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Schere_Bloss">Bloss-Schere</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Schere_S">S-förmige Schere</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstige Überhöhungslinie</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="weichen-typ">
      <planpro:bezeichnung kurz="ABW">Außenbogenweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="EW">Einfache Weiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="DKW">Doppelte Kreuzungsweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="DW">Doppelweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="EKW">Einfache Kreuzungsweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="IBW">Innenbogenweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Kr">Kreuzung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Flachkreuzung">Flachkreuzung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Klothoidenweiche">Klothoidenweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstige Weiche/Kreuzung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Korbbogenweiche">Korbbogenweiche</planpro:bezeichnung>
      <!-- neue Bezeichnung (ab 1.10.0.3) -->
      <planpro:bezeichnung kurz="ABW/IBW">Außenbogen-/Innenbogenweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="BKr">Bogenkreuzung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="DBKW">Doppelte Bogenkreuzungsweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="EABKW">Einfache Außenbogenkreuzungsweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="EBKW">Einfache Bogenkreuzungsweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="EIBKW">Einfache Innenbogenkreuzungsweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Eins. DW">Einseitige Doppelweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="IBKr">Innenbogenkreuzung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="IBW/ABW">Innenbogen-/Außenbogenweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Sym. ABW">Symmetrische Außenbogenweiche</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ZHA">Zungen- und herzstücklose Abzweigung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ZHV ABW">Außenbogenweiche Zungen- und herzstücklose Abzweigung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="ZHV IBW">Innenbogenweiche Zungen- und herzstücklose Abzweigung</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="zugeinwirkung-typ">
      <planpro:bezeichnung kurz="Doppel_Schleife">Doppel-Schleife</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Doppel_Sensor">Doppel-Sensor</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Dreifach_Schleife">Dreifach-Schleife</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Einfach_Schleife">Einfach-Schleife</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Einfach_Sensor">Einfach-Sensor</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Isolierte_Schiene_alleinstehend">Isolierte Schiene</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Isolierte_Schiene_FMA_Anlage_mitbenutzt">Isolierte Schiene</planpro:bezeichnung>
      <planpro:bezeichnung kurz="sonstige">Sonstige Zugeinwirkung</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Einfach_Sensor_richtungsabhaengig">Einfach-Sensor richtungsabhängig</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Schienenkontakt">Schienenkontakt</planpro:bezeichnung>
   </xsl:variable>
   <xsl:variable name="signalbefestigung-art">
      <!-- Eine Regel prüft auf valide (eigentlich redundante) Angaben,
           dafür ist planpro:signal_befestigung/@art der Ausdruck in Signal_Befestigung/Signal_Befestigung_Allg/Befestigung_Art/Wert
           während planpro:signal_befestigung/text() dem Ausdruck in Signal/Signal_Real/Signal_Befestigungsart/Wert entspricht -->
      <planpro:signal_befestigung art="andere">andere</planpro:signal_befestigung>
      <planpro:signal_befestigung art="andere Sonderkonstruktion">andere</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Arbeitsbuehne">Signalausleger</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Arbeitsbuehne">Signalbruecke</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Bahnsteig">Sonderkonstruktion</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Dach_Decke">Sonderkonstruktion</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Fundament">Fundament</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Konstruktionsteil">Sonderkonstruktion</planpro:signal_befestigung>
      <planpro:signal_befestigung art="OL_Kettenwerk">andere</planpro:signal_befestigung>
      <planpro:signal_befestigung art="OL_Mast">andere</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Pfahl">andere</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Pfosten_hoch">Mast</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Pfosten_niedrig">Mast</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Prellbock">andere</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Rahmen">andere</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Regelanordnung_Mast_hoch">Mast</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Regelanordnung_Mast_niedrig">Mast</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Regelanordnung_Sonstige_hoch">Mast</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Regelanordnung_Sonstige_niedrig">Mast</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Schienenfuss">andere</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Signalausleger">Signalausleger</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Signalbruecke">Signalbruecke</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Sonderanordnung_Mast_hoch">Mast</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Sonderanordnung_Mast_niedrig">Mast</planpro:signal_befestigung>
      <planpro:signal_befestigung art="sonstige">andere</planpro:signal_befestigung>
      <planpro:signal_befestigung art="Wand">Sonderkonstruktion</planpro:signal_befestigung>
   </xsl:variable>
<!--Keys für ausgelagerte Kontextbegrenzung-->
   <xsl:key name="Identitaet" match="Container[parent::LST_Zustand_Ziel | parent::LST_Zustand]/*/Identitaet" use="Wert"/>
   
   <xsl:key name="Aussenelementansteuerung" match="Aussenelementansteuerung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Bahnsteig_Anlage" match="Bahnsteig_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Bahnsteig_Kante" match="Bahnsteig_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Balise" match="Balise[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Bearbeitungsvermerk" match="Bearbeitungsvermerk[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Bedien_Anzeige_Element" match="Bedien_Anzeige_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Bedien_Einrichtung_Oertlich" match="Bedien_Einrichtung_Oertlich[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Bedien_Standort" match="Bedien_Standort[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="BUE_Anlage" match="BUE_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="BUE_Gleisbezogener_Gefahrraum" match="BUE_Gleisbezogener_Gefahrraum[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Datenpunkt" match="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="ESTW_Zentraleinheit" match="ESTW_Zentraleinheit[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Fla_Schutz" match="Fla_Schutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="FMA_Anlage" match="FMA_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="FMA_Komponente" match="FMA_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Fstr_DWeg" match="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Fstr_Fahrweg" match="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Fstr_Zug_Rangier" match="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="GEO_Knoten" match="GEO_Knoten[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Gleis_Abschnitt" match="Gleis_Abschnitt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Gleis_Bezeichnung" match="Gleis_Bezeichnung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Hoehenpunkt" match="Hoehenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Kabel_Verteilpunkt" match="Kabel_Verteilpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="LEU_Anlage" match="LEU_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Markanter_Punkt" match="Markanter_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="NB" match="NB[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="NB_Zone" match="NB_Zone[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="NB_Zone_Grenze" match="NB_Zone_Grenze[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="PZB_Element_Zuordnung" match="PZB_Element_Zuordnung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Schlosskombination" match="Schlosskombination[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Schluesselsperre" match="Schluesselsperre[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Signal" match="Signal[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Signal_Befestigung" match="Signal_Befestigung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Signal_Rahmen" match="Signal_Rahmen[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Signal_Signalbegriff" match="Signal_Signalbegriff[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Stellelement" match="Stellelement[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Strecke" match="Strecke[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Technik_Standort" match="Technik_Standort[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="TOP_Kante" match="TOP_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="TOP_Knoten" match="TOP_Knoten[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Trasse_Knoten" match="Trasse_Knoten[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Ueberhoehung" match="Ueberhoehung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="W_Kr_Anlage" match="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="W_Kr_Gsp_Element" match="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="W_Kr_Gsp_Komponente" match="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Weichenlaufkette" match="Weichenlaufkette[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   <xsl:key name="Zugeinwirkung" match="Zugeinwirkung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Identitaet/Wert"/>
   
   <xsl:key name="Planungsbereich" match="ID_LST_Objekt_Planungsbereich" use="Wert"/>
   <xsl:key name="LST_Planung_Einzel-fuerAusgabe_Fachdaten" match="LST_Planung_Einzel" use="ID_Ausgabe_Fachdaten/Wert"/>
   <xsl:key name="Objekt-fuerUnterbringung" match="Container[parent::LST_Zustand_Ziel | parent::LST_Zustand]/*" use="ID_Unterbringung/Wert"/>
   
   <xsl:key name="Aussenelementansteuerung-fuerAussenelementansteuerung" match="Aussenelementansteuerung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Information_Primaer/Wert"/>
   <xsl:key name="Aussenelementansteuerung-fuerESTW_Zentraleinheit" match="Aussenelementansteuerung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Information_Primaer/Wert"/>
   <xsl:key name="Aussenelementansteuerung-fuerUnterbringung" match="Aussenelementansteuerung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Unterbringung/Wert"/>
   <xsl:key name="Balise_fuerDatenpunkt" match="Balise[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Datenpunkt/Wert"/>
   <xsl:key name="Bahnsteig_Zugang-fuerBahnsteig_Anlage" match="Bahnsteig_Zugang[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Bahnsteig_Anlage/Wert"/>
   <xsl:key name="Bahnsteig_Kante-fuerBahnsteig_Anlage" match="Bahnsteig_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Bahnsteig_Anlage/Wert"/>
   <xsl:key name="Bedien_Einrichtung_Oertlich-fuerUnterbringung" match="Bedien_Einrichtung_Oertlich[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Unterbringung/Wert"/>
   <xsl:key name="Bedien_Platz-fuerUnterbringung" match="Bedien_Platz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Unterbringung/Wert"/>
   <xsl:key name="BUE_Anlage-fuerBUE_Schnittstelle" match="BUE_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_BUE_Schnittstelle/Wert"/>
   <xsl:key name="BUE_Einschaltung_Zuordnung-fuerBUE_Einschaltung" match="BUE_Einschaltung_Zuordnung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_BUE_Einschaltung/Wert"/>
   <xsl:key name="Datenpunkt-fuerBezug_Funktional" match="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="DP_Bezug_Funktional/ID_DP_Bezug_Funktional/Wert"/>
   <xsl:key name="Datenpunkt-fuerGETCS_Bezug_Funktional" match="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="DP_Typ/DP_Typ_GETCS/ID_DP_Bezug_Funktional/Wert"/>
   <xsl:key name="Datenpunkt-fuerEinmesspunkt" match="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Datenpunkt_Einmesspunkt/ID_Einmesspunkt/Wert"/>
   <xsl:key name="Datenpunkt-fuerFachtelegramm" match="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="DP_Telegramm/ID_Fachtelegramm/Wert"/>
   <xsl:key name="ETCS_Signal-fuerETCS_Gefahrpunkt" match="ETCS_Signal[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="(ID_ETCS_Gefahrpunkt|ID_ETCS_Gefahrpunkt_2)/Wert"/>
   <xsl:key name="ETCS_W_Kr-fuerETCS_Gefahrpunkt_Nebengleis" match="ETCS_W_Kr[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_ETCS_Gefahrpunkt_Nebengleis/Wert"/>
   <xsl:key name="Fla_Schutz-fuerW_Kr_Gsp_Element" match="Fla_Schutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Fla_Schutz_W_Gsp/ID_Fla_W_Gsp_Element/Wert"/>
   <xsl:key name="Fla_Schutz-fuerAnforderer" match="Fla_Schutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Fla_Schutz_Anforderer/ID_Anforderer_Element/Wert"/>
   <xsl:key name="Fla_Zwieschutz-fuerW_Element" match="Fla_Zwieschutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_W_Element/Wert"/>
   <xsl:key name="FMA_Komponente-fuerAussenelementansteuerung" match="FMA_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]/FMA_Komponente_Achszaehlpunkt" use="ID_Information/Wert"/>
   <xsl:key name="FMA_Komponente-fuerFMA_Anlage" match="FMA_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_FMAgrenze/Wert"/>
   <xsl:key name="FMA_Komponente-fuerBezugspunkt" match="FMA_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Bezugspunkt/Wert"/>
   <xsl:key name="Fstr_Aneinander_Zuordnung-fuerFstr_Aneinander" match="Fstr_Aneinander_Zuordnung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Fstr_Aneinander/Wert"/>
   <xsl:key name="Fstr_DWeg-fuerPZB_Gefahrpunkt" match="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_PZB_Gefahrpunkt/Wert"/>
   <xsl:key name="Fstr_DWeg_W_Kr-fuerFstr_DWeg" match="Fstr_DWeg_W_Kr[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Fstr_DWeg/Wert"/>
   <xsl:key name="Fstr_Fahrweg-fuerStart" match="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Start/Wert"/>
   <xsl:key name="Fstr_Fahrweg-fuerZiel" match="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Ziel/Wert"/>
   <xsl:key name="Fstr_Signalisierung-fuerFstr_Zug_Rangier" match="Fstr_Signalisierung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Fstr_Zug_Rangier/Wert"/>
   <xsl:key name="Fstr_Umfahrpunkt-fuerFstr_Fahrweg" match="Fstr_Umfahrpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Fstr_Fahrweg/Wert"/>
   <xsl:key name="Fstr_Zug_Rangier-fuerFstr_Fahrweg" match="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Fstr_Fahrweg/Wert"/>
   <xsl:key name="Fstr_Zug_Rangier-fuerFstr_Zug_DWeg" match="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Fstr_Zug/Fstr_Zug_DWeg/ID_Fstr_DWeg/Wert"/>
   <xsl:key name="GEO_Punkt-fuerGEO_Knoten" match="GEO_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_GEO_Knoten/Wert"/>
   <xsl:key name="Gleis_Abschnitt_BOT-fuerTOP_Kante" match="Gleis_Abschnitt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]/Bereich_Objekt_Teilbereich" use="ID_TOP_Kante/Wert"/>
   <xsl:key name="Gleis_Bezeichnung_BOT-fuerTOP_Kante" match="Gleis_Bezeichnung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]/Bereich_Objekt_Teilbereich" use="ID_TOP_Kante/Wert"/>
   <xsl:key name="Gleis_Schaltgruppe-fuerTOP_Kante" match="Gleis_Schaltgruppe[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]/Bereich_Objekt_Teilbereich" use="ID_TOP_Kante/Wert"/>
   <xsl:key name="Luft_Telegramm-fuerFachtelegramm" match="Luft_Telegramm[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Fachtelegramm/Wert"/>
   <xsl:key name="Luft_Telegramm-fuerBinaerdaten" match="Luft_Telegramm[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="LT_Binaerdaten/ID_Binaerdaten/Wert"/>
   <xsl:key name="Markanter_Punkt-fuerMarkante_Stelle" match="Markanter_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Markante_Stelle/Wert"/>
   <xsl:key name="NB_Zone_Grenze-fuerMarkanter_Punkt" match="NB_Zone_Grenze[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Markanter_Punkt/Wert"/>
   <xsl:key name="PZB_Element-fuerPZB_Element_Zuordnung" match="PZB_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_PZB_Element_Zuordnung/Wert"/>
   <xsl:key name="PZB_Element-fuerUnterbringung" match="PZB_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Unterbringung/Wert"/>
   <xsl:key name="Schloss-fuerSchlosskombination" match="Schloss[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Schloss_Sk/ID_Schlosskombination/Wert"/>
   <xsl:key name="PZB_Element_Zuordnung-fuerINA_Gefahrstelle" match="PZB_Element_Zuordnung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="PZB_Element_Zuordnung_BP/INA_Gefahrstelle/ID_Markanter_Punkt/Wert"/>
   <xsl:key name="Schloss-fuerSchluessel" match="Schloss[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Schluessel/Wert"/>
   <xsl:key name="Schloss-fuerSchluesselsperre" match="Schloss[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Schloss_Ssp/ID_Schluesselsperre/Wert"/>
   <xsl:key name="Schlosskombination-fuerUnterbringung" match="Schlosskombination[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Unterbringung/Wert"/>
   <xsl:key name="Schluesselsperre-fuerUnterbringung" match="Schluesselsperre[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Unterbringung/Wert"/>
   <xsl:key name="Signal-fuerStellelement" match="Signal[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Signal_Real/Signal_Real_Aktiv/ID_Stellelement/Wert"/>
   <xsl:key name="Signal_Befestigung-fuerSignal_Befestigung" match="Signal_Befestigung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Signal_Befestigung/Wert"/>
   <xsl:key name="Signal_Rahmen-fuerSignal" match="Signal_Rahmen[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Signal/Wert"/>
   <xsl:key name="Signal_Rahmen-fuerSignal_Befestigung" match="Signal_Rahmen[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Signal_Befestigung/Wert"/>
   <xsl:key name="Signal_Signalbegriff-fuerSignal_Rahmen" match="Signal_Signalbegriff[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Signal_Rahmen/Wert"/>
   <xsl:key name="Stell_Bereich-fuerAussenelementansteuerung" match="Stell_Bereich[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Aussenelementansteuerung/Wert"/>
   <xsl:key name="Stellelement-fuerAussenelementansteuerung" match="Stellelement[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Information/Wert"/>
   <xsl:key name="TOP_Kante-fuerTOP_Knoten_A" match="TOP_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_TOP_Knoten_A/Wert"/>
   <xsl:key name="TOP_Kante-fuerTOP_Knoten_B" match="TOP_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_TOP_Knoten_B/Wert"/>
   <xsl:key name="W_Kr_Gsp_Element-fuerStellelement" match="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Stellelement/Wert"/>
   <xsl:key name="W_Kr_Gsp_Element-fuerW_Kr_Anlage" match="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_W_Kr_Anlage/Wert"/>
   <xsl:key name="W_Kr_Gsp_Element-fuerGrenzzeichen" match="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="Weiche_Element/ID_Grenzzeichen/Wert"/>
   <xsl:key name="W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element" match="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_W_Kr_Gsp_Element/Wert"/>
   <xsl:key name="W_Kr_Gsp_Komponente_POT-fuerTOP_Kante" match="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]/Punkt_Objekt_TOP_Kante" use="ID_TOP_Kante/Wert"/>
   <xsl:key name="ZN-fuerUnterbringung" match="ZN[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Unterbringung/Wert"/>
   <xsl:key name="Zugeinwirkung-fuerBezugspunkt" match="Zugeinwirkung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" use="ID_Bezugspunkt/Wert"/>
   
<!--Funktionen für gleichartige Bezeichnungen und ausgelagerte Kontextbegrenzung-->
   <xsl:decimal-format name="d" decimal-separator="," grouping-separator="."/>

   <xsl:function name="fx:number-or-zero" as="xs:decimal">
      <xsl:param name="wert" as="node()?"/>
      
      <xsl:sequence select="if (number($wert) = number($wert)) then xs:decimal($wert) else (0.0)"/>
   </xsl:function>
   
   <xsl:function name="fx:ignore-nil" as="xs:boolean">
      <xsl:param name="values" as="node()*"/>
      
      <xsl:sequence select="if ($values/Wert/@xsi:nil = 'true') then false() else true()"/>
   </xsl:function>

   <xsl:function name="fx:detect-nil" as="xs:boolean">
      <xsl:param name="values" as="node()*"/>
      
      <xsl:sequence select="not(fx:ignore-nil($values))"/>
   </xsl:function>

   <xsl:function name="fx:check-coverage" as="xs:boolean">
      <xsl:param name="start" as="xs:decimal"/>
      <xsl:param name="end" as="xs:decimal"/>
      <xsl:param name="sections" as="node()*"/>
      <xsl:param name="genauigkeit" as="xs:decimal"/>
      
      <xsl:variable name="find-start" select="$sections[fx:number-or-zero(Begrenzung_A/Wert) - $genauigkeit le $start][1]"/>
      <xsl:choose>
         <xsl:when test="not($find-start)">
            <xsl:sequence select="false()"/>
         </xsl:when>
         <xsl:when test="fx:number-or-zero($find-start/Begrenzung_B/Wert) + $genauigkeit ge $end">
            <xsl:sequence select="true()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="fx:check-coverage(fx:number-or-zero($find-start/Begrenzung_B/Wert), $end,                                                      $sections except $find-start, $genauigkeit)"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:choose_signalbegriff" as="xs:string">
      <xsl:param name="signalbegriff-bezeichnung" as="node()"/>
      
      <xsl:choose>
         <xsl:when test="not($signalbegriff-bezeichnung/planpro:bezeichnung_ds)">
            <xsl:sequence select="$signalbegriff-bezeichnung/planpro:bezeichnung_dv"/>
         </xsl:when>
         <xsl:when test="not($signalbegriff-bezeichnung/planpro:bezeichnung_dv)">
            <xsl:sequence select="$signalbegriff-bezeichnung/planpro:bezeichnung_ds"/>
         </xsl:when>
         <xsl:when test="$signalbegriff-bezeichnung/planpro:bezeichnung_ds = $signalbegriff-bezeichnung/planpro:bezeichnung_dv">
            <xsl:sequence select="$signalbegriff-bezeichnung/planpro:bezeichnung_ds"/>
         </xsl:when>
         <xsl:when test="not($signalbegriff-bezeichnung/planpro:bezeichnung_ds = $signalbegriff-bezeichnung/planpro:bezeichnung_dv)             and $signalbegriff-bezeichnung/planpro:bezeichnung_ds and $signalbegriff-bezeichnung/planpro:bezeichnung_dv">
            <xsl:sequence select="concat($signalbegriff-bezeichnung/planpro:bezeichnung_ds, '/', $signalbegriff-bezeichnung/planpro:bezeichnung_dv)"/>
         </xsl:when>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:signalbegriff-liste" as="xs:string?">
      <xsl:param name="current-signalbegriff" as="node()*"/>
      
      <xsl:variable name="signalbegriff-liste" as="xs:string*">
         <xsl:for-each select="$current-signalbegriff/Signalbegriff_ID/@xsi:type">
            <xsl:sort select="current()" order="ascending" data-type="text"/>
            <xsl:variable name="current-signalbegriff-bezeichnung" select="$signalbegriff-typ/planpro:bezeichnung[@kurz = substring-after(current(), ':')]"/>
            <xsl:choose>
               <xsl:when test="$current-signalbegriff-bezeichnung">
                  <xsl:sequence select="fx:choose_signalbegriff($current-signalbegriff-bezeichnung)"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:sequence select="substring-after(current(), ':')"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
      </xsl:variable>
      <xsl:sequence select="string-join($signalbegriff-liste, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Signalbegriff-fuerSignal" as="node()*">
      <!-- Suche Signalbegriffe für Signale über deren Signalrahmen -->
      <xsl:param name="current-signal" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="key('Signal_Signalbegriff-fuerSignal_Rahmen',                               key('Signal_Rahmen-fuerSignal', $current-signal/Identitaet/Wert, $context)                             /Identitaet/Wert, $context)"/>
   </xsl:function>
 
   <xsl:function name="fx:Signal-fuerSignalbegriff" as="node()*">
      <!-- Suche Signale für Signalbegriffe über deren Signalrahmen -->
      <xsl:param name="current-signalbegriff" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="key('Signal',                               key('Signal_Rahmen', $current-signalbegriff/ID_Signal_Rahmen/Wert, $context)                             /ID_Signal/Wert, $context)"/>
   </xsl:function>
   
   <xsl:function name="fx:SignalRahmen-fuerSignalBefestigung" as="node()*">
      <!-- Suche Signal_Rahmen für die aktuelle Signal_Befestigung unter Beachtung
         von "Fundament" bzw. "Signalausleger oder Signalbruecke" für fortgesetzte Suche -->
      <xsl:param name="current-signal-befestigung" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-signal-rahmen" select="key('Signal_Rahmen-fuerSignal_Befestigung', $current-signal-befestigung/Identitaet/Wert, $context)"/>
      <xsl:variable name="related-signal-befestigung" select="key('Signal_Befestigung-fuerSignal_Befestigung', $current-signal-befestigung/Identitaet/Wert, $context)"/>
      <xsl:variable name="related-signal-rahmen" select="key('Signal_Rahmen-fuerSignal_Befestigung', $related-signal-befestigung/Identitaet/Wert, $context)"/>
      <xsl:choose>
         <xsl:when test="$current-signal-befestigung/*/Befestigung_Art/Wert = 'Fundament'">
            <xsl:choose>
               <xsl:when test="$related-signal-befestigung/*/Befestigung_Art/Wert = ('Signalausleger', 'Signalbruecke')">
                  <xsl:variable name="next-signal-befestigung" select="key('Signal_Befestigung-fuerSignal_Befestigung', $related-signal-befestigung/Identitaet/Wert, $context)"/>
                  <xsl:sequence select="key('Signal_Rahmen-fuerSignal_Befestigung', $next-signal-befestigung/Identitaet/Wert, $context)"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:sequence select="$related-signal-rahmen"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$current-signal-befestigung/*/Befestigung_Art/Wert = ('Signalausleger', 'Signalbruecke')">
            <xsl:sequence select="$related-signal-rahmen"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="$current-signal-rahmen"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Gleise-fuerBUEGefahrraum" as="xs:string*">
      <xsl:param name="current-id" as="xs:string*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="concat('Gleis ', string-join(key('BUE_Gleisbezogener_Gefahrraum', $current-id, $context)/Gleis_Am_Bue/Wert, ', '))"/>
   </xsl:function>
   
   <xsl:function name="fx:W_Kr_Gsp_Komponente-for-TOP_Knoten" as="node()*">
      <xsl:param name="current-TOP-Knoten" as="xs:string"/>
      <xsl:param name="found-TOP-Kante" as="node()*"/>
      
      <xsl:for-each select="$found-TOP-Kante">
         <xsl:choose>
            <xsl:when test="current()/ID_TOP_Knoten_A/Wert = $current-TOP-Knoten">
               <xsl:sequence select="key('W_Kr_Gsp_Komponente_POT-fuerTOP_Kante', current()/Identitaet/Wert, /*)[fx:number-or-zero(Abstand/Wert) = 0.0]"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:variable name="TOP-Laenge_AnschlussB" select="fx:number-or-zero(current()/TOP_Kante_Allg/TOP_Laenge/Wert)"/>
               <xsl:sequence select="key('W_Kr_Gsp_Komponente_POT-fuerTOP_Kante', current()/Identitaet/Wert, /*)[fx:number-or-zero(Abstand/Wert) = $TOP-Laenge_AnschlussB]"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:function>
 
   <xsl:function name="fx:Aufbau-fuerFla" as="xs:string">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fla-schutz" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Fla_Schutz">
               <xsl:sequence select="key('Fla_Schutz', $current/ID_Fla_Schutz/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>         
      <xsl:choose>
         <xsl:when test="$current-fla-schutz/*/Fahrt_Ueber/Wert">
            <xsl:sequence select="'01'"/>
         </xsl:when>
         <xsl:when test="key('NB_Zone_Grenze', $current-fla-schutz/*/ID_Anforderer_Element/Wert, $context)">
            <xsl:sequence select="'30'"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="'00'"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Art-fuerAussenelementansteuerung" as="xs:string*">
      <xsl:param name="current-aussenelementansteuerung" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="string-join(for $i in $current-aussenelementansteuerung return fx:Bezeichnung-fuerSonstige($i/*/Aussenelementansteuerung_Art, $context, $aussenelement-typ, 'Sonstige Aussenelementansteuerung'), ', ')"/>
   </xsl:function>
 
   <xsl:function name="fx:Art-fuerBedienEinrichtung" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-bedien-einrichtung" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/(.|*)/ID_Bedien_Anzeige_Element">
               <xsl:sequence select="key('Bedien_Einrichtung_Oertlich',                   key('Bedien_Anzeige_Element', $current/(.|*)/ID_Bedien_Anzeige_Element/Wert, $context)                   /ID_Bedien_Einrichtung_Oertlich/Wert, $context)"/>
            </xsl:when>
            <xsl:when test="$current/ID_Bedien_Einrichtung_Oertlich">
               <xsl:sequence select="key('Bedien_Einrichtung_Oertlich', $current/ID_Bedien_Einrichtung_Oertlich/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>         
      <xsl:sequence select="string-join(for $i in $current-bedien-einrichtung return fx:Bezeichnung-fuerSonstige(($i/*/Bedien_Einricht_Bauart), $context, $bedien-einricht-typ, 'Sonstige Bedieneinrichtung'), ', ')"/>
   </xsl:function>
 
   <xsl:function name="fx:Typ-fuerDatenpunkt" as="xs:string*">
      <xsl:param name="current" as="node()*"/>      
      <xsl:param name="datenpunkt-id" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-datenpunkt" as="node()*">
         <xsl:choose>
            <xsl:when test="$datenpunkt-id">
               <xsl:sequence select="key('Datenpunkt', $datenpunkt-id/Wert, $context)"/>
            </xsl:when>
            <xsl:when test="$current/ID_Balise_Uebertragung">
               <xsl:sequence select="key('Datenpunkt',  key('Balise', $current/ID_Balise_Uebertragung/Wert, $context)/ID_Datenpunkt/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-datenpunkt/DP_Typ/*/           (DP_Typ_ETCS | DP_Typ_ESG | DP_Typ_GNT | DP_Typ_ZBS | DP_Typ_Trans | DP_Typ_Sonst)/Wert, ', ')"/>
   </xsl:function>
 
   <xsl:function name="fx:Art-fuerFMA_Komponente" as="xs:string">
      <!-- Erzeugt fachlich zusammengefasste Arten von Freimeldekomponenten -->
      <xsl:param name="current-fma-komponente" as="node()*"/>
      
      <xsl:choose>
         <xsl:when test="$current-fma-komponente/FMA_Komponente_Achszaehlpunkt">
            <xsl:sequence select="'Achszählpunkt'"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:variable name="current-fma-art" select="$current-fma-komponente/FMA_Komponente_Art/Wert"/>
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
   </xsl:function>
   
   <xsl:function name="fx:Art-fuerFstrZugRangier" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fstr-zug-rangier" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Fstr_Zug_Rangier">
               <xsl:sequence select="key('Fstr_Zug_Rangier', $current/ID_Fstr_Zug_Rangier/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join(for $i in $current-fstr-zug-rangier return $fstr-typ/planpro:bezeichnung[@kurz = $i/*/(Fstr_Rangier_Art|Fstr_Mittel_Art|Fstr_Zug_Art)/Wert], ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Art-fuerKabelVerteilpunkt" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="string-join(for $i in $current return fx:Bezeichnung-fuerSonstige($i/Kabel_Verteilpunkt_Art, $context, (), 'Sonstiger Kabelverteiler'), ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Art-fuerSchluesselsperre" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-schluesselsperre" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/*/ID_Schluesselsperre">
               <xsl:sequence select="key('Schluesselsperre', $current/*/ID_Schluesselsperre/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join(for $i in $current-schluesselsperre return fx:Bezeichnung-fuerSonstige($i/Bedienung_Art, $context, $ssp-typ, 'Sonstige Schluesselsperre'), ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Art-fuerSignalBefestigung" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="string-join(for $i in $current return fx:Bezeichnung-fuerSonstige($i/*/Befestigung_Art, $context, $signalbefestigung-typ, 'Sonstige Signalbefestigung'), ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Art-fuerSignalRahmen" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="string-join(for $i in $current return fx:Bezeichnung-fuerSonstige($i/Rahmen_Art, $context, $signalrahmen-typ, 'Sonstiger Signalrahmen'), ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Art-fuerTrasseKnoten" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-trasse-knoten" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/self::Trasse_Knoten">
               <xsl:sequence select="$current"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="key('Trasse_Knoten', $current/Wert, $context)"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="current-anschluss-element" select="$current-trasse-knoten/ID_Anschluss_Element/Wert"/>
      <xsl:variable name="aussenelementansteuerung" select="key('Aussenelementansteuerung', $current-anschluss-element, $context)[1]"/>
      <xsl:variable name="bedien-standort" select="key('Bedien_Standort', $current-anschluss-element, $context)"/>
      <xsl:variable name="datenpunkt" select="key('Datenpunkt', $current-anschluss-element, $context)"/>
      <xsl:variable name="estw-zentraleinheit" select="key('ESTW_Zentraleinheit', $current-anschluss-element, $context)"/>
      <xsl:variable name="fma-komponente" select="key('FMA_Komponente', $current-anschluss-element, $context)[1]"/>
      <xsl:variable name="kabel-verteilpunkt" select="key('Kabel_Verteilpunkt', $current-anschluss-element, $context)[1]"/>
      <xsl:variable name="leu-anlage" select="key('LEU_Anlage', $current-anschluss-element, $context)"/>
      <xsl:variable name="stellelement" select="key('Stellelement', $current-anschluss-element, $context)"/>
      <xsl:variable name="technik-standort" select="key('Technik_Standort', $current-anschluss-element, $context)"/>
      <xsl:variable name="current-geo-pad" select="key('GEO_Knoten', $current-trasse-knoten/ID_GEO_Knoten/Wert, $context)[1]/GEO_PAD"/>
      <xsl:choose>
         <xsl:when test="$aussenelementansteuerung">
            <xsl:sequence select="fx:Art-fuerAussenelementansteuerung($aussenelementansteuerung, $context)"/>
         </xsl:when>
         <xsl:when test="$bedien-standort">
            <xsl:sequence select="'DSZ/BSO'"/> <!-- Digitale Steuer-Zentrale / Bedien-Standort -->
         </xsl:when>
         <xsl:when test="$datenpunkt">
            <xsl:sequence select="'Datenpunkt'"/>
         </xsl:when>
         <xsl:when test="$estw-zentraleinheit">
            <xsl:sequence select="'ESTW-Zentraleinheit'"/>
         </xsl:when>            
         <xsl:when test="$fma-komponente">
            <xsl:sequence select="fx:Art-fuerFMA_Komponente($fma-komponente)"/>
         </xsl:when>
         <xsl:when test="$kabel-verteilpunkt">
            <xsl:sequence select="fx:Art-fuerKabelVerteilpunkt($kabel-verteilpunkt, $context)"/>            
         </xsl:when>
         <xsl:when test="$leu-anlage">
            <xsl:sequence select="'LEU-Anlage'"/>
         </xsl:when>
         <xsl:when test="$stellelement">
            <xsl:variable name="aussenelementansteuerung" select="key('Aussenelementansteuerung', $stellelement/ID_Information/Wert, $context)[1]"/>
            <xsl:sequence select="concat('Stellelement ', fx:Art-fuerAussenelementansteuerung($aussenelementansteuerung, $context))"/>
         </xsl:when>
         <xsl:when test="$technik-standort">
            <xsl:sequence select="'DTZ/TSO'"/> <!-- Digitale Technik-Zentrale / Technik-Standort -->
         </xsl:when>            
         <xsl:when test="$current-geo-pad">
            <xsl:sequence select="'GEO-Knoten'"/>
         </xsl:when>            
         <xsl:otherwise>
            <xsl:variable name="Search-Objekt" select="(key('Identitaet', $current-anschluss-element, $context)/..[Bezeichnung])[1]"/>
            <xsl:sequence select="$Search-Objekt/local-name()"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Art-fuerWKrAnlage" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-w-kr-anlage" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_W_Kr_Anlage">
               <xsl:sequence select="key('W_Kr_Anlage', $current/ID_W_Kr_Anlage/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join(for $i in $current-w-kr-anlage return fx:Bezeichnung-fuerSonstige($i/*/W_Kr_Art, $context, $weichen-typ, 'Sonstige Weiche/Kreuzung'), ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Art-fuerWKrGspKomponente" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      
      <xsl:if test="$current">
         <xsl:variable name="typ" as="xs:string">
            <xsl:choose>
               <xsl:when test="$current/Entgleisungsschuh">
                  <xsl:sequence select="'Entgleisungsschuh'"/>
               </xsl:when>
               <xsl:when test="$current/Kreuzung">
                  <xsl:sequence select="'Kr-Komponente'"/>
               </xsl:when>
               <xsl:when test="$current/Zungenpaar">
                  <xsl:sequence select="'Zungenpaar'"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:sequence select="'Sonstige Komponente'"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:sequence select="concat($typ, ' von')"/>
      </xsl:if>
   </xsl:function>
   
   <xsl:function name="fx:Art-fuerZugeinwirkung" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="string-join(for $i in $current return fx:Bezeichnung-fuerSonstige($i/*/Zugeinwirkung_Art, $context, $zugeinwirkung-typ, 'Sonstige Zugeinwirkung'), ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerAussenelementansteuerung" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-aussenelementansteuerung" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/self::Aussenelementansteuerung">
               <xsl:sequence select="$current"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="key('Aussenelementansteuerung', $current/ID_Information/Wert, $context)"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="current-aea-bezeichnung" select="$current-aussenelementansteuerung/*/Bezeichnung_AEA/Wert/text()"/>
      <xsl:choose>
         <xsl:when test="$current-aussenelementansteuerung/*/Aussenelementansteuerung_Art/Wert = 'FeAk' and not($current-aea-bezeichnung)">
            <xsl:variable name="current-stellelement" as="node()*">
               <xsl:choose>
                  <xsl:when test="$current/self::Stellelement">
                     <xsl:sequence select="$current"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:sequence select="key('Stellelement-fuerAussenelementansteuerung', $current-aussenelementansteuerung/Identitaet/Wert, $context)"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:variable name="current-signal" select="key('Signal-fuerStellelement', $current-stellelement/Identitaet/Wert, $context)"/>
            <xsl:variable name="current-w-kr-gsp-element" select="key('W_Kr_Gsp_Element-fuerStellelement', $current-stellelement/Identitaet/Wert, $context)"/>
            <xsl:sequence select="string-join(concat(fx:Bezeichnung-fuerSignal($current-signal, $context, false()),                fx:Bezeichnung-fuerWKrGspElement($current-w-kr-gsp-element, $context)), ', ')"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="string-join($current-aea-bezeichnung, ', ')"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerBahnsteigAnlage" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-bahnsteig-anlage" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Bahnsteig_Anlage">
               <xsl:sequence select="key('Bahnsteig_Anlage', $current/ID_Bahnsteig_Anlage/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="bezeichnung" select="$current-bahnsteig-anlage/*/Bezeichnung_Bahnsteig_Anlage"/>
      <xsl:choose>
         <xsl:when test="$bezeichnung">
            <xsl:sequence select="string-join($bezeichnung/Wert, ', ')"/>    
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="fx:Bezeichnung-fuerBahnsteigKante(key('Bahnsteig_Kante-fuerBahnsteig_Anlage', $current-bahnsteig-anlage/Identitaet/Wert, $context), $context)"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
 
   <xsl:function name="fx:Bezeichnung-fuerBahnsteigKante" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-bahnsteig-kante" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Bahnsteig_Kante">
               <xsl:sequence select="key('Bahnsteig_Kante', $current/ID_Bahnsteig_Kante/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-bahnsteig-kante/*/Bezeichnung_Bahnsteig_Kante/Wert, '/')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerBalise" as="xs:string?">
      <xsl:param name="current" as="node()*"/>      
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-balise" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Balise_Uebertragung">
               <xsl:sequence select="key('Balise', $current/ID_Balise_Uebertragung/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-balise/*/Anordnung_Im_DP/Wert, ', ')"/>
   </xsl:function>
 
   <xsl:function name="fx:Bezeichnung-fuerBedienEinrichtung" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-bedien-einrichtung-oertlich" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/(.|*)/ID_Bedien_Anzeige_Element">
               <xsl:sequence select="key('Bedien_Einrichtung_Oertlich',                   key('Bedien_Anzeige_Element', $current/(.|*)/ID_Bedien_Anzeige_Element/Wert, $context)                   /ID_Bedien_Einrichtung_Oertlich/Wert, $context)"/>
            </xsl:when>
            <xsl:when test="$current/ID_Bedien_Einrichtung_Oertlich">
               <xsl:sequence select="key('Bedien_Einrichtung_Oertlich', $current/ID_Bedien_Einrichtung_Oertlich/Wert, $context)"/>            
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-bedien-einrichtung-oertlich/*/Bedien_Einricht_Oertl_Bez/Wert, ', ')"/>            
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerBedienPlatz" as="xs:string?">
      <xsl:param name="current-bedien-platz" as="node()*"/>      
      
      <xsl:sequence select="string-join($current-bedien-platz/*/Bedienplatzbezeichnung/Wert, ', ')"/>
   </xsl:function>
 
   <xsl:function name="fx:Bezeichnung-fuerBedienStandort" as="xs:string?">
      <xsl:param name="current-bedien-standort" as="node()*"/>      
      
      <xsl:sequence select="string-join($current-bedien-standort/*/Bezeichnung_BSO/Wert, ', ')"/>
   </xsl:function>
   

   <xsl:function name="fx:Bezeichnung-fuerBUEAnlage" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-bue-anlage" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/(ID_BUE_Anlage | */ID_BUE_Anlage)">
               <xsl:sequence select="key('BUE_Anlage', $current/(ID_BUE_Anlage | */ID_BUE_Anlage)/Wert, $context)"/>
            </xsl:when>
            <xsl:when test="$current/(ID_BUE_Gleisbez_Gefahrraum | ID_Beginn_Bereich)">
               <xsl:sequence select="key('BUE_Anlage',                   key('BUE_Gleisbezogener_Gefahrraum', $current/(ID_BUE_Gleisbez_Gefahrraum | ID_Beginn_Bereich)/Wert, $context)                   /ID_BUE_Anlage/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-bue-anlage/*/Bezeichnung_Tabelle/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerDatenpunkt" as="xs:string?">
      <xsl:param name="current" as="node()*"/>      
      <xsl:param name="datenpunkt-id" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-datenpunkt" as="node()*">
         <xsl:choose>
            <xsl:when test="$datenpunkt-id">
               <xsl:sequence select="key('Datenpunkt', $datenpunkt-id/Wert, $context)"/>
            </xsl:when>
            <xsl:when test="$current/ID_Balise_Uebertragung">
               <xsl:sequence select="key('Datenpunkt',  key('Balise', $current/ID_Balise_Uebertragung/Wert, $context)/ID_Datenpunkt/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-datenpunkt/*/NID_BG/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerESTWZentraleinheit" as="xs:string?">
      <xsl:param name="current-estw-zentraleinheit" as="node()*"/>      
      
      <xsl:sequence select="string-join($current-estw-zentraleinheit/*/Bezeichnung_ESTW_ZE/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerFlaAnforderung" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fla-schutz" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Fla_Schutz">
               <xsl:sequence select="key('Fla_Schutz', $current/ID_Fla_Schutz/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>         
      <xsl:variable name="current-anforderung" select="$current-fla-schutz/*/ID_Anforderer_Element/Wert"/>
      <xsl:variable name="current-w-element" select="key('W_Kr_Gsp_Element', $current-anforderung, $context)"/>
      <xsl:choose>
         <xsl:when test="$current-w-element">
            <xsl:sequence select="fx:Bezeichnung-fuerWKrGspElement($current-w-element, $context)"/>
         </xsl:when>
         <xsl:when test="key('NB_Zone_Grenze', $current-anforderung, $context)">
            <xsl:sequence select="'NB-Zonengrenze'"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="string-join(key('Identitaet', $current-anforderung, $context)/../*/Bezeichnung_Tabelle/Wert, ', ')"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
 
   <xsl:function name="fx:Bezeichnung-fuerFlaAnforderungDetail" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fla-schutz" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Fla_Schutz">
               <xsl:sequence select="key('Fla_Schutz', $current/ID_Fla_Schutz/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>         
      <xsl:variable name="current-anforderung" select="$current-fla-schutz/*/ID_Anforderer_Element/Wert"/>
      <xsl:variable name="fahrt-ueber" select="$current-fla-schutz/*/Fahrt_Ueber/Wert"/>
      <xsl:variable name="current-w-element" select="key('W_Kr_Gsp_Element', $current-anforderung, $context)"/>
      <xsl:variable name="current-nb-zonengrenzen" select="key('NB_Zone_Grenze', $current-anforderung, $context)"/>
      <xsl:choose>
         <xsl:when test="$current-w-element and $fahrt-ueber">
            <xsl:sequence select="string-join($lage-typ/planpro:bezeichnung[@kurz = $fahrt-ueber], ', ')"/>
         </xsl:when>
         <xsl:when test="$current-nb-zonengrenzen">
            <xsl:sequence select="fx:Bezeichnung-fuerMarkanterPunkt($current-nb-zonengrenzen, $context)"/>
         </xsl:when>
      </xsl:choose>
   </xsl:function>
 
   <xsl:function name="fx:Bezeichnung-fuerFMAAnlage" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fma-anlage" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_FMA_Anlage">
               <xsl:sequence select="key('FMA_Anlage', $current/ID_FMA_Anlage/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="current-gleis-abschnitt" select="key('Gleis_Abschnitt', $current-fma-anlage/ID_Gleis_Abschnitt/Wert, $context)"/>
      <xsl:choose>
         <xsl:when test="fx:FMAAnlage-has-Kennbuchstabe($current-fma-anlage, $context)">
            <xsl:sequence select="($current-gleis-abschnitt/*/Kennzahl/Wert/text())[1]"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="fx:Bezeichnung-fuerGleisAbschnitt($current-gleis-abschnitt)"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>

   <xsl:function name="fx:Bezeichnung-fuerFMAAnlage-Kennbuchstabe" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fma-anlage" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_FMA_Anlage">
               <xsl:sequence select="key('FMA_Anlage', $current/ID_FMA_Anlage/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="fx:FMAAnlage-has-Kennbuchstabe($current-fma-anlage, $context)">
         <xsl:sequence select="($current-fma-anlage/*/Bezeichnung_Kennbuchstabe/Wert/text())[1]"/>    
      </xsl:if>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerFMAAnlage-OertlicherElementname" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fma-anlage" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_FMA_Anlage">
               <xsl:sequence select="key('FMA_Anlage', $current/ID_FMA_Anlage/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="current-gleis-abschnitt" select="key('Gleis_Abschnitt', $current-fma-anlage/ID_Gleis_Abschnitt/Wert, $context)"/>
      <xsl:if test="fx:FMAAnlage-has-Kennbuchstabe($current-fma-anlage, $context)">
         <xsl:sequence select="($current-gleis-abschnitt/*/Oertlicher_Elementname/Wert/text())[1]"/>    
      </xsl:if>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerFMAKomponente" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      
      <xsl:sequence select="string-join($current/*/Bezeichnung_Tabelle/Wert, ', ')"/>
   </xsl:function>

   <xsl:function name="fx:Bezeichnung-fuerFstrDWeg" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      
      <xsl:if test="$current/Fstr_DWeg_Spezifisch"> 
         <xsl:sequence select="string-join($current/*/Bezeichnung_Fstr_DWeg/Wert, ', ')"/>
      </xsl:if>
   </xsl:function>

   <xsl:function name="fx:Bezeichnung-fuerFstrStart" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fstr" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Fstr_Zug_Rangier">
               <xsl:sequence select="key('Fstr_Zug_Rangier', $current/ID_Fstr_Zug_Rangier/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="current-fstr-fahrweg" as="node()*">
         <xsl:choose>
            <xsl:when test="$current-fstr/ID_Fstr_Fahrweg">
               <xsl:sequence select="key('Fstr_Fahrweg', $current-fstr/ID_Fstr_Fahrweg/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join(fx:Bezeichnung-fuerSignal(key('Signal', $current-fstr-fahrweg/ID_Start/Wert, $context), $context, true()), ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerFstrZiel" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fstr" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Fstr_Zug_Rangier">
               <xsl:sequence select="key('Fstr_Zug_Rangier', $current/ID_Fstr_Zug_Rangier/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="current-fstr-fahrweg" as="node()*">
         <xsl:choose>
            <xsl:when test="$current-fstr/ID_Fstr_Fahrweg">
               <xsl:sequence select="key('Fstr_Fahrweg', $current-fstr/ID_Fstr_Fahrweg/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="current-ziel" select="$current-fstr-fahrweg/ID_Ziel/Wert"/>
      <xsl:variable name="current-signal" select="key('Signal', $current-ziel, $context)"/>
      <xsl:variable name="current-markanter-punkt" select="key('Markanter_Punkt', $current-ziel, $context)"/>
      <xsl:choose>
         <xsl:when test="$current-signal">
            <xsl:sequence select="fx:Bezeichnung-fuerSignal($current-signal, $context, true())"/>
         </xsl:when>
         <xsl:when test="$current-markanter-punkt">
            <xsl:sequence select="fx:Bezeichnung-fuerMarkanterPunkt($current-markanter-punkt, $context)"/>
         </xsl:when>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerFstrUmfahrpunkt" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="Search-umfahrpunkt" select="key('Identitaet', $current/ID_Umfahrpunkt/Wert, $context)[../Bezeichnung]"/>
      <xsl:sequence select="string-join($Search-umfahrpunkt/../*/Bezeichnung_Tabelle/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerFstrZwischenziel" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fstr" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Fstr_Zug_Rangier">
               <xsl:sequence select="key('Fstr_Zug_Rangier', $current/ID_Fstr_Zug_Rangier/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="current-fstr-fahrweg" select="key('Fstr_Fahrweg', $current-fstr/ID_Fstr_Fahrweg/Wert, $context)"/>
      <xsl:variable name="current-fstr-umfahrpunkt" select="key('Fstr_Umfahrpunkt-fuerFstr_Fahrweg', $current-fstr-fahrweg/Identitaet/Wert, $context)"/>
      <xsl:variable name="current-dweg" select="key('Fstr_DWeg', $current-fstr/*/*/ID_Fstr_DWeg/Wert, $context)"/>
      <xsl:choose>
         <xsl:when test="$current-fstr-umfahrpunkt">
            <xsl:sequence select="fx:Bezeichnung-fuerFstrUmfahrpunkt($current-fstr-umfahrpunkt, $context)"/>
         </xsl:when>
         <xsl:when test="$current-dweg">
            <xsl:sequence select="fx:Bezeichnung-fuerFstrDWeg($current-dweg)"/>
         </xsl:when>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerGEOKnoten" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-geo-knoten" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/self::GEO_Knoten">
               <xsl:sequence select="$current"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="key('GEO_Knoten', $current/Wert, $context)"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-geo-knoten/GEO_PAD/Wert, ', ')"/>    
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerGFRElement" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      
      <xsl:sequence select="string-join($current/*/Bezeichnung_GFR_Element/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerGleis" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      <xsl:param name="eine" as="xs:boolean"/>
      
      <xsl:variable name="potential" as="node()*" select="key('Gleis_Bezeichnung_BOT-fuerTOP_Kante', $current/Punkt_Objekt_TOP_Kante/ID_TOP_Kante/Wert, $context)"/>
      <xsl:variable name="relevant" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Gleis_Bezeichnung">
               <xsl:sequence select="key('Gleis_Bezeichnung', $current/ID_Gleis_Bezeichnung/Wert, $context)"/>
            </xsl:when>
            <xsl:when test="$current/self::Gleis_Bezeichnung">
               <xsl:sequence select="$current"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="for $pot in $current/Punkt_Objekt_TOP_Kante return                   $potential[ID_TOP_Kante/Wert = $pot/ID_TOP_Kante/Wert and                   fx:number-or-zero(Begrenzung_A/Wert) le fx:number-or-zero($pot/Abstand/Wert) and                   fx:number-or-zero(Begrenzung_B/Wert) ge fx:number-or-zero($pot/Abstand/Wert)]/.."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>         
      <xsl:choose>
         <xsl:when test="$relevant">
            <xsl:choose>
               <xsl:when test="$eine">
                  <xsl:sequence select="$relevant[1]/*/Bez_Gleis_Bezeichnung/Wert"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:sequence select="string-join($relevant/*/Bez_Gleis_Bezeichnung/Wert, ', ')"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="''"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerGleisAbschnitt" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      
      <xsl:sequence select="string-join($current/*/Bezeichnung_Tabelle/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerMarkanterPunkt" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-markanter-punkt" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Markanter_Punkt">
               <xsl:sequence select="key('Markanter_Punkt', $current/ID_Markanter_Punkt/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-markanter-punkt/*/Bezeichnung_Markanter_Punkt/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerHoehenpunkt" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-hoehenpunkt" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/self::Hoehenpunkt">
               <xsl:sequence select="$current"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="key('Hoehenpunkt', $current/Wert, $context)"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-hoehenpunkt/*/GEO_PAD/Wert, ', ')"/>    
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerKabelVerteilpunkt" as="xs:string?">
      <xsl:param name="current" as="node()*"/>      
      
      <xsl:sequence select="string-join($current/*/Bezeichnung_Kabel_Verteilpunkt/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerLEUAnlage" as="xs:string?">
      <xsl:param name="current" as="node()*"/>      
      
      <xsl:sequence select="string-join($current/*/Bezeichnung_LEU_Anlage/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerNB" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fla-schutz" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Fla_Schutz">
               <xsl:sequence select="key('Fla_Schutz', $current/ID_Fla_Schutz/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>         
      <xsl:variable name="current-nb" as="node()*">
         <xsl:choose>
            <xsl:when test="$current-fla-schutz/*/ID_Anforderer_Element">
               <xsl:sequence select="key('NB',                    key('NB_Zone',                      key('NB_Zone_Grenze', $current-fla-schutz/*/ID_Anforderer_Element/Wert, $context)                      /ID_NB_Zone/Wert, $context)                   /ID_NB/Wert, $context)"/>
            </xsl:when>
            <xsl:when test="$current/ID_NB_Zone and not($current/self::NB_Zone)">
               <xsl:sequence select="key('NB',                    key('NB_Zone', $current/ID_NB_Zone/Wert, $context)                   /ID_NB/Wert, $context)"/>
            </xsl:when>
            <xsl:when test="$current-fla-schutz/ID_NB">
               <xsl:sequence select="key('NB', $current/ID_NB/Wert, $context)"/>            
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-nb/*/Bezeichnung_NB/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerNBZone" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fla-schutz" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Fla_Schutz">
               <xsl:sequence select="key('Fla_Schutz', $current/ID_Fla_Schutz/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>         
      <xsl:variable name="current-nb-zone" as="node()*">
         <xsl:choose>
            <xsl:when test="$current-fla-schutz/*/ID_Anforderer_Element">
               <xsl:sequence select="key('NB_Zone',                   key('NB_Zone_Grenze', $current-fla-schutz/*/ID_Anforderer_Element/Wert, $context)                   /ID_NB_Zone/Wert, $context)"/>
            </xsl:when>
            <xsl:when test="$current/ID_NB_Zone and not($current/self::NB_Zone)">
               <xsl:sequence select="key('NB_Zone', $current/ID_NB_Zone/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-nb-zone/*/Bezeichnung_NB_Zone/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerGUE" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      
      <xsl:sequence select="concat('GÜ', string-join($current/*/Pruefgeschwindigkeit/Wert, ', GÜ'))"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerSchlosskombination" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-schlosskombination" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/*/ID_Schlosskombination">
               <xsl:sequence select="key('Schlosskombination', $current/*/ID_Schlosskombination/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-schlosskombination/*/Bezeichnung_Sk/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerSchluesselsperre" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-schluesselsperre" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/*/ID_Schluesselsperre">
               <xsl:sequence select="key('Schluesselsperre', $current/*/ID_Schluesselsperre/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-schluesselsperre/*/Bezeichnung_Tabelle/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerSignal" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      <xsl:param name="mit-Gz" as="xs:boolean"/>  <!-- true = mit 'Gz ' -->
      
      <xsl:variable name="current-signalbegriff" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/self::Signal">
               <xsl:sequence select="fx:Signalbegriff-fuerSignal($current, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="key('Signal_Signalbegriff-fuerSignal_Rahmen', $current/Identitaet/Wert, $context)"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="current-signal" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Signal">
               <xsl:sequence select="key('Signal', $current/ID_Signal/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="current-term" select="$current-signal/*/Bezeichnung_Tabelle"/>
      <xsl:choose>
         <xsl:when test="$current-signalbegriff/Signalbegriff_ID/substring-after(@xsi:type, ':') = 'Ra_12'">
            <xsl:variable name="gz-bezeichnung" as="xs:string?" select="string-join(key('W_Kr_Gsp_Element-fuerGrenzzeichen', $current-signal/Identitaet/Wert, $context)/*/Bezeichnung_Tabelle/Wert, ', ')"/>
            <xsl:choose>
               <xsl:when test="$mit-Gz">
                  <xsl:sequence select="concat('Gz ', $gz-bezeichnung)"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:sequence select="$gz-bezeichnung"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$current-term">
            <xsl:sequence select="string-join($current-term/Wert, ', ')"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="fx:signalbegriff-liste($current-signalbegriff)"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerStrecke" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-strecke" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/(.|*)/ID_Strecke">
               <xsl:sequence select="key('Strecke', ($current/(.|*)/ID_Strecke/Wert)[1], $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-strecke/*/Bezeichnung_Strecke/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerTechnikStandort" as="xs:string?">
      <xsl:param name="current" as="node()*"/>      
      
      <xsl:sequence select="string-join($current/*/Bezeichnung_TSO/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerTOPKnoten" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-top-knoten" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/self::TOP_Knoten">
               <xsl:sequence select="$current"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="key('TOP_Knoten', $current/Wert, $context)"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="$current-top-knoten/Knotenname">
            <xsl:sequence select="normalize-space(($current-top-knoten/Knotenname/Wert/text())[1])"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="fx:Bezeichnung-fuerGEOKnoten($current-top-knoten/ID_GEO_Knoten, $context)"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerTrasseKnoten" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>

      <xsl:variable name="current-trasse-knoten" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/self::Trasse_Knoten">
               <xsl:sequence select="$current"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="key('Trasse_Knoten', $current/Wert, $context)"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="current-anschluss-element" select="$current-trasse-knoten/ID_Anschluss_Element/Wert"/>
      <xsl:variable name="aussenelementansteuerung" select="key('Aussenelementansteuerung', $current-anschluss-element, $context)[1]"/>
      <xsl:variable name="bedien-standort" select="key('Bedien_Standort', $current-anschluss-element, $context)[1]"/>
      <xsl:variable name="datenpunkt" select="key('Datenpunkt', $current-anschluss-element, $context)[1]"/>
      <xsl:variable name="estw-zentraleinheit" select="key('ESTW_Zentraleinheit', $current-anschluss-element, $context)[1]"/>
      <xsl:variable name="fma-komponente" select="key('FMA_Komponente', $current-anschluss-element, $context)[1]"/>
      <xsl:variable name="kabel-verteilpunkt" select="key('Kabel_Verteilpunkt', $current-anschluss-element, $context)[1]"/>
      <xsl:variable name="leu-anlage" select="key('LEU_Anlage', $current-anschluss-element, $context)[1]"/>
      <xsl:variable name="stellelement" select="key('Stellelement', $current-anschluss-element, $context)[1]"/>
      <xsl:variable name="technik-standort" select="key('Technik_Standort', $current-anschluss-element, $context)[1]"/>
      <xsl:variable name="current-geo-knoten" select="key('GEO_Knoten', $current-trasse-knoten/ID_GEO_Knoten/Wert, $context)[1]"/>
      <xsl:choose>
         <xsl:when test="$aussenelementansteuerung">
            <xsl:sequence select="fx:Bezeichnung-fuerAussenelementansteuerung($aussenelementansteuerung, $context)"/>
         </xsl:when>
         <xsl:when test="$bedien-standort">
            <xsl:sequence select="fx:Bezeichnung-fuerBedienStandort($bedien-standort)"/>
         </xsl:when>
         <xsl:when test="$datenpunkt">
            <xsl:sequence select="fx:Bezeichnung-fuerDatenpunkt($datenpunkt, (), $context)"/>
         </xsl:when>
         <xsl:when test="$estw-zentraleinheit">
            <xsl:sequence select="fx:Bezeichnung-fuerESTWZentraleinheit($estw-zentraleinheit)"/>
         </xsl:when>            
         <xsl:when test="$fma-komponente">
            <xsl:choose>
               <xsl:when test="fx:showsStrecke-fuerFMA_Komponente($fma-komponente)">
                  <xsl:sequence select="concat('Strecke ', fx:Bezeichnung-fuerStrecke($fma-komponente, $context),                      ', Km ', fx:Km-fuerStrecke($fma-komponente),                      ', Gleis ', fx:Bezeichnung-fuerGleis($fma-komponente, $context, true()))"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:sequence select="fx:Bezeichnung-fuerFMAKomponente($fma-komponente)"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$kabel-verteilpunkt">
            <xsl:sequence select="fx:Bezeichnung-fuerKabelVerteilpunkt($kabel-verteilpunkt)"/>
         </xsl:when>
         <xsl:when test="$leu-anlage">
            <xsl:sequence select="fx:Bezeichnung-fuerLEUAnlage($leu-anlage)"/>
         </xsl:when>
         <xsl:when test="$stellelement">
            <xsl:sequence select="fx:Bezeichnung-fuerAussenelementansteuerung($stellelement, $context)"/>
         </xsl:when>
         <xsl:when test="$technik-standort">
            <xsl:sequence select="fx:Bezeichnung-fuerTechnikStandort($technik-standort)"/>
         </xsl:when>
         <xsl:when test="$current-geo-knoten">
            <xsl:sequence select="fx:Bezeichnung-fuerGEOKnoten($current-geo-knoten, $context)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="(key('Identitaet', $current-anschluss-element, $context)/../Bezeichnung/*)[1]/Wert/text()"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerUeberhoehung" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      <xsl:param name="mit-einheit" as="xs:boolean"/>  <!-- true = Höhe mit ' m' -->
      
      <xsl:variable name="current-ueberhoehung" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/self::Ueberhoehung">
               <xsl:sequence select="$current"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="key('Ueberhoehung', $current/Wert, $context)"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="current-geo-pad" as="node()*" select="$current-ueberhoehung/*/GEO_PAD"/>
      <xsl:choose>
         <xsl:when test="$current-geo-pad">
            <xsl:sequence select="string-join($current-geo-pad/Wert, ', ')"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:variable name="current-hoehe" as="xs:string*" select="$current-ueberhoehung/*/Ueberhoehung_Hoehe/Wert"/>
            <xsl:choose>
               <xsl:when test="$mit-einheit">
                  <xsl:sequence select="string-join(concat($current-hoehe, ' m'), ', ')"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:sequence select="string-join($current-hoehe, ', ')"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerWKrGspElement" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-w-kr-gsp-element" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/self::W_Kr_Gsp_Element">
               <xsl:sequence select="$current"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="key('W_Kr_Gsp_Element', $current/Wert, $context)"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-w-kr-gsp-element/*/Bezeichnung_Tabelle/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerWeichenlaufkette" as="xs:string?">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-weichenlaufkette" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Weichenlaufkette">
               <xsl:sequence select="key('Weichenlaufkette', $current/ID_Weichenlaufkette/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="string-join($current-weichenlaufkette/*/Bezeichnung_Tabelle/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerZN" as="xs:string?">
      <xsl:param name="current-zn" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="id-stellwerk" select="$current-zn/ID_Stellwerk/Wert"/>
      <xsl:variable name="current-estw-zentraleinheit" select="key('ESTW_Zentraleinheit', $id-stellwerk, $context)"/>
      <xsl:variable name="current-aussenelementansteuerung" select="key('Aussenelementansteuerung', $id-stellwerk, $context)"/>
      <xsl:choose>
         <xsl:when test="$current-estw-zentraleinheit">
            <xsl:sequence select="fx:Bezeichnung-fuerESTWZentraleinheit($current-estw-zentraleinheit)"/>
         </xsl:when>
         <xsl:when test="$current-aussenelementansteuerung">
            <xsl:sequence select="string-join($current-aussenelementansteuerung/*/Bezeichnung_AEA/Wert, ', ')"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="$current-zn/Bezeichnung_Stellwerk/Wert/text()"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerZugeinwirkung" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      
      <xsl:sequence select="string-join($current/*/Bezeichnung_Tabelle/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerVerkehrszeichen" as="xs:string*">
      <xsl:param name="current" as="node()*"/>
      
      <xsl:sequence select="string-join($current/*/Bezeichnung_Verkehrszeichen/Wert, ', ')"/>
   </xsl:function>
   
   <xsl:function name="fx:Bezeichnung-fuerSonstige" as="xs:string*">
      <xsl:param name="current" as="node()?"/>
      <xsl:param name="context" as="node()"/>
      <xsl:param name="typ-tabelle" as="node()*"/>
      <xsl:param name="fallback" as="xs:string"/>
      
      <xsl:choose>
         <xsl:when test="$current/Wert = 'sonstige'">
            <xsl:variable name="current-kurztext" select="key('Bearbeitungsvermerk', $current/ID_Bearbeitungsvermerk/Wert, $context)/*/Kurztext/Wert"/>
            <xsl:choose>
               <xsl:when test="$current-kurztext">
                  <xsl:sequence select="($current-kurztext)[1]/text()"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:sequence select="$fallback"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <xsl:variable name="normal" as="xs:string*">
               <xsl:choose>
                  <xsl:when test="$typ-tabelle">
                     <xsl:sequence select="$typ-tabelle/planpro:bezeichnung[@kurz = $current/Wert]/text()"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:sequence select="$current/Wert/text()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test="$normal">
                  <xsl:sequence select="$normal"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:sequence select="$fallback"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Km-fuerStrecke" as="xs:string?">
      <!-- Kilometer-Wert zur Strecke im ersten Punkt_Objekt_Strecke des Objekts -->
      <xsl:param name="current" as="node()*"/>
      
      <xsl:sequence select="($current/*/Strecke_Km/Wert)[1]/text()"/>
   </xsl:function>
   
   <xsl:function name="fx:showsStrecke-fuerSignal" as="xs:boolean">
      <!-- Rückgabe "false", wenn das Signal / die Signale mindestens ein Bezeichnung_Tabelle besitzen oder
           mindestens einer ihrer Signalbegriffe Ra_12 ist 
           in diesen Fällen wird keine Streckeninformation ausgegeben, deshalb hier "false" -->
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-signal" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_Signal">
               <xsl:sequence select="key('Signal', $current/ID_Signal/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>      
      <xsl:sequence select="not($current-signal/*/Bezeichnung_Tabelle/Wert/text() or          fx:Signalbegriff-fuerSignal($current-signal, $context)/Signalbegriff_ID/substring-after(@xsi:type,':') = 'Ra_12')"/>
   </xsl:function>
   
   <xsl:function name="fx:showsStrecke-fuerFMA_Komponente" as="xs:boolean">
      <!-- Rückgabe "false", wenn mindestens eine FMA-Kompontente mindestens ein Bezeichnung_Tabelle und
           mindestens ein FMA_Komponente_Achszaehlpunkt besitzt
           in diesen Fällen wird keine Streckeninformation ausgegeben, deshalb hier "false" -->
      <xsl:param name="current-fma-komponente" as="node()*"/>
      
      <xsl:sequence select="not($current-fma-komponente/FMA_Komponente_Achszaehlpunkt and $current-fma-komponente/*/Bezeichnung_Tabelle)"/>
   </xsl:function>
   
   <xsl:function name="fx:Datenpunkt-hasDPTyp" as="xs:boolean">
      <xsl:param name="current" as="node()"/>
      <xsl:param name="dp-typ" as="xs:string*"/>
      
      <xsl:sequence select="$current/DP_Typ/DP_Typ_GETCS/DP_Typ_ETCS/Wert = $dp-typ"/>
   </xsl:function>
   
   <xsl:function name="fx:Datenpunkt-hasAnwendungssystem" as="xs:boolean">
      <xsl:param name="current" as="node()"/>
      <xsl:param name="anwendungssystem" as="xs:string*"/>
      
      <xsl:sequence select="$current/Datenpunkt_Allg/Anwendungssystem/Wert = $anwendungssystem"/>
   </xsl:function>
   
   <xsl:function name="fx:FMAAnlage-has-Kennbuchstabe" as="xs:boolean">
      <xsl:param name="current" as="node()*"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="current-fma-anlage" as="node()*">
         <xsl:choose>
            <xsl:when test="$current/ID_FMA_Anlage">
               <xsl:sequence select="key('FMA_Anlage', $current/ID_FMA_Anlage/Wert, $context)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$current"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="exists($current-fma-anlage/*/Bezeichnung_Kennbuchstabe)"/>
   </xsl:function>
   
   <xsl:function name="fx:GEOPunkt-has-KnotenPAD" as="xs:boolean">
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="geo-knoten-id" select="$current/ID_GEO_Knoten/Wert"/>
      <xsl:variable name="current-geo-knoten" select="key('GEO_Knoten', $geo-knoten-id, $context)"/>
      <xsl:sequence select="exists($geo-knoten-id) and exists($current-geo-knoten/GEO_PAD/Wert)"/>
   </xsl:function>
   
   <xsl:function name="fx:PZB-has-GM" as="xs:boolean">
      <!-- Rückgabe "true", wenn mindestens ein PZB-Element PZB_Element_GM besitzt  -->
      <xsl:param name="current-pzb-element" as="node()*"/>
      
      <xsl:sequence select="exists($current-pzb-element/PZB_Element_GM)"/>
   </xsl:function>
 
   <xsl:function name="fx:PZB-has-GUE" as="xs:boolean">
      <!-- Rückgabe "true", wenn mindestens ein PZB-Element PZB_Element_GUE besitzt  -->
      <xsl:param name="current" as="node()*"/>
      
      <xsl:sequence select="exists($current/PZB_Element_GUE)"/>
   </xsl:function>
   
   <xsl:function name="fx:Laenge_zwischen_Punktobjekten" as="xs:decimal">
      <xsl:param name="start-punkt-objekt" as="node()?"/> <!-- es wird ein Punkt_Objekt mit Wirkrichtung erwartet -->
      <xsl:param name="ziel-punkt-objekt" as="node()?"/> <!-- hier wird keine Wirkrichtung erwartet -->
      <xsl:param name="context" as="node()*"/>
      
      <xsl:variable name="start-TOP" as="xs:string" select="$start-punkt-objekt/ID_TOP_Kante/Wert"/>
      <xsl:variable name="ziel-TOP" as="xs:string" select="$ziel-punkt-objekt/ID_TOP_Kante/Wert"/>
      
      <xsl:variable name="TOP-start" as="node()?" select="for $x in $context return key('TOP_Kante', $start-TOP, $x)"/>
      <xsl:variable name="TOP-ziel" as="node()?" select="for $x in $context return key('TOP_Kante', $ziel-TOP, $x)"/>
      
      <xsl:variable name="start-Abstand" as="xs:decimal" select="fx:number-or-zero($start-punkt-objekt/Abstand/Wert)"/>
      <xsl:variable name="ziel-Abstand" as="xs:decimal" select="fx:number-or-zero($ziel-punkt-objekt/Abstand/Wert)"/>
      
      <xsl:choose>
         <xsl:when test="empty($start-punkt-objekt) or empty($ziel-punkt-objekt)">
            <xsl:value-of select="(0.0)"/>
         </xsl:when>
         <xsl:when test="empty($start-TOP) or empty($ziel-TOP)">
            <xsl:value-of select="(0.0)"/>
         </xsl:when>
         <xsl:when test="$start-TOP eq $ziel-TOP">
            <xsl:value-of select="abs($start-Abstand - $ziel-Abstand)"/>
         </xsl:when>
         <xsl:when test="empty($TOP-start) or empty($TOP-ziel)">
            <xsl:value-of select="(0.0)"/>
         </xsl:when>
         <xsl:when test="$TOP-start/(ID_TOP_Knoten_A|ID_TOP_Knoten_B)/Wert = $TOP-ziel/(ID_TOP_Knoten_A|ID_TOP_Knoten_B)/Wert">
            <xsl:variable name="Abstand-start" as="xs:decimal" select="if ($start-punkt-objekt/Wirkrichtung/Wert = 'gegen')                        then $start-Abstand                        else abs(fx:number-or-zero($TOP-start/TOP_Kante_Allg/TOP_Laenge/Wert) - $start-Abstand)"/>
            <xsl:variable name="gemeinsamer_TOP_Knoten" as="node()" select="$TOP-ziel/(ID_TOP_Knoten_A|ID_TOP_Knoten_B)[Wert = $TOP-start/(ID_TOP_Knoten_A|ID_TOP_Knoten_B)/Wert]"/>
            <xsl:variable name="Abstand-ziel" as="xs:decimal" select="if ($gemeinsamer_TOP_Knoten/self::ID_TOP_Knoten_A)                        then $ziel-Abstand                        else abs(fx:number-or-zero($TOP-ziel/TOP_Kante_Allg/TOP_Laenge/Wert) - $ziel-Abstand)"/>
            <xsl:value-of select="$Abstand-start + $Abstand-ziel"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="(0.0)"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:Aea-632" as="xs:boolean">
      <!-- Suche nach einem primärer Referenz zu ESTW-Zentraleinheit -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="exists(key('ESTW_Zentraleinheit', $current/ID_Information_Primaer/Wert, $context))"/>
   </xsl:function>
 
   <xsl:function name="fx:Fla-141" as="xs:boolean">
      <!-- Suche nach einem W_Kr_Gsp_Element welches der ID_Fla_W_Gsp_Element eines Fla_Schutz_W_Gsp entspricht -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="exists(key('W_Kr_Gsp_Element', $current/Fla_Schutz_W_Gsp/ID_Fla_W_Gsp_Element/Wert, $context)          [Weiche_Element])"/>
   </xsl:function>
   
   <xsl:function name="fx:Fla-354" as="xs:boolean">
      <!-- Suche nach einem W_Kr_Gsp_Element mit der "ID_W_Element" eines Fla_Zwieschutz -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>

      <xsl:sequence select="exists(key('W_Kr_Gsp_Element', $current/ID_W_Element/Wert, $context))"/>
   </xsl:function>

   <xsl:function name="fx:Fstr-11" as="xs:boolean">
      <!-- Suche nach einem Fstr_Fahrweg auf welchen von Fstr_Zug_Rangier verwiesen wird, die Fstr_Zug enthält:
            fachlicher Klartext: Fahrweg der von einer Zugstrasse verwendet wird -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="exists(key('Fstr_Zug_Rangier-fuerFstr_Fahrweg', $current/Identitaet/Wert, $context)          [Fstr_Zug])"/>
   </xsl:function>
   
   <xsl:function name="fx:Fstr-59" as="xs:boolean">
      <!-- Suche nach einem Fstr_Fahrweg, dessen TOP_Kanten in Bereich_Objekt_Teilbereich
            die gleichen ID_TOP_Knoten_A oder ID_TOP_Knoten_B beinhalten
            fachlicher Klartext: verknüpfte TOP_Kanten für gleichen Fahrweg -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="enthaltene_TOP_Kanten" as="node()*" select="key('TOP_Kante', $current/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert, $context)/(ID_TOP_Knoten_A|ID_TOP_Knoten_B)/Wert"/>	
     
      <xsl:sequence select="exists($enthaltene_TOP_Kanten[index-of($enthaltene_TOP_Kanten, .)[2]])"/>
   </xsl:function>

	<xsl:function name="fx:Fstr-76" as="xs:boolean">
      <!-- Suche nach allen Fstr_Aneinander_Zuordnung, die auf die Fstr_Aneinander verweist und suche nach allen Fstr_Zug_Rangier 
			auf die von der Fstr_Aneinander_Zuordnung verweisen wird.
            fachlicher Klartext: aneinandergereihte Fahrstraßen werden auf Fahr- und Zugstrassen geprüft-->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
	   <xsl:sequence select="exists(key('Fstr_Zug_Rangier',                                      key('Fstr_Aneinander_Zuordnung-fuerFstr_Aneinander', $current/Identitaet/Wert, $context)                                     /ID_Fstr_Zug_Rangier/Wert, $context))"/>
   </xsl:function>

   <xsl:function name="fx:Fstr-88" as="xs:boolean">
      <!-- Suche nach einem Fstr_DWeg/ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Markanter_Punkt entspricht:
            fachlicher Klartext: Ein D-Weg/Gefahrpunktabstand, der an einem markanten Punkt endet -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="exists(key('Markanter_Punkt',                                     key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)                                     /ID_Ziel/Wert, $context))"/>
   </xsl:function>
   
   <xsl:function name="fx:Fstr-144" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Fahrweg vorhanden und Fahrweg mind. 30m lang -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="exists(key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)          [sum(Bereich_Objekt_Teilbereich/abs(fx:number-or-zero(Begrenzung_B/Wert) - fx:number-or-zero(Begrenzung_A/Wert))) ge 30.0])"/>
   </xsl:function>
   
   <xsl:function name="fx:Fstr-255" as="xs:boolean">
      <!-- Prüfung, ob (Fstr_Fahrweg) als ID_Start/ID_Ziel auf ein Signal verweist, welches Punkt_Objekt_TOP_Kante mit 
            der gleichen TOP_Kante wie Fstr_Fahrweg besitzt und dazu die relevante Wirkrichtung definiert ist
            fachlicher Klartext: Fahrweg bei Wirkrichtung des Start-/Zielsignals in/gegen Topologierichtung -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:param name="signal" as="node()"/>
      <xsl:param name="wirkrichtung" as="xs:string*"/>
      
      <xsl:sequence select="exists(key('Signal', $signal/Wert, $context)          [Punkt_Objekt_TOP_Kante          [ID_TOP_Kante/Wert = $current/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert]          [Wirkrichtung/Wert = $wirkrichtung]])"/>
   </xsl:function>

   <xsl:function name="fx:Fstr-259" as="xs:boolean">
      <!-- Suche nach einem Fstr_DWeg/ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Markanter_Punkt entspricht, worin eine ID_Markante_Stelle einer W_Kr_Gsp_Komponente entspricht,
            die ein Weiche_Element enthält:
            fachlicher Klartext: Ein D-Weg, der bis zu einem Weichenanfang definiert ist -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="exists(key('W_Kr_Gsp_Element',          key('W_Kr_Gsp_Komponente',             key('Markanter_Punkt',                key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)                /ID_Ziel/Wert, $context)             /ID_Markante_Stelle/Wert, $context)          /ID_W_Kr_Gsp_Element/Wert, $context)[Weiche_Element])"/>
   </xsl:function>

   <xsl:function name="fx:Fstr-278" as="xs:boolean">
      <!-- Prüfung, ob es eine Fstr_Zug_Rangier mit dem aktuellen Fstr_Fahrweg gibt,
         die zudem eine Fstr_Zug ist
         und einen Fstr_Zug_DWeg hat,
         der wiederum ein Fstr_DWeg_Spezifisch besitzt
         fachlicher Klartext: Fahrweg als befahrenener Teil von Zugstraßen mit DWeg genutzt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="exists(key('Fstr_DWeg',                                  key('Fstr_Zug_Rangier-fuerFstr_Fahrweg', $current/Identitaet/Wert , $context)                               /Fstr_Zug/Fstr_Zug_DWeg/ID_Fstr_DWeg/Wert, $context)                               [Fstr_DWeg_Spezifisch])"/> 
   </xsl:function>
   
   <xsl:function name="fx:Fstr-371" as="xs:boolean">
      <!-- Prüfung, ob ein Fstr_Dweg_W_Kr für aktuellen Fstr_DWeg vorhanden ist
           -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
       <xsl:sequence select="exists(key('Fstr_DWeg_W_Kr-fuerFstr_DWeg', $current/Identitaet/Wert, $context))"/>
   </xsl:function>
   
   <xsl:function name="fx:Fstr-374" as="xs:boolean">
      <!-- Prüfung, ob aktuelle Zugfahrstraße vom Typ "ZT" oder "ZTU" als Teilzugfahrstraße
            und ob dazu ein Fstr_Fahrweg mittels ID_Fstr_Fahrweg existiert, dessen ID_Start
            gleich dem ID_Ziel eines anderen Fstr_Fahrweg entspricht,
            der widerum in einer Fstr_Zug_Rangier eingebunden ist, die als "ZT" oder "ZTU" kategorisiert ist,
            und das ID_Ziel keine der fiktiven Signalfunktionen "Zug_Ziel_Awanst" oder "Zug_Ziel_Strecke" umsetzt,
            fachlicher Klartext: zweite Teil-Zugstraße von zwei folgeabhängigen Teil-Zugstraßen,
            die weder auf eine Strecke noch auf eine Awanst führt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="exists($current[Fstr_Zug/Fstr_Zug_Art/Wert = ('ZT', 'ZTU')]                            [key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)                            [key('Signal', ID_Ziel/Wert, $context)[not(Signal_Fiktiv/Fiktives_Signal_Funktion/Wert                            = ('Zug_Ziel_Awanst', 'Zug_Ziel_Strecke'))]]                            /ID_Start = key('Fstr_Fahrweg', $current/../Fstr_Zug_Rangier                                  [Fstr_Zug/Fstr_Zug_Art/Wert = ('ZT', 'ZTU')]                                                         /ID_Fstr_Fahrweg/Wert, $context)/ID_Ziel])"/>            
   </xsl:function>
   
   <xsl:function name="fx:Fstr-377" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Signalisierung Signal_Signalbegriff ein Zs_3 besitzt,
           entweder kein Signal_Signalbegriff_Ziel besitzt und 
           auch keine andere Fstr_Signalisierung für die Fstr_Zug_Rangier mit Signal_Signalbegriff_Ziel auf Hp_0 vorhanden ist,
           oder Signal_Signalbegriff_Ziel gleich Hp_0 ist
           und diese Signalisierung für ein Startsignal einer Fahrstraße genutzt wird,
           und keine weitere Signalisierung mit Zs 3 nicht am Startsignal existiert,
           und dieser Signalbegriff für eine Fstr_Zug_Rangier genutzt wird, deren Fstr_DWeg ein DWeg_V besitzt
           fachlicher Kontext: am Fahrstraßenstart geplante Geschwindigkeit gegen die im Durchrutschweg hinterlegte Geschwindigkeit vergleichen -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="weitere-Fstr_Signalisierung" as="node()*" select="key('Fstr_Signalisierung-fuerFstr_Zug_Rangier', $current/ID_Fstr_Zug_Rangier/Wert, $context)                      except $current"/>
      <xsl:variable name="weitere-Fstr_Signalisierung-mitZs3" as="node()*" select="key('Signal_Signalbegriff', $weitere-Fstr_Signalisierung/ID_Signal_Signalbegriff/Wert, $context)                     [substring-after(Signalbegriff_ID/@xsi:type, ':') = 'Zs_3']"/>
      <xsl:variable name="Signalrahmen-fuer-weitere-Zs3-Signalisierung" as="node()*" select="key('Signal_Rahmen', $weitere-Fstr_Signalisierung-mitZs3/ID_Signal_Rahmen/Wert, $context)"/>
      <xsl:variable name="Fahrwegstart-fuer-weitere-Zs3-Signalisierung" as="node()*" select="key('Fstr_Fahrweg-fuerStart', $Signalrahmen-fuer-weitere-Zs3-Signalisierung/ID_Signal/Wert, $context)"/>
      
      <xsl:sequence select="((not($current/ID_Signal_Signalbegriff_Ziel) and           not(key('Signal_Signalbegriff',              (key('Fstr_Signalisierung-fuerFstr_Zug_Rangier', $current/ID_Fstr_Zug_Rangier/Wert, $context)                except $current)/ID_Signal_Signalbegriff_Ziel/Wert, $context)                   [substring-after(Signalbegriff_ID/@xsi:type, ':') = 'Hp_0'])) or           key('Signal_Signalbegriff', $current/ID_Signal_Signalbegriff_Ziel/Wert, $context)             [substring-after(Signalbegriff_ID/@xsi:type, ':') = 'Hp_0']) and          key('Fstr_Fahrweg-fuerStart',             key('Signal_Rahmen',                 key('Signal_Signalbegriff', $current/ID_Signal_Signalbegriff/Wert, $context)                   [substring-after(Signalbegriff_ID/@xsi:type, ':') = 'Zs_3']                /ID_Signal_Rahmen/Wert, $context)             /ID_Signal/Wert, $context) and          not($weitere-Fstr_Signalisierung-mitZs3 and not($Fahrwegstart-fuer-weitere-Zs3-Signalisierung)) and          key('Fstr_DWeg',             key('Fstr_Zug_Rangier', $current/ID_Fstr_Zug_Rangier/Wert, $context)                /Fstr_Zug/*/ID_Fstr_DWeg/Wert, $context)             [*/DWeg_V]"/>
   </xsl:function>
   
   <xsl:function name="fx:Fstr-387" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Fahrweg vorhanden
           auch für Fstr-366 genutzt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
       <xsl:sequence select="exists(key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context))"/>

   </xsl:function>
   
   <xsl:function name="fx:Fstr-388" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Zug vorhanden UND
            Suche nach dem Fstr_Fahrweg mit ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Signal entspricht, welches die Eigenschaft "Sperrsignal" oder "Zugdeckungssignal" besitzt
            fachlicher Klartext: Eine Zugstraße, die in einem Sperrsignal oder Zugdeckungssignal endet -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="$current/Fstr_Zug and             key('Signal',                key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)             /ID_Ziel/Wert, $context)          /Signal_Real/Signal_Real_Aktiv_Schirm/Signal_Art/Wert = ('Sperrsignal', 'Zugdeckungssignal')"/>
   </xsl:function> 
   
   <xsl:function name="fx:Fstr-389" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Zug vorhanden UND
            Suche nach dem Fstr_Fahrweg mit ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Signal entspricht, welches die Eigenschaft "Zug_Ziel_ohne_Signal" besitzt
            fachlicher Klartext: Eine Zugstraße, die in einem Stumpfgleis endet -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="$current/Fstr_Zug and             key('Signal',                key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)             /ID_Ziel/Wert, $context)          /Signal_Fiktiv/Fiktives_Signal_Funktion/Wert = 'Zug_Ziel_ohne_Signal'"/>
   </xsl:function> 
   
   <xsl:function name="fx:Fstr-616" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Zug vorhanden UND
            Suche nach dem Fstr_Fahrweg mit ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Signal entspricht, welches die Eigenschaften "Zugdeckungssignal" und Geltungsbereich "DS" besitzt
            fachlicher Klartext: Eine Zugstraße, die in einem Zugdeckungssignal endet -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="exists($current[Fstr_Zug]                                     [key('Signal',                                                                   key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)                                                                    /ID_Ziel/Wert, $context)                                  /Signal_Real[Geltungsbereich/Wert = 'DS']/Signal_Real_Aktiv_Schirm/Signal_Art/Wert = 'Zugdeckungssignal'])"/>
   </xsl:function>
   
   <xsl:function name="fx:Fstr-617" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Signalisierung mit definiertem Signal_Signalbegriff,
         und dieser Signalbegriff für eine Fstr_Zug_Rangier genutzt wird, die Fstr_V besitzt
         fachlicher Kontext: am Fahrstraßenstart geplante Geschwindigkeit gegen die in der Fahrstraße hinterlegte Geschwindigkeit vergleichen -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:param name="signalbegriff" as="xs:string*"/>
      
      <xsl:sequence select="key('Signal_Signalbegriff', $current/ID_Signal_Signalbegriff/Wert, $context)                [substring-after(Signalbegriff_ID/@xsi:type,':') = $signalbegriff] and             key('Fstr_Zug_Rangier', $current/ID_Fstr_Zug_Rangier/Wert, $context)/*/Fstr_V"/>      
   </xsl:function>
   
   <xsl:function name="fx:Fstr-622" as="xs:boolean">
      <!-- Suche nach einem Fstr_DWeg/ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Markanter_Punkt entspricht, worin eine ID_Markante_Stelle einer W_Kr_Gsp_Komponente entspricht:
            fachlicher Klartext: Ein D-Weg, der bis zu einem Weichenanfang definiert ist -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="find-Fstr_Fahrweg" select="key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)"/>
      
      <xsl:variable name="find-W_Kr_Gsp_Komponente" select="key('W_Kr_Gsp_Komponente',          key('Markanter_Punkt', $find-Fstr_Fahrweg/ID_Ziel/Wert, $context)          /ID_Markante_Stelle/Wert, $context)"/>
      
      <xsl:variable name="find-gleiche-TOP_Kante" select="$find-W_Kr_Gsp_Komponente/Punkt_Objekt_TOP_Kante/ID_TOP_Kante[Wert =          $find-Fstr_Fahrweg/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert]"/>
      
      <xsl:sequence select="key('W_Kr_Gsp_Element',          $find-W_Kr_Gsp_Komponente/ID_W_Kr_Gsp_Element/Wert, $context)/Weiche_Element             and not($find-gleiche-TOP_Kante)"/>
   </xsl:function>

   <xsl:function name="fx:Fstr-623" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Fahrweg als ID_Start auf ein Signal verweist, 
         welches Punkt_Objekt_TOP_Kante.Wirkrichtung == "in"/"gegen" besitzt
            fachlicher Klartext: Fahrweg bei Wirkrichtung des Startsignals in/gegen Topologierichtung -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:param name="wirkrichtung" as="xs:string*"/>
      
      <xsl:sequence select="exists(key('Signal',                 key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)/ID_Start/Wert, $context)             [Punkt_Objekt_TOP_Kante/Wirkrichtung/Wert = $wirkrichtung])"/>
   </xsl:function>
   
   <xsl:function name="fx:Fstr-639" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Signalisierung  über Signal_Signalbegriff ein Zs_3 besitzt,
           fachlicher Kontext: am Zugstraßenstart geplante Geschwindigkeit 
           auch genutzt für Fstr-618 -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="relevant-Fstr_Fahrweg" select="          key('Fstr_Fahrweg-fuerStart',             key('Signal_Rahmen',                 key('Signal_Signalbegriff', $current/ID_Signal_Signalbegriff/Wert, $context)                [substring-after(Signalbegriff_ID/@xsi:type,':') = 'Zs_3']             /ID_Signal_Rahmen/Wert, $context)          /ID_Signal/Wert, $context)"/>
      
      <xsl:sequence select="exists(key('Fstr_Zug_Rangier-fuerFstr_Fahrweg',          $relevant-Fstr_Fahrweg/Identitaet/Wert, $context)[Fstr_Zug])"/>
   </xsl:function>

   <xsl:function name="fx:Fstr-645" as="xs:boolean">
      <!-- Prüfung, Fstr_Fahrweg mit ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Signal entspricht, welches die Eigenschaft "Zug_Ziel_Strecke" besitzt
            fachlicher Klartext: Eine Ausfahrtzugstraße -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>

      <xsl:sequence select="exists(key('Signal',                               key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)                             /ID_Ziel/Wert, $context)                           [Signal_Fiktiv/Fiktives_Signal_Funktion/Wert = 'Zug_Ziel_Strecke'])"/>
   </xsl:function>
   
   <xsl:function name="fx:Fstr-666" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Signalisierung über Signal_Signalbegriff ein Zs_3 und Fstr_Zug besitzt
            und mindestens eine Weichen- oder Kreuzungskomponente im Fahrweg verortet ist,
           fachlicher Kontext: am Zugstraßenstart geplante Geschwindigkeit 
           in Kombination mit Weichen oder Kreuzungen im Fahrweg -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:variable name="relevant-Fstr_Fahrweg" select="          key('Fstr_Fahrweg-fuerStart',             key('Signal_Rahmen',                 key('Signal_Signalbegriff', $current/ID_Signal_Signalbegriff/Wert, $context)                [substring-after(Signalbegriff_ID/@xsi:type,':') = 'Zs_3']             /ID_Signal_Rahmen/Wert, $context)          /ID_Signal/Wert, $context)"/>
      
      <xsl:variable name="relevant-W_Kr-Begin" select="          key('W_Kr_Gsp_Komponente_POT-fuerTOP_Kante',              key('TOP_Kante', $relevant-Fstr_Fahrweg/Bereich_Objekt_Teilbereich                [fx:number-or-zero(Begrenzung_A/Wert) = 0.0]/ID_TOP_Kante/Wert, $context)             [*/TOP_Anschluss_A/Wert = ('Rechts', 'Links')]/Identitaet/Wert, $context)          [fx:number-or-zero(Abstand/Wert) = 0.0]"/>
      
      <xsl:variable name="relevant-W_Kr-End" select="          for $j in              (for $i in $relevant-Fstr_Fahrweg/Bereich_Objekt_Teilbereich return                key('TOP_Kante', $i/ID_TOP_Kante/Wert, $context)                   [fx:number-or-zero(*/TOP_Laenge/Wert) = fx:number-or-zero($i/Begrenzung_B/Wert)]                   [*/TOP_Anschluss_B/Wert = ('Rechts', 'Links')]             ) return             key('W_Kr_Gsp_Komponente_POT-fuerTOP_Kante', $j/Identitaet/Wert, $context)             [fx:number-or-zero(Abstand/Wert) = fx:number-or-zero($j/*/TOP_Laenge/Wert)]"/>

      <xsl:sequence select="key('Fstr_Zug_Rangier-fuerFstr_Fahrweg',             $relevant-Fstr_Fahrweg/Identitaet/Wert, $context)/Fstr_Zug              and ($relevant-W_Kr-Begin | $relevant-W_Kr-End)"/>
   </xsl:function>
   
   <xsl:function name="fx:Sig-613" as="xs:boolean">
      <xsl:param name="reference" as="xs:string*"/>
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:choose>
         <xsl:when test="$reference = $current/ID_Signal_Befestigung/Wert">
            <xsl:sequence select="true()"/>
         </xsl:when>
         <xsl:when test="key('Signal_Befestigung', $current/ID_Signal_Befestigung/Wert, $context)/ID_Signal_Befestigung/Wert">
            <xsl:sequence select="fx:Sig-613(($reference, $current/ID_Signal_Befestigung/Wert),                key('Signal_Befestigung', $current/ID_Signal_Befestigung/Wert, $context), $context)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:sequence select="false()"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xsl:function name="fx:WGsp-28" as="xs:boolean">
      <!-- Prüfung, ob zugehörige W_Kr_Anlage, darin W_Kr_Art = ABW", "DKW", "DW", "EKW", "EW", "Flachkreuzung", IBW",
            "IBW", "EIBKW", "EABKW", "DBKW", "IBW/ABW", "ABW/IBW", "ZHV ABW", "ZHV IBW", "EBKW", "Sym. ABW", "Eins. DW", "Klothoidenweiche" oder "Korbbogenweiche" 
            und zugehörige W_Kr_Gsp_Elemente darin W_Kr_Gsp_Stellart != "sonstige", "stillgelegt_links", "stillgelegt_rechts", "unbestimmt" oder "ZHA", 
            fachlicher Klartext: Weiche bzw. Flachkreuzung, die nicht stillgelegt oder sonstige/unbestimmt ist -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="not($current/W_Kr_Gsp_Element_Allg/W_Kr_Gsp_Stellart/Wert =           ('sonstige', 'stillgelegt_links', 'stillgelegt_rechts', 'unbestimmt', 'ZHA')) and          key('W_Kr_Anlage', $current/ID_W_Kr_Anlage/Wert, $context)             /W_Kr_Anlage_Allg/W_Kr_Art/Wert =                 ('ABW', 'DKW', 'DW', 'EKW', 'EW', 'Flachkreuzung', 'IBW',                   'EIBKW', 'EABKW', 'DBKW', 'IBW/ABW', 'ABW/IBW', 'ZHV ABW', 'ZHV IBW', 'EBKW', 'Sym. ABW', 'Eins. DW',                   'Klothoidenweiche', 'Korbbogenweiche')"/>
   </xsl:function>

   <xsl:function name="fx:WGsp-75" as="xs:boolean">
      <!-- Prüfung, ob zugehörige W_Kr_Anlage, darin W_Kr_Art = "DKW"
            fachlicher Klartext: Doppelkreuzungsweiche -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="exists(key('W_Kr_Anlage', $current/ID_W_Kr_Anlage/Wert, $context)          [W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('DKW', 'DBKW')])"/>
   </xsl:function>
   
   <xsl:function name="fx:WGsp-184" as="xs:boolean">
      <!-- Prüfung, ob Anzahl_Elektrischer_Antrieb = 0 UND
            zugehöriges W_Kr_Gsp_Element nicht die Stellart Rückfallweiche besitzt
            fachlicher Klartext: Weichenkomponente, die keine Rückfallweiche ist, bzw. keine elektrischen Antriebe besitzt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="$current/Zungenpaar/Elektrischer_Antrieb_Anzahl/Wert = '0' and          not(key('W_Kr_Gsp_Element', $current/ID_W_Kr_Gsp_Element/Wert, $context)          /W_Kr_Gsp_Element_Allg/W_Kr_Gsp_Stellart/Wert = ('Rueckfallweiche', 'ZHA'))"/>
   </xsl:function>
   
   <xsl:function name="fx:WGsp-193" as="xs:boolean">
      <!-- Prüfung, ob zugehörige W_Kr_Anlage, darin W_Kr_Art = "Kr" oder "Flachkreuzung"
            fachlicher Klartext: Kreuzung -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="exists(key('W_Kr_Anlage', $current/ID_W_Kr_Anlage/Wert, $context)             [W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('Kr', 'BKr', 'IBKr', 'Flachkreuzung')])"/>
   </xsl:function>
   
   <xsl:function name="fx:WGsp-195" as="xs:boolean">
      <!-- Prüfung, ob DKW oder EKW UND
            zugehörige W_Kr_Gsp_Komponenten nicht die xsi:nil="true" als Zungenpruefkontaktanzahl besitzt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="$current/W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('DKW', 'DBKW', 'EKW', 'EBKW', 'EIBKW', 'EABKW') and             fx:ignore-nil(key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element',                key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', $current/Identitaet/Wert, $context)                /Identitaet/Wert, $context)             /Zungenpaar/Zungenpruefkontakt_Anzahl)"/>
   </xsl:function>
   
   <xsl:function name="fx:WGsp-422" as="xs:boolean">
      <!-- Prüfung, ob Rückfallweiche UND
            zugehörige W_Kr_Gsp_Komponenten nicht die xsi:nil="true" als Zungenpruefkontaktanzahl besitzt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="$current/W_Kr_Gsp_Element_Allg/W_Kr_Gsp_Stellart/Wert = 'Rueckfallweiche' and              fx:ignore-nil(key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $current/Identitaet/Wert, $context)                /Zungenpaar/Zungenpruefkontakt_Anzahl)"/>
   </xsl:function>
   
   <xsl:function name="fx:WGsp-621" as="xs:boolean">
      <!-- Prüfung, ob zugehörige W_Kr_Anlage, darin W_Kr_Art = "DW" oder "EKW"
            fachlicher Klartext: Doppelweiche oder Einfache Kreuzungsweiche-->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      
      <xsl:sequence select="exists(key('W_Kr_Anlage', $current/ID_W_Kr_Anlage/Wert, $context)          [W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('DW', 'EKW', 'Eins. DW', 'EBKW', 'EIBKW', 'EABKW')])"/>
   </xsl:function>

   <xsl:function name="fx:WGsp-644" as="xs:boolean">
      <!-- Prüfung, ob zugehörige W_Kr_Gsp_Komponente ein Besonderes_Fahrwegelement besitzt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>

      <xsl:sequence select="exists(key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $current/Identitaet/Wert, $context)             [Besonderes_Fahrwegelement])"/>
   </xsl:function>
   
<!--Einbinden der modularisierten Regeldateien-->
   <include href="Ansteuerung_Element/Ansteuerung_Element_ID116.sch"/>
<include href="Ansteuerung_Element/Ansteuerung_Element_ID344.sch"/>
<include href="Ansteuerung_Element/Ansteuerung_Element_ID345.sch"/>
<include href="Ansteuerung_Element/Ansteuerung_Element_ID632.sch"/>
<include href="Bahnsteige/Bahnsteige_ID343.sch"/>
<include href="Bahnsteige/Bahnsteige_ID65.sch"/>
<include href="Balisentechnik_ETCS/ETCS_ID625.sch"/>
<include href="Balisentechnik_ETCS/ETCS_ID626.sch"/>
<include href="Balisentechnik_ETCS/ETCS_ID627.sch"/>
<include href="Balisentechnik_ETCS/ETCS_ID628.sch"/>
<include href="Balisentechnik_ETCS/ETCS_ID630.sch"/>
<include href="Balisentechnik_ETCS/ETCS_ID631.sch"/>
<include href="Balisentechnik_ETCS/ETCS_ID638.sch"/>
<include href="Balisentechnik_ETCS/ETCS_ID652.sch"/>
<include href="Balisentechnik_ETCS/ETCS_ID653.sch"/>
<include href="Balisentechnik_ETCS/ETCS_ID667.sch#ID667-abstract"/>
<include href="Balisentechnik_ETCS/ETCS_ID667.sch#ID667"/>
<include href="Balisentechnik_ETCS/ETCS_ID671.sch#ID671-abstract"/>
<include href="Balisentechnik_ETCS/ETCS_ID671.sch#ID671"/>
<include href="Basisobjekte/Basisobjekte_ID178.sch"/>
<include href="Basisobjekte/Basisobjekte_ID642.sch"/>
<include href="Basisobjekte/Basisobjekte_ID643.sch"/>
<include href="Basisobjekte/Basisobjekte_ID655.sch"/>
<include href="Basisobjekte/Basisobjekte_ID656.sch"/>
<include href="Basisobjekte/Basisobjekte_ID657.sch"/>
<include href="Basisobjekte/Basisobjekte_ID658.sch"/>
<include href="Basisobjekte/Basisobjekte_ID659.sch"/>
<include href="Basisobjekte/Basisobjekte_ID660.sch"/>
<include href="Basisobjekte/Basisobjekte_ID661.sch"/>
<include href="Basisobjekte/Basisobjekte_ID662.sch"/>
<include href="Basisobjekte/Basisobjekte_ID663.sch#ID663-abstract"/>
<include href="Basisobjekte/Basisobjekte_ID663.sch#ID663"/>
<include href="Basisobjekte/Basisobjekte_ID664.sch#ID664-abstract"/>
<include href="Basisobjekte/Basisobjekte_ID664.sch#ID664"/>
<include href="Fahrstraße/Fahrstrasse_ID101.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID11.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID14.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID144.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID255.sch#ID255-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID255.sch#ID255"/>
<include href="Fahrstraße/Fahrstrasse_ID256.sch#ID256-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID256.sch#ID256"/>
<include href="Fahrstraße/Fahrstrasse_ID259.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID270.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID272.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID278.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID284.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID312.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID313.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID314.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID315.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID316.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID356.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID357.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID360.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID361.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID366.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID371.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID372.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID374.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID377.sch#ID377-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID377.sch#ID377"/>
<include href="Fahrstraße/Fahrstrasse_ID387.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID388.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID389.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID390.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID408.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID59.sch#ID59-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID59.sch#ID59"/>
<include href="Fahrstraße/Fahrstrasse_ID611.sch#ID611-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID611.sch#ID611"/>
<include href="Fahrstraße/Fahrstrasse_ID612.sch#ID612-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID612.sch#ID612"/>
<include href="Fahrstraße/Fahrstrasse_ID616.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID617.sch#ID617-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID617.sch#ID617"/>
<include href="Fahrstraße/Fahrstrasse_ID618.sch#ID618-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID618.sch#ID618"/>
<include href="Fahrstraße/Fahrstrasse_ID622.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID623.sch#ID623-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID623.sch#ID623"/>
<include href="Fahrstraße/Fahrstrasse_ID624.sch#ID624-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID624.sch#ID624"/>
<include href="Fahrstraße/Fahrstrasse_ID639.sch#ID639-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID639.sch#ID639"/>
<include href="Fahrstraße/Fahrstrasse_ID640.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID641.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID645.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID648.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID665.sch#ID665-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID665.sch#ID665"/>
<include href="Fahrstraße/Fahrstrasse_ID666.sch#ID666-abstract"/>
<include href="Fahrstraße/Fahrstrasse_ID666.sch#ID666"/>
<include href="Fahrstraße/Fahrstrasse_ID7.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID76.sch"/>
<include href="Fahrstraße/Fahrstrasse_ID88.sch"/>
<include href="Flankenschutz/Flankenschutz_ID125.sch"/>
<include href="Flankenschutz/Flankenschutz_ID129.sch"/>
<include href="Flankenschutz/Flankenschutz_ID130.sch"/>
<include href="Flankenschutz/Flankenschutz_ID135.sch"/>
<include href="Flankenschutz/Flankenschutz_ID136.sch"/>
<include href="Flankenschutz/Flankenschutz_ID141.sch"/>
<include href="Flankenschutz/Flankenschutz_ID175.sch"/>
<include href="Flankenschutz/Flankenschutz_ID353.sch"/>
<include href="Flankenschutz/Flankenschutz_ID354.sch"/>
<include href="Flankenschutz/Flankenschutz_ID355.sch"/>
<include href="Flankenschutz/Flankenschutz_ID359.sch"/>
<include href="Flankenschutz/Flankenschutz_ID375.sch"/>
<include href="Flankenschutz/Flankenschutz_ID53.sch"/>
<include href="Flankenschutz/Flankenschutz_ID620.sch"/>
<include href="Flankenschutz/Flankenschutz_ID679.sch"/>
<include href="Geodaten/Geodaten_ID633.sch"/>
<include href="Geodaten/Geodaten_ID637.sch"/>
<include href="Gleis/Gleis_ID634.sch"/>
<include href="Ortung/Ortung_ID654.sch"/>
<include href="Schluesselabhaengigkeiten/Schluesselabhaengigkeiten_ID346.sch"/>
<include href="Schluesselabhaengigkeiten/Schluesselabhaengigkeiten_ID348.sch"/>
<include href="Schluesselabhaengigkeiten/Schluesselabhaengigkeiten_ID349.sch"/>
<include href="Schluesselabhaengigkeiten/Schluesselabhaengigkeiten_ID614.sch"/>
<include href="Schluesselabhaengigkeiten/Schluesselabhaengigkeiten_ID615.sch"/>
<include href="Signale/Signale_ID220.sch"/>
<include href="Signale/Signale_ID613.sch"/>
<include href="Signale/Signale_ID619.sch"/>
<include href="Signale/Signale_ID649.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID184.sch#ID184-abstract"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID184.sch#ID184"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID188.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID193.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID194.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID195.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID244.sch#ID244-abstract"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID244.sch#ID244"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID249.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID28.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID281.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID335.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID336.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID337.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID338.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID341.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID422.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID423.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID424.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID621.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID635.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID636.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID644.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID646.sch#ID646-abstract"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID646.sch#ID646"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID647.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID651.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID72.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID73.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID74.sch"/>
<include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID75.sch"/>
<!--Diagnostics-Erzeugung für gleichartige Bezeichnungen-->
   <diagnostics>
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
             '1A'   s1 "s2" s3 "s4"
    
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
             '31'   s1 "s2 (s3)" s4 "s5"
    
             '40'   s1 "s2, s3 s4, s5 s6"
             '41'   s1 "s2 s3/s4 [s5] (s6)"
             '42'   s1 "s2 s3 s4", s5 "s6"
             '43'   s1 "s2 s3 s4 / s5 s6"
             '44'   s1 "s2", s3 "s4", s5 "s6"
    
             '50'   s1 "s2 (s3 s4 s5, s6 s7)"
             '51'   s1 "s2 - s3 (s4 s5, s6 s7)"
             '52'   s1 "s2 - s3 s4, s5 (s6, s7)"
             '53'   s1 "s2 - s3 s4, s5 (s6, s7)..."
             '54'   s1 "s2 s3, s4 s5, s6 s7"
             '55'   s1 "s2 - s3 (s4 s5, s6 s7)..."
             '56'   s1 "s2, s3 s4, s5 s6, s7"
             '57'   s1 "s2", s3 s4, s5 s6, s7
             '58'   s1 "s2" s3 "s4" s5 "s6" (s7)
             '59'   s1 "s2" s3 "s4" (s5, s6, s7)
             '5A'   s1 "s2" s3 s4 "s5" s6 (s7)
             
        -->
        <diagnostic id="guid">
            <xsl:apply-templates select="." mode="diagnostic-guid"/>
        </diagnostic>
        <diagnostic id="typ">
            <xsl:apply-templates select="." mode="diagnostic-typ"/>
        </diagnostic>
        <diagnostic id="bereich">
            <xsl:apply-templates select="." mode="diagnostic-bereich"/>
        </diagnostic>
        <diagnostic id="aufbau">
            <xsl:apply-templates select="." mode="diagnostic-aufbau"/>
        </diagnostic>
        <diagnostic id="s1">
            <xsl:apply-templates select="." mode="diagnostic-s1"/>
        </diagnostic>
        <diagnostic id="s2">
            <xsl:apply-templates select="." mode="diagnostic-s2"/>            
        </diagnostic>
        <diagnostic id="s3">
            <xsl:apply-templates select="." mode="diagnostic-s3"/>         
        </diagnostic>
        <diagnostic id="s4">
            <xsl:apply-templates select="." mode="diagnostic-s4"/>
        </diagnostic>
        <diagnostic id="s5">
            <xsl:apply-templates select="." mode="diagnostic-s5"/>
        </diagnostic>
        <diagnostic id="s6">
            <xsl:apply-templates select="." mode="diagnostic-s6"/>
        </diagnostic>
        <diagnostic id="s7">
            <xsl:apply-templates select="." mode="diagnostic-s7"/>
        </diagnostic>
    </diagnostics>
    
    <xsl:template match="Container" mode="diagnostic-guid" as="xs:string?">
        <xsl:sequence select="../Identitaet/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="*" mode="diagnostic-guid" as="xs:string?">
        <xsl:sequence select="Identitaet/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="Container" mode="diagnostic-typ" as="xs:string?">
        <xsl:sequence select="'Container'"/>
    </xsl:template>

    <xsl:template match="*" mode="diagnostic-typ" as="xs:string?">
        <xsl:sequence select="local-name(ancestor-or-self::*[parent::Container])"/>
    </xsl:template>
    
    <xsl:template match="*[key('Planungsbereich', ancestor-or-self::*[parent::Container]/Identitaet/Wert, /*)]" mode="diagnostic-bereich" priority="1000" as="xs:string?">
        <xsl:sequence select="'Planung'"/>
    </xsl:template>

    <xsl:template match="*[ancestor::LST_Planung]" mode="diagnostic-bereich" priority="100" as="xs:string?">
        <xsl:sequence select="'Betrachtung'"/>
    </xsl:template>

    <xsl:template match="*" mode="diagnostic-bereich" as="xs:string?">
        <xsl:sequence select="'Zustand'"/>
    </xsl:template>
    
    <xsl:template match="Container" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="Container" mode="diagnostic-s1" as="xs:string?">
        <xsl:choose>
            <xsl:when test="ancestor::LST_Planung">
                <xsl:sequence select="'Bauzustand'"/>                        
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Konkreter Zustand der LST-Anlage (ohne Planung)'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Container" mode="diagnostic-s2" as="xs:string?">
        <xsl:choose>
            <xsl:when test="ancestor::LST_Planung">
                <xsl:sequence select="key('LST_Planung_Einzel-fuerAusgabe_Fachdaten', ancestor::Ausgabe_Fachdaten/Identitaet/Wert, ancestor::LST_Planung)/descendant::Bauzustand_Kurzbezeichnung/Wert/text()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="concat('Erzeugt: ', format-dateTime(//PlanPro_Schnittstelle_Allg/Erzeugung_Zeitstempel/Wert, '[D].[M].[Y] [H]:[m]'), ' (UTC)')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
                    
    <xsl:template match="Anhang" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="Anhang" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Anhang'"/>
    </xsl:template>

    <xsl:template match="Anhang" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="*/Dateiname/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="Aussenelementansteuerung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'01'"/>
    </xsl:template>

    <xsl:template match="Aussenelementansteuerung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Außenelementansteuerung'"/>
    </xsl:template>

    <xsl:template match="Aussenelementansteuerung" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerAussenelementansteuerung(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Aussenelementansteuerung" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerAussenelementansteuerung(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Bahnsteig_Anlage" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="Bahnsteig_Anlage" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Bahnsteig'"/>
    </xsl:template>

    <xsl:template match="Bahnsteig_Anlage" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBahnsteigAnlage(., parent::*)"/>
    </xsl:template>    
    
    <xsl:template match="Bahnsteig_Dach" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Bahnsteig_Dach" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Bahnsteigdach zur Bahnsteigkante'"/>
    </xsl:template>
    
    <xsl:template match="Bahnsteig_Dach" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBahnsteigKante(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Bahnsteig_Kante" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Bahnsteig_Kante" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Bahnsteigkante'"/>
    </xsl:template>

    <xsl:template match="Bahnsteig_Kante" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBahnsteigKante(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Bahnsteig_Zugang" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'10'"/>
    </xsl:template>

    <xsl:template match="Bahnsteig_Zugang" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Bahnsteigkante'"/>
    </xsl:template>
    
    <xsl:template match="Bahnsteig_Zugang" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBahnsteigAnlage(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Bahnsteig_Zugang" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="'Bahnsteigzugang'"/>
    </xsl:template>
    
    <xsl:template match="Bahnsteig_Zugang" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="*/Bahnsteig_Zugang_Art/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="Balise" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'58'"/>
    </xsl:template>
    
    <xsl:template match="Balise" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Balise'"/>
    </xsl:template>

    <xsl:template match="Balise" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBalise(., parent::*)"/>
    </xsl:template>

    <xsl:template match="Balise" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="'im DP'"/>
    </xsl:template>

    <xsl:template match="Balise" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerDatenpunkt((), ID_Datenpunkt, parent::*)"/>
    </xsl:template>

    <xsl:template match="Balise" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="'mit Typ'"/>
    </xsl:template>
    
    <xsl:template match="Balise" mode="diagnostic-s6" as="xs:string?">
        <xsl:sequence select="fx:Typ-fuerDatenpunkt((), ID_Datenpunkt, parent::*)"/>
    </xsl:template>

    <xsl:template match="Balise" mode="diagnostic-s7" as="xs:string?">
        <xsl:variable name="current-datenpunkt" select="key('Datenpunkt', ID_Datenpunkt/Wert, parent::*)"/>
        <xsl:sequence select="concat('Strecke ', fx:Bezeichnung-fuerStrecke($current-datenpunkt, /*),              ', Km ', fx:Km-fuerStrecke($current-datenpunkt),             ', Gleis ', fx:Bezeichnung-fuerGleis($current-datenpunkt, /*, false()))"/>
    </xsl:template>

    <xsl:template match="Bedien_Anzeige_Element" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'10'"/>
    </xsl:template>

    <xsl:template match="Bedien_Anzeige_Element" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerBedienEinrichtung(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Bedien_Anzeige_Element" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBedienEinrichtung(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Bedien_Anzeige_Element" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="'Bedien-/Anzeige-Element'"/>
    </xsl:template>
    
    <xsl:template match="Bedien_Anzeige_Element" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="*/Bez_Bed_Anzeige_Element/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="Bedien_Einrichtung_Oertlich" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'01'"/>
    </xsl:template>
    
    <xsl:template match="Bedien_Einrichtung_Oertlich" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Bedieneinrichtung'"/>
    </xsl:template>

    <xsl:template match="Bedien_Einrichtung_Oertlich" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerBedienEinrichtung(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Bedien_Platz" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
  
    <xsl:template match="Bedien_Platz" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Bedienplatz'"/>
    </xsl:template>
    
    <xsl:template match="Bedien_Platz" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBedienPlatz(.)"/>
    </xsl:template>
    
    <xsl:template match="Bedien_Einrichtung_Oertlich" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBedienEinrichtung(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Bedien_Standort" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="Bedien_Standort" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'DSZ/BSO'"/> <!-- Digitale Steuer-Zentrale / Bedien-Standort -->
    </xsl:template>
    
    <xsl:template match="Bedien_Standort" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBedienStandort(.)"/>
    </xsl:template>
    
    <xsl:template match="Binaerdaten" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'58'"/>
    </xsl:template>

    <xsl:template match="Binaerdaten" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Binärdaten der Balise'"/>
    </xsl:template>

    <xsl:template match="Binaerdaten" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBalise(key('Luft_Telegramm-fuerBinaerdaten', Identitaet/Wert, parent::*), parent::*)"/>
    </xsl:template>

    <xsl:template match="Binaerdaten" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="'im DP'"/>
    </xsl:template>

    <xsl:template match="Binaerdaten" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerDatenpunkt(key('Luft_Telegramm-fuerBinaerdaten', Identitaet/Wert, parent::*), (), parent::*)"/>
    </xsl:template>

    <xsl:template match="Binaerdaten" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="'mit Typ'"/>
    </xsl:template>
    
    <xsl:template match="Binaerdaten" mode="diagnostic-s6" as="xs:string?">
        <xsl:sequence select="fx:Typ-fuerDatenpunkt(key('Luft_Telegramm-fuerBinaerdaten', Identitaet/Wert, parent::*), (), parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Binaerdaten" mode="diagnostic-s7" as="xs:string?">
        <xsl:variable name="current-datenpunkt" select="key('Datenpunkt',                 key('Balise',                    key('Luft_Telegramm-fuerBinaerdaten', Identitaet/Wert, parent::*)                   /ID_Balise_Uebertragung/Wert, parent::*)                /ID_Datenpunkt/Wert, parent::*)"/>
        <xsl:sequence select="concat('Strecke ', fx:Bezeichnung-fuerStrecke($current-datenpunkt, /*),              ', Km ', fx:Km-fuerStrecke($current-datenpunkt),             ', Gleis ', fx:Bezeichnung-fuerGleis($current-datenpunkt, /*, false()))"/>
    </xsl:template>

    <xsl:template match="Block_Anlage" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'01'"/>
    </xsl:template>

    <xsl:template match="Block_Anlage" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Block-Anlage'"/>
    </xsl:template>
    
    <xsl:template match="Block_Anlage" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="'Gleis'"/>
    </xsl:template>
    
    <xsl:template match="Block_Anlage" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerGleis(., parent::*, false())"/>
    </xsl:template>
    
    <xsl:template match="Block_Element" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Block_Element" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Block-Endstelle'"/>
    </xsl:template>
    
    <xsl:template match="Block_Element" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerSignal(., /*, true())"/>
    </xsl:template>
    
    <xsl:template match="BUE_Anlage" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="BUE_Anlage" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Bahnübergang'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Anlage" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBUEAnlage(., /*)"/>
    </xsl:template>
    
    <xsl:template match="BUE_Anlage_Strasse" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="BUE_Anlage_Strasse" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Straßenbezogene Angaben zu Bahnübergang'"/>
    </xsl:template>

    <xsl:template match="BUE_Anlage_Strasse" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBUEAnlage(., /*)"/>
    </xsl:template>
    
    <xsl:template match="BUE_Anlage_V" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="BUE_Anlage_V" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Geschwindigkeitsbezogene Angaben zu Bahnübergang'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Anlage_V" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBUEAnlage(., /*)"/>
    </xsl:template>
    
    <xsl:template match="BUE_Ausschaltung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'10'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Ausschaltung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Bahnübergang'"/>
    </xsl:template>

    <xsl:template match="BUE_Ausschaltung" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBUEAnlage(., /*)"/>
    </xsl:template>
    
    <xsl:template match="BUE_Ausschaltung" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="'BÜ-Ausschaltung'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Ausschaltung" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Gleise-fuerBUEGefahrraum(ID_BUE_Gleisbez_Gefahrraum/Wert, /*)"/>
    </xsl:template>
    
    <xsl:template match="BUE_Bedien_Anzeige_Element" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'10'"/>
    </xsl:template>

    <xsl:template match="BUE_Bedien_Anzeige_Element" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerBedienEinrichtung(., /*)"/>
    </xsl:template>


    <xsl:template match="BUE_Bedien_Anzeige_Element" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBedienEinrichtung(., /*)"/>
    </xsl:template>
    
    <xsl:template match="BUE_Bedien_Anzeige_Element" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="'BÜ-Handschalteinrichtung'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Bedien_Anzeige_Element" mode="diagnostic-s4" as="xs:string?">
        <xsl:variable name="art" select="*/BUE_Handschalteinrichtung"/>
        <xsl:sequence select="fx:Bezeichnung-fuerSonstige($art, /*, $handschalteinrichtung-typ, 'Sonstige Handschalteinrichtung')"/>
    </xsl:template>
    
    <xsl:template match="BUE_Einschaltung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'10'"/>
    </xsl:template>

    <xsl:template match="BUE_Einschaltung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Bahnübergang'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Einschaltung" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBUEAnlage(key('BUE_Einschaltung_Zuordnung-fuerBUE_Einschaltung', Identitaet/Wert, /*), /*)"/>
    </xsl:template>
    
    <xsl:template match="BUE_Einschaltung" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="'BÜ-Einschaltung'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Einschaltung" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Gleise-fuerBUEGefahrraum(key('BUE_Einschaltung_Zuordnung-fuerBUE_Einschaltung', Identitaet/Wert, /*)/ID_BUE_Gleisbez_Gefahrraum/Wert, /*)"/>
    </xsl:template>
    
    <xsl:template match="BUE_Gefahrraum_Eckpunkt" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Gefahrraum_Eckpunkt" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'BÜ-Gefahrraum-Eckpunkt'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Gefahrraum_Eckpunkt" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="*/Bezeichnung_BUE_GFR_Eckpunkt/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="BUE_Gleisbezogener_Gefahrraum" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'10'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Gleisbezogener_Gefahrraum" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Bahnübergang'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Gleisbezogener_Gefahrraum" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBUEAnlage(., /*)"/>
    </xsl:template>
    
    <xsl:template match="BUE_Gleisbezogener_Gefahrraum" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="'Gleis'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Gleisbezogener_Gefahrraum" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="Gleis_Am_Bue/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="BUE_Kante" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="fx:Bezeichnung-fuerGleis(., /*, true())">
                <xsl:sequence select="'44'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'18'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="BUE_Kante" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'BÜ-Kante'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Kante" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBUEAnlage(., /*)"/>
    </xsl:template>
    
    <xsl:template match="BUE_Kante" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="'km'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Kante" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="Punkt_Objekt_Strecke[1]/Strecke_Km/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="BUE_Kante" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="'Gleis'"/>                    
    </xsl:template>
    
    <xsl:template match="BUE_Kante" mode="diagnostic-s6" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerGleis(., /*, false())"/>
    </xsl:template>
    
    <xsl:template match="BUE_Kreuzungsplan" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Kreuzungsplan" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'BÜ-Kreuzungsplan für Bahnübergang'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Kreuzungsplan" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBUEAnlage(., /*)"/>
    </xsl:template>
    
    <xsl:template match="BUE_Schnittstelle" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="BUE_Schnittstelle" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'BÜ-Schnittstelle'"/>    
    </xsl:template>
    
    <xsl:template match="BUE_Schnittstelle" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBUEAnlage(key('BUE_Anlage-fuerBUE_Schnittstelle', Identitaet/Wert, /*), /*)"/>
    </xsl:template>
    
    <xsl:template match="BUE_Spezifisches_Signal" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="not(fx:showsStrecke-fuerSignal(., /*))">
                <xsl:sequence select="'00'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'54'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="BUE_Spezifisches_Signal" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'BÜ-Signal'"/>
    </xsl:template>
    
    <xsl:template match="BUE_Spezifisches_Signal" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="current-signal-bezeichnung" select="fx:Bezeichnung-fuerSignal(., /*, true())"/>
        <xsl:choose>
            <xsl:when test="$current-signal-bezeichnung">
                <xsl:sequence select="$current-signal-bezeichnung"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Strecke'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="BUE_Spezifisches_Signal" mode="diagnostic-s3" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:sequence select="fx:Bezeichnung-fuerStrecke(key('Signal', ID_Signal/Wert, /*), /*)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="BUE_Spezifisches_Signal" mode="diagnostic-s4" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:sequence select="'Km'"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="BUE_Spezifisches_Signal" mode="diagnostic-s5" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:sequence select="fx:Km-fuerStrecke(key('Signal', ID_Signal/Wert, /*))"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="BUE_Spezifisches_Signal" mode="diagnostic-s6" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:sequence select="'Gleis'"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="BUE_Spezifisches_Signal" mode="diagnostic-s7" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:sequence select="fx:Bezeichnung-fuerGleis(key('Signal', ID_Signal/Wert, /*), /*, false())"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Datenpunkt" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'59'"/>
    </xsl:template>

    <xsl:template match="Datenpunkt" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Datenpunkt'"/>
    </xsl:template>
    
    <xsl:template match="Datenpunkt" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerDatenpunkt(., (), parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Datenpunkt" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="'mit Typ'"/>
    </xsl:template>
    
    <xsl:template match="Datenpunkt" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Typ-fuerDatenpunkt(., (), parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Datenpunkt" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="concat('Strecke ', fx:Bezeichnung-fuerStrecke(., /*))"/>
    </xsl:template>

    <xsl:template match="Datenpunkt" mode="diagnostic-s6" as="xs:string?">
        <xsl:sequence select="concat('Km ', fx:Km-fuerStrecke(.))"/>
    </xsl:template>

    <xsl:template match="Datenpunkt" mode="diagnostic-s7" as="xs:string?">
        <xsl:sequence select="concat('Gleis ', fx:Bezeichnung-fuerGleis(., /*, false()))"/>
    </xsl:template>

    <xsl:template match="Datenpunkt_Link" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'5A'"/>
    </xsl:template>

    <xsl:template match="Datenpunkt_Link" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Linking von DP'"/>
    </xsl:template>

    <xsl:template match="Datenpunkt_Link" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerDatenpunkt((), ID_DP_Link_Start, parent::*)"/>
    </xsl:template>

    <xsl:template match="Datenpunkt_Link" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="current-datenpunkt" select="key('Datenpunkt', ID_DP_Link_Start/Wert, parent::*)"/>
        <xsl:sequence select="concat('mit Typ ', fx:Typ-fuerDatenpunkt($current-datenpunkt, (), parent::*),             ' (Strecke ', fx:Bezeichnung-fuerStrecke($current-datenpunkt, /*),             ', Km ', fx:Km-fuerStrecke($current-datenpunkt),             ', Gleis ', fx:Bezeichnung-fuerGleis($current-datenpunkt, /*, false()), ')')"/>
    </xsl:template>

    <xsl:template match="Datenpunkt_Link" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="'zu DP'"/>
    </xsl:template>

    <xsl:template match="Datenpunkt_Link" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerDatenpunkt((), ID_DP_Link_Ziel, parent::*)"/>        
    </xsl:template>
    
    <xsl:template match="Datenpunkt_Link" mode="diagnostic-s6" as="xs:string?">
        <xsl:variable name="current-datenpunkt" select="key('Datenpunkt', ID_DP_Link_Ziel/Wert, parent::*)"/>
        <xsl:sequence select="concat('mit Typ ', fx:Typ-fuerDatenpunkt($current-datenpunkt, (), parent::*))"/>
    </xsl:template>

    <xsl:template match="Datenpunkt_Link" mode="diagnostic-s7" as="xs:string?">
        <xsl:variable name="current-datenpunkt" select="key('Datenpunkt', ID_DP_Link_Ziel/Wert, parent::*)"/>
        <xsl:sequence select="concat('Strecke ', fx:Bezeichnung-fuerStrecke($current-datenpunkt, /*),             ', Km ', fx:Km-fuerStrecke($current-datenpunkt),             ', Gleis ', fx:Bezeichnung-fuerGleis($current-datenpunkt, /*, false()))"/>
    </xsl:template>

    <xsl:template match="ESTW_Zentraleinheit" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="ESTW_Zentraleinheit" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'ESTW-Zentraleinheit'"/>
    </xsl:template>
    
    <xsl:template match="ESTW_Zentraleinheit" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerESTWZentraleinheit(.)"/>
    </xsl:template>
    
    <xsl:template match="ETCS_Kante" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="ETCS_Kante" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'ETCS-Kante'"/>
    </xsl:template>
    
    <xsl:template match="ETCS_Kante" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="string-join(*/Bezeichnung_ETCS_Kante/Wert, ', ')"/>
    </xsl:template>
    
    <xsl:template match="ETCS_Knoten" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="Knoten_Auf_TOP_Kante/ETCS_Knoten_Art_Sonstige">
                <xsl:sequence select="'03'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'00'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="ETCS_Knoten" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'ETCS-Knoten'"/>
    </xsl:template>
    
    <xsl:template match="ETCS_Knoten" mode="diagnostic-s2" as="xs:string?">
        <xsl:choose>
            <xsl:when test="Knoten_Auf_TOP_Kante/ETCS_Knoten_Art_Sonstige">
                <xsl:sequence select="string-join(fx:Bezeichnung-fuerSonstige(Knoten_Auf_TOP_Kante/ETCS_Knoten_Art_Sonstige, /*, $etcs-knoten-art, 'Sonstiger ETCS-Knoten'), ', ')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="current-id" select="ID_TOP_Knoten/Wert"/>
                <xsl:variable name="current_TOP_Kante_AnschlussA" select="key('TOP_Kante-fuerTOP_Knoten_A', $current-id, /*)[TOP_Kante_Allg/TOP_Anschluss_A/Wert = ('Rechts', 'Links')]"/>
                <xsl:variable name="current_TOP_Kante_AnschlussB" select="key('TOP_Kante-fuerTOP_Knoten_B', $current-id, /*)[TOP_Kante_Allg/TOP_Anschluss_B/Wert = ('Rechts', 'Links')]"/>
                <xsl:sequence select="fx:Bezeichnung-fuerWKrGspElement(                     fx:W_Kr_Gsp_Komponente-for-TOP_Knoten($current-id, ($current_TOP_Kante_AnschlussA | $current_TOP_Kante_AnschlussB))                     /../ID_W_Kr_Gsp_Element, parent::*)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ETCS_Knoten" mode="diagnostic-s3" as="xs:string?">
        <xsl:if test="Knoten_Auf_TOP_Kante/ETCS_Knoten_Art_Sonstige">
            <xsl:sequence select="concat('Gleis ', fx:Bezeichnung-fuerGleis(Knoten_Auf_TOP_Kante, /*, false()))"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ETCS_Signal" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="ETCS_Signal" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'ETCS-spez. Angaben zu Signal'"/>
    </xsl:template>
    
    <xsl:template match="ETCS_Signal" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerSignal(key('Signal', ID_Signal/Wert, /*), /*, true())"/>
    </xsl:template>
    
    <xsl:template match="ETCS_W_Kr" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="ETCS_W_Kr" mode="diagnostic-s1" as="xs:string?">
        <xsl:variable name="w-kr-gsp-element" select="key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', ID_W_Kr_Anlage/Wert, /*)"/>
        <xsl:variable name="w-kr-gsp-komponente" select="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $w-kr-gsp-element/Identitaet/Wert, parent::*)"/>
        <xsl:variable name="w-kr-art">
            <xsl:choose>
                <xsl:when test="$w-kr-gsp-komponente/Zungenpaar">
                    <xsl:sequence select="'Weiche'"/>
                </xsl:when>
                <xsl:when test="$w-kr-gsp-komponente/Kreuzung">
                    <xsl:sequence select="'Kreuzung'"/>
                </xsl:when>
                <xsl:when test="$w-kr-gsp-komponente/Entgleisungsschuh">
                    <xsl:sequence select="'Gleissperre'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="'Besonderes Fahrwegelement'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:sequence select="concat('ETCS-spez. Angaben zu ', $w-kr-art)"/>
    </xsl:template>
    
    <xsl:template match="ETCS_W_Kr" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="replace(fx:Bezeichnung-fuerWKrGspElement(             key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', ID_W_Kr_Anlage/Wert, parent::*), parent::*), 'AB|CD|A|B', '')"/>
    </xsl:template>
    
    <xsl:template match="Fachtelegramm" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'59'"/>
    </xsl:template>
    
    <xsl:template match="Fachtelegramm" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Fachtelegramm'"/>
    </xsl:template>
    
    <xsl:template match="Fachtelegramm" mode="diagnostic-s2" as="xs:string?">
        <xsl:choose>
            <xsl:when test="FT_ESG_Merkmale">
                <xsl:sequence select="concat('Projektierungsfall ', FT_ESG_Merkmale/Projektierungsfall/Wert)"/>
            </xsl:when>
            <xsl:when test="FT_ETCS_L2_Merkmale">
                <xsl:sequence select="concat('Typ ', FT_ETCS_L2_Merkmale/FT_ETCS_L2_Typ/Wert)"/>
            </xsl:when>
            <xsl:when test="FT_ETCS_Trans_Merkmale">
                <xsl:sequence select="'Transition'"/>
            </xsl:when>
            <xsl:when test="FT_GNT_Merkmale">
                <xsl:sequence select="concat('Punktart ', FT_GNT_Merkmale/FT_GNT_Punktart/Wert)"/>
            </xsl:when>
            <xsl:when test="FT_ZBS_Merkmale">
                <xsl:sequence select="concat('Typ ', FT_ZBS_Merkmale/FT_ZBS_Typ/Wert)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Fachtelegramm" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="'zum Datenpunkt'"/>
    </xsl:template>
    
    <xsl:template match="Fachtelegramm" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerDatenpunkt(key('Datenpunkt-fuerFachtelegramm', Identitaet/Wert, parent::*), (), parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Fachtelegramm" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="concat('Strecke ', fx:Bezeichnung-fuerStrecke(key('Datenpunkt-fuerFachtelegramm', Identitaet/Wert, parent::*), /*))"/>
    </xsl:template>
    
    <xsl:template match="Fachtelegramm" mode="diagnostic-s6" as="xs:string?">
        <xsl:sequence select="concat('Km ', fx:Km-fuerStrecke(key('Datenpunkt-fuerFachtelegramm', Identitaet/Wert, parent::*)))"/>
    </xsl:template>
    
    <xsl:template match="Fachtelegramm" mode="diagnostic-s7" as="xs:string?">
        <xsl:sequence select="concat('Gleis ', fx:Bezeichnung-fuerGleis(key('Datenpunkt-fuerFachtelegramm', Identitaet/Wert, parent::*), /*, false()))"/>
    </xsl:template>
    
    <xsl:template match="Fla_Freimelde_Zuordnung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="fx:Aufbau-fuerFla(., parent::*)"/>
    </xsl:template>

    <xsl:template match="Fla_Freimelde_Zuordnung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Freimeldung des Flankenschutzraums für'"/>
    </xsl:template>
    
    <xsl:template match="Fla_Freimelde_Zuordnung" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFlaAnforderung(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Fla_Freimelde_Zuordnung" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFlaAnforderungDetail(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Fla_Freimelde_Zuordnung" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNB(.,  parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Fla_Freimelde_Zuordnung" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNBZone(.,  parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Fla_Schutz" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="fx:Aufbau-fuerFla(., parent::*)"/>
    </xsl:template>

    <xsl:template match="Fla_Schutz" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Flankenschutz für'"/>
    </xsl:template>
    
    <xsl:template match="Fla_Schutz" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFlaAnforderung(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Fla_Schutz" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFlaAnforderungDetail(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Fla_Schutz" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNB(.,  parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Fla_Schutz" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNBZone(.,  parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Fla_Zwieschutz" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Fla_Zwieschutz" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Zwieschutz'"/>
    </xsl:template>
    
    <xsl:template match="Fla_Zwieschutz" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerWKrGspElement(ID_W_Element, parent::*)"/>
    </xsl:template>
    
    <xsl:template match="FMA_Anlage" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="fx:FMAAnlage-has-Kennbuchstabe(., parent::*)">
                <xsl:sequence select="'15'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'00'"/>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>

    <xsl:template match="FMA_Anlage" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Freimeldeabschnitt'"/>
    </xsl:template>
    
    <xsl:template match="FMA_Anlage" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFMAAnlage(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="FMA_Anlage" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFMAAnlage-Kennbuchstabe(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="FMA_Anlage" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFMAAnlage-OertlicherElementname(., parent::*)"/>    
    </xsl:template>
    
    <xsl:template match="FMA_Element" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="fx:FMAAnlage-has-Kennbuchstabe(., parent::*)">
                <xsl:sequence select="'15'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'00'"/>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>

    <xsl:template match="FMA_Element" mode="diagnostic-s1" as="xs:string?">
        <xsl:variable name="art" select="*/FMA_Element_Art"/>
        <xsl:sequence select="concat(fx:Bezeichnung-fuerSonstige($art, /*, $fma-typ, 'Sonstiges FMA-Element'), ' FMA')"/>
    </xsl:template>
    
    <xsl:template match="FMA_Element" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFMAAnlage(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="FMA_Element" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFMAAnlage-Kennbuchstabe(., parent::*)"/>        
    </xsl:template>
    
    <xsl:template match="FMA_Element" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFMAAnlage-OertlicherElementname(., parent::*)"/>    
    </xsl:template>
    
    <xsl:template match="FMA_Komponente" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="fx:showsStrecke-fuerFMA_Komponente(.)">
                <xsl:sequence select="'54'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'00'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="FMA_Komponente" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerFMA_Komponente(.)"/>
    </xsl:template>
    
    <xsl:template match="FMA_Komponente" mode="diagnostic-s2" as="xs:string?">
        <xsl:choose>
            <xsl:when test="fx:showsStrecke-fuerFMA_Komponente(.)">
                <xsl:sequence select="'Strecke'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="fx:Bezeichnung-fuerFMAKomponente(.)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="FMA_Komponente" mode="diagnostic-s3" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerFMA_Komponente(.)">
            <xsl:sequence select="fx:Bezeichnung-fuerStrecke(., /*)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="FMA_Komponente" mode="diagnostic-s4" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerFMA_Komponente(.)">
            <xsl:sequence select="'Km'"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="FMA_Komponente" mode="diagnostic-s5" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerFMA_Komponente(.)">
            <xsl:sequence select="fx:Km-fuerStrecke(.)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="FMA_Komponente" mode="diagnostic-s6" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerFMA_Komponente(.)">
            <xsl:sequence select="'Gleis'"/>                    
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="FMA_Komponente" mode="diagnostic-s7" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerFMA_Komponente(.)">
            <xsl:sequence select="fx:Bezeichnung-fuerGleis(., /*, false())"/>                    
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Fstr_Aneinander" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Fstr_Aneinander" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Aneinander gereihte Fahrstraße'"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Aneinander" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="Fstr_Aneinander_Bedienstring/Wert/text()"/>
    </xsl:template>

    <xsl:template match="Fstr_DWeg" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="Fstr_DWeg_Spezifisch">
                <xsl:sequence select="'03'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'00'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Fstr_DWeg" mode="diagnostic-s1" as="xs:string?">
        <xsl:choose>
            <xsl:when test="Fstr_DWeg_Spezifisch">
                <xsl:sequence select="'Durchrutschweg'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Gefahrpunktabstand'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Fstr_DWeg" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFstrStart(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_DWeg" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFstrDWeg(.)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Fahrweg" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'02'"/>
    </xsl:template>

    <xsl:template match="Fstr_Fahrweg" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Fahrweg'"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Fahrweg" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFstrStart(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Fahrweg" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFstrZiel(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Nichthaltfall" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="fx:FMAAnlage-has-Kennbuchstabe(., parent::*)">
                <xsl:sequence select="'15'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'00'"/>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>

    <xsl:template match="Fstr_Nichthaltfall" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Nichthaltfallabschnitt'"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Nichthaltfall" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFMAAnlage(., parent::*)"/>
    </xsl:template>
     
    <xsl:template match="Fstr_Nichthaltfall" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFMAAnlage-Kennbuchstabe(., parent::*)"/>        
    </xsl:template>
    
    <xsl:template match="Fstr_Nichthaltfall" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFMAAnlage-OertlicherElementname(., parent::*)"/>    
    </xsl:template>
     
    <xsl:template match="Fstr_Signalisierung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:variable name="current-fstr_zug_rangier" select="key('Fstr_Zug_Rangier', ID_Fstr_Zug_Rangier/Wert, parent::*)"/>
        <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $current-fstr_zug_rangier/ID_Fstr_Fahrweg/Wert, parent::*)"/>
        <xsl:variable name="current-fstr_umfahrpunkt" select="key('Fstr_Umfahrpunkt-fuerFstr_Fahrweg', $current-fstr_fahrweg/Identitaet/Wert, /*)"/>
        <xsl:variable name="current-dweg" select="key('Fstr_DWeg', $current-fstr_zug_rangier/*/*/ID_Fstr_DWeg/Wert, parent::*)"/>
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
    </xsl:template>

    <xsl:template match="Fstr_Signalisierung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Signalisierung für'"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Signalisierung" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerFstrZugRangier(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Signalisierung" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFstrStart(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Signalisierung" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFstrZiel(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Signalisierung" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFstrZwischenziel(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Signalisierung" mode="diagnostic-s6" as="xs:string?">
        <xsl:variable name="current-fstr_zug_rangier" select="key('Fstr_Zug_Rangier', ID_Fstr_Zug_Rangier/Wert, parent::*)"/>
        <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', $current-fstr_zug_rangier/ID_Fstr_Fahrweg/Wert, parent::*)"/>
        <xsl:variable name="current-fstr_umfahrpunkt" select="key('Fstr_Umfahrpunkt-fuerFstr_Fahrweg', $current-fstr_fahrweg/Identitaet/Wert, /*)"/>
        <xsl:variable name="current-dweg" select="key('Fstr_DWeg', $current-fstr_zug_rangier/*/*/ID_Fstr_DWeg/Wert, parent::*)"/>
        <xsl:if test="$current-fstr_umfahrpunkt and $current-dweg">
            <xsl:sequence select="fx:Bezeichnung-fuerFstrDWeg($current-dweg)"/>
        </xsl:if>
    </xsl:template>
     
    <xsl:template match="Fstr_Umfahrpunkt" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Umfahrpunkt" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Umfahrpunkt'"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Umfahrpunkt" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFstrUmfahrpunkt(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Zug_Rangier" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
        <xsl:variable name="current-fstr_umfahrpunkt" select="key('Fstr_Umfahrpunkt-fuerFstr_Fahrweg', $current-fstr_fahrweg/Identitaet/Wert, /*)"/>
        <xsl:variable name="current-dweg" select="key('Fstr_DWeg', */*/ID_Fstr_DWeg/Wert, parent::*)"/>
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
    </xsl:template>

    <xsl:template match="Fstr_Zug_Rangier" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerFstrZugRangier(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Zug_Rangier" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFstrStart(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Zug_Rangier" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFstrZiel(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Zug_Rangier" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerFstrZwischenziel(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Fstr_Zug_Rangier" mode="diagnostic-s5" as="xs:string?">
        <xsl:variable name="current-fstr_fahrweg" select="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
        <xsl:variable name="current-fstr_umfahrpunkt" select="key('Fstr_Umfahrpunkt-fuerFstr_Fahrweg', $current-fstr_fahrweg/Identitaet/Wert, /*)"/>
        <xsl:variable name="current-dweg" select="key('Fstr_DWeg', */*/ID_Fstr_DWeg/Wert, parent::*)"/>
        <xsl:if test="$current-fstr_umfahrpunkt and $current-dweg">
            <xsl:sequence select="fx:Bezeichnung-fuerFstrDWeg($current-dweg)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="GEO_Kante" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'02'"/>
    </xsl:template>

    <xsl:template match="GEO_Kante" mode="diagnostic-s1" as="xs:string?">
        <xsl:variable name="current_geo-art" select="ID_GEO_Art/Wert"/>
        <xsl:choose>
            <xsl:when test="key('TOP_Kante', $current_geo-art, parent::*)">
                <xsl:sequence select="'Gleis-Geo-Kante'"/>
            </xsl:when>
            <xsl:when test="key('Strecke', $current_geo-art, parent::*)">
                <xsl:sequence select="'Strecken-Geo-Kante'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Sonstige Geo-Kante'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="GEO_Kante" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerGEOKnoten(ID_GEO_Knoten_A, parent::*)"/>
    </xsl:template>
    
    <xsl:template match="GEO_Kante" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerGEOKnoten(ID_GEO_Knoten_B, parent::*)"/>
    </xsl:template>
    
    <xsl:template match="GEO_Knoten" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="GEO_Knoten" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Geo-Knoten'"/>
    </xsl:template>
    
    <xsl:template match="GEO_Knoten" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerGEOKnoten(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="GEO_Punkt" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="fx:GEOPunkt-has-KnotenPAD(., parent::*)">
                <xsl:sequence select="'24'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'02'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="GEO_Punkt" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Geo-Punkt'"/>
    </xsl:template>
    
    <xsl:template match="GEO_Punkt" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="*/GK_X/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="GEO_Punkt" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="*/GK_Y/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="GEO_Punkt" mode="diagnostic-s4" as="xs:string?">
        <xsl:if test="fx:GEOPunkt-has-KnotenPAD(., parent::*)">
            <xsl:sequence select="'zu Geo-Knoten'"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="GEO_Punkt" mode="diagnostic-s5" as="xs:string?">
        <xsl:if test="fx:GEOPunkt-has-KnotenPAD(., parent::*)">
            <xsl:sequence select="fx:Bezeichnung-fuerGEOKnoten(ID_GEO_Knoten, parent::*)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="GFR_Element" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="GFR_Element" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Detektor der Gefahrraumfreimeldeanlage'"/>
    </xsl:template>
    
    <xsl:template match="GFR_Element" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerGFRElement(.)"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Abschluss" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'54'"/>
    </xsl:template>

    <xsl:template match="Gleis_Abschluss" mode="diagnostic-s1" as="xs:string?">
        <xsl:variable name="art" select="Gleis_Abschluss_Art"/>
        <xsl:sequence select="fx:Bezeichnung-fuerSonstige($art, /*, $gleisabschluss-typ, 'Sonstiger Gleisabschluss')"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Abschluss" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="'Strecke'"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Abschluss" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerStrecke(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Abschluss" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="'Km'"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Abschluss" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="fx:Km-fuerStrecke(.)"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Abschluss" mode="diagnostic-s6" as="xs:string?">
        <xsl:sequence select="'Gleis'"/>                    
    </xsl:template>
    
    <xsl:template match="Gleis_Abschluss" mode="diagnostic-s7" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerGleis(., /*, false())"/>                    
    </xsl:template>
    
    <xsl:template match="Gleis_Abschnitt" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Gleis_Abschnitt" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Gleisabschnitt'"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Abschnitt" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerGleisAbschnitt(.)"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Art" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Gleis_Art" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Gleisart'"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Art" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="art" select="Gleisart"/>
        <xsl:sequence select="fx:Bezeichnung-fuerSonstige($art, /*, $gleisart-typ, 'Sonstige Gleisart')"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Bezeichnung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Gleis_Bezeichnung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Bezeichnung Gleis'"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Bezeichnung" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerGleis(., /*, true())"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Lichtraum" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="Gleis_Lichtraum" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Gleislichtraum'"/>        
    </xsl:template>
    
    <xsl:template match="Gleis_Lichtraum" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="art" select="Lichtraumprofil"/>
        <xsl:sequence select="fx:Bezeichnung-fuerSonstige($art, /*, $lichtraumprofil, 'Sonstiger Gleislichtraum')"/>
    </xsl:template>
    
    <xsl:template match="Hoehenlinie" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'02'"/>
    </xsl:template>

    <xsl:template match="Hoehenlinie" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Höhenlinie'"/>
    </xsl:template>
    
    <xsl:template match="Hoehenlinie" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerHoehenpunkt(ID_Hoehenpunkt_A, parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Hoehenlinie" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerHoehenpunkt(ID_Hoehenpunkt_B, parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Hoehenpunkt" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Hoehenpunkt" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Höhenpunkt'"/>
    </xsl:template>
    
    <xsl:template match="Hoehenpunkt" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerHoehenpunkt(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Kabel" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Kabel" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Kabel'"/>
    </xsl:template>
    
    <xsl:template match="Kabel" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="*/Bezeichnung_Kabel/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="Kabel_Verteilpunkt" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Kabel_Verteilpunkt" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerKabelVerteilpunkt(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Kabel_Verteilpunkt" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerKabelVerteilpunkt(.)"/>
    </xsl:template>
    
    <xsl:template match="LEU_Anlage" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="LEU_Anlage" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'LEU-Anlage'"/>
    </xsl:template>
    
    <xsl:template match="LEU_Anlage" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerLEUAnlage(.)"/>
    </xsl:template>
    
    <xsl:template match="Lieferobjekt" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'01'"/>
    </xsl:template>

    <xsl:template match="Lieferobjekt" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Lieferantenangaben zu'"/>
    </xsl:template>
    
    <xsl:template match="Lieferobjekt" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="Search-Objekt" select="(key('Identitaet', ID_LO_Einbau/Wert, /*)/..[Bezeichnung])[1]"/>
        <xsl:sequence select="$Search-Objekt/local-name()"/>
    </xsl:template>
    
    <xsl:template match="Lieferobjekt" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="Search-Objekt" select="(key('Identitaet', ID_LO_Einbau/Wert, /*)/../Bezeichnung/*)[1]"/>
        <xsl:sequence select="$Search-Objekt/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="Luft_Telegramm" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'54'"/>
    </xsl:template>

    <xsl:template match="Luft_Telegramm" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Luft-Telegramm'"/>
    </xsl:template>
    
    <xsl:template match="Luft_Telegramm" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="'Datenpunkt'"/>
    </xsl:template>
    
    <xsl:template match="Luft_Telegramm" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerDatenpunkt(., (), parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Luft_Telegramm" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="'DP-Typ'"/>
    </xsl:template>
    
    <xsl:template match="Luft_Telegramm" mode="diagnostic-s5" as="xs:string?">
        <xsl:variable name="current-balise" select="key('Balise', ID_Balise_Uebertragung/Wert, parent::*)"/>
        <xsl:sequence select="string-join(key('Datenpunkt', $current-balise/ID_Datenpunkt/Wert, parent::*)/DP_Typ/*/DP_Typ_ETCS/Wert, ', ')"/>
    </xsl:template>
    
    <xsl:template match="Luft_Telegramm" mode="diagnostic-s6" as="xs:string?">
        <xsl:sequence select="'Balise'"/>
    </xsl:template>
    
    <xsl:template match="Luft_Telegramm" mode="diagnostic-s7" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBalise(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Markanter_Punkt" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Markanter_Punkt" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Markanter Punkt'"/>
    </xsl:template>
    
    <xsl:template match="Markanter_Punkt" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerMarkanterPunkt(., /*)"/>
    </xsl:template>
    
    <xsl:template match="NB" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="NB" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Nahbedienbereich'"/>
    </xsl:template>
    
    <xsl:template match="NB" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNB(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="NB_Bedien_Anzeige_Element" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'28'"/>
    </xsl:template>

    <xsl:template match="NB_Bedien_Anzeige_Element" mode="diagnostic-s1" as="xs:string?">
        <xsl:variable name="art" select="NB_Bedien_Anzeige_Funktionen/*"/>
        <xsl:choose>
            <xsl:when test="$art/self::Taste_ANF">
                <xsl:sequence select="'NB-Anforderungstaste'"/>
            </xsl:when>
            <xsl:when test="$art/self::Taste_FGT">
                <xsl:sequence select="'NB-Fertigmeldetaste'"/>
            </xsl:when>
            <xsl:when test="$art/self::Taste_WGT">
                <xsl:sequence select="'Weichengruppentaste'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Sonstige NB-Taste'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="NB_Bedien_Anzeige_Element" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNB(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="NB_Bedien_Anzeige_Element" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNBZone(.,  parent::*)"/>
    </xsl:template>
    
    <xsl:template match="NB_Bedien_Anzeige_Element" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerBedienEinrichtung(., /*)"/>
    </xsl:template>
    
    <xsl:template match="NB_Bedien_Anzeige_Element" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerBedienEinrichtung(., /*)"/>
    </xsl:template>
    
    <xsl:template match="NB_Zone" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'02'"/>
    </xsl:template>

    <xsl:template match="NB_Zone" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'NB-Zone'"/>    
    </xsl:template>
    
    <xsl:template match="NB_Zone" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNB(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="NB_Zone" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNBZone(.,  parent::*)"/>    
    </xsl:template>
    
    <xsl:template match="NB_Zone_Element" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'14'"/>
    </xsl:template>

    <xsl:template match="NB_Zone_Element" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'NB-Element'"/>
    </xsl:template>
    
    <xsl:template match="NB_Zone_Element" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="current-typ" select="key('Identitaet', ID_NB_Element/Wert, /*)/.."/>
        <xsl:choose>
            <xsl:when test="$current-typ/self::W_Kr_Gsp_Komponente">
                <xsl:sequence select="fx:Bezeichnung-fuerWKrGspElement($current-typ/ID_W_Kr_Gsp_Element, parent::*)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Schluesselsperre">
                <xsl:sequence select="concat(fx:Art-fuerSchluesselsperre($current-typ, /*), ' ', fx:Bezeichnung-fuerSchluesselsperre($current-typ, /*))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="string-join($current-typ/*/Bezeichnung_Tabelle/Wert, ', ')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="NB_Zone_Element" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNB(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="NB_Zone_Element" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNBZone(.,  parent::*)"/>
    </xsl:template>
    
    <xsl:template match="NB_Zone_Grenze" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'14'"/>
    </xsl:template>

    <xsl:template match="NB_Zone_Grenze" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'NB-Zonengrenze'"/>
    </xsl:template>
    
    <xsl:template match="NB_Zone_Grenze" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerMarkanterPunkt(., /*)"/>
    </xsl:template>
    
    <xsl:template match="NB_Zone_Grenze" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNB(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="NB_Zone_Grenze" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerNBZone(.,  parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Oertlichkeit" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Oertlichkeit" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Örtlichkeit'"/>
    </xsl:template>
    
    <xsl:template match="Oertlichkeit" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="*/Oertlichkeit_Abkuerzung/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="PZB_Element" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="not(PZB_Element_GUE)">
                <xsl:sequence select="'03'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'54'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="PZB_Element" mode="diagnostic-s1" as="xs:string?">
        <xsl:choose>
            <xsl:when test="not(PZB_Element_GUE)">
                <xsl:sequence select="'PZB-Gleismagnet'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="fx:Bezeichnung-fuerGUE(.)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="PZB_Element" mode="diagnostic-s2" as="xs:string?">
        <xsl:choose>
            <xsl:when test="not(PZB_Element_GUE)">
                <xsl:variable name="art" select="PZB_Art/Wert"/>
                <xsl:sequence select="$pzb-typ/planpro:bezeichnung[@kurz = $art]/text()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Strecke'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="PZB_Element" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="current-gue" select="PZB_Element_GUE"/>
        <xsl:choose>
            <xsl:when test="not($current-gue)">
                <xsl:variable name="current-pzb-zuordnung" select="key('PZB_Element_Zuordnung', ID_PZB_Element_Zuordnung/Wert, /*)"/>
                <xsl:variable name="pzb-element-bezugspunkt" select="($current-pzb-zuordnung/PZB_Element_Zuordnung_BP/ID_PZB_Element_Bezugspunkt/Wert)[1]"/>
                <xsl:variable name="signal" select="key('Signal', $pzb-element-bezugspunkt, /*)"/>
                <xsl:variable name="w_element" select="key('W_Kr_Gsp_Element', $pzb-element-bezugspunkt, /*)"/>
                <xsl:variable name="bezugselement" select="key('Identitaet', $pzb-element-bezugspunkt, /*)/.."/>
                <xsl:choose>
                    <xsl:when test="$signal">
                        <xsl:sequence select="fx:Bezeichnung-fuerSignal($signal, /*, true())"/>
                    </xsl:when>
                    <xsl:when test="$w_element">
                        <xsl:sequence select="fx:Bezeichnung-fuerWKrGspElement($w_element, parent::*)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="string-join($bezugselement/*/Bezeichnung_Tabelle/Wert, ', ')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="fx:Bezeichnung-fuerStrecke(., /*)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="PZB_Element" mode="diagnostic-s4" as="xs:string?">
        <xsl:if test="PZB_Element_GUE">
            <xsl:sequence select="'Km'"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="PZB_Element" mode="diagnostic-s5" as="xs:string?">
        <xsl:if test="PZB_Element_GUE">
            <xsl:sequence select="fx:Km-fuerStrecke(.)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="PZB_Element" mode="diagnostic-s6" as="xs:string?">
        <xsl:if test="PZB_Element_GUE">
            <xsl:sequence select="'Gleis'"/>                    
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="PZB_Element" mode="diagnostic-s7" as="xs:string?">
        <xsl:if test="PZB_Element_GUE">
            <xsl:sequence select="fx:Bezeichnung-fuerGleis(., /*, false())"/>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template match="PZB_Element_Zuordnung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:variable name="current-pzb-elemente" select="key('PZB_Element-fuerPZB_Element_Zuordnung', Identitaet/Wert, /*)"/>
        <xsl:variable name="current-gues" select="$current-pzb-elemente/PZB_Element_GUE"/>
        <xsl:choose>
            <xsl:when test="fx:PZB-has-GM($current-pzb-elemente) and not(fx:PZB-has-GUE($current-pzb-elemente))">
                <xsl:sequence select="'19'"/>
            </xsl:when>
            <xsl:when test="fx:PZB-has-GM($current-pzb-elemente) and $current-gues[1][not($current-gues[2])]"><!-- count($current-gues) = 1 -->
                <xsl:sequence select="'52'"/>
            </xsl:when>
            <xsl:when test="fx:PZB-has-GM($current-pzb-elemente) and $current-gues[2]"><!-- count($current-gues) > 1 -->
                <xsl:sequence select="'53'"/>
            </xsl:when>
            <xsl:when test="not(fx:PZB-has-GM($current-pzb-elemente)) and $current-gues[1][not($current-gues[2])]"><!-- count($current-gues) = 1 -->
                <xsl:sequence select="'51'"/>
            </xsl:when>
            <xsl:when test="not(fx:PZB-has-GM($current-pzb-elemente)) and $current-gues[2]"><!-- count($current-gues) > 1 -->
                <xsl:sequence select="'55'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'00'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="PZB_Element_Zuordnung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'PZB-Zuordnung'"/>
    </xsl:template>
    
    <xsl:template match="PZB_Element_Zuordnung" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="current-typ" select="key('Identitaet', (*/ID_PZB_Element_Bezugspunkt/Wert)[1], /*)/.."/>
        <xsl:sequence select="string-join($current-typ/*/Bezeichnung_Tabelle/Wert, ', ')"/>
    </xsl:template>
    
    <xsl:template match="PZB_Element_Zuordnung" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="current-pzb-elemente" select="key('PZB_Element-fuerPZB_Element_Zuordnung', Identitaet/Wert, /*)"/>
        <xsl:variable name="current-gleismagnete" select="$current-pzb-elemente[PZB_Element_GM]/PZB_Art/Wert"/>
        <xsl:choose>
            <xsl:when test="$current-gleismagnete">
                <xsl:choose>
                    <xsl:when test="$current-gleismagnete[1][not($current-gleismagnete[2])]">
                        <xsl:sequence select="'PZB-Gleismagnet'"/>        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="'PZB-Gleismagnete'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="not($current-gleismagnete) and fx:PZB-has-GUE($current-pzb-elemente)">
                <xsl:sequence select="fx:Bezeichnung-fuerGUE($current-pzb-elemente)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="PZB_Element_Zuordnung" mode="diagnostic-s4" as="xs:string?">
        <xsl:variable name="current-pzb-elemente" select="key('PZB_Element-fuerPZB_Element_Zuordnung', Identitaet/Wert, /*)"/>
        <xsl:variable name="current-gleismagnete" select="$current-pzb-elemente[PZB_Element_GM]/PZB_Art/Wert"/>
        <xsl:choose>
            <xsl:when test="$current-gleismagnete">
                <xsl:variable name="sorted-gleismagnete" as="xs:string*">
                    <xsl:for-each-group select="$current-gleismagnete" group-by=".">
                        <xsl:sort select="string-length(current())" order="ascending" data-type="text"/>
                        <xsl:sort select="current()" order="ascending" data-type="text"/>
                        <xsl:sequence select="string-join($pzb-typ/planpro:bezeichnung[@kurz = current()], ', ')"/>
                    </xsl:for-each-group>
                </xsl:variable>
                <xsl:sequence select="string-join($sorted-gleismagnete, ', ')"/>
            </xsl:when>
            <xsl:when test="fx:PZB-has-GUE($current-pzb-elemente)">
                <xsl:sequence select="'Strecke'"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="PZB_Element_Zuordnung" mode="diagnostic-s5" as="xs:string?">
        <xsl:variable name="current-pzb-elemente" select="key('PZB_Element-fuerPZB_Element_Zuordnung', Identitaet/Wert, /*)"/>
        <xsl:choose>
            <xsl:when test="fx:PZB-has-GM($current-pzb-elemente) and fx:PZB-has-GUE($current-pzb-elemente)">
                <xsl:sequence select="fx:Bezeichnung-fuerGUE($current-pzb-elemente)"/>
            </xsl:when>
            <xsl:when test=" not(fx:PZB-has-GM($current-pzb-elemente)) and fx:PZB-has-GUE($current-pzb-elemente)">
                <xsl:sequence select="fx:Bezeichnung-fuerStrecke($current-pzb-elemente[PZB_Element_GUE][1], /*)"/>                        
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="PZB_Element_Zuordnung" mode="diagnostic-s6" as="xs:string?">
        <xsl:variable name="current-pzb-elemente" select="key('PZB_Element-fuerPZB_Element_Zuordnung', Identitaet/Wert, /*)"/>
        <xsl:choose>
            <xsl:when test="fx:PZB-has-GM($current-pzb-elemente) and fx:PZB-has-GUE($current-pzb-elemente)">
                <xsl:sequence select="concat('Strecke ', fx:Bezeichnung-fuerStrecke($current-pzb-elemente[PZB_Element_GUE][1], /*))"/>
            </xsl:when>
            <xsl:when test=" not(fx:PZB-has-GM($current-pzb-elemente)) and fx:PZB-has-GUE($current-pzb-elemente)">
                <xsl:sequence select="'Km'"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="PZB_Element_Zuordnung" mode="diagnostic-s7" as="xs:string?">
        <xsl:variable name="current-pzb-elemente" select="key('PZB_Element-fuerPZB_Element_Zuordnung', Identitaet/Wert, /*)"/>
        <xsl:variable name="current-gues" select="$current-pzb-elemente/PZB_Element_GUE"/>
        <xsl:if test="fx:PZB-has-GUE($current-pzb-elemente)">
            <xsl:variable name="current-gleis" as="xs:string?" select="fx:Bezeichnung-fuerGleis($current-pzb-elemente[PZB_Element_GUE], /*, true())"/>
            <xsl:sequence select="concat(if (fx:PZB-has-GM($current-pzb-elemente)) then 'Km ' else '', fx:Km-fuerStrecke($current-pzb-elemente[PZB_Element_GUE][1]),                 if ($current-gleis) then concat(', Gleis ', $current-gleis) else '')"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="PZB_Zuordnung_Signal" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'04'"/>
    </xsl:template>

    <xsl:template match="PZB_Zuordnung_Signal" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'PZB-Zuordnung'"/>
    </xsl:template>
    
    <xsl:template match="PZB_Zuordnung_Signal" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="current-pzb-element-zuordnung" select="key('PZB_Element_Zuordnung', ID_PZB_Element_Zuordnung/Wert, parent::*)"/>
        <xsl:variable name="current-typ" select="key('Identitaet', ($current-pzb-element-zuordnung/*/ID_PZB_Element_Bezugspunkt/Wert)[1], /*)/.."/>
        <xsl:sequence select="string-join($current-typ/*/Bezeichnung_Tabelle/Wert, ', ')"/>
    </xsl:template>
    
    <xsl:template match="PZB_Zuordnung_Signal" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="current-signal" select="key('Signal', ID_Signal/Wert, /*)"/>
        <xsl:variable name="current-vorsignal" select="starts-with($current-signal/*/Signal_Real_Aktiv_Schirm/Signal_Art/Wert, 'Vorsignal')"/>
        <xsl:variable name="current-signalbegriff" select="fx:Signalbegriff-fuerSignal($current-signal, /*)"/>
        <xsl:variable name="current-haltetafel" select="$current-signalbegriff/Signalbegriff_ID[substring-after(@xsi:type, ':') = 'Ne_5']"/>
        <xsl:choose>
            <xsl:when test="$current-vorsignal">
                <xsl:sequence select="fx:Bezeichnung-fuerSignal(., /*, true())"/>
            </xsl:when>
            <xsl:when test="$current-haltetafel">
                <xsl:sequence select="$signalbegriff-typ/planpro:bezeichnung[@kurz = 'Ne_5']/planpro:bezeichnung_ds/text()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'unbekannte PZB-Signalzuordnung'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="RBC" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="RBC" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'RBC'"/>
    </xsl:template>
    
    <xsl:template match="RBC" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="string-join(*/Bezeichnung_RBC/Wert, ', ')"/>
    </xsl:template>
    
    <xsl:template match="Schaltmittel_Zuordnung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:variable name="current-schalter" select="ID_Schalter/Wert"/>
        <xsl:variable name="fma-komponente" select="key('FMA_Komponente', $current-schalter, /*)"/>
        <xsl:variable name="fma-anlage" select="key('FMA_Anlage', $current-schalter, /*)"/>
        <xsl:choose>
            <xsl:when test="$fma-anlage">
                <xsl:choose>
                    <xsl:when test="fx:FMAAnlage-has-Kennbuchstabe($fma-anlage, $fma-anlage/parent::*)">
                        <xsl:sequence select="'29'"/>                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="'03'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$fma-komponente">
                <xsl:choose>
                    <xsl:when test="fx:showsStrecke-fuerFMA_Komponente($fma-komponente)">
                        <xsl:sequence select="'50'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="'16'"/>
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
    </xsl:template>

    <xsl:template match="Schaltmittel_Zuordnung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Schaltmittel-Zuordnung'"/>
    </xsl:template>
    
    <xsl:template match="Schaltmittel_Zuordnung" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="art" select="Schaltmittel_Funktion"/>
        <xsl:sequence select="fx:Bezeichnung-fuerSonstige($art, /*, $schaltmittel-funktion, 'Sonstige Funktion')"/>
    </xsl:template>
    
    <xsl:template match="Schaltmittel_Zuordnung" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="current-schalter" select="ID_Schalter/Wert"/>
        <xsl:variable name="fma-anlage" select="key('FMA_Anlage', $current-schalter, /*)"/>
        <xsl:variable name="fma-komponente" select="key('FMA_Komponente', $current-schalter, /*)"/>
        <xsl:variable name="zugeinwirkung" select="key('Zugeinwirkung', $current-schalter, /*)"/>
        <xsl:variable name="Search-Objekt" select="key('Identitaet', $current-schalter, /*)/.."/>
        <xsl:choose>
            <xsl:when test="$fma-anlage">
                <xsl:sequence select="concat('Freimeldeabschnitt ', fx:Bezeichnung-fuerFMAAnlage($fma-anlage, /*))"/>
            </xsl:when>
            <xsl:when test="$fma-komponente">
                <xsl:sequence select="string-join(fx:Art-fuerFMA_Komponente($fma-komponente), ', ')"/>
            </xsl:when>
            <xsl:when test="$zugeinwirkung">
                <xsl:sequence select="fx:Art-fuerZugeinwirkung($zugeinwirkung, /*)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="string-join($Search-Objekt/*/Bezeichnung_Tabelle/Wert, ', ')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Schaltmittel_Zuordnung" mode="diagnostic-s4" as="xs:string?">
        <xsl:variable name="current-schalter" select="ID_Schalter/Wert"/>
        <xsl:variable name="fma-anlage" select="key('FMA_Anlage', $current-schalter, /*)"/>
        <xsl:variable name="fma-komponente" select="key('FMA_Komponente', $current-schalter, /*)"/>
        <xsl:variable name="zugeinwirkung" select="key('Zugeinwirkung', $current-schalter, /*)"/>
        <xsl:choose>
            <xsl:when test="$fma-anlage">
                <xsl:sequence select="fx:Bezeichnung-fuerFMAAnlage-Kennbuchstabe($fma-anlage, parent::*)"/>
            </xsl:when>
            <xsl:when test="$fma-komponente">
                <xsl:choose>
                    <xsl:when test="fx:showsStrecke-fuerFMA_Komponente($fma-komponente)">
                        <xsl:sequence select="'Strecke'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="fx:Bezeichnung-fuerFMAKomponente($fma-komponente)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$zugeinwirkung">
                <xsl:sequence select="fx:Bezeichnung-fuerZugeinwirkung($zugeinwirkung)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Schaltmittel_Zuordnung" mode="diagnostic-s5" as="xs:string?">
        <xsl:variable name="current-schalter" select="ID_Schalter/Wert"/>
        <xsl:variable name="fma-anlage" select="key('FMA_Anlage', $current-schalter, /*)"/>
        <xsl:variable name="fma-komponente" select="key('FMA_Komponente', $current-schalter, /*)"/>
        <xsl:choose>
            <xsl:when test="$fma-anlage">
                <xsl:sequence select="fx:Bezeichnung-fuerFMAAnlage-OertlicherElementname($fma-anlage, parent::*)"/>    
            </xsl:when>
            <xsl:when test="$fma-komponente">
                <xsl:if test="fx:showsStrecke-fuerFMA_Komponente($fma-komponente)">
                    <xsl:sequence select="fx:Bezeichnung-fuerStrecke($fma-komponente, /*)"/>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Schaltmittel_Zuordnung" mode="diagnostic-s6" as="xs:string?">
        <xsl:variable name="fma-komponente" select="key('FMA_Komponente', ID_Schalter/Wert, /*)"/>
        <xsl:if test="$fma-komponente">
            <xsl:if test="fx:showsStrecke-fuerFMA_Komponente($fma-komponente)">
                <xsl:sequence select="'Km'"/>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Schaltmittel_Zuordnung" mode="diagnostic-s7" as="xs:string?">
        <xsl:variable name="fma-komponente" select="key('FMA_Komponente', ID_Schalter/Wert, /*)"/>
        <xsl:if test="$fma-komponente">
            <xsl:if test="fx:showsStrecke-fuerFMA_Komponente($fma-komponente)">
                <xsl:variable name="current-gleis" as="xs:string?" select="fx:Bezeichnung-fuerGleis($fma-komponente, /*, true())"/>
                <xsl:sequence select="concat(fx:Km-fuerStrecke($fma-komponente),                     if ($current-gleis) then concat(', Gleis ', $current-gleis) else '')"/>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Schloss" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test=" Schloss_Sk | Schloss_Sonderanlage">
                <xsl:sequence select="'00'"/>
            </xsl:when>
            <xsl:when test="Schloss_Gsp">
                <xsl:sequence select="'18'"/>
            </xsl:when>
            <xsl:when test="Schloss_BUE | Schloss_Ssp">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:when test="Schloss_W">
                <xsl:sequence select="'05'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'00'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Schloss" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Schloss'"/>
    </xsl:template>
    
    <xsl:template match="Schloss" mode="diagnostic-s2" as="xs:string?">
        <xsl:choose>
            <xsl:when test="Schloss_BUE">
                <xsl:sequence select="fx:Bezeichnung-fuerBUEAnlage(., /*)"/>
            </xsl:when>
            <xsl:when test="Schloss_Gsp">
                <xsl:sequence select="'Gsp'"/>
            </xsl:when>
            <xsl:when test="Schloss_Sk">
                <xsl:sequence select="fx:Bezeichnung-fuerSchlosskombination(., /*)"/>
            </xsl:when>
            <xsl:when test="Schloss_Sonderanlage">
                <xsl:sequence select="'Sonderanlage'"/>
            </xsl:when>
            <xsl:when test="Schloss_Ssp">
                <xsl:sequence select="fx:Art-fuerSchluesselsperre(., /*)"/>
            </xsl:when>
            <xsl:when test="Schloss_W">
                <xsl:sequence select="fx:Bezeichnung-fuerWKrGspElement(*/ID_W_Kr_Element, /*)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Schloss" mode="diagnostic-s3" as="xs:string?">
        <xsl:choose>
            <xsl:when test="Schloss_Gsp">
                <xsl:sequence select="fx:Bezeichnung-fuerWKrGspElement(*/ID_Gsp_Element, /*)"/>
            </xsl:when>
            <xsl:when test="Schloss_Ssp">
                <xsl:sequence select="fx:Bezeichnung-fuerSchluesselsperre(., /*)"/>
            </xsl:when>
            <xsl:when test="Schloss_W">
                <xsl:variable name="art" select="*/W_Lage/Wert"/>
                <xsl:sequence select="$lage-typ/planpro:bezeichnung[@kurz = $art]/text()"/>
            </xsl:when>
            <xsl:when test="Schloss_BUE">
                <xsl:sequence select="Schloss_BUE/BUE_Lage/Wert/text()"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Schloss" mode="diagnostic-s4" as="xs:string?">
        <xsl:if test="Schloss_Gsp">
            <xsl:sequence select="Schloss_Gsp/Gsp_Lage/Wert/text()"/>
        </xsl:if>
    </xsl:template>    
    
    <xsl:template match="Schlosskombination" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Schlosskombination" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Schlosskombination'"/>
    </xsl:template>
    
    <xsl:template match="Schlosskombination" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerSchlosskombination(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Schluessel" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Schluessel" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Schlüssel'"/>
    </xsl:template>
    
    <xsl:template match="Schluessel" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="*/Bezeichnung_Schluessel/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="Schluesselsperre" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Schluesselsperre" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerSchluesselsperre(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Schluesselsperre" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerSchluesselsperre(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Schrankenantrieb" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Schrankenantrieb" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Schrankenantrieb'"/>
    </xsl:template>
    
    <xsl:template match="Schrankenantrieb" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="*/Bez_Schrankenantrieb/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="Signal" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="fx:showsStrecke-fuerSignal(., /*)">
                <xsl:sequence select="'56'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'00'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Signal" mode="diagnostic-s1" as="xs:string?">
        <xsl:variable name="current-signalbegriff" select="fx:Signalbegriff-fuerSignal(., /*)"/>
        <xsl:choose>
            <xsl:when test="$current-signalbegriff/Signalbegriff_ID/substring-after(@xsi:type, ':') = 'Ra_12'">
                <xsl:sequence select="'Gz'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Signal'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Signal" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerSignal(., /*, false())"/>
    </xsl:template>
    
    <xsl:template match="Signal" mode="diagnostic-s3" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:sequence select="'Strecke'"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Signal" mode="diagnostic-s4" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:sequence select="fx:Bezeichnung-fuerStrecke(., /*)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Signal" mode="diagnostic-s5" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:sequence select="'Km'"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Signal" mode="diagnostic-s6" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:sequence select="fx:Km-fuerStrecke(.)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Signal" mode="diagnostic-s7" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:variable name="current-gleis" as="xs:string?" select="fx:Bezeichnung-fuerGleis(., /*, true())"/>
            <xsl:if test="$current-gleis">
                <xsl:sequence select="concat('Gleis ', $current-gleis)"/>    
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Signal_Befestigung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:variable name="signal-rahmen" select="fx:SignalRahmen-fuerSignalBefestigung(., /*)"/>
        <xsl:choose>
            <xsl:when test="$signal-rahmen and not(fx:showsStrecke-fuerSignal($signal-rahmen, /*))">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'56'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Signal_Befestigung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Signalbefestigung'"/>
    </xsl:template>
    
    <xsl:template match="Signal_Befestigung" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="signal-rahmen" select="fx:SignalRahmen-fuerSignalBefestigung(., /*)"/>
        <xsl:choose>
            <xsl:when test="key('Signal', $signal-rahmen/ID_Signal/Wert, /*)">
                <xsl:sequence select="fx:Bezeichnung-fuerSignal($signal-rahmen, /*, true())"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="concat('Strecke ', fx:Bezeichnung-fuerStrecke(., /*))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Signal_Befestigung" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="signal-rahmen" select="fx:SignalRahmen-fuerSignalBefestigung(., /*)"/>
        <xsl:choose>
            <xsl:when test="key('Signal', $signal-rahmen/ID_Signal/Wert, /*)">
                <xsl:choose>
                    <xsl:when test="not(fx:showsStrecke-fuerSignal($signal-rahmen, /*))">
                        <xsl:sequence select="fx:Art-fuerSignalBefestigung(., /*)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="'Strecke'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Km'"/>                
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Signal_Befestigung" mode="diagnostic-s4" as="xs:string?">
        <xsl:variable name="signal-rahmen" select="fx:SignalRahmen-fuerSignalBefestigung(., /*)"/>
        <xsl:variable name="signal" select="key('Signal', $signal-rahmen/ID_Signal/Wert, /*)"/>
        <xsl:choose>
            <xsl:when test="$signal">
                <xsl:if test="fx:showsStrecke-fuerSignal($signal-rahmen, /*)">
                    <xsl:sequence select="fx:Bezeichnung-fuerStrecke($signal, /*)"/>
                </xsl:if>                
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="fx:Km-fuerStrecke(.)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Signal_Befestigung" mode="diagnostic-s5" as="xs:string?">
        <xsl:variable name="signal-rahmen" select="fx:SignalRahmen-fuerSignalBefestigung(., /*)"/>
        <xsl:choose>
            <xsl:when test="key('Signal', $signal-rahmen/ID_Signal/Wert, /*)">
                <xsl:if test="fx:showsStrecke-fuerSignal($signal-rahmen, /*)">
                    <xsl:sequence select="'Km'"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Gleis'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Signal_Befestigung" mode="diagnostic-s6" as="xs:string?">
        <xsl:variable name="signal-rahmen" select="fx:SignalRahmen-fuerSignalBefestigung(., /*)"/>
        <xsl:variable name="signal" select="key('Signal', $signal-rahmen/ID_Signal/Wert, /*)"/>
        <xsl:choose>
            <xsl:when test="$signal">
                <xsl:if test="fx:showsStrecke-fuerSignal($signal-rahmen, /*)">
                    <xsl:variable name="current-gleis" select="fx:Bezeichnung-fuerGleis($signal, /*, true())"/>
                    <xsl:sequence select="concat(fx:Km-fuerStrecke($signal),                         if ($current-gleis) then concat(', Gleis ', $current-gleis) else '')"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="current-gleis" select="fx:Bezeichnung-fuerGleis(., /*, true())"/>
                <xsl:if test="$current-gleis">
                    <xsl:sequence select="$current-gleis"/>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Signal_Befestigung" mode="diagnostic-s7" as="xs:string?">
        <xsl:variable name="signal-rahmen" select="fx:SignalRahmen-fuerSignalBefestigung(., /*)"/>
        <xsl:if test="fx:showsStrecke-fuerSignal($signal-rahmen, /*)">
            <xsl:sequence select="fx:Art-fuerSignalBefestigung(., /*)"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Signal_Rahmen" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="not(fx:showsStrecke-fuerSignal(., /*))">
                <xsl:sequence select="'01'"/>                
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'56'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Signal_Rahmen" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Signalrahmen'"/>
    </xsl:template>

    <xsl:template match="Signal_Rahmen" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerSignal(., /*, true())"/>
    </xsl:template>
    
    <xsl:template match="Signal_Rahmen" mode="diagnostic-s3" as="xs:string?">
        <xsl:choose>
            <xsl:when test="not(fx:showsStrecke-fuerSignal(., /*))">
                <xsl:sequence select="fx:Art-fuerSignalRahmen(., /*)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Strecke'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Signal_Rahmen" mode="diagnostic-s4" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:sequence select="fx:Bezeichnung-fuerStrecke(key('Signal', ID_Signal/Wert, /*), /*)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Signal_Rahmen" mode="diagnostic-s5" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:sequence select="'Km'"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Signal_Rahmen" mode="diagnostic-s6" as="xs:string?">
        <xsl:variable name="signal" select="key('Signal', ID_Signal/Wert, /*)"/>
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:variable name="current-gleis" as="xs:string?" select="fx:Bezeichnung-fuerGleis($signal, /*, true())"/>
            <xsl:sequence select="concat(fx:Km-fuerStrecke($signal),                 if ($current-gleis) then concat(', Gleis ', $current-gleis) else '')"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Signal_Rahmen" mode="diagnostic-s7" as="xs:string?">
        <xsl:if test="fx:showsStrecke-fuerSignal(., /*)">
            <xsl:sequence select="fx:Art-fuerSignalRahmen(., /*)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Signal_Signalbegriff" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="not(fx:showsStrecke-fuerSignal(fx:Signal-fuerSignalbegriff(., /*), /*))">
                <xsl:choose>
                    <xsl:when test="Signalbegriff_ID/Symbol">
                        <xsl:sequence select="'31'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="'1A'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'57'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Signal_Signalbegriff" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Signalbegriff'"/>
    </xsl:template>
    
    <xsl:template match="Signal_Signalbegriff" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="current-signalbegriff_id" select="Signalbegriff_ID/substring-after(@xsi:type, ':')"/>
        <xsl:variable name="current-signalbegriff-bezeichnung" select="$signalbegriff-typ/planpro:bezeichnung[@kurz = $current-signalbegriff_id]"/>
        <xsl:sequence select="fx:choose_signalbegriff($current-signalbegriff-bezeichnung)"/>
    </xsl:template>
    
    <xsl:template match="Signal_Signalbegriff" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="current-signal" select="fx:Signal-fuerSignalbegriff(., /*)"/>
        <xsl:variable name="current-symbol" select="Signalbegriff_ID/Symbol"/>
        <xsl:choose>
            <xsl:when test="$current-symbol">
                <xsl:sequence select="$current-symbol/text()"/>                
            </xsl:when>
            <xsl:when test="not(fx:showsStrecke-fuerSignal($current-signal, /*))">
                <xsl:choose>
                    <xsl:when test="Signalbegriff_ID/substring-after(@xsi:type, ':') = 'Ra_12'">
                        <xsl:sequence select="'an Weiche'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="'am Signal'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Strecke'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Signal_Signalbegriff" mode="diagnostic-s4" as="xs:string?">
        <xsl:variable name="current-signal" select="fx:Signal-fuerSignalbegriff(., /*)"/>
        <xsl:choose>
            <xsl:when test="not(fx:showsStrecke-fuerSignal($current-signal, /*))">
                <xsl:choose>
                    <xsl:when test="Signalbegriff_ID/Symbol">
                        <xsl:sequence select="'am Signal'"/>
                    </xsl:when>
                    <xsl:when test="Signalbegriff_ID/substring-after(@xsi:type, ':') = 'Ra_12'">
                        <xsl:sequence select="fx:Bezeichnung-fuerWKrGspElement(key('W_Kr_Gsp_Element-fuerGrenzzeichen', $current-signal/Identitaet/Wert, /*), /*)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="fx:Bezeichnung-fuerSignal($current-signal, /*, false())"/>                        
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="fx:Bezeichnung-fuerStrecke($current-signal, /*)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="Signal_Signalbegriff" mode="diagnostic-s5" as="xs:string?">
        <xsl:variable name="current-signal" select="fx:Signal-fuerSignalbegriff(., /*)"/>
        <xsl:choose>
            <xsl:when test="not(fx:showsStrecke-fuerSignal($current-signal, /*))">
                <xsl:if test="Signalbegriff_ID/Symbol">
                    <xsl:sequence select="fx:Bezeichnung-fuerSignal($current-signal, /*, false())"/>                        
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Km'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Signal_Signalbegriff" mode="diagnostic-s6" as="xs:string?">
        <xsl:variable name="current-signal" select="fx:Signal-fuerSignalbegriff(., /*)"/>
        <xsl:if test="fx:showsStrecke-fuerSignal($current-signal, /*)">
            <xsl:sequence select="fx:Km-fuerStrecke($current-signal)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Signal_Signalbegriff" mode="diagnostic-s7" as="xs:string?">
        <xsl:variable name="current-signal" select="fx:Signal-fuerSignalbegriff(., /*)"/>
        <xsl:if test="fx:showsStrecke-fuerSignal($current-signal, /*)">
            <xsl:variable name="current-gleis" as="xs:string?" select="fx:Bezeichnung-fuerGleis($current-signal, /*, false())"/>
            <xsl:if test="$current-gleis">
                <xsl:sequence select="concat('Gleis ', $current-gleis)"/>    
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Sonstiger_Punkt" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:variable name="current-beginn-bereich" select="ID_Beginn_Bereich/Wert"/>
        <xsl:choose>
            <xsl:when test="key('Bahnsteig_Kante', $current-beginn-bereich, parent::*)">
                <xsl:sequence select="'00'"/>
            </xsl:when>
            <xsl:when test="key('BUE_Gleisbezogener_Gefahrraum', $current-beginn-bereich, /*)">
                <xsl:sequence select="'18'"/>
            </xsl:when>
            <xsl:when test="key('Markanter_Punkt-fuerMarkante_Stelle', Identitaet/Wert, /*)">
                <xsl:sequence select="'00'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'54'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Sonstiger_Punkt" mode="diagnostic-s1" as="xs:string?">
        <xsl:variable name="current-beginn-bereich" select="ID_Beginn_Bereich/Wert"/>
        <xsl:choose>
            <xsl:when test="key('Bahnsteig_Kante', $current-beginn-bereich, parent::*)">
                <xsl:sequence select="'Beginn Bahnsteigkante'"/>
            </xsl:when>
            <xsl:when test="key('BUE_Gleisbezogener_Gefahrraum', $current-beginn-bereich, /*)">
                <xsl:sequence select="'Beginn BÜ-Gefahrraum'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Sonstiger Punkt'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Sonstiger_Punkt" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="current-typ" select="key('Identitaet', ID_Beginn_Bereich/Wert, /*)/.."/>
        <xsl:variable name="markanter-punkt" select="key('Markanter_Punkt-fuerMarkante_Stelle', Identitaet/Wert, /*)"/>
        <xsl:choose>
            <xsl:when test="$current-typ/self::Bahnsteig_Kante">
                <xsl:sequence select="fx:Bezeichnung-fuerBahnsteigKante($current-typ, /*)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::BUE_Gleisbezogener_Gefahrraum">
                <xsl:sequence select="'Bahnübergang'"/>
            </xsl:when>
            <xsl:when test="$markanter-punkt">
                <xsl:sequence select="fx:Bezeichnung-fuerMarkanterPunkt($markanter-punkt, /*)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'Strecke'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Sonstiger_Punkt" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="bue-gleisbezogener-gefahrraum" select="fx:Bezeichnung-fuerBUEAnlage(., /*)"/>
        <xsl:variable name="markanter-punkt" select="key('Markanter_Punkt-fuerMarkante_Stelle', Identitaet/Wert, /*)"/>
        <xsl:variable name="bahnsteig-kante" select="key('Bahnsteig_Kante', ID_Beginn_Bereich/Wert, parent::*)"/>
        <xsl:choose>
            <xsl:when test="$bue-gleisbezogener-gefahrraum">
                <xsl:sequence select="$bue-gleisbezogener-gefahrraum"/>
            </xsl:when>
            <xsl:when test="not($markanter-punkt) and not($bahnsteig-kante)">
                <xsl:sequence select="fx:Bezeichnung-fuerStrecke(., /*)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Sonstiger_Punkt" mode="diagnostic-s4" as="xs:string?">
        <xsl:variable name="bue-gleisbezogener-gefahrraum" select="fx:Gleise-fuerBUEGefahrraum(ID_Beginn_Bereich/Wert, /*)"/>
        <xsl:variable name="markanter-punkt" select="key('Markanter_Punkt-fuerMarkante_Stelle', Identitaet/Wert, /*)"/>
        <xsl:variable name="bahnsteig-kante" select="key('Bahnsteig_Kante', ID_Beginn_Bereich/Wert, parent::*)"/>
        <xsl:choose>
            <xsl:when test="string-length($bue-gleisbezogener-gefahrraum) gt 6">
                <xsl:sequence select="string-join($bue-gleisbezogener-gefahrraum, ', ')"/>
            </xsl:when>
            <xsl:when test="not($markanter-punkt) and not($bahnsteig-kante)">
                <xsl:sequence select="'Km'"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Sonstiger_Punkt" mode="diagnostic-s5" as="xs:string?">
        <xsl:variable name="bue-gleisbezogener-gefahrraum" select="key('BUE_Gleisbezogener_Gefahrraum', ID_Beginn_Bereich/Wert, /*)"/>
        <xsl:variable name="markanter-punkt" select="key('Markanter_Punkt-fuerMarkante_Stelle', Identitaet/Wert, /*)"/>
        <xsl:variable name="bahnsteig-kante" select="key('Bahnsteig_Kante', ID_Beginn_Bereich/Wert, parent::*)"/>
        <xsl:if test="not($markanter-punkt) and not($bahnsteig-kante) and not($bue-gleisbezogener-gefahrraum)">
            <xsl:sequence select="fx:Km-fuerStrecke(.)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Sonstiger_Punkt" mode="diagnostic-s6" as="xs:string?">
        <xsl:variable name="bue-gleisbezogener-gefahrraum" select="key('BUE_Gleisbezogener_Gefahrraum', ID_Beginn_Bereich/Wert, /*)"/>
        <xsl:variable name="markanter-punkt" select="key('Markanter_Punkt-fuerMarkante_Stelle', Identitaet/Wert, /*)"/>
        <xsl:variable name="bahnsteig-kante" select="key('Bahnsteig_Kante', ID_Beginn_Bereich/Wert, parent::*)"/>
        <xsl:if test="not($markanter-punkt) and not($bahnsteig-kante) and not($bue-gleisbezogener-gefahrraum)">
            <xsl:sequence select="'Gleis'"/>                    
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Sonstiger_Punkt" mode="diagnostic-s7" as="xs:string?">
        <xsl:variable name="bue-gleisbezogener-gefahrraum" select="key('BUE_Gleisbezogener_Gefahrraum', ID_Beginn_Bereich/Wert, /*)"/>
        <xsl:variable name="markanter-punkt" select="key('Markanter_Punkt-fuerMarkante_Stelle', Identitaet/Wert, /*)"/>
        <xsl:variable name="bahnsteig-kante" select="key('Bahnsteig_Kante', ID_Beginn_Bereich/Wert, parent::*)"/>
        <xsl:if test="not($markanter-punkt) and not($bahnsteig-kante) and not($bue-gleisbezogener-gefahrraum)">
            <xsl:sequence select="fx:Bezeichnung-fuerGleis(., /*, false())"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Stell_Bereich" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="ID_Aussenelementansteuerung">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'00'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Stell_Bereich" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Stellbereich'"/>
    </xsl:template>
    
    <xsl:template match="Stell_Bereich" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="current-aussenelementansteuerung" select="key('Aussenelementansteuerung', ID_Aussenelementansteuerung/Wert, parent::*)"/>
        <xsl:choose>
            <xsl:when test="$current-aussenelementansteuerung">
                <xsl:sequence select="fx:Art-fuerAussenelementansteuerung($current-aussenelementansteuerung, /*)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="Bezeichnung_Stellwerk/Wert/text()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Stell_Bereich" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="aussenelementansteuerung" select="key('Aussenelementansteuerung', ID_Aussenelementansteuerung/Wert, parent::*)"/>
        <xsl:if test="$aussenelementansteuerung">
            <xsl:sequence select="fx:Bezeichnung-fuerAussenelementansteuerung($aussenelementansteuerung, /*)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Stellelement" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'01'"/>
    </xsl:template>
    
    <xsl:template match="Stellelement" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Stellelement'"/>
    </xsl:template>
    
    <xsl:template match="Stellelement" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="aussenelementansteuerung" select="key('Aussenelementansteuerung', ID_Information/Wert, parent::*)"/>
        <xsl:if test="$aussenelementansteuerung">
            <xsl:sequence select="fx:Art-fuerAussenelementansteuerung($aussenelementansteuerung, /*)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Stellelement" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="aussenelementansteuerung" select="key('Aussenelementansteuerung', ID_Information/Wert, parent::*)"/>
        <xsl:if test="$aussenelementansteuerung">
            <xsl:sequence select="fx:Bezeichnung-fuerAussenelementansteuerung($aussenelementansteuerung, /*)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Strecke" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Strecke" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Strecke'"/>
    </xsl:template>
    
    <xsl:template match="Strecke" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerStrecke(., parent::*)"/>
    </xsl:template>    
    
    <xsl:template match="Strecke_Punkt" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'20'"/>
    </xsl:template>

    <xsl:template match="Strecke_Punkt" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Streckenpunkt'"/>
    </xsl:template>
    
    <xsl:template match="Strecke_Punkt" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="'Strecke'"/>
    </xsl:template>
    
    <xsl:template match="Strecke_Punkt" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerStrecke(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Strecke_Punkt" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="'Km'"/>
    </xsl:template>
    
    <xsl:template match="Strecke_Punkt" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="format-number(Strecke_Meter/Wert div 1000, '0,000', 'd')"/>
    </xsl:template>
    
    <xsl:template match="Technik_Standort" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Technik_Standort" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'DTZ/TSO'"/> <!-- Digitale Technik-Zentrale / Technik-Standort -->
    </xsl:template>
    
    <xsl:template match="Technik_Standort" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerTechnikStandort(.)"/>
    </xsl:template>
    
    <xsl:template match="Technischer_Bereich" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Technischer_Bereich" mode="diagnostic-s1" as="xs:string?">
        <xsl:variable name="art" select="TB_Art"/>        
        <xsl:sequence select="fx:Bezeichnung-fuerSonstige($art, /*, $tb-typ, 'Sonstiger Technischer Bereich')"/>
    </xsl:template>
    
    <xsl:template match="Technischer_Bereich" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="TB_Beschreibung/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="Technischer_Punkt" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Technischer_Punkt" mode="diagnostic-s1" as="xs:string?">
        <xsl:variable name="art" select="TP_Art"/>
        <xsl:sequence select="fx:Bezeichnung-fuerSonstige($art, /*, $tp-typ, 'Sonstiger Technischer Punkt')"/>
    </xsl:template>
    
    <xsl:template match="Technischer_Punkt" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="TP_Beschreibung/Wert/text()"/>
    </xsl:template>
    
    <xsl:template match="TOP_Kante" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'02'"/>
    </xsl:template>

    <xsl:template match="TOP_Kante" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Top-Kante'"/>
    </xsl:template>
    
    <xsl:template match="TOP_Kante" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerTOPKnoten(ID_TOP_Knoten_A, parent::*)"/>
    </xsl:template>
    
    <xsl:template match="TOP_Kante" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerTOPKnoten(ID_TOP_Knoten_B, parent::*)"/>
    </xsl:template>
    
    <xsl:template match="TOP_Knoten" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:variable name="current-id" select="Identitaet/Wert"/>
        <xsl:variable name="current-top-kanten" select="key('TOP_Kante-fuerTOP_Knoten_A', $current-id, parent::*)[*/TOP_Anschluss_A/Wert = ('Rechts', 'Links')] |             key('TOP_Kante-fuerTOP_Knoten_B', $current-id, parent::*)[*/TOP_Anschluss_B/Wert = ('Rechts', 'Links')]"/>
        <xsl:variable name="current-w-kr-gsp-komponente" select="key('W_Kr_Gsp_Komponente_POT-fuerTOP_Kante', $current-top-kanten/Identitaet/Wert, /*)"/>
        <xsl:choose>
            <xsl:when test="$current-w-kr-gsp-komponente">
                <xsl:sequence select="'16'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'00'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="TOP_Knoten" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Top-Knoten'"/>
    </xsl:template>
    
    <xsl:template match="TOP_Knoten" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerTOPKnoten(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="TOP_Knoten" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="current-id" select="Identitaet/Wert"/>
        <xsl:variable name="current_TOP_Kante_AnschlussA" select="key('TOP_Kante-fuerTOP_Knoten_A', $current-id, parent::*)[TOP_Kante_Allg/TOP_Anschluss_A/Wert = ('Rechts', 'Links')]"/>
        <xsl:variable name="current_TOP_Kante_AnschlussB" select="key('TOP_Kante-fuerTOP_Knoten_B', $current-id, parent::*)[TOP_Kante_Allg/TOP_Anschluss_B/Wert = ('Rechts', 'Links')]"/>
        <xsl:sequence select="fx:Art-fuerWKrGspKomponente(fx:W_Kr_Gsp_Komponente-for-TOP_Knoten($current-id, ($current_TOP_Kante_AnschlussA | $current_TOP_Kante_AnschlussB))/..)"/>
    </xsl:template>
    
    <xsl:template match="TOP_Knoten" mode="diagnostic-s4" as="xs:string?">
        <xsl:variable name="current-id" select="Identitaet/Wert"/>
        <xsl:variable name="current_TOP_Kante_AnschlussA" select="key('TOP_Kante-fuerTOP_Knoten_A', $current-id, parent::*)[TOP_Kante_Allg/TOP_Anschluss_A/Wert = ('Rechts', 'Links')]"/>
        <xsl:variable name="current_TOP_Kante_AnschlussB" select="key('TOP_Kante-fuerTOP_Knoten_B', $current-id, parent::*)[TOP_Kante_Allg/TOP_Anschluss_B/Wert = ('Rechts', 'Links')]"/>
        <xsl:variable name="current-W-Kr-Gsp-Komponente" select="fx:W_Kr_Gsp_Komponente-for-TOP_Knoten($current-id, ($current_TOP_Kante_AnschlussA | $current_TOP_Kante_AnschlussB))/.."/>
        <xsl:if test="$current-W-Kr-Gsp-Komponente">
            <xsl:sequence select="fx:Bezeichnung-fuerWKrGspElement($current-W-Kr-Gsp-Komponente/ID_W_Kr_Gsp_Element, /*)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Trasse_Kante" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'43'"/>
    </xsl:template>

    <xsl:template match="Trasse_Kante" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Trassen-Kante'"/>
    </xsl:template>
    
    <xsl:template match="Trasse_Kante" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="art" select="Trasse_Kante_Art"/>
        <xsl:sequence select="fx:Bezeichnung-fuerSonstige($art, /*, $trasse-art, 'Sonstige Trassen-Kante')"/>
    </xsl:template>
    
    <xsl:template match="Trasse_Kante" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerTrasseKnoten(ID_Trasse_Knoten_A, /*)"/>
    </xsl:template>
    
    <xsl:template match="Trasse_Kante" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerTrasseKnoten(ID_Trasse_Knoten_A, /*)"/>
    </xsl:template>
    
    <xsl:template match="Trasse_Kante" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerTrasseKnoten(ID_Trasse_Knoten_B, /*)"/>
    </xsl:template>
    
    <xsl:template match="Trasse_Kante" mode="diagnostic-s6" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerTrasseKnoten(ID_Trasse_Knoten_B, /*)"/>
    </xsl:template>

    <xsl:template match="Trasse_Knoten" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'01'"/>
    </xsl:template>

    <xsl:template match="Trasse_Knoten" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Trassen-Knoten'"/>
    </xsl:template>
    
    <xsl:template match="Trasse_Knoten" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerTrasseKnoten(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Trasse_Knoten" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerTrasseKnoten(., /*)"/>
    </xsl:template>

    <xsl:template match="Ueberhoehung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:choose>
            <xsl:when test="*/GEO_PAD">
                <xsl:sequence select="'00'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'01'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Ueberhoehung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Überhöhung'"/>
    </xsl:template>
    
    <xsl:template match="Ueberhoehung" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerUeberhoehung(., parent::*, false())"/>
    </xsl:template>
    
    <xsl:template match="Ueberhoehung" mode="diagnostic-s3" as="xs:string?">
        <xsl:if test="not(*/GEO_PAD)">
            <xsl:sequence select="'m'"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Ueberhoehungslinie" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'13'"/>
    </xsl:template>

    <xsl:template match="Ueberhoehungslinie" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Überhöhungslinie'"/>
    </xsl:template>
    
    <xsl:template match="Ueberhoehungslinie" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="art" select="*/Ueberhoehungslinie_Form"/>
        <xsl:sequence select="fx:Bezeichnung-fuerSonstige($art, /*, $ueberhoehungslinien-form, 'Sonstige Überhöhungslinie')"/>
    </xsl:template>
    
    <xsl:template match="Ueberhoehungslinie" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerUeberhoehung(ID_Ueberhoehung_A, parent::*, true())"/>
    </xsl:template>
    
    <xsl:template match="Ueberhoehungslinie" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerUeberhoehung(ID_Ueberhoehung_B, parent::*, true())"/>
    </xsl:template>
    
    <xsl:template match="Unterbringung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:variable name="current-typ" select="key('Objekt-fuerUnterbringung', Identitaet/Wert, /*)"/>
        <xsl:choose>
            <xsl:when test="$current-typ/self::Aussenelementansteuerung">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Bedien_Einrichtung_Oertlich">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Bedien_Platz">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Bedien_Standort">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::GFR_Element">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Kabel_Verteilpunkt">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::PZB_Element">
                <xsl:sequence select="'57'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Schlosskombination">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Schluesselsperre">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Technik_Standort">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Verkehrszeichen">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::ZN">
                <xsl:sequence select="'01'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="'00'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Unterbringung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Unterbringung'"/>
    </xsl:template>
    
    <xsl:template match="Unterbringung" mode="diagnostic-s2" as="xs:string?">
        <xsl:variable name="current-typ" select="key('Objekt-fuerUnterbringung', Identitaet/Wert, /*)"/>
        <xsl:choose>
            <xsl:when test="$current-typ/self::Aussenelementansteuerung">
                <xsl:sequence select="fx:Art-fuerAussenelementansteuerung($current-typ, /*)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Bedien_Einrichtung_Oertlich">
                <xsl:sequence select="fx:Art-fuerBedienEinrichtung($current-typ, /*)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Bedien_Platz">
                <xsl:sequence select="'Bedienplatz'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Bedien_Standort">
                <xsl:sequence select="'DSZ/BSO'"/> <!-- Digitale Steuer-Zentrale / Bedien-Standort -->
            </xsl:when>
            <xsl:when test="$current-typ/self::ESTW_Zentraleinheit">
                <xsl:sequence select="fx:Bezeichnung-fuerESTWZentraleinheit($current-typ)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::GFR_Element">
                <xsl:sequence select="'GFR-Detektor'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Kabel_Verteilpunkt">
                <xsl:sequence select="fx:Art-fuerKabelVerteilpunkt($current-typ, /*)"/>            
            </xsl:when>
            <xsl:when test="$current-typ/self::PZB_Element">
                <xsl:sequence select="fx:Bezeichnung-fuerGUE($current-typ)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Schlosskombination">
                <xsl:sequence select="'Schlosskombination'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Schluesselsperre">
                <xsl:sequence select="fx:Art-fuerSchluesselsperre($current-typ, /*)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Technik_Standort">
                <xsl:sequence select="'DTZ/TSO'"/> <!-- Digitale Technik-Zentrale / Technik-Standort -->
            </xsl:when>
            <xsl:when test="$current-typ/self::Verkehrszeichen">
                <xsl:sequence select="'BÜ-Vz'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::ZN">
                <xsl:sequence select="'ZN'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="string-join($current-typ/*/Bezeichnung_Tabelle/Wert, ', ')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Unterbringung" mode="diagnostic-s3" as="xs:string?">
        <xsl:variable name="current-typ" select="key('Objekt-fuerUnterbringung', Identitaet/Wert, /*)"/>
        <xsl:choose>
            <xsl:when test="$current-typ/self::Aussenelementansteuerung">
                <xsl:sequence select="fx:Bezeichnung-fuerAussenelementansteuerung($current-typ, /*)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Bedien_Einrichtung_Oertlich">
                <xsl:sequence select="fx:Bezeichnung-fuerBedienEinrichtung($current-typ, /*)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Bedien_Platz">
                <xsl:sequence select="fx:Bezeichnung-fuerBedienPlatz($current-typ)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Bedien_Standort">
                <xsl:sequence select="fx:Bezeichnung-fuerBedienStandort($current-typ)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::GFR_Element">
                <xsl:sequence select="fx:Bezeichnung-fuerGFRElement($current-typ)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Kabel_Verteilpunkt">
                <xsl:sequence select="fx:Bezeichnung-fuerKabelVerteilpunkt($current-typ)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::PZB_Element">
                <xsl:sequence select="'Strecke'"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Schlosskombination">
                <xsl:sequence select="fx:Bezeichnung-fuerSchlosskombination($current-typ, /*)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Schluesselsperre">
                <xsl:sequence select="fx:Bezeichnung-fuerSchluesselsperre($current-typ, /*)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Technik_Standort">
                <xsl:sequence select="fx:Bezeichnung-fuerTechnikStandort($current-typ)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::Verkehrszeichen">
                <xsl:sequence select="fx:Bezeichnung-fuerVerkehrszeichen($current-typ)"/>
            </xsl:when>
            <xsl:when test="$current-typ/self::ZN">
                <xsl:sequence select="fx:Bezeichnung-fuerZN($current-typ, /*)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Unterbringung" mode="diagnostic-s4" as="xs:string?">
        <xsl:variable name="pzb-element" select="key('PZB_Element-fuerUnterbringung', Identitaet/Wert, /*)"/>
        <xsl:if test="$pzb-element">
            <xsl:sequence select="fx:Bezeichnung-fuerStrecke($pzb-element, /*)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Unterbringung" mode="diagnostic-s5" as="xs:string?">
        <xsl:variable name="pzb-element" select="key('PZB_Element-fuerUnterbringung', Identitaet/Wert, /*)"/>
        <xsl:if test="$pzb-element">
            <xsl:sequence select="'Km'"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Unterbringung" mode="diagnostic-s6" as="xs:string?">
        <xsl:variable name="pzb-element" select="key('PZB_Element-fuerUnterbringung', Identitaet/Wert, /*)"/>
        <xsl:if test="$pzb-element">
            <xsl:sequence select="fx:Km-fuerStrecke($pzb-element)"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Unterbringung" mode="diagnostic-s7" as="xs:string?">
        <xsl:variable name="pzb-element" select="key('PZB_Element-fuerUnterbringung', Identitaet/Wert, /*)"/>
        <xsl:if test="$pzb-element">
            <xsl:variable name="current-gleis" as="xs:string?" select="fx:Bezeichnung-fuerGleis($pzb-element, /*, false())"/>
            <xsl:if test="$current-gleis">
                <xsl:sequence select="concat('Gleis ', $current-gleis)"/>    
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Verkehrszeichen" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>
    
    <xsl:template match="Verkehrszeichen" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'BÜ-Vz'"/>
    </xsl:template>
    
    <xsl:template match="Verkehrszeichen" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerVerkehrszeichen(.)"/>
    </xsl:template>
    
    <xsl:template match="W_Kr_Anlage" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="W_Kr_Anlage" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerWKrAnlage(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="W_Kr_Anlage" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="replace(fx:Bezeichnung-fuerWKrGspElement(key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', Identitaet/Wert, parent::*), parent::*), 'AB|CD|A|B', '')"/>
    </xsl:template>
    
    <xsl:template match="W_Kr_Gsp_Element" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="W_Kr_Gsp_Element" mode="diagnostic-s1" as="xs:string?">
        <xsl:variable name="typ" as="xs:string?">
            <xsl:choose>
                <xsl:when test="Weiche_Element">
                    <xsl:sequence select="fx:Art-fuerWKrAnlage(., parent::*)"/>
                </xsl:when>
                <xsl:when test="Gleissperre_Element">
                    <xsl:sequence select="'Gsp'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="'Sonstiges Weichen'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:sequence select="concat($typ, '-Element')"/>
    </xsl:template>
    
    <xsl:template match="W_Kr_Gsp_Element" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerWKrGspElement(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="W_Kr_Gsp_Komponente" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="W_Kr_Gsp_Komponente" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerWKrGspKomponente(.)"/>
    </xsl:template>
    
    <xsl:template match="W_Kr_Gsp_Komponente" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerWKrGspElement(ID_W_Kr_Gsp_Element, parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Weichenlaufkette" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="Weichenlaufkette" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Weichenlaufkette'"/>
    </xsl:template>
    
    <xsl:template match="Weichenlaufkette" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerWeichenlaufkette(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Weichenlaufkette_Zuordnung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'10'"/>
    </xsl:template>

    <xsl:template match="Weichenlaufkette_Zuordnung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Weichenlaufkette'"/>
    </xsl:template>
    
    <xsl:template match="Weichenlaufkette_Zuordnung" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerWeichenlaufkette(., parent::*)"/>
    </xsl:template>
    
    <xsl:template match="Weichenlaufkette_Zuordnung" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="'Zuordnung Signal'"/>
    </xsl:template>
    
    <xsl:template match="Weichenlaufkette_Zuordnung" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerSignal(., /*, true())"/>
    </xsl:template>

    <xsl:template match="ZN" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="ZN" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Zugnummernmeldeanlage'"/>
    </xsl:template>

    <xsl:template match="ZN" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerZN(., /*)"/>
    </xsl:template>

    <xsl:template match="Zugeinwirkung" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'01'"/>
    </xsl:template>

    <xsl:template match="Zugeinwirkung" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="'Zugeinwirkung'"/>
    </xsl:template>
    
    <xsl:template match="Zugeinwirkung" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="fx:Art-fuerZugeinwirkung(., /*)"/>
    </xsl:template>
    
    <xsl:template match="Zugeinwirkung" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="fx:Bezeichnung-fuerZugeinwirkung(.)"/>
    </xsl:template>

    <xsl:template match="*" mode="diagnostic-aufbau" as="xs:string?">
        <xsl:sequence select="'00'"/>
    </xsl:template>

    <xsl:template match="*" mode="diagnostic-s1" as="xs:string?">
        <xsl:sequence select="name()"/>
    </xsl:template>

    <xsl:template match="*" mode="diagnostic-s2" as="xs:string?">
        <xsl:sequence select="(Bezeichnung/*/Wert/text())[1]"/>
    </xsl:template>

    <xsl:template match="*" mode="diagnostic-s3" as="xs:string?">
        <xsl:sequence select="''"/>        
    </xsl:template>    

    <xsl:template match="*" mode="diagnostic-s4" as="xs:string?">
        <xsl:sequence select="''"/>        
    </xsl:template>    

    <xsl:template match="*" mode="diagnostic-s5" as="xs:string?">
        <xsl:sequence select="''"/>        
    </xsl:template>    

    <xsl:template match="*" mode="diagnostic-s6" as="xs:string?">
        <xsl:sequence select="''"/>        
    </xsl:template>    

    <xsl:template match="*" mode="diagnostic-s7" as="xs:string?">
        <xsl:sequence select="''"/>        
    </xsl:template>    
</schema>
