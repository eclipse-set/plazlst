<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="889BA91D-D083-46f4-B159-6260DFC06F53" id="ID193-abstract" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3" see="Weichen_und_Gleissperren_ID193"><iso:title>Anzahl Kreuzungs-Komponenten je -Element für Kreuzung und Flachkreuzung</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Bei einer Kreuzung bzw. Flachkreuzung ist einem Kreuzungs-Element genau eine Kreuzungs-Komponente zugeordnet.
			
			Wenn W_Kr_Gsp_Element.ID_W_Kr_Anlage → W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "Kr", "BKr", "IBKr" oder "Flachkreuzung",
			dann muss auf das W_Kr_Gsp_Element genau eine W_Kr_Gsp_Komponente verweisen. 
</code></pre>
</planpro:description>
			<planpro:comment>
			Eine fehlende W_Kr_Gsp_Komponente ist ein Fehler.
			
			Prüfung entfällt, falls:
			- ID_W_Kr_Anlage nil
			- relevante W_Kr_Anlage fehlend
			- W_Kr_Art nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Dem Kreuzungs-Element ist genau eine Kreuzungs-Komponente zugeordnet.
				</planpro:success>
				<planpro:error>
					Dem Kreuzungs-Element sind [weniger/mehr] als eine Kreuzungs-Komponente zugeordnet.
				</planpro:error>
			</planpro:test>
			<planpro:output>W_Kr_Gsp_Element</planpro:output>
		</iso:p><iso:include href="../incomplete/W_Kr_Gsp_Element-nil_ID_W_Kr_Anlage.xml"/><iso:include href="../incomplete/W_Kr_Gsp_Element-miss_W_Kr_Anlage.xml"/><iso:include href="../incomplete/W_Kr_Gsp_Element-nil_W_Kr_Art.xml"/><iso:rule context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:WGsp-W_Kr_Art(current(), parent::*, $relevante-W_Kr_Art)]" role="$Role">
			<iso:let name="W_Kr_Gsp_Komponente" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', Identitaet/Wert, parent::*)"/>
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="count($W_Kr_Gsp_Komponente) = 1">Dem Kreuzungs-Element sind <iso:value-of select="if (not($W_Kr_Gsp_Komponente)) then 'weniger' else 'mehr'"/> als eine Kreuzungs-Komponente zugeordnet.</iso:assert>
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID193" is-a="ID193-abstract"><iso:param name="Role" value="error"/><iso:param name="relevante-W_Kr_Art" value="('Kr', 'BKr', 'IBKr', 'Flachkreuzung')"/><iso:param name="ignore-W_Kr_Art" value="('ABW','ABW/IBW','DBKW','DKW','DW','EABKW','EBKW','EIBKW','Eins. DW','EKW','EW','IBW','IBW/ABW','Klothoidenweiche','Korbbogenweiche','sonstige','Sym. ABW','ZHA','ZHV ABW','ZHV IBW')"/></iso:pattern>
	
</planpro:pattern>