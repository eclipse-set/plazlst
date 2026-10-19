<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="B969EEDA-49C8-4909-944B-029EA13D90FC" see="Weichen_und_Gleissperren_ID336" id="ID336" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Anzahl Weichen-Komponenten für Doppelweiche</iso:title>
	<iso:p>
    <planpro:description>
    	Doppelweichen werden durch zwei Weichenkomponenten mit Attributgruppe "Zungenpaar" abgebildet.
    	
    	Wenn W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "DW" oder "Eins. DW",
    	dann müssen hierzu genau 2 W_Kr_Gsp_Komponente mit gefüllter Attributgruppe W_Kr_Gsp_Komponente.Zungenpaar vorhanden sein.
	</planpro:description>
	<planpro:comment/>
	<planpro:test>
		<planpro:success>
			Doppelweichen sind genau 2 Zungenpaare (Weichen-Komponenten) zugeordnet.
		</planpro:success>
		<planpro:error>
			Doppelweichen sind weniger oder mehr als 2 Zungenpaare (Weichen-Komponenten) zugeordnet.
		</planpro:error>					
	</planpro:test>
	<planpro:output>W_Kr_Anlage</planpro:output>
  </iso:p>
	<iso:rule role="error" context="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('DW', 'Eins. DW')]">
		<iso:let name="verweisende_Elemente" value="key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', Identitaet/Wert, parent::*)"/>
		<iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $verweisende_Elemente/Identitaet/Wert, parent::*)"/>
		<iso:let name="AnzahlKomponenteMitZungenpaar" value="count($verweisende_Komponenten/Zungenpaar)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="every $i in $verweisende_Komponenten satisfies $i/Zungenpaar and      $AnzahlKomponenteMitZungenpaar = 2">Doppelweichen sind <iso:value-of select="if ($AnzahlKomponenteMitZungenpaar &gt; 2) then 'mehr' else 'weniger'"/> als 2 Zungenpaare (Weichen-Komponenten) zugeordnet.</iso:assert>	
  </iso:rule>
</iso:pattern>