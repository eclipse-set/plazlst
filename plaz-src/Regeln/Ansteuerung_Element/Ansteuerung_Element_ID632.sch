<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="58E3B190-85EE-7A2D-9051-7EFD66B3B663" see="Ansteuerung_Element_ID632" id="ID632" planpro:arbeitspaket="Ansteuerung_Element" planpro:version="1.10.0.3">
	<iso:title>Definition Stellbereich für AEA Top</iso:title>
	<iso:p>
		<planpro:description>
			Für eine Außenelementansteuerung mit primärem Anschluss an eine ESTW-Zentraleinheit (AEA Top)
			muss ein Stellbereich definiert sein.
			
			Wenn Aussenelementansteuerung.ID_Information_Primaer == ESTW_Zentraleinheit,
			dann muss Stell_Bereich.ID_Aussenelementansteuerung == this.Aussenelementansteuerung.Identitaet existieren. 
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Für die Außenelementansteuerung mit primärem Anschluss an eine ESTW-Zentraleinheit (AEA Top) ist ein Stellbereich definiert.
			</planpro:success>
			<planpro:error>
				Für die Außenelementansteuerung mit primärem Anschluss an eine ESTW-Zentraleinheit (AEA Top) ist kein Stellbereich definiert.
			</planpro:error>
		</planpro:test>
		<planpro:output>Aussenelementansteuerung</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Aussenelementansteuerung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Aea-632(current(), parent::*)]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="key('Stell_Bereich-fuerAussenelementansteuerung', Identitaet/Wert, parent::*)">Für die Außenelementansteuerung mit primärem Anschluss an eine ESTW-Zentraleinheit (AEA Top) ist kein Stellbereich definiert.</iso:assert>
  </iso:rule>
</iso:pattern>