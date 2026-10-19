<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="B922FC4C-11A9-40F3-BA5B-07FEA32BC8D3" see="Weichen_und_Gleissperren_ID281" id="ID281" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Automatischer Rücklauf von W und Gsp nur bei vorhandener Vorzugslage</iso:title>
	<iso:p>
		<planpro:description>
			Wenn keine Vorzugslage definiert wurde, darf auch keine Angabe zum automatischen Rücklauf existieren. 
			
			Wenn W_Kr_Gsp_Element.Weiche_Element.Weiche_Vorzugslage und
			W_Kr_Gsp_Element.Gleissperre_Element.Gleissperre_Vorzugslage nicht angegeben ist, darf
			auch W_Kr_Gsp_Element.W_Kr_Gsp_Element_Allg.Vorzugslage_Automatik nicht angegeben werden.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Da keine Vorzugslage definiert wurde, existiert auch keine Angabe zum automatischen Rücklauf.
			</planpro:success>
			<planpro:error>
				Obwohl keine Vorzugslage definiert wurde, ist eine Angabe zum automatischen Rücklauf vorhanden.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Element</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][not(Weiche_Element/Weiche_Vorzugslage | Gleissperre_Element/Gleissperre_Vorzugslage)]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="not(W_Kr_Gsp_Element_Allg/Vorzugslage_Automatik)">Obwohl keine Vorzugslage definiert wurde, ist eine Angabe zum automatischen Rücklauf vorhanden.</iso:assert>
	</iso:rule>
</iso:pattern>