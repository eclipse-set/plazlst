<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="472DEF0C-813D-4BDC-A57F-A91CD8848EBD" see="Weichen_und_Gleissperren_ID423" id="ID423" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Auswahl von Kreuzungs-Komponenten für Kreuzung und Flachkreuzung</iso:title>
	<iso:p>
		<planpro:description>
			Bei Kreuzungen und Flachkreuzungen dürfen nur Weichen-/Kreuzungskomponenten der Art "Kreuzung" verwendet werden.
			
			Wenn W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "Kr", "BKr", "IBKr" oder "Flachkreuzung", 
			dann muss in den zugeordneten W_Kr_Gsp_Komponente die Attributgruppe W_Kr_Gsp_Komponente.Kreuzung
			vorhanden sein. 
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Kreuzung bzw. Flachkreuzung wird ausschließlich durch Kreuzungs-Komponenten beschrieben.
			</planpro:success>
			<planpro:error>
				Die Kreuzung bzw. Flachkreuzung wird nicht nur durch Kreuzungs-Komponenten beschrieben.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Anlage</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('Kr', 'BKr', 'IBKr', 'Flachkreuzung')]">
		<iso:let name="verweisende_Elemente" value="key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', Identitaet/Wert, parent::*)"/>
		<iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $verweisende_Elemente/Identitaet/Wert, parent::*)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$verweisende_Komponenten/Kreuzung">Die Kreuzung bzw. Flachkreuzung wird nicht nur durch Kreuzungs-Komponenten beschrieben.</iso:assert>
	</iso:rule>
</iso:pattern>