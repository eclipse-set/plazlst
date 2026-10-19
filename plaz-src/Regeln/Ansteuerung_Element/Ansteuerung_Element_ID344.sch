<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="B6FBD0B2-4219-4037-84DC-B503F4F32C2D" see="Ansteuerung_Element_ID344" id="ID344" planpro:arbeitspaket="Ansteuerung_Element" planpro:version="1.10.0.3">
	<iso:title>Existenz mind. einer Außenelementansteuerung zu einer ESTW-Zentraleinheit</iso:title>
	<iso:p>
		<planpro:description>
			Existiert eine ESTW-Zentraleinheit, so muss mindestens eine Außenelementansteuerung zugeordnet sein.
 
			Existiert eine ESTW_Zentraleinheit, so muss mindestens eine Aussenelementansteuerung mittels
			Aussenelementansteuerung.ID_Information_Primaer hierauf verweisen.
		</planpro:description>
		<planpro:comment/>		
		<planpro:test>
			<planpro:success>
				Es existiert eine ESTW-Zentraleinheit und mindestens eine Außenelementansteuerung ist zugeordnet.
			</planpro:success>
			<planpro:error>
				Es existiert eine ESTW-Zentraleinheit, aber keine Außenelementansteuerung ist zugeordnet.
			</planpro:error>
		</planpro:test>
		<planpro:output>ESTW_Zentraleinheit</planpro:output>
	</iso:p>
	<iso:rule role="error" context="ESTW_Zentraleinheit[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="key('Aussenelementansteuerung-fuerESTW_Zentraleinheit', Identitaet/Wert, parent::*)">Es existiert eine ESTW-Zentraleinheit, aber keine Außenelementansteuerung ist zugeordnet.</iso:assert>
  </iso:rule>
</iso:pattern>