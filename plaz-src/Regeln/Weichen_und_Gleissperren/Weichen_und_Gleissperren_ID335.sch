<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="68193EC8-B8AD-4BBD-A6E9-6CD2DE288C74" see="Weichen_und_Gleissperren_ID335" id="ID335" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Anzahl Weichen-Komponenten für ABW, EW, IBW, Klothoiden-, Korbbogenweiche</iso:title>
	<iso:p>
		<planpro:description>
			"Einfache" Weichen (ABW, EW, IBW, Klothoiden-, Korbbogenweiche) werden
			durch genau eine Weichen-Komponente mit Attributgruppe "Zungenpaar" abgebildet.
			
			Wenn W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "ABW", "EW", "IBW", "ABW/IBW", "IBW/ABW", "Sym. ABW",
			"Klothoidenweiche" oder "Korbbogenweiche",
			dann muss zu dieser W_Kr_Anlage genau eine W_Kr_Gsp_Komponente vorhanden sein und 
			diese muss die Attributgruppe W_Kr_Gsp_Komponente.Zungenpaar enthalten. 
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Zu dieser Weichen-Anlage ist genau eine Weichen-Komponente mit Attributgruppe "Zungenpaar" vorhanden.
			</planpro:success>
			<planpro:error>
				Zu dieser Weichen-Anlage sind weniger oder mehr als eine Weichen-Komponente mit Attributgruppe "Zungenpaar" vorhanden.
			</planpro:error>
		</planpro:test>
		<planpro:output>W_Kr_Anlage</planpro:output>
	</iso:p>
	<iso:rule role="error" context="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('ABW', 'EW', 'IBW', 'ABW/IBW', 'IBW/ABW', 'Sym. ABW', 'Klothoidenweiche', 'Korbbogenweiche')]">
		<iso:let name="verweisende_Elemente" value="key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', Identitaet/Wert, parent::*)"/>
		<iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $verweisende_Elemente/Identitaet/Wert, parent::*)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="count($verweisende_Komponenten) = 1 and count($verweisende_Komponenten/Zungenpaar) = 1">Zu dieser Weichen-Anlage sind <iso:value-of select="if (not($verweisende_Komponenten/Zungenpaar)) then 'weniger' else 'mehr'"/> als eine Weichen-Komponente mit Attributgruppe "Zungenpaar" vorhanden.</iso:assert>
	</iso:rule>
</iso:pattern>