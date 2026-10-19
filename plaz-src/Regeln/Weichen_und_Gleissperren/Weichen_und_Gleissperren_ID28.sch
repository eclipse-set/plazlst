<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="C11BB704-EE15-42C4-91A5-2A0B9B1A7322" see="Weichen_und_Gleissperren_ID28" id="ID28" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Verweis auf Regelzeichnung bei Weichen und Flachkreuzungen</iso:title>
	<iso:p>
	    <planpro:description>
	    	Bei Weichen und Flachkreuzungen im Planungsbereich muss im Element oder einer zugehörigen Komponente ein Verweis
	    	auf eine Regelzeichnung vorhanden sein, sofern als Stellart nicht stillgelegt, sonstige oder unbestimmt angegeben ist.
	    	
	    	Wenn Planung_Einzel.LST_Objekte_Planungsbereich.ID_LST_Objekt_Planungsbereich == W_Kr_Gsp_Element.Identitaet und
	    	W_Kr_Gsp_Element.ID_W_Kr_Anlage → W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == 
	    	"ABW", "DKW", "DW", "EKW", "EW", "Flachkreuzung", 
	    	"IBW", "EIBKW", "EABKW", "DBKW", "IBW/ABW", "ABW/IBW", "ZHV ABW", "ZHV IBW", "EBKW", "Sym. ABW", "Eins. DW",
	    	"Klothoidenweiche" oder "Korbbogenweiche"
	    	und W_Kr_Gsp_Element.W_Kr_Gsp_Element_Allg.W_Kr_Gsp_Stellart ≠ 
	    	"sonstige", "stillgelegt_links", "stillgelegt_rechts", "unbestimmt" oder "ZHA", 
	    	dann muss entweder in dem auf die W_Kr_Anlage verweisenden W_Kr_Gsp_Element oder einer auf dieses 
	    	W_Kr_Gsp_Element verweisenden W_Kr_Gsp_Komponente das Attribut ID_Regelzeichnung gefüllt sein.
	    </planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Für die Weiche bzw. Flachkreuzung im Planungsbereich ist in Element oder Komponente eine Regelzeichnung angegeben.
			</planpro:success>
			<planpro:error>
				Für die Weiche bzw. Flachkreuzung im Planungsbereich ist in Element oder Komponente keine Regelzeichnung angegeben.
			</planpro:error>					
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Element</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:WGsp-28(current(), parent::*)][key('Planungsbereich', Identitaet/Wert, /)]">
		<iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', Identitaet/Wert, parent::*)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="(current() | $verweisende_Komponenten)/ID_Regelzeichnung">Für die Weiche bzw. Flachkreuzung im Planungsbereich ist in Element oder Komponente keine Regelzeichnung angegeben.</iso:assert>	
  </iso:rule>
</iso:pattern>