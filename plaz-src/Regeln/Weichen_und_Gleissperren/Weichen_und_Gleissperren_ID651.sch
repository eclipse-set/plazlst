<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="5F17A070-3A1A-11F0-B20A-0800200C9A66" see="Weichen_und_Gleissperren_ID651" id="ID651" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Punkt-Verortung einer Gsp-Komponente</iso:title>
	<iso:p>
		<planpro:description>
			Eine Gsp-Komponente muss einfach punktförmig verortet sein.
			
			Wenn W_Kr_Gsp_Komponente.Entgleisungsschuh existiert, muss Anzahl W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante == 1 sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Gsp-Komponente ist einfach punktförmig verortet.
			</planpro:success>
			<planpro:error>
				Die Kreuzungs-Komponente ist mehrfach punktförmig verortet.
				Hinweis: Bei gekuppelten Gleissperren sind zwei Gsp-Komponenten (Entgleisungsschuhe) mit jeweils einer topologischen Verortung anzulegen.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Komponente</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Entgleisungsschuh]">
		<iso:let name="topKanteCount" value="count(distinct-values(Punkt_Objekt_TOP_Kante/ID_TOP_Kante/Wert))"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$topKanteCount = 1">Die Kreuzungs-Komponente ist mehrfach punktförmig verortet. Hinweis: Bei gekuppelten Gleissperren sind zwei Gsp-Komponenten (Entgleisungsschuhe) mit jeweils einer topologischen Verortung anzulegen.</iso:assert>
	</iso:rule>
</iso:pattern>