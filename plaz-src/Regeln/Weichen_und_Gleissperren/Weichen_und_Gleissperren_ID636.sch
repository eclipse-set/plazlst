<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="096F1F5E-066D-44DA-9464-529D27176930" see="Weichen_und_Gleissperren_ID636" id="ID636" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Zweifache Punkt-Verortung einer Kr-Komponente</iso:title>
	<iso:p>
		<planpro:description>
			Eine Kreuzungs-Komponente muss zweifach punktförmig verortet sein.

			Wenn W_Kr_Gsp_Komponente.Kreuzung existiert, muss Anzahl W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante == 2 sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Kreuzungs-Komponente ist zweifach punktförmig verortet.
			</planpro:success>
			<planpro:error>
				Die Kreuzungs-Komponente ist nicht zweifach punktförmig verortet.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Komponente</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Kreuzung]">
		<iso:let name="topKanteCount" value="count(distinct-values(Punkt_Objekt_TOP_Kante/ID_TOP_Kante/Wert))"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$topKanteCount = 2">Die Kreuzungs-Komponente ist nicht zweifach punktförmig verortet.</iso:assert>
  </iso:rule>
</iso:pattern>