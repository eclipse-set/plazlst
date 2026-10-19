<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="AAB2E7E2-7962-4D30-A610-80F98759B97E" see="Weichen_und_Gleissperren_ID338" id="ID338" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Warnung bei Flachkreuzung mit nur einem Herzstück-Antrieb</iso:title>
	<iso:p>
		<planpro:description>
			Flachkreuzungen mit einem Herzstück-Antrieb sollen neu nicht mehr geplant werden.
			
			Warnung, wenn W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "Flachkreuzung"
			und in den dazugehörigen W_Kr_Gsp_Komponente die Summe der beiden Werte von
			W_Kr_Gsp_Komponente.Kreuzung.Elektrischer_Antrieb_Anzahl == "1" ist.
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls
			- W_Kr_Anlage_Allg.W_Kr_Art xsi:nil="true"
			- fehlende relevante W_Kr_Gsp_Element
			- fehlende relevante W_Kr_Gsp_Komponente
			- Kreuzung.Elektrischer_Antrieb_Anzahl xsi:nil="true" 
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Flachkreuzung hat mehr als einen Herzstück-Antrieb.
			</planpro:success>
			<planpro:error>
				Die Flachkreuzung hat einen Herzstück-Antrieb. Diese Variante soll neu nicht mehr geplant werden.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Anlage</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][W_Kr_Anlage_Allg/W_Kr_Art/Wert = 'Flachkreuzung']">
		<iso:let name="verweisende_Elemente" value="key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', Identitaet/Wert, parent::*)"/>
		<iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $verweisende_Elemente/Identitaet/Wert, parent::*)"/>
		<iso:let name="Summe_Herzstueckantriebe" value="sum($verweisende_Komponenten/Kreuzung/Elektrischer_Antrieb_Anzahl/number(Wert))"/>
		<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Summe_Herzstueckantriebe = 1">Die Flachkreuzung hat einen Herzstück-Antrieb. Diese Variante soll neu nicht mehr geplant werden.</iso:report>
	</iso:rule>
</iso:pattern>