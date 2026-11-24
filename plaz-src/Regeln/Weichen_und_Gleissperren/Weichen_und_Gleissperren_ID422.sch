<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="3de43f0d-3e1c-4b47-8b68-047eadee41a2" see="Weichen_und_Gleissperren_ID422" id="ID422" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Anzahl Zungenprüfkontakte bei Rückfallweichen</iso:title>
	<iso:p>
		<planpro:description>
			Bei Rückfallweichen muss genau ein Zungenprüfkontakt geplant werden.
			
			Wenn W_Kr_Gsp_Element.W_Kr_Gsp_Element_Allg.W_Kr_Gsp_Stellart == "Rueckfallweiche", dann muss in der dazugehörigen
			W_Kr_Gsp_Komponente W_Kr_Gsp_Komponente.Zungenpaar.Zungenpruefkontakt_Anzahl == "1" sein.
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls
			- W_Kr_Gsp_Element_Allg.W_Kr_Gsp_Stellart xsi:nil="true"
			- fehlende relevante W_Kr_Gsp_Komponente
			- Zungenpaar.Elektrischer_Antrieb_Anzahl xsi:nil="true"
			- Zungenpaar.Zungenpruefkontakt_Anzahl xsi:nil="true"
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Für die Rückfallweiche wurde genau ein Zungenprüfkontakt geplant.
			</planpro:success>
			<planpro:error>
				Die Anzahl der Zungenprüfkontakte für die Rückfallweiche ist ungleich 1.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Element</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:WGsp-422(current(), parent::*)]">
		<iso:let name="Rueckfallweiche_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', Identitaet/Wert, parent::*)"/>
		<iso:let name="Zungenpruefkontakt" value="$Rueckfallweiche_Komponenten/Zungenpaar/Zungenpruefkontakt_Anzahl/Wert"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="count($Rueckfallweiche_Komponenten) = 1 and count($Zungenpruefkontakt) = 1 and $Zungenpruefkontakt = '1'">Die Anzahl der Zungenprüfkontakte für die Rückfallweiche ist ungleich 1.</iso:assert>
	</iso:rule>
</iso:pattern>