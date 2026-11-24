<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="29DFAAAD-5311-4275-B3B9-D1C84C3870EE" see="Weichen_und_Gleissperren_ID249" id="ID249" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>TOP-Anschluss Links/Rechts/Spitze</iso:title>
	<iso:p>
		<planpro:description>
			In Bezug auf einen TOP-Knoten dürfen für die Anschlüsse der TOP-Kanten die Werte "Links" (linker Weichenschenkel),
			"Rechts" (rechter Weichenschenkel) und "Spitze" jeweils max. einmal vorhanden sein.
			
			Bei allen TOP_Kante.ID_TOP_Knoten_A (bzw. TOP_Kante.ID_TOP_Knoten_B) mit identischem Wert muss für die zugehörigen 
			TOP_Kante.TOP_Kante_Allg.TOP_Anschluss_A (bzw. TOP_Kante.TOP_Kante_Allg.TOP_Anschluss_B) die Anzahl der Werte 
			"Links", "Rechts" und "Spitze" jeweils ≤ 1 sein. 
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				In Bezug auf den TOP-Knoten sind für die Anschlüsse der TOP-Kanten die Werte "Links" (linker Weichenschenkel), 
				"Rechts" (rechter Weichenschenkel) und "Spitze" jeweils max. einmal vorhanden.
			</planpro:success>
			<planpro:error>
				In Bezug auf den TOP-Knoten sind für die Anschlüsse der TOP-Kanten die Werte "Links" (linker Weichenschenkel), 
				"Rechts" (rechter Weichenschenkel) oder "Spitze" mehrfach vorhanden.
				Anzahl der TOP-Anschlüsse "Links": [Anzahl]
				Anzahl der TOP-Anschlüsse "Rechts": [Anzahl]
				Anzahl der TOP-Anschlüsse "Spitze": [Anzahl]
			</planpro:error>
		</planpro:test>
		<planpro:output>TOP_Knoten</planpro:output>
	</iso:p>
	<iso:rule role="error" context="TOP_Knoten[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][count((key('TOP_Kante-fuerTOP_Knoten_A', Identitaet/Wert, parent::*) | key('TOP_Kante-fuerTOP_Knoten_B', Identitaet/Wert, parent::*))) gt 1]">
		<iso:let name="TOP_Kante-fuerA" value="key('TOP_Kante-fuerTOP_Knoten_A', Identitaet/Wert, parent::*)"/>
		<iso:let name="TOP_Kante-fuerB" value="key('TOP_Kante-fuerTOP_Knoten_B', Identitaet/Wert, parent::*)"/>
		<iso:let name="TOP_Anschluss_A" value="$TOP_Kante-fuerA/TOP_Kante_Allg/TOP_Anschluss_A"/>
		<iso:let name="TOP_Anschluss_B" value="$TOP_Kante-fuerB/TOP_Kante_Allg/TOP_Anschluss_B"/>
		<iso:let name="AnzahlLinks" value="count(($TOP_Anschluss_A | $TOP_Anschluss_B)[Wert = 'Links'])"/>
		<iso:let name="AnzahlRechts" value="count(($TOP_Anschluss_A | $TOP_Anschluss_B)[Wert = 'Rechts'])"/>
		<iso:let name="AnzahlSpitze" value="count(($TOP_Anschluss_A | $TOP_Anschluss_B)[Wert = 'Spitze'])"/>	
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$AnzahlLinks le 1 and $AnzahlRechts le 1 and $AnzahlSpitze le 1">In Bezug auf den TOP-Knoten sind für die Anschlüsse der TOP-Kanten die Werte "Links" (linker Weichenschenkel), "Rechts" (rechter Weichenschenkel) oder "Spitze" mehrfach vorhanden.
			Anzahl der TOP-Anschlüsse "Links": <iso:value-of select="$AnzahlLinks"/>
			Anzahl der TOP-Anschlüsse "Rechts": <iso:value-of select="$AnzahlRechts"/>
			Anzahl der TOP-Anschlüsse "Spitze": <iso:value-of select="$AnzahlSpitze"/></iso:assert>
	</iso:rule>
</iso:pattern>