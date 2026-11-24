<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="C19DAC35-91EF-4890-8389-B216D49A4113" see="Ansteuerung_Element_ID345" id="ID345" planpro:arbeitspaket="Ansteuerung_Element" planpro:version="1.10.0.3">
	<iso:title>Außenelementansteuerung mit mind. einem Stellelement/einer FMA-Komponente (ID_Information)</iso:title>
	<iso:p>
		<planpro:description>
			Existiert eine Außenelementansteuerung, so muss dieser mindestens ein Stellelement, eine FMA-Komponente (z. B. Azp) 
			oder eine andere Außenelementansteuerung zugeordnet sein.

			Existiert eine Außenelementansteuerung, so muss mindestens ein Stellelement mittels Stellelement.ID_Information 
			oder eine FMA_Komponente mittels FMA_Komponente.FMA_Komponente_Achszaehlpunkt.ID_Information oder 
			eine Aussenelementansteuerung mittels Aussenelementansteuerung.ID_Information_Primaer hierauf verweisen.
		</planpro:description>
		<planpro:comment/>		
		<planpro:test>
			<planpro:success>
				Auf die Außenelementansteuerung verweist mindestens ein Stellelement (z. B. Signal) oder eine FMA-Komponente (z. B. Azp)
				oder eine andere Außenelementansteuerung.
			</planpro:success>
			<planpro:error>
				Auf die Außenelementansteuerung verweist weder ein Stellelement (z. B. Signal) noch eine FMA-Komponente (z. B. Azp) oder
				eine andere Außenelementansteuerung.
			</planpro:error>
		</planpro:test>
		<planpro:output>Aussenelementansteuerung</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="Aussenelementansteuerung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="key('Stellelement-fuerAussenelementansteuerung', Identitaet/Wert, /*) or     key('FMA_Komponente-fuerAussenelementansteuerung', Identitaet/Wert, parent::*) or     key('Aussenelementansteuerung-fuerAussenelementansteuerung', Identitaet/Wert, parent::*)">Auf die Außenelementansteuerung verweist weder ein Stellelement (z. B. Signal) noch eine FMA-Komponente (z. B. Azp) oder eine andere Außenelementansteuerung.</iso:assert>
  </iso:rule>
</iso:pattern>