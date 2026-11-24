<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="21B7D2BF-8C14-48BF-BA5C-C5511F48571A" see="Weichen_und_Gleissperren_ID621" id="ID621" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Anzahl Weichen-Komponenten je -Element für DW und EKW</iso:title>
	<iso:p>
		<planpro:description>
			Bei Doppelweichen oder Einfachen Kreuzungsweichen ist einem Weichen-Element genau eine Weichen-Komponente zugeordnet.

			Wenn W_Kr_Gsp_Element.ID_W_Kr_Anlage → W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "DW", "Eins. DW", "EKW", "EBKW", EIBKW" oder EABKW", 
			dann muss auf das W_Kr_Gsp_Element genau eine W_Kr_Gsp_Komponente verweisen.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Bei Doppelweichen oder Einfachen Kreuzungsweichen ist einem Weichen-Element genau eine Weichen-Komponente zugeordnet. 
			</planpro:success>
			<planpro:error>
				Bei Doppelweichen oder Einfachen Kreuzungsweichen sind einem Weichen-Element [weniger/mehr] als eine Weichen-Komponenten zugeordnet.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Element</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:WGsp-621(current(), parent::*)]">
		<iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', Identitaet/Wert, parent::*)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="count($verweisende_Komponenten) = 1">Bei Doppelweichen oder Einfachen Kreuzungsweichen sind einem Weichen-Element <iso:value-of select="if (not($verweisende_Komponenten)) then 'weniger' else 'mehr'"/> als eine Weichen-Komponenten zugeordnet.</iso:assert>
	</iso:rule>
</iso:pattern>