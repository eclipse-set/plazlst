<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="A011F1E5-6107-425B-9AAB-9FF1F0E9068B" see="Fahrstrasse_ID88" id="ID88" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Bereichsende eines DWegs/Gefahrpunktabstands am Markanten Punkt</iso:title>
	<iso:p>
		<planpro:description>
			Endet ein DWeg/Gefahrpunktabstand an einem Markanten Punkt, muss dessen Verortung identisch sein mit dem Ende
			des zugehörigen Bereichsobjekts Fstr_Fahrweg. Der Fall "Ende am WA" wird in dieser Regel nicht berücksichtigt.
			
			Wenn Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel == "Markanter_Punkt" und
			Markanter_Punkt.ID_Markante_Stelle ≠ W_Kr_Gsp_Komponente, dann muss die Verortung des unter
			Markanter_Punkt.ID_Markante_Stelle angegebenen Punktobjekts identisch mit der Verortung des Endes des Bereichsobjekts
			Fstr_Fahrweg sein (Toleranz 0,01 m). 
		</planpro:description>
		<planpro:comment>
			Es wird nur abgeprüft, ob eine Grenze des Teilbereichs, der auf der TOP-Kante des Markanten Punkts liegt, mit der 
			Verortung des Markanten Punkts übereinstimmt.
			Der Fall, dass ein mittlerer Teilbereich von Fstr_Fahrweg am Markanten Punkt endet, wird derzeit nicht angenommen.
			Als Markante Punkte werden Signal, Sonstiger_Punkt und FMA_Komponente geprüft.
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Der DWeg/Gefahrpunktabstand endet am Markanten Punkt, der als Ziel angegeben ist.
			</planpro:success>
			<planpro:error>
				Der DWeg/Gefahrpunktabstand endet nicht am Markanten Punkt, der als Ziel angegeben ist.
				Die topologische Verortung des DWegs/Gefahrpunktabstands ist zu korrigieren.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_DWeg</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-88(current(), parent::*)]">
		<iso:let name="FstrFahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
		<iso:let name="ID_Markanter_Punkt" value="key('Markanter_Punkt', $FstrFahrweg/ID_Ziel/Wert, parent::*)"/>
			<!-- ID_Markante_Stelle only allowed once -->
		<iso:let name="Fstr_Fahrweg_BOTs" value="$FstrFahrweg/Bereich_Objekt_Teilbereich"/>
			<!-- Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert allowed multiple times -->
		<iso:let name="Ziel_POT" value="key('Identitaet', $ID_Markanter_Punkt/ID_Markante_Stelle/Wert, /*)/..    [self::Signal | self::Sonstiger_Punkt | self::FMA_Komponente]/    Punkt_Objekt_TOP_Kante[ID_TOP_Kante/Wert = $Fstr_Fahrweg_BOTs/ID_TOP_Kante/Wert][1]"/>
			<!-- Signal/Punkt_Objekt_TOP_Kante/ID_TOP_Kante/Wert allowed multiple times, but not in the same Fstr_Fahrweg -->
		<iso:let name="Abstand" value="fx:number-or-zero($Ziel_POT/Abstand/Wert)"/>
		<iso:let name="Fstr_Fahrweg_BOTs_Ziel" value="$Fstr_Fahrweg_BOTs[ID_TOP_Kante/Wert = $Ziel_POT/ID_TOP_Kante/Wert]"/>
		<iso:let name="Fstr_Fahrweg_einBOT_Ziel" value="$Fstr_Fahrweg_BOTs_Ziel    [not(ID_TOP_Kante/Wert = preceding-sibling::Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert)]"/>
		<iso:let name="Abstaende_B_POTs" value="max(fx:number-or-zero($Fstr_Fahrweg_einBOT_Ziel/Begrenzung_B/Wert))"/>
		<iso:let name="Abstaende_A_POTs" value="min(fx:number-or-zero($Fstr_Fahrweg_einBOT_Ziel/Begrenzung_A/Wert))"/>	
		<iso:let name="genauigkeit" value="0.01"/>
		
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="abs($Abstaende_B_POTs - $Abstand) le $genauigkeit or abs($Abstaende_A_POTs - $Abstand) le $genauigkeit">Der DWeg/Gefahrpunktabstand endet nicht am Markanten Punkt, der als Ziel angegeben ist. Die topologische Verortung des DWegs/Gefahrpunktabstands ist zu korrigieren.</iso:assert>
	</iso:rule>
</iso:pattern>