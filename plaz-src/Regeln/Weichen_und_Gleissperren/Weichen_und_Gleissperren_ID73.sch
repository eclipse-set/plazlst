<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="2A2DFEA9-70EF-4E2D-829F-05D1D6AD3ACD" see="Weichen_und_Gleissperren_ID73" id="ID73" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Anzahl Weichen-/Kreuzungs-Elemente für DKW, DW, EKW, Flachkreuzung und Kreuzung</iso:title>
	<iso:p>
		<planpro:description>
			Einfache Kreuzungsweichen, Doppelte Kreuzungsweichen, Doppelweichen, Flachkreuzungen und Kreuzungen werden
			durch genau zwei Weichen- bzw. Kreuzungselemente abgebildet. 
			
			Wenn W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "EKW", "EBKW", "EIBKW", "EABKW", "DKW", "DBKW", "DW", "Eins. DW",
			"Kr", "BKr", "IBKr" oder "Flachkreuzung",
			dann müssen genau 2 W_Kr_Gsp_Element auf die W_Kr_Anlage verweisen.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Für die Einfache Kreuzungsweiche, Doppelte Kreuzungsweiche, Doppelweiche, Flachkreuzung oder Kreuzung
				sind genau zwei Weichen- bzw. Kreuzungselemente vorhanden.
			</planpro:success>
			<planpro:error>
				Für die Einfache Kreuzungsweiche, Doppelte Kreuzungsweiche, Doppelweiche, Flachkreuzung oder Kreuzung
				sind [mehr/weniger] als zwei Weichen- bzw. Kreuzungselemente vorhanden.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Anlage</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('EKW', 'EBKW', 'EIBKW', 'EABKW', 'DKW', 'DBKW', 'DW', 'Eins. DW', 'Kr', 'BKr', 'IBKr', 'Flachkreuzung')]">
		<iso:let name="verweisende_Elemente" value="key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', Identitaet/Wert, parent::*)"/>
		<iso:let name="AnzahlVerweisendeElemente" value="count($verweisende_Elemente)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$AnzahlVerweisendeElemente = 2">Für die Einfache Kreuzungsweiche, Doppelte Kreuzungsweiche, Doppelweiche, Flachkreuzung oder Kreuzung sind <iso:value-of select="if ($AnzahlVerweisendeElemente &gt; 2) then 'mehr' else 'weniger'"/> als zwei Weichen- bzw. Kreuzungselemente vorhanden.</iso:assert>
	</iso:rule>
</iso:pattern>