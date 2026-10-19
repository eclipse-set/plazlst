<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="07EF2940-AA02-42AF-A542-26C14C316D5A" see="Weichen_und_Gleissperren_ID75" id="ID75" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Anzahl Weichen-Komponenten je -Element für DKW</iso:title>
	<iso:p>
		<planpro:description>
			Bei Doppelten Kreuzungsweichen sind einem Weichen-Element genau zwei Weichen-Komponenten zugeordnet.
			
			Wenn W_Kr_Gsp_Element.ID_W_Kr_Anlage → W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "DKW" oder "DBKW", 
			dann müssen auf das W_Kr_Gsp_Element genau zwei W_Kr_Gsp_Komponente verweisen.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Bei Doppelten Kreuzungsweichen sind einem Weichen-Element genau zwei Weichen-Komponenten zugeordnet. 
			</planpro:success>
			<planpro:error>
				Bei Doppelten Kreuzungsweichen sind einem Weichen-Element [weniger/mehr] als zwei Weichen-Komponenten zugeordnet. 
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Element</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:WGsp-75(current(), parent::*)]">
		<iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', Identitaet/Wert, parent::*)"/>
		<iso:let name="AnzahlVerweisendeKomponenten" value="count($verweisende_Komponenten)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$AnzahlVerweisendeKomponenten = 2">Bei Doppelten Kreuzungsweichen sind einem Weichen-Element <iso:value-of select="if ($AnzahlVerweisendeKomponenten gt 2) then 'mehr' else 'weniger'"/> als zwei Weichen-Komponenten zugeordnet.</iso:assert>
	</iso:rule>
</iso:pattern>