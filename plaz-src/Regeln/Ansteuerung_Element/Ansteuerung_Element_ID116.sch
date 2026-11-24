<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="F91983ED-F2D2-41C0-9226-58C0F9E1CF22" see="Ansteuerung_Element_ID116" id="ID116" planpro:arbeitspaket="Ansteuerung_Element" planpro:version="1.10.0.3">
	<iso:title>Virtuelle Außenelementansteuerung ohne Unterbringung</iso:title>
	<iso:p>
		<planpro:description>
			Wenn eine Außenelementansteuerung virtuell ist, darf keine Unterbringung angegeben sein.

			Wenn Aussenelementansteuerung.Aussenelementansteuerung_Allg.Aussenelementansteuerung_Art == "virtuelle_Aussenelementansteuerung", 
			dann darf Aussenelementansteuerung.ID_Unterbringung nicht angegeben sein.
		</planpro:description>
		<planpro:comment>
			Die virtuelle AEA wird verwendet, wenn Hersteller und damit Stellwerksarchitektur noch unbekannt sind oder mehrere physische AEA
			zu einem Stellbereich zusammengefasst werden sollen.
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Bei der virtuellen Außenelementansteurung ist keine Unterbringung angegeben.
			</planpro:success>
			<planpro:error>
				Bei der virtuellen Außenelementansteurung ist eine Unterbringung angegeben.
			</planpro:error>
		</planpro:test>
		<planpro:output>Aussenelementansteuerung</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Aussenelementansteuerung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][AEA_Allg/Aussenelementansteuerung_Art/Wert = 'virtuelle_Aussenelementansteuerung']">
		<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="ID_Unterbringung">Bei der virtuellen Außenelementansteurung ist eine Unterbringung angegeben.</iso:report>
  </iso:rule>
</iso:pattern>