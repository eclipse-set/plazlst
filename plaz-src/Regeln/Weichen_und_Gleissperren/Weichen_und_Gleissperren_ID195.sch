<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="7F0E68B1-DA2C-48dc-80B7-40031D70F2EA" see="Weichen_und_Gleissperren_ID195" id="ID195" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Zungenprüfkontakte bei Kreuzungsweichen</iso:title>
	<iso:p>
		<planpro:description>
			Kreuzungsweichen haben keine Zungenprüfkontakte. 
			
			Wenn W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "DKW", "DBKW", "EKW", "EBKW", "EIBKW", "EABKW", 
			dann muss in den dazugehörigen W_Kr_Gsp_Komponente W_Kr_Gsp_Komponente.Zungenpaar.Zungenpruefkontakt_Anzahl == "0" sein. 
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls
			- W_Kr_Anlage_Allg.W_Kr_Art xsi:nil="true"
			- W_Kr_Gsp_Komponente.Zungenpaar.Zungenpruefkontakt_Anzahl == xsi:nil="true",
			- fehlende referenzierte W_Kr_Gsp_Element(e)
			- fehlende referenzierte W_Kr_Gsp_Komponente(n)
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Kreuzungsweiche hat keinen Zungenprüfkontakt. 
			</planpro:success>
			<planpro:error>
				Die Kreuzungsweiche hat mindestens einen Zungenprüfkontakt. 
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Anlage</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:WGsp-195(current(), parent::*)]">
		<iso:let name="verweisende_Elemente" value="key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', Identitaet/Wert, parent::*)"/>
		<iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $verweisende_Elemente/Identitaet/Wert, parent::*)"/>
		<iso:let name="Zungenpruefkontakt" value="$verweisende_Komponenten/Zungenpaar/Zungenpruefkontakt_Anzahl/Wert"/>
		<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="count($verweisende_Komponenten) != count($Zungenpruefkontakt) or not($Zungenpruefkontakt) or $Zungenpruefkontakt != '0'">Die Kreuzungsweiche hat mindestens einen Zungenprüfkontakt.</iso:report>
	</iso:rule>
</iso:pattern>