<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="889BA91D-D083-46f4-B159-6260DFC06F53" see="Weichen_und_Gleissperren_ID193" id="ID193" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Anzahl Kreuzungs-Komponenten je -Element für Kreuzung und Flachkreuzung</iso:title>
	<iso:p>
		<planpro:description>
			Bei einer Kreuzung bzw. Flachkreuzung ist einem Kreuzungs-Element genau eine Kreuzungs-Komponente zugeordnet.
			
			Wenn W_Kr_Gsp_Element.ID_W_Kr_Anlage → W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "Kr", "BKr", "IBKr" oder "Flachkreuzung",
			dann muss auf das W_Kr_Gsp_Element genau eine W_Kr_Gsp_Komponente verweisen. 
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Dem Kreuzungs-Element ist genau eine Kreuzungs-Komponente zugeordnet.
			</planpro:success>
			<planpro:error>
				Dem Kreuzungs-Element sind weniger oder mehr als eine Kreuzungs-Komponente zugeordnet.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Element</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:WGsp-193(current(), parent::*)]">
		<iso:let name="W_Kr_Gsp_Komponente" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', Identitaet/Wert, parent::*)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="count($W_Kr_Gsp_Komponente) = 1">Dem Kreuzungs-Element sind <iso:value-of select="if (not($W_Kr_Gsp_Komponente)) then 'weniger' else 'mehr'"/> als eine Kreuzungs-Komponente zugeordnet.</iso:assert>
	</iso:rule>
</iso:pattern>