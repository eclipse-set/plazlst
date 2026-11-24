<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="07962BFD-CB41-4051-A0AC-3A61D9856DBF" see="Weichen_und_Gleissperren_ID635" id="ID635" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Zweifache Punkt-Verortung einer W-Komponente</iso:title>
	<iso:p>
		<planpro:description>
			Es soll eine Warnung erfolgen, wenn eine Weichen-Komponente nicht zweifach punktförmig verortet ist.

			Es soll eine Warnung erfolgen, wenn W_Kr_Gsp_Komponente.Zungenpaar existiert und 
			Anzahl W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante ≠ 2 ist. 
		</planpro:description>
		<planpro:comment>
			Einfache punktförmige Verortung bei stillgelegten Weichen und Zungen- und Herzstücklosen Anbindungen denkbar. 
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Weichen-Komponente ist zweifach punktförmig verortet.
			</planpro:success>
			<planpro:error>
				Die Weichen-Komponente ist nicht zweifach punktförmig verortet.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Komponente</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Zungenpaar]">
		<iso:let name="topKanteCount" value="count(distinct-values(Punkt_Objekt_TOP_Kante/ID_TOP_Kante/Wert))"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$topKanteCount = 2">Die Weichen-Komponente ist nicht zweifach punktförmig verortet.</iso:assert>
  </iso:rule>
</iso:pattern>