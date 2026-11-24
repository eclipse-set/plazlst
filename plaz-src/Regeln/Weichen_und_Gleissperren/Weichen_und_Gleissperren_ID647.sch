<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="FA29581E-8764-45AC-9548-730AE34B1FBD" see="WEICHEN_UND_GLEISSPERREN_ID647" id="ID647" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Auswurfrichtung einer Gsp</iso:title>
	<iso:p>
		<planpro:description>
			Wenn für die Gleissperre eine Auswurfrichtung und (seitliche Lage oder Wirkrichtung) angegeben sind,
			muss diese Angaben konsistent sein.

			Wenn W_Kr_Gsp_Komponente.Entgleisungsschuh.Auswurfrichtung ∧ 
			(W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Seitliche_Lage ∨ W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Wirkrichtung) vorhanden sind,
			dann muss:

			Wenn W_Kr_Gsp_Komponente.Entgleisungsschuh.Auswurfrichtung == "rechts", dann muss
			1. W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Seitliche_Lage == "rechts" ∧ 
			   W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Wirkrichtung == "in"
			oder
			2. W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Seitliche_Lage == "links" ∧ 
			   W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Wirkrichtung == "gegen"
			sein.

			Wenn W_Kr_Gsp_Komponente.Entgleisungsschuh.Auswurfrichtung == "links", dann muss
			1. W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Seitliche_Lage == "rechts" ∧ 
			   W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Wirkrichtung == "gegen"
			oder
			2. W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Seitliche_Lage == "links" ∧ 
			   W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Wirkrichtung == "in"
			sein.
		</planpro:description>
		<planpro:comment>
			Das Attribut "Auswurfrichtung" soll zukünftig entfallen. Aktuell ist die Befüllbarkeit in den Planungswerkzeugen unterschiedlich:
			Bei Exporten aus ProSig wird die Auswurfrichtung angegeben, Exporte aus ProVI LST enthalten den Parameter nicht.
			
			Falls in Punkt_Objekt_TOP_Kante entweder Seitliche_Lage oder Wirkrichtung fehlt, dann erfolgt auch eine Fehlermeldung. 
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Angabe der Auswurfrichtung in der Gleissperre ist konsistent mit den (redundanten) Angaben zur seitlichen Lage
				und Wirkrichtung.
			</planpro:success>
			<planpro:error>
				Die Angabe der Auswurfrichtung in der Gleissperre ist nicht konsistent mit den (redundanten) Angaben zur seitlichen Lage
				und Wirkrichtung.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Komponente</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Entgleisungsschuh/Auswurfrichtung][Punkt_Objekt_TOP_Kante/(Seitliche_Lage | Wirkrichtung)]">
		<iso:let name="Wirkrichtung" value="Punkt_Objekt_TOP_Kante/Wirkrichtung/Wert"/>
		<iso:let name="Seitliche_Lage" value="Punkt_Objekt_TOP_Kante/Seitliche_Lage/Wert"/>
		<iso:let name="Auswurfrichtung" value="Entgleisungsschuh/Auswurfrichtung/Wert"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="(if ($Wirkrichtung = 'in') then $Seitliche_Lage = $Auswurfrichtung       else $Seitliche_Lage != $Auswurfrichtung) and $Seitliche_Lage = ('rechts', 'links')       and $Auswurfrichtung = ('rechts', 'links')">Die Angabe der Auswurfrichtung in der Gleissperre ist nicht konsistent mit den (redundanten) Angaben zur seitlichen Lage und Wirkrichtung.</iso:assert>
	</iso:rule>
</iso:pattern>