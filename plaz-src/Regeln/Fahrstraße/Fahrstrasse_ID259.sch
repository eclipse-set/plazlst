<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="F1D31541-38BF-4fc0-B658-2331E77A72FF" see="Fahrstrasse_ID259" id="ID259" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>DWeg-Ende am WA von stumpfer Seite kommend</iso:title>
    <iso:p>
      <planpro:description>
      	Es ist eine Warnung auszugeben, wenn 
      	
      	der DWeg am Weichenanfang endet, 
      	
      	der zugehörige Fahrweg mindestens einen der beiden Weichenschenkel beinhaltet (Prüfung bezieht sich auf TOP-Kanten,
      	auf denen die Weichen-Komponente verortet ist) und 
      	
      	die Länge bis zum Grenzzeichen der Weiche nicht ausreicht, um die geforderte Soll-Länge des DWegs zu erfüllen.
      	
      	Es ist eine Warnung auszugeben, wenn 
      	Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel → Markanter_Punkt.ID_Markante_Stelle
      	→ W_Kr_Gsp_Komponente und W_Kr_Gsp_Komponente.ID_W_Kr_Gsp_Element → W_Kr_Gsp_Element.Weiche_Element vorhanden ist und
      	
      	Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante ==
      	Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel → Markanter_Punkt.ID_Markante_Stelle 
      	→ W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.ID_TOP_Kante und
      	
      	wenn der Abstand zwischen Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Start → Signal.Punkt_Objekt_TOP_Kante und
      	Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel → Markanter_Punkt.ID_Markante_Stelle
      	→ W_Kr_Gsp_Komponente und W_Kr_Gsp_Komponente.ID_W_Kr_Gsp_Element → W_Kr_Gsp_Element.Weiche_Element.ID_Grenzzeichen 
      	→ Signal.Punkt_Objekt_TOP_Kante
      	(Signal.Punkt_Objekt_TOP_Kante.ID_TOP_Kante == Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante)
      	≤ Fstr_DWeg.Fstr_DWeg_Allg.Laenge_Soll.
      </planpro:description>
      <planpro:comment>
      	Eine Warnung soll nur ausgegeben werden, wenn bei Verwendung des Gz der angegebenen Weiche die Soll-Länge des D-Wegs
      	eingehalten werden könnte. In diesem Fall ist eine weitere Prüfung durch den Planer notwendig
      	(Fehlen einer Freimeldegrenze als möglicher Grund, der ggü. dem unnötigen Verschluss der Weiche abgewogen werden muss). 
      </planpro:comment>
      <planpro:test>
        <planpro:success>
        	Der DWeg endet von der stumpfen Seite der Weiche kommend am WA und bei Verwendung des zugehörigen Gz als DWeg-Ende
        	kann die geforderte Soll-Länge nicht eingehalten werden.
		</planpro:success>
        <planpro:error>
        	Der DWeg endet von der stumpfen Seite der Weiche kommend am WA, bei Verwendung des zugehörigen Gz als DWeg-Ende könnte
        	die geforderte Soll-Länge jedoch bereits eingehalten werden. Bitte prüfen Sie, ob eine Verkürzung des DWegs möglich ist.
		</planpro:error>
      </planpro:test>
      <planpro:output>Fstr_DWeg</planpro:output>
    </iso:p>
	<iso:rule role="warning" context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-259(current(), parent::*)][fx:ignore-nil(key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)/ID_Start)]">
		<iso:let name="Fstr_DWeg_Laenge" value="fx:number-or-zero(Fstr_DWeg_Allg/Laenge_Soll/Wert)"/>
		<iso:let name="FstrFahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
		<iso:let name="ID_TOP_Kanten_DWeg" value="$FstrFahrweg/Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert"/>
		<iso:let name="Markanter_Punkt_Ziel" value="key('Markanter_Punkt', $FstrFahrweg/ID_Ziel/Wert, parent::*)"/>
		<iso:let name="WKrGsp_Komponente_Ziel" value="key('W_Kr_Gsp_Komponente', $Markanter_Punkt_Ziel/ID_Markante_Stelle/Wert, parent::*)"/>
		<iso:let name="WKrGsp_Element" value="key('W_Kr_Gsp_Element', $WKrGsp_Komponente_Ziel/ID_W_Kr_Gsp_Element/Wert, parent::*)"/>
		<iso:let name="Signal_Grenzzeichen" value="key('Signal', $WKrGsp_Element/Weiche_Element/ID_Grenzzeichen/Wert, /*)"/>
		<iso:let name="TOP_Kante_Grenzzeichen" value="$Signal_Grenzzeichen/Punkt_Objekt_TOP_Kante[ID_TOP_Kante/Wert = $ID_TOP_Kanten_DWeg]"/>
		<iso:let name="WeichenschenkelInDWeg" value="$ID_TOP_Kanten_DWeg = $WKrGsp_Komponente_Ziel/Punkt_Objekt_TOP_Kante/ID_TOP_Kante/Wert"/>
		<iso:let name="Signal_Start" value="key('Signal', $FstrFahrweg/ID_Start/Wert, /*)"/>
		<iso:let name="TOP_Kante_Start" value="$Signal_Start/Punkt_Objekt_TOP_Kante[ID_TOP_Kante/Wert = $ID_TOP_Kanten_DWeg]"/>
		<iso:let name="Abstand_Startsignal_Grenzzeichen" value="fx:Laenge_zwischen_Punktobjekten($TOP_Kante_Start, $TOP_Kante_Grenzzeichen, /*)"/>
		<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$WeichenschenkelInDWeg and $Fstr_DWeg_Laenge ne 0.0 and $Abstand_Startsignal_Grenzzeichen ge $Fstr_DWeg_Laenge">Der DWeg endet von der stumpfen Seite der Weiche kommend am WA, bei Verwendung des zugehörigen Gz als DWeg-Ende könnte die geforderte Soll-Länge jedoch bereits eingehalten werden. Bitte prüfen Sie, ob eine Verkürzung des DWegs möglich ist.</iso:report>	
  </iso:rule>
</iso:pattern>