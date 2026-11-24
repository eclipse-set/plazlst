<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="16917E58-C7C0-4339-B90D-537372F37A68" see="Weichen_und_Gleissperren_ID337" id="ID337" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Anzahl Antriebe bei Rückfallweichen und ZHA</iso:title>
	<iso:p>
		<planpro:description>
			Bei Rückfallweichen und Zungen- und herzstücklosen Abzweigungen darf kein elektrischer Antrieb vorhanden sein. 
			
			Wenn W_Kr_Gsp_Element.W_Kr_Gsp_Element_Allg.W_Kr_Gsp_Stellart == "Rueckfallweiche" oder "ZHA",
			dann muss in der dazugehörigen W_Kr_Gsp_Komponente W_Kr_Gsp_Komponente.Zungenpaar.Elektrischer_Antrieb_Anzahl == "0" sein.
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls
			- W_Kr_Gsp_Element_Allg.W_Kr_Gsp_Stellart xsi:nil="true"
			- fehlende relevante W_Kr_Gsp_Komponente
			- Zungenpaar.Elektrischer_Antrieb_Anzahl xsi:nil="true"
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Rückfallweiche oder Zungen- und herzstücklose Abzweigung hat keinen Antrieb.
			</planpro:success>
			<planpro:error>
				Die Anzahl der Antriebe für die Rückfallweiche oder Zungen- und herzstücklose Abzweigung ist ungleich 0.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Element</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][W_Kr_Gsp_Element_Allg/W_Kr_Gsp_Stellart/Wert = ('Rueckfallweiche', 'ZHA')]">
		<iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', Identitaet/Wert, parent::*)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="every $x in $verweisende_Komponenten satisfies $x/Zungenpaar/Elektrischer_Antrieb_Anzahl/Wert = '0'">Die Anzahl der Antriebe für die Rückfallweiche oder Zungen- und herzstücklose Abzweigung ist ungleich 0.</iso:assert>
	</iso:rule>
</iso:pattern>