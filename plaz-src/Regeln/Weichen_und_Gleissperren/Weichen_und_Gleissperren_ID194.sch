<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="82A2E480-9EE1-4425-AC85-3DAEEC145808" see="Weichen_und_Gleissperren_ID194" id="ID194" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Herzstück-Antriebe einer Flachkreuzung</iso:title>
	<iso:p>
		<planpro:description>
			Für eine Flachkreuzung müssen ein oder zwei elektrische Antriebe für die beweglichen Herzstückspitzen
			geplant werden, wobei je Kreuzungskomponente max. ein Antrieb möglich ist.

			Wenn W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "Flachkreuzung", dann darf in den dazugehörigen W_Kr_Gsp_Komponente
			W_Kr_Gsp_Komponente.Kreuzung.Elektrischer_Antrieb_Anzahl max. == "1" und die Summe der Werte nur == "1" oder "2" sein.
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls:
			- W_Kr_Anlage_Allg.W_Kr_Art xsi:nil="true"
			- fehlende relevante W_Kr_Gsp_Element
			- fehlende relevante W_Kr_Gsp_Komponente
			- Kreuzung.Elektrischer_Antrieb_Anzahl xsi:nil="true"
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Flachkreuzung hat einen oder zwei Herzstück-Antriebe und je Kreuzungskomponente ist max. ein Antrieb vorgesehen.
			</planpro:success>
			<planpro:error>
				Die Flachkreuzung hat weniger als einen oder mehr als zwei Herzstück-Antriebe oder einer Kreuzungskomponente sind
				mehrere Antriebe zugeordnet.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Anlage</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][W_Kr_Anlage_Allg/W_Kr_Art/Wert = 'Flachkreuzung']">
		<iso:let name="verweisende_Elemente" value="key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', Identitaet/Wert, parent::*)"/>
		<iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $verweisende_Elemente/Identitaet/Wert, parent::*)"/>
		<iso:let name="Anzahlen_Herzstueckantriebe" value="$verweisende_Komponenten/Kreuzung/Elektrischer_Antrieb_Anzahl/number(Wert)"/>
		<iso:let name="Summe_Herzstueckantriebe" value="sum($Anzahlen_Herzstueckantriebe)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="every $x in $Anzahlen_Herzstueckantriebe satisfies $x le 1 and $Summe_Herzstueckantriebe = (1, 2)">Die Flachkreuzung hat weniger als einen oder mehr als zwei Herzstück-Antriebe oder einer Kreuzungskomponente sind mehrere Antriebe zugeordnet.</iso:assert>
	</iso:rule>
</iso:pattern>