<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:fx="http://tu-dresden.de/vlp/schematron/functions"
        xmlns:planpro="http://www.plan-pro.org/regeln/struktur"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        queryBinding="xslt2"
        schemaVersion="ISO19757-3">
   <title>Regelbasis für PlanPro-PlaZ</title>
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
   <!-- Variablen für gleichartige Bezeichnungen -->
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
      <planpro:bezeichnung kurz="ZUM">Zug-Umfahrmittelweichenteilfahrstraße</planpro:bezeichnung>
      <!-- Zug-Umfahr-Mwtfstr -->
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
   <xsl:variable name="lage-typ">
      <planpro:bezeichnung kurz="rechts">R</planpro:bezeichnung>
      <planpro:bezeichnung kurz="links">L</planpro:bezeichnung>
      <planpro:bezeichnung kurz="Spitze">Spitze</planpro:bezeichnung>
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
      <planpro:bezeichnung kurz="sonstige">sonstige Funktion</planpro:bezeichnung>
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
         <planpro:bezeichnung_ds>VSig-Bake 1</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>VSig-Bake 1</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_3_2str">
         <planpro:bezeichnung_ds>VSig-Bake 2</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>VSig-Bake 2</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_3_3str">
         <planpro:bezeichnung_ds>VSig-Bake 3</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>VSig-Bake 3</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_3_4str">
         <planpro:bezeichnung_ds>VSig-Bake 4</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>VSig-Bake 4</planpro:bezeichnung_dv>
      </planpro:bezeichnung>
      <planpro:bezeichnung kurz="Ne_3_5str">
         <planpro:bezeichnung_ds>VSig-Bake 5</planpro:bezeichnung_ds>
         <planpro:bezeichnung_dv>VSig-Bake 5</planpro:bezeichnung_dv>
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
   <xsl:variable name="planungsbereich"/>
   <xsl:variable name="betrachtungsbereich"/>
   <!-- Keys für ausgelagerte Kontextbegrenzung -->
   <xsl:key name="Identitaet"
            match="Container[parent::LST_Zustand_Ziel | parent::LST_Zustand]/*/Identitaet"
            use="Wert"/>
   <xsl:key name="Aussenelementansteuerung"
            match="Aussenelementansteuerung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Bahnsteig_Kante"
            match="Bahnsteig_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Balise"
            match="Balise[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Bearbeitungsvermerk"
            match="Bearbeitungsvermerk[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Bedien_Anzeige_Element"
            match="Bedien_Anzeige_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Bedien_Einrichtung_Oertlich"
            match="Bedien_Einrichtung_Oertlich[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="BUE_Anlage"
            match="BUE_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="BUE_Gleisbezogener_Gefahrraum"
            match="BUE_Gleisbezogener_Gefahrraum[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Datenpunkt"
            match="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="ESTW_Zentraleinheit"
            match="ESTW_Zentraleinheit[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Fla_Schutz"
            match="Fla_Schutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="FMA_Anlage"
            match="FMA_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="FMA_Komponente"
            match="FMA_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Fstr_DWeg"
            match="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Fstr_Fahrweg"
            match="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Fstr_Zug_Rangier"
            match="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="GEO_Knoten"
            match="GEO_Knoten[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Gleis_Abschnitt"
            match="Gleis_Abschnitt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Gleis_Bezeichnung"
            match="Gleis_Bezeichnung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Hoehenpunkt"
            match="Hoehenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Markanter_Punkt"
            match="Markanter_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="NB"
            match="NB[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="NB_Zone"
            match="NB_Zone[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="NB_Zone_Grenze"
            match="NB_Zone_Grenze[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="PZB_Element_Zuordnung"
            match="PZB_Element_Zuordnung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Schlosskombination"
            match="Schlosskombination[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Schluesselsperre"
            match="Schluesselsperre[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Signal"
            match="Signal[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Signal_Befestigung"
            match="Signal_Befestigung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Signal_Rahmen"
            match="Signal_Rahmen[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Signal_Signalbegriff"
            match="Signal_Signalbegriff[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Strecke"
            match="Strecke[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="TOP_Kante"
            match="TOP_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="TOP_Knoten"
            match="TOP_Knoten[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Trasse_Knoten"
            match="Trasse_Knoten[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Ueberhoehung"
            match="Ueberhoehung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="W_Kr_Anlage"
            match="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="W_Kr_Gsp_Element"
            match="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="W_Kr_Gsp_Komponente"
            match="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Weichenlaufkette"
            match="Weichenlaufkette[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Zugeinwirkung"
            match="Zugeinwirkung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Identitaet/Wert"/>
   <xsl:key name="Planungsbereich"
            match="ID_LST_Objekt_Planungsbereich"
            use="Wert"/>
   <xsl:key name="LST_Planung_Einzel-fuerAusgabe_Fachdaten"
            match="LST_Planung_Einzel"
            use="ID_Ausgabe_Fachdaten/Wert"/>
   <xsl:key name="Objekt-fuerUnterbringung"
            match="Container[parent::LST_Zustand_Ziel | parent::LST_Zustand]/*"
            use="ID_Unterbringung/Wert"/>
   <xsl:key name="Aussenelementansteuerung-fuerAussenelementansteuerung"
            match="Aussenelementansteuerung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Information_Primaer/Wert"/>
   <xsl:key name="Aussenelementansteuerung-fuerESTW_Zentraleinheit"
            match="Aussenelementansteuerung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Information_Primaer/Wert"/>
   <xsl:key name="Aussenelementansteuerung-fuerUnterbringung"
            match="Aussenelementansteuerung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Unterbringung/Wert"/>
   <xsl:key name="Balise_fuerDatenpunkt"
            match="Balise[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Datenpunkt/Wert"/>
   <xsl:key name="Bahnsteig_Zugang-fuerBahnsteig_Anlage"
            match="Bahnsteig_Zugang[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Bahnsteig_Anlage/Wert"/>
   <xsl:key name="Bahnsteig_Kante-fuerBahnsteig_Anlage"
            match="Bahnsteig_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Bahnsteig_Anlage/Wert"/>
   <xsl:key name="Bedien_Einrichtung_Oertlich-fuerUnterbringung"
            match="Bedien_Einrichtung_Oertlich[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Unterbringung/Wert"/>
   <xsl:key name="Bedien_Platz-fuerUnterbringung"
            match="Bedien_Platz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Unterbringung/Wert"/>
   <xsl:key name="BUE_Anlage-fuerBUE_Schnittstelle"
            match="BUE_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_BUE_Schnittstelle/Wert"/>
   <xsl:key name="BUE_Einschaltung_Zuordnung-fuerBUE_Einschaltung"
            match="BUE_Einschaltung_Zuordnung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_BUE_Einschaltung/Wert"/>
   <xsl:key name="Fla_Schutz-fuerW_Kr_Gsp_Element"
            match="Fla_Schutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Fla_Schutz_W_Gsp/ID_Fla_W_Gsp_Element/Wert"/>
   <xsl:key name="Fla_Schutz-fuerAnforderer"
            match="Fla_Schutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Fla_Schutz_Anforderer/ID_Anforderer_Element/Wert"/>
   <xsl:key name="Fla_Zwieschutz-fuerW_Element"
            match="Fla_Zwieschutz[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_W_Element/Wert"/>
   <xsl:key name="FMA_Komponente-fuerAussenelementansteuerung"
            match="FMA_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]/FMA_Komponente_Achszaehlpunkt"
            use="ID_Information/Wert"/>
   <xsl:key name="FMA_Komponente-fuerFMA_Anlage"
            match="FMA_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_FMAgrenze/Wert"/>
   <xsl:key name="Fstr_Aneinander_Zuordnung-fuerFstr_Aneinander"
            match="Fstr_Aneinander_Zuordnung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Fstr_Aneinander/Wert"/>
   <xsl:key name="Fstr_DWeg_W_Kr-fuerFstr_DWeg"
            match="Fstr_DWeg_W_Kr[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Fstr_DWeg/Wert"/>
   <xsl:key name="Fstr_Fahrweg-fuerStart"
            match="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Start/Wert"/>
   <xsl:key name="Fstr_Signalisierung-fuerFstr_Zug_Rangier"
            match="Fstr_Signalisierung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Fstr_Zug_Rangier/Wert"/>
   <xsl:key name="Fstr_Umfahrpunkt-fuerFstr_Fahrweg"
            match="Fstr_Umfahrpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Fstr_Fahrweg/Wert"/>
   <xsl:key name="Fstr_Zug_Rangier-fuerFstr_Fahrweg"
            match="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Fstr_Fahrweg/Wert"/>
   <xsl:key name="Fstr_Zug_Rangier-fuerFstr_Zug_DWeg"
            match="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Fstr_Zug/Fstr_Zug_DWeg/ID_Fstr_DWeg/Wert"/>
   <xsl:key name="GEO_Punkt-fuerGEO_Knoten"
            match="GEO_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_GEO_Knoten/Wert"/>
   <xsl:key name="Gleis_Abschnitt_BOT-fuerTOP_Kante"
            match="Gleis_Abschnitt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]/Bereich_Objekt_Teilbereich"
            use="ID_TOP_Kante/Wert"/>
   <xsl:key name="Gleis_Schaltgruppe-fuerTOP_Kante"
            match="Gleis_Schaltgruppe[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]/Bereich_Objekt_Teilbereich"
            use="ID_TOP_Kante/Wert"/>
   <xsl:key name="Luft_Telegramm-fuerFachtelegramm"
            match="Luft_Telegramm[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Fachtelegramm/Wert"/>
   <xsl:key name="Markanter_Punkt-fuerMarkante_Stelle"
            match="Markanter_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Markante_Stelle/Wert"/>
   <xsl:key name="PZB_Element-fuerPZB_Element_Zuordnung"
            match="PZB_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_PZB_Element_Zuordnung/Wert"/>
   <xsl:key name="PZB_Element-fuerUnterbringung"
            match="PZB_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Unterbringung/Wert"/>
   <xsl:key name="Schloss-fuerSchlosskombination"
            match="Schloss[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Schloss_Sk/ID_Schlosskombination/Wert"/>
   <xsl:key name="Schloss-fuerSchluessel"
            match="Schloss[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Schluessel/Wert"/>
   <xsl:key name="Schloss-fuerSchluesselsperre"
            match="Schloss[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Schloss_Ssp/ID_Schluesselsperre/Wert"/>
   <xsl:key name="Schlosskombination-fuerUnterbringung"
            match="Schlosskombination[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Unterbringung/Wert"/>
   <xsl:key name="Schluesselsperre-fuerUnterbringung"
            match="Schluesselsperre[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Unterbringung/Wert"/>
   <xsl:key name="Signal-fuerStellelement"
            match="Signal[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Signal_Real/Signal_Real_Aktiv/ID_Stellelement/Wert"/>
   <xsl:key name="Signal_Rahmen-fuerSignal"
            match="Signal_Rahmen[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Signal/Wert"/>
   <xsl:key name="Signal_Rahmen-fuerSignal_Befestigung"
            match="Signal_Rahmen[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Signal_Befestigung/Wert"/>
   <xsl:key name="Signal_Signalbegriff-fuerSignal_Rahmen"
            match="Signal_Signalbegriff[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Signal_Rahmen/Wert"/>
   <xsl:key name="Stell_Bereich-fuerAussenelementansteuerung"
            match="Stell_Bereich[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Aussenelementansteuerung/Wert"/>
   <xsl:key name="Stellelement-fuerAussenelementansteuerung"
            match="Stellelement[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Information/Wert"/>
   <xsl:key name="TOP_Kante-fuerTOP_Knoten_A"
            match="TOP_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_TOP_Knoten_A/Wert"/>
   <xsl:key name="TOP_Kante-fuerTOP_Knoten_B"
            match="TOP_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_TOP_Knoten_B/Wert"/>
   <xsl:key name="W_Kr_Gsp_Element-fuerStellelement"
            match="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Stellelement/Wert"/>
   <xsl:key name="W_Kr_Gsp_Element-fuerW_Kr_Anlage"
            match="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_W_Kr_Anlage/Wert"/>
   <xsl:key name="W_Kr_Gsp_Element-fuerGrenzzeichen"
            match="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="Weiche_Element/ID_Grenzzeichen/Wert"/>
   <xsl:key name="W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element"
            match="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_W_Kr_Gsp_Element/Wert"/>
   <xsl:key name="W_Kr_Gsp_Komponente_POT-fuerTOP_Kante"
            match="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]/Punkt_Objekt_TOP_Kante"
            use="ID_TOP_Kante/Wert"/>
   <xsl:key name="ZN-fuerUnterbringung"
            match="ZN[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]"
            use="ID_Unterbringung/Wert"/>
   <!-- Funktionen für gleichartige Bezeichnungen und ausgelagerter Kontextbegrenzung -->
   <xsl:decimal-format name="d" decimal-separator="," grouping-separator="."/>
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
      <xsl:variable name="find-start"
                    select="$sections[fx:number-or-zero(Begrenzung_A/Wert) - $genauigkeit le $start][1]"/>
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
   <xsl:function name="fx:W_Kr_Gsp_Komponente-for-TOP_Knoten" as="node()*">
      <xsl:param name="current-TOP-Knoten" as="xs:string"/>
      <xsl:param name="found-TOP-Kante" as="node()*"/>
      <xsl:for-each select="$found-TOP-Kante">
         <xsl:choose>
            <xsl:when test="current()/ID_TOP_Knoten_A/Wert = $current-TOP-Knoten">
               <xsl:sequence select="key('W_Kr_Gsp_Komponente_POT-fuerTOP_Kante', current()/Identitaet/Wert, /*)[fx:number-or-zero(Abstand/Wert) = 0.0]"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:variable name="TOP-Laenge_AnschlussB"
                             select="fx:number-or-zero(current()/TOP_Kante_Allg/TOP_Laenge/Wert)"/>
               <xsl:sequence select="key('W_Kr_Gsp_Komponente_POT-fuerTOP_Kante', current()/Identitaet/Wert, /*)[fx:number-or-zero(Abstand/Wert) = $TOP-Laenge_AnschlussB]"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:function>
   <xsl:function name="fx:Laenge_zwischen_Punktobjekten" as="xs:decimal">
      <xsl:param name="start-punkt-objekt" as="node()?"/>
      <!-- es wird ein Punkt_Objekt mit Wirkrichtung erwartet -->
      <xsl:param name="ziel-punkt-objekt" as="node()?"/>
      <!-- hier wird keine Wirkrichtung erwartet -->
      <xsl:param name="context" as="node()*"/>
      <xsl:variable name="start-TOP"
                    as="xs:string"
                    select="$start-punkt-objekt/ID_TOP_Kante/Wert"/>
      <xsl:variable name="ziel-TOP"
                    as="xs:string"
                    select="$ziel-punkt-objekt/ID_TOP_Kante/Wert"/>
      <xsl:variable name="TOP-start"
                    as="node()?"
                    select="for $x in $context return key('TOP_Kante', $start-TOP, $x)"/>
      <xsl:variable name="TOP-ziel"
                    as="node()?"
                    select="for $x in $context return key('TOP_Kante', $ziel-TOP, $x)"/>
      <xsl:variable name="start-Abstand"
                    as="xs:decimal"
                    select="fx:number-or-zero($start-punkt-objekt/Abstand/Wert)"/>
      <xsl:variable name="ziel-Abstand"
                    as="xs:decimal"
                    select="fx:number-or-zero($ziel-punkt-objekt/Abstand/Wert)"/>
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
            <xsl:variable name="Abstand-start"
                          as="xs:decimal"
                          select="if ($start-punkt-objekt/Wirkrichtung/Wert = 'gegen')                        then $start-Abstand                        else abs(fx:number-or-zero($TOP-start/TOP_Kante_Allg/TOP_Laenge/Wert) - $start-Abstand)"/>
            <xsl:variable name="gemeinsamer_TOP_Knoten"
                          as="node()"
                          select="$TOP-ziel/(ID_TOP_Knoten_A|ID_TOP_Knoten_B)[Wert = $TOP-start/(ID_TOP_Knoten_A|ID_TOP_Knoten_B)/Wert]"/>
            <xsl:variable name="Abstand-ziel"
                          as="xs:decimal"
                          select="if ($gemeinsamer_TOP_Knoten/self::ID_TOP_Knoten_A)                        then $ziel-Abstand                        else abs(fx:number-or-zero($TOP-ziel/TOP_Kante_Allg/TOP_Laenge/Wert) - $ziel-Abstand)"/>
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
      <xsl:sequence select="if (key('ESTW_Zentraleinheit', $current/ID_Information_Primaer/Wert, $context))          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fla-141" as="xs:boolean">
      <!-- Suche nach einem W_Kr_Gsp_Element welches der ID_Fla_W_Gsp_Element eines Fla_Schutz_W_Gsp entspricht -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('W_Kr_Gsp_Element', $current/Fla_Schutz_W_Gsp/ID_Fla_W_Gsp_Element/Wert, $context)            /Weiche_Element)           then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fla-354" as="xs:boolean">
      <!-- Suche nach einem W_Kr_Gsp_Element mit der "ID_W_Element" eines Fla_Zwieschutz -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('W_Kr_Gsp_Element', $current/ID_W_Element/Wert, $context))          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-11" as="xs:boolean">
      <!-- Suche nach einem Fstr_Fahrweg auf welchen von Fstr_Zug_Rangier verwiesen wird, die Fstr_Zug enthält:
            fachlicher Klartext: Fahrweg der von einer Zugstrasse verwendet wird -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Fstr_Zug_Rangier-fuerFstr_Fahrweg', $current/Identitaet/Wert, $context)/Fstr_Zug)           then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-59" as="xs:boolean">
      <!-- Suche nach einem Fstr_Fahrweg, dessen TOP_Kanten in Bereich_Objekt_Teilbereich
            die gleichen ID_TOP_Knoten_A oder ID_TOP_Knoten_B beinhalten
            fachlicher Klartext: verknüpfte TOP_Kanten für gleichen Fahrweg -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:variable name="enthaltene_TOP_Kanten"
                    as="node()*"
                    select="key('TOP_Kante', $current/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert, $context)/(ID_TOP_Knoten_A|ID_TOP_Knoten_B)/Wert"/>
      <xsl:sequence select="if ($enthaltene_TOP_Kanten[index-of($enthaltene_TOP_Kanten, .)[2]]) then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-76" as="xs:boolean">
      <!-- Suche nach allen Fstr_Aneinander_Zuordnung, die auf die Fstr_Aneinander verweist und suche nach allen Fstr_Zug_Rangier 
			auf die von der Fstr_Aneinander_Zuordnung verweisen wird.
            fachlicher Klartext: aneinandergereihte Fahrstraßen werden auf Fahr- und Zugstrassen geprüft-->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Fstr_Zug_Rangier',                                      key('Fstr_Aneinander_Zuordnung-fuerFstr_Aneinander', $current/Identitaet/Wert, $context)                                     /ID_Fstr_Zug_Rangier/Wert, $context))                           then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-88" as="xs:boolean">
      <!-- Suche nach einem Fstr_DWeg/ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Markanter_Punkt entspricht:
            fachlicher Klartext: Ein D-Weg/Gefahrpunktabstand, der an einem markanten Punkt endet -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Markanter_Punkt',                                     key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)                                     /ID_Ziel/Wert, $context))                             then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-144" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Fahrweg vorhanden und Fahrweg mind. 30m lang -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)          [sum(Bereich_Objekt_Teilbereich/abs(fx:number-or-zero(Begrenzung_B/Wert) - fx:number-or-zero(Begrenzung_A/Wert))) ge 30.0])          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-255" as="xs:boolean">
      <!-- Prüfung, ob (Fstr_Fahrweg) als ID_Start auf ein Signal verweist, welches Punkt_Objekt_TOP_Kante mit 
            der gleichen TOP_Kante wie Fstr_Fahrweg besitzt und dazu Wirkrichtung == "in" definiert ist
            fachlicher Klartext: Fahrweg bei Wirkrichtung des Startsignals in Topologierichtung -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Signal', $current/ID_Start/Wert, $context)          /Punkt_Objekt_TOP_Kante          [ID_TOP_Kante/Wert = $current/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert]          [Wirkrichtung/Wert = 'in'])          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-256" as="xs:boolean">
      <!-- Prüfung, ob (Fstr_Fahrweg) als ID_Ziel auf ein Signal verweist, welches Punkt_Objekt_TOP_Kante mit 
            der gleichen TOP_Kante wie Fstr_Fahrweg besitzt und dazu Wirkrichtung == "in" definiert ist
            fachlicher Klartext: Fahrweg bei Wirkrichtung des Zielsignals in Topologierichtung -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Signal', $current/ID_Ziel/Wert, $context)          /Punkt_Objekt_TOP_Kante          [ID_TOP_Kante/Wert = $current/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert]          [Wirkrichtung/Wert = 'in'])          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-259" as="xs:boolean">
      <!-- Suche nach einem Fstr_DWeg/ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Markanter_Punkt entspricht, worin eine ID_Markante_Stelle einer W_Kr_Gsp_Komponente entspricht,
            die ein Weiche_Element enthält:
            fachlicher Klartext: Ein D-Weg, der bis zu einem Weichenanfang definiert ist -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('W_Kr_Gsp_Element',          key('W_Kr_Gsp_Komponente',          key('Markanter_Punkt',          key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)          /ID_Ziel/Wert, $context)          /ID_Markante_Stelle/Wert, $context)          /ID_W_Kr_Gsp_Element/Wert, $context)/Weiche_Element)          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-278" as="xs:boolean">
      <!-- Prüfung, ob es eine Fstr_Zug_Rangier mit dem aktuellen Fstr_Fahrweg gibt,
         die zudem eine Fstr_Zug ist
         und einen Fstr_Zug_DWeg hat,
         der wiederum ein Fstr_DWeg_Spezifisch besitzt
         fachlicher Klartext: Fahrweg als befahrenener Teil von Zugstraßen mit DWeg genutzt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Fstr_DWeg',                                  key('Fstr_Zug_Rangier-fuerFstr_Fahrweg', $current/Identitaet/Wert , $context)                               /Fstr_Zug/Fstr_Zug_DWeg/ID_Fstr_DWeg/Wert, $context)                               /Fstr_DWeg_Spezifisch)                             then true() else false() "/>
   </xsl:function>
   <xsl:function name="fx:Fstr-371" as="xs:boolean">
      <!-- Prüfung, ob ein Fstr_Dweg_W_Kr für aktuellen Fstr_DWeg vorhanden ist
           -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Fstr_DWeg_W_Kr-fuerFstr_DWeg', $current/Identitaet/Wert, $context))        then true() else false()"/>
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
      <xsl:sequence select="if ($current[Fstr_Zug/Fstr_Zug_Art/Wert = ('ZT', 'ZTU')]                            [key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)                            [key('Signal', ID_Ziel/Wert, $context)[not(Signal_Fiktiv/Fiktives_Signal_Funktion/Wert                            = ('Zug_Ziel_Awanst', 'Zug_Ziel_Strecke'))]]                            /ID_Start = key('Fstr_Fahrweg', $current/../Fstr_Zug_Rangier                                  [Fstr_Zug/Fstr_Zug_Art/Wert = ('ZT', 'ZTU')]                                                         /ID_Fstr_Fahrweg/Wert, $context)/ID_Ziel])                             then true() else false()"/>
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
      <xsl:variable name="weitere-Fstr_Signalisierung"
                    as="node()*"
                    select="key('Fstr_Signalisierung-fuerFstr_Zug_Rangier', $current/ID_Fstr_Zug_Rangier/Wert, $context)                      except $current"/>
      <xsl:variable name="weitere-Fstr_Signalisierung-mitZs3"
                    as="node()*"
                    select="key('Signal_Signalbegriff', $weitere-Fstr_Signalisierung/ID_Signal_Signalbegriff/Wert, $context)                     [substring-after(Signalbegriff_ID/@xsi:type, ':') = 'Zs_3']"/>
      <xsl:variable name="Signalrahmen-fuer-weitere-Zs3-Signalisierung"
                    as="node()*"
                    select="key('Signal_Rahmen', $weitere-Fstr_Signalisierung-mitZs3/ID_Signal_Rahmen/Wert, $context)"/>
      <xsl:variable name="Fahrwegstart-fuer-weitere-Zs3-Signalisierung"
                    as="node()*"
                    select="key('Fstr_Fahrweg-fuerStart', $Signalrahmen-fuer-weitere-Zs3-Signalisierung/ID_Signal/Wert, $context)"/>
      <xsl:sequence select="if (((not($current/ID_Signal_Signalbegriff_Ziel) and           not(key('Signal_Signalbegriff',              (key('Fstr_Signalisierung-fuerFstr_Zug_Rangier', $current/ID_Fstr_Zug_Rangier/Wert, $context)                except $current)/ID_Signal_Signalbegriff_Ziel/Wert, $context)                   [substring-after(Signalbegriff_ID/@xsi:type, ':') = 'Hp_0'])) or           key('Signal_Signalbegriff', $current/ID_Signal_Signalbegriff_Ziel/Wert, $context)             [substring-after(Signalbegriff_ID/@xsi:type, ':') = 'Hp_0']) and          key('Fstr_Fahrweg-fuerStart',             key('Signal_Rahmen',                 key('Signal_Signalbegriff', $current/ID_Signal_Signalbegriff/Wert, $context)                   [substring-after(Signalbegriff_ID/@xsi:type, ':') = 'Zs_3']                /ID_Signal_Rahmen/Wert, $context)             /ID_Signal/Wert, $context) and          not($weitere-Fstr_Signalisierung-mitZs3 and not($Fahrwegstart-fuer-weitere-Zs3-Signalisierung)) and          key('Fstr_DWeg',             key('Fstr_Zug_Rangier', $current/ID_Fstr_Zug_Rangier/Wert, $context)                /Fstr_Zug/*/ID_Fstr_DWeg/Wert, $context)             [*/DWeg_V])          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-387" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Fahrweg vorhanden
           auch für Fstr-366 genutzt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context))        then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-388" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Zug vorhanden UND
            Suche nach dem Fstr_Fahrweg mit ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Signal entspricht, welches die Eigenschaft "Sperrsignal" oder "Zugdeckungssignal" besitzt
            fachlicher Klartext: Eine Zugstraße, die in einem Sperrsignal oder Zugdeckungssignal endet -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if ($current/Fstr_Zug and             key('Signal',                key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)             /ID_Ziel/Wert, $context)          /Signal_Real/Signal_Real_Aktiv_Schirm/Signal_Art/Wert = ('Sperrsignal', 'Zugdeckungssignal'))          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-389" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Zug vorhanden UND
            Suche nach dem Fstr_Fahrweg mit ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Signal entspricht, welches die Eigenschaft "Zug_Ziel_ohne_Signal" besitzt
            fachlicher Klartext: Eine Zugstraße, die in einem Stumpfgleis endet -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if ($current/Fstr_Zug and             key('Signal',                key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)             /ID_Ziel/Wert, $context)          /Signal_Fiktiv/Fiktives_Signal_Funktion/Wert = 'Zug_Ziel_ohne_Signal')          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-611" as="xs:boolean">
      <!-- Prüfung, ob (Fstr_Fahrweg) als ID_Ziel auf ein Signal verweist, welches Punkt_Objekt_TOP_Kante mit 
            der gleichen TOP_Kante wie Fstr_Fahrweg besitzt und dazu Wirkrichtung == "gegen" definiert ist
            fachlicher Klartext: Fahrweg bei Wirkrichtung des Zielsignals entgegen Topologierichtung -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Signal', $current/ID_Ziel/Wert, $context)          /Punkt_Objekt_TOP_Kante          [ID_TOP_Kante/Wert = $current/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert]          [Wirkrichtung/Wert = 'gegen'])          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-612" as="xs:boolean">
      <!-- Prüfung, ob (Fstr_Fahrweg) als ID_Start auf ein Signal verweist, welches Punkt_Objekt_TOP_Kante mit 
            der gleichen TOP_Kante wie Fstr_Fahrweg besitzt und dazu Wirkrichtung == "gegen" definiert ist
            fachlicher Klartext: Fahrweg bei Wirkrichtung des Zielsignals entgegen Topologierichtung -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Signal', $current/ID_Start/Wert, $context)          /Punkt_Objekt_TOP_Kante          [ID_TOP_Kante/Wert = $current/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert]          [Wirkrichtung/Wert = 'gegen'])          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-616" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Zug vorhanden UND
            Suche nach dem Fstr_Fahrweg mit ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Signal entspricht, welches die Eigenschaften "Zugdeckungssignal" und Geltungsbereich "DS" besitzt
            fachlicher Klartext: Eine Zugstraße, die in einem Zugdeckungssignal endet -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if ($current[Fstr_Zug]                                     [key('Signal',                                                                   key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)                                                                    /ID_Ziel/Wert, $context)                                  /Signal_Real[Geltungsbereich/Wert = 'DS']/Signal_Real_Aktiv_Schirm/Signal_Art/Wert = 'Zugdeckungssignal'])                             then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-617" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Signalisierung  über Signal_Signalbegriff ein Zs_3 besitzt,
           und dieser Signalbegriff für eine Fstr_Zug_Rangier genutzt wird, die Fstr_V besitzt
           fachlicher Kontext: am Fahrstraßenstart geplante Geschwindigkeit gegen die in der Fahrstraße hinterlegte Geschwindigkeit vergleichen -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Signal_Signalbegriff', $current/ID_Signal_Signalbegriff/Wert, $context)                [substring-after(Signalbegriff_ID/@xsi:type,':')='Zs_3'] and             key('Fstr_Zug_Rangier', $current/ID_Fstr_Zug_Rangier/Wert, $context)/*/Fstr_V)             then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-622" as="xs:boolean">
      <!-- Suche nach einem Fstr_DWeg/ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Markanter_Punkt entspricht, worin eine ID_Markante_Stelle einer W_Kr_Gsp_Komponente entspricht:
            fachlicher Klartext: Ein D-Weg, der bis zu einem Weichenanfang definiert ist -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:variable name="find-Fstr_Fahrweg"
                    select="key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)"/>
      <xsl:variable name="find-W_Kr_Gsp_Komponente"
                    select="key('W_Kr_Gsp_Komponente',          key('Markanter_Punkt', $find-Fstr_Fahrweg/ID_Ziel/Wert, $context)          /ID_Markante_Stelle/Wert, $context)"/>
      <xsl:variable name="find-gleiche-TOP_Kante"
                    select="$find-W_Kr_Gsp_Komponente/Punkt_Objekt_TOP_Kante/ID_TOP_Kante[Wert =          $find-Fstr_Fahrweg/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert]"/>
      <xsl:sequence select="if (key('W_Kr_Gsp_Element',          $find-W_Kr_Gsp_Komponente/ID_W_Kr_Gsp_Element/Wert, $context)/Weiche_Element             and not($find-gleiche-TOP_Kante))             then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-623" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Fahrweg als ID_Start auf ein Signal verweist, welches Punkt_Objekt_TOP_Kante.Wirkrichtung == "in" besitzt
            fachlicher Klartext: Fahrweg bei Wirkrichtung des Startsignals in Topologierichtung -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Signal',                 key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)/ID_Start/Wert, $context)             /Punkt_Objekt_TOP_Kante/Wirkrichtung/Wert = 'in')             then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-624" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Fahrweg als ID_Start auf ein Signal verweist, welches Punkt_Objekt_TOP_Kante.Wirkrichtung == "gegen" besitzt
            fachlicher Klartext: Fahrweg bei Wirkrichtung des Startsignals entgegen Topologierichtung -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Signal',              key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)/ID_Start/Wert, $context)          /Punkt_Objekt_TOP_Kante/Wirkrichtung/Wert = 'gegen')          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-639" as="xs:boolean">
      <!-- Prüfung, ob Fstr_Signalisierung  über Signal_Signalbegriff ein Zs_3 besitzt,
           fachlicher Kontext: am Zugstraßenstart geplante Geschwindigkeit 
           auch genutzt für Fstr-618 -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key ('Fstr_Zug_Rangier-fuerFstr_Fahrweg',          key('Fstr_Fahrweg-fuerStart',             key('Signal_Rahmen',                 key('Signal_Signalbegriff', $current/ID_Signal_Signalbegriff/Wert, $context)                   [substring-after(Signalbegriff_ID/@xsi:type,':') = 'Zs_3']                /ID_Signal_Rahmen/Wert, $context)             /ID_Signal/Wert, $context)          /Identitaet/Wert, $context)/Fstr_Zug)             then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:Fstr-645" as="xs:boolean">
      <!-- Prüfung, Fstr_Fahrweg mit ID_Fstr_Fahrweg, welcher ein ID_Ziel besitzt,
            dass einem Signal entspricht, welches die Eigenschaft "Zug_Ziel_Strecke" besitzt
            fachlicher Klartext: Eine Ausfahrtzugstraße -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('Signal',                               key('Fstr_Fahrweg', $current/ID_Fstr_Fahrweg/Wert, $context)                             /ID_Ziel/Wert, $context)                           /Signal_Fiktiv/Fiktives_Signal_Funktion/Wert = 'Zug_Ziel_Strecke') then true() else false()"/>
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
      <xsl:sequence select="if (not($current/W_Kr_Gsp_Element_Allg/W_Kr_Gsp_Stellart/Wert =           ('sonstige', 'stillgelegt_links', 'stillgelegt_rechts', 'unbestimmt', 'ZHA')) and          key('W_Kr_Anlage', $current/ID_W_Kr_Anlage/Wert, $context)             /W_Kr_Anlage_Allg/W_Kr_Art/Wert =                 ('ABW', 'DKW', 'DW', 'EKW', 'EW', 'Flachkreuzung', 'IBW',                   'EIBKW', 'EABKW', 'DBKW', 'IBW/ABW', 'ABW/IBW', 'ZHV ABW', 'ZHV IBW', 'EBKW', 'Sym. ABW', 'Eins. DW',                   'Klothoidenweiche', 'Korbbogenweiche'))          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:WGsp-75" as="xs:boolean">
      <!-- Prüfung, ob zugehörige W_Kr_Anlage, darin W_Kr_Art = "DKW"
            fachlicher Klartext: Doppelkreuzungsweiche -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('W_Kr_Anlage', $current/ID_W_Kr_Anlage/Wert, $context)          /W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('DKW', 'DBKW'))          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:WGsp-184" as="xs:boolean">
      <!-- Prüfung, ob Anzahl_Elektrischer_Antrieb = 0 UND
            zugehöriges W_Kr_Gsp_Element nicht die Stellart Rückfallweiche besitzt
            fachlicher Klartext: Weichenkomponente, die keine Rückfallweiche ist, bzw. keine elektrischen Antriebe besitzt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if ($current/Zungenpaar/Elektrischer_Antrieb_Anzahl/Wert = '0' and          not(key('W_Kr_Gsp_Element', $current/ID_W_Kr_Gsp_Element/Wert, $context)          /W_Kr_Gsp_Element_Allg/W_Kr_Gsp_Stellart/Wert = ('Rueckfallweiche', 'ZHA')))          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:WGsp-193" as="xs:boolean">
      <!-- Prüfung, ob zugehörige W_Kr_Anlage, darin W_Kr_Art = "Kr" oder "Flachkreuzung"
            fachlicher Klartext: Kreuzung -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('W_Kr_Anlage', $current/ID_W_Kr_Anlage/Wert, $context)             /W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('Kr', 'BKr', 'IBKr', 'Flachkreuzung'))           then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:WGsp-195" as="xs:boolean">
      <!-- Prüfung, ob DKW oder EKW UND
            zugehörige W_Kr_Gsp_Komponenten nicht die xsi:nil="true" als Zungenpruefkontaktanzahl besitzt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if ($current/W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('DKW', 'DBKW', 'EKW', 'EBKW', 'EIBKW', 'EABKW') and             fx:ignore-nil(key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element',                key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', $current/Identitaet/Wert, $context)                /Identitaet/Wert, $context)             /Zungenpaar/Zungenpruefkontakt_Anzahl))             then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:WGsp-422" as="xs:boolean">
      <!-- Prüfung, ob Rückfallweiche UND
            zugehörige W_Kr_Gsp_Komponenten nicht die xsi:nil="true" als Zungenpruefkontaktanzahl besitzt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if ($current/W_Kr_Gsp_Element_Allg/W_Kr_Gsp_Stellart/Wert = 'Rueckfallweiche' and              fx:ignore-nil(key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $current/Identitaet/Wert, $context)                /Zungenpaar/Zungenpruefkontakt_Anzahl))           then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:WGsp-621" as="xs:boolean">
      <!-- Prüfung, ob zugehörige W_Kr_Anlage, darin W_Kr_Art = "DW" oder "EKW"
            fachlicher Klartext: Doppelweiche oder Einfache Kreuzungsweiche-->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('W_Kr_Anlage', $current/ID_W_Kr_Anlage/Wert, $context)          /W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('DW', 'EKW', 'Eins. DW', 'EBKW', 'EIBKW', 'EABKW'))          then true() else false()"/>
   </xsl:function>
   <xsl:function name="fx:WGsp-644" as="xs:boolean">
      <!-- Prüfung, ob zugehörige W_Kr_Gsp_Komponente ein Besonderes_Fahrwegelement besitzt -->
      <xsl:param name="current" as="node()"/>
      <xsl:param name="context" as="node()"/>
      <xsl:sequence select="if (key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $current/Identitaet/Wert, $context)             /Besonderes_Fahrwegelement)          then true() else false()"/>
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
   <include href="Basisobjekte/Basisobjekte_ID663.sch"/>
   <include href="Basisobjekte/Basisobjekte_ID664.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID101.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID11.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID14.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID144.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID255.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID256.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID259.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID270.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID272.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID278.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID284.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID312.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID313.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID314.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID315.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID316.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID357.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID360.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID361.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID366.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID371.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID372.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID374.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID377.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID387.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID388.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID389.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID390.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID408.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID59.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID611.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID612.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID616.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID617.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID618.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID622.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID623.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID624.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID639.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID640.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID641.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID645.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID648.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID7.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID76.sch"/>
   <include href="Fahrstra%C3%9Fe/Fahrstrasse_ID88.sch"/>
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
   <include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID184.sch"/>
   <include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID188.sch"/>
   <include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID193.sch"/>
   <include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID194.sch"/>
   <include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID195.sch"/>
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
   <include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID646.sch"/>
   <include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID647.sch"/>
   <include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID651.sch"/>
   <include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID72.sch"/>
   <include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID73.sch"/>
   <include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID74.sch"/>
   <include href="Weichen_und_Gleissperren/Weichen_und_Gleissperren_ID75.sch"/>
   <include href="Diagnostics.sch"/>
</schema>
