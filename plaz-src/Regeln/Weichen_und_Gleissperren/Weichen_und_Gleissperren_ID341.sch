<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="AA11FF5C-C304-44A1-B776-286C54B418C1" see="Weichen_und_Gleissperren_ID341" id="ID341" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Angabe von Herzstück-Antrieben</iso:title>
	<iso:p>
		<planpro:description>
			Herzstückantriebe dürfen nur bei einer ABW, EW, ABW/IBW, Flachkreuzung, IBW, IBW/ABW oder Klothoidenweiche angegeben werden.
			Bei Einfachen Kreuzungsweichen, Doppelten Kreuzungsweichen, Doppelweichen und Kreuzungen ist die Angabe unzulässig. 
			
			Wenn W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "DKW", "DBKW", "DW", "Eins. DW", "EKW", "EBKW", "EIBKW", "EABKW",
			"Kr", "BKr" oder "IBKr", 
			darf in den dazugehörigen W_Kr_Gsp_Komponente W_Kr_Gsp_Komponente.Zungenpaar.Herzstueck_Antriebe nicht angegeben sein. 
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Für die Weichen- bzw. Kreuzungskomponenten sind keine Herzstück-Antriebe angegeben.
			</planpro:success>
			<planpro:error>
				Für mindestens eine der Weichen- bzw. Kreuzungskomponenten sind Herzstück-Antriebe angegeben.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Anlage</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('DKW', 'DBKW', 'DW', 'Eins. DW', 'EKW', 'EBKW', 'EIBKW', 'EABKW', 'Kr', 'BKr', 'IBKr')]">
		<iso:let name="verweisende_Elemente" value="key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', Identitaet/Wert, parent::*)"/>
		<iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $verweisende_Elemente/Identitaet/Wert, parent::*)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="every $x in $verweisende_Komponenten satisfies not($x/Zungenpaar/Herzstueck_Antriebe)">Für mindestens eine der Weichen- bzw. Kreuzungskomponenten sind Herzstück-Antriebe angegeben.</iso:assert>
	</iso:rule>
</iso:pattern>