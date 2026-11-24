<?xml version="1.0" encoding="UTF-8" standalone="no"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="505B12A0-ED91-424D-9A12-C01A3ECB2A02" id="ID424" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3" see="Weichen_und_Gleissperren_ID424">
	<iso:title>Vorzugslage und automatischer Rücklauf bei Weichen und Gleissperren</iso:title>
	<iso:p>
		<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>		Wenn für eine Weiche oder Gleissperre eine Vorzugslage definiert wurde,
		muss auch eine Angabe zum automatischen Rücklauf vorhanden sein.
		
		Wenn W_Kr_Gsp_Element.Weiche_Element.Weiche_Vorzugslage oder
		W_Kr_Gsp_Element.Gleissperre_Element.Gleissperre_Vorzugslage angegeben ist, muss auch
		W_Kr_Gsp_Element.W_Kr_Gsp_Element_Allg.Vorzugslage_Automatik angegeben werden.
</code></pre>
</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls:
			- relevante Weiche_Element.Weiche_Vorzugslage xsi:nil="true"
			- relevante Gleissperre_Element.Gleissperre_Vorzugslage xsi:nil="true" 
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Neben der Angabe der Vorzugslage ist auch eine Angabe zum automatischen Rücklauf vorhanden.
			</planpro:success>
			<planpro:error>
				Zwar wurde eine Vorzugslage definiert, es ist jedoch keine Angabe zum automatischen Rücklauf vorhanden.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Element</planpro:output>
	</iso:p>
	<iso:rule context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Weiche_Element/Weiche_Vorzugslage | Gleissperre_Element/Gleissperre_Vorzugslage]" role="error">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="W_Kr_Gsp_Element_Allg/Vorzugslage_Automatik">Zwar wurde eine Vorzugslage definiert, es ist jedoch keine Angabe zum automatischen Rücklauf vorhanden.</iso:assert>
	</iso:rule>
</iso:pattern>