<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="1680809C-80B5-4C4D-AF03-0A6A89D0C747" see="Weichen_und_Gleissperren_ID644" id="ID644" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Fehlen von Weiche/Gleissperre_Element nur bei besonderem Fahrwegelement</iso:title>
	<iso:p>
		<planpro:description>
			Wenn dem W_Kr_Gsp_Element keine W_Kr_Gsp_Komponente mit Attributgruppe Besonderes_Fahrwegelement zugeordnet ist,
			muss im W_Kr_Gsp_Element entweder die Attributgruppe Weiche_Element oder die Attributgruppe Gleissperre_Element vorhanden sein.

			Wenn ∄ W_Kr_Gsp_Element ← W_Kr_Gsp_Komponente.ID_W_Kr_Gsp_Element → W_Kr_Gsp_Komponente.Besonderes_Fahrwegelement,
			dann muss W_Kr_Gsp_Element.Weiche_Element ∨ W_Kr_Gsp_Element.Gleissperre_Element vorhanden sein. 
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Es handelt sich nicht um ein besonderes Fahrwegelement und eine der beiden Attributgruppen Weiche_Element bzw.
				Gleissperre_Element ist vorhanden.
			</planpro:success>
			<planpro:error>
				Obwohl es sich nicht um ein besonderes Fahrwegelement handelt, ist weder die Attributgruppe Weiche_Element 
				noch die Attributgruppe Gleissperre_Element vorhanden.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Element</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:WGsp-644(current(), parent::*)]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Weiche_Element | Gleissperre_Element">Obwohl es sich nicht um ein besonderes Fahrwegelement handelt, ist weder die Attributgruppe Weiche_Element noch die Attributgruppe Gleissperre_Element vorhanden.</iso:assert>
  </iso:rule>
</iso:pattern>