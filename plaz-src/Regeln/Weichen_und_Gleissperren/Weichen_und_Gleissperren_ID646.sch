<?xml version="1.0" encoding="UTF-8"?><planpro:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur">
	<iso:pattern fpi="8BAD01E0-72D3-407E-A15F-09DBD87AE1C1" see="Weichen_und_Gleissperren_ID646" id="ID646-abstract" abstract="true" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3"><iso:title>Austausch Weichenantriebe</iso:title><iso:p>
			<planpro:description>
				Es soll eine Warnung erfolgen, wenn ein Austausch der Weichenantriebe geplant, die Stellart der W/Kr/Gsp jedoch nicht elektrisch ist.
	
				Es soll eine Warnung erfolgen, wenn W_Kr_Gsp_Komponente.Austausch_Antriebe == "true" und W_Kr_Gsp_Komponente.ID_W_Kr_Gsp_Element → 
				W_Kr_Gsp_Element.W_Kr_Gsp_Element_Allg.W_Kr_Gsp_Stellart ≠ "elektrisch_ferngestellt" ∨ "elektrisch_ortsgestellt" ist. 
			</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls
				- relevante Austausch_Antriebe nil
				- relevantes ID_W_Kr_Gsp_Element nil
				- referenziertes W_Kr_Gsp_Element fehlend
				- relevante W_Kr_Gsp_Stellart nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Ein Austausch der Weichenantriebe ist geplant und die Stellart der W/Kr/Gsp ist elektrisch.
				</planpro:success>
				<planpro:error>
					Ein Austausch der Weichenantriebe ist geplant, die Stellart der W/Kr/Gsp ist jedoch nicht elektrisch.
				</planpro:error>
			</planpro:test>
			<planpro:output>W_Kr_Gsp_Komponente</planpro:output>
		</iso:p><iso:include href="../incomplete/W_Kr_Gsp_Komponente-nil_Austausch_Antriebe.xml"/><iso:include href="../incomplete/W_Kr_Gsp_Komponente-nil_ID_W_Kr_Gsp_Element.xml"/><iso:include href="../incomplete/W_Kr_Gsp_Komponente-miss_W_Kr_Gsp_Element.xml"/><iso:include href="../incomplete/W_Kr_Gsp_Komponente-nil_W_Kr_Gsp_Stellart.xml"/><iso:rule role="$Role" context="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Austausch_Antriebe/Wert = 'true']">
			<iso:let name="verweisende_Elemente" value="key('W_Kr_Gsp_Element', ID_W_Kr_Gsp_Element/Wert, parent::*)"/>
			<iso:let name="Stellart" value="$verweisende_Elemente/W_Kr_Gsp_Element_Allg/W_Kr_Gsp_Stellart/Wert"/>
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Stellart = ('elektrisch_ferngestellt', 'elektrisch_ortsgestellt')">Ein Austausch der Weichenantriebe ist geplant, die Stellart der W/Kr/Gsp ist jedoch nicht elektrisch.</iso:assert>
		</iso:rule></iso:pattern>

	<iso:pattern is-a="ID646-abstract" id="ID646"><iso:param name="Role" value="warning"/></iso:pattern>
	
</planpro:pattern>