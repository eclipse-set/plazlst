<?xml version="1.0" encoding="UTF-8"?><planpro:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur">
	<iso:pattern fpi="3B7850F3-4FA4-4666-8ED6-EC0D18EB2B44" see="ETCS_ID671" id="ID671-abstract" abstract="true" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3"><iso:title>Vorhandensein der ETCS-Halttafel bei Datenpunkttyp 20</iso:title><iso:p>
			<planpro:description>
				Wenn ein ETCS-Datenpunkt vom Typ 20 oder 21 verwendet wird, sollte eine ETCS-Halt-Tafel projektiert sein.
				
				Wenn Datenpunkt.DP_Typ.DP_Typ_GETCS.DP_Typ_ETCS == [20 | 21] vorhanden ist, 
				dann muss dieser DP_Typ.DP_Typ_GETCS.ID_DP_Bezug_Funktional ← Markanter_Punkt.Markante_Stelle ← Signal ← Signal_Rahmen.ID_Signal
				← Signal_Rahmen ← Signal_Signalbegriff.ID_Signal_Rahmen → Signal_Signalbegriff.Signalbegriff_ID == "Ne_14" sein. 
			</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- DP_Typ_ETCS nil
				- ID_DP_Bezug_Funktional nil
				- referenzierter Markanter_Punkt fehlend
				- relevante Markante_Stelle nil
				- relevanter Signal_Rahmen fehlend
				- relevanter Signal_Signalbegriff fehlend
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Am ETCS-Datenpunkt ist eine ETCS-Halt-Tafel projektiert.
				</planpro:success>
				<planpro:error>
					Am ETCS-Datenpunkt [ist keine/sind mehr als eine] ETCS-Halt-Tafel projektiert, obwohl für [die] Typ[en] [relevante DP_Typ_ETCS] eine ETCS-Halt-Tafel gefordert wird.
				</planpro:error>
			</planpro:test>
			<planpro:output>Datenpunkt</planpro:output>
		</iso:p><iso:include href="../incomplete/Datenpunkt-nil_DP_Typ_ETCS-E.xml"/><iso:include href="../incomplete/Datenpunkt-nil_DP_Bezug_Funktional-E.xml"/><iso:include href="../incomplete/Datenpunkt-miss_Markanter_Punkt-E.xml"/><iso:include href="../incomplete/Datenpunkt-nil_Markante_Stelle-E.xml"/><iso:include href="../incomplete/Datenpunkt-miss_Signal_Rahmen-E.xml"/><iso:include href="../incomplete/Datenpunkt-miss_Signal_Begriff-E.xml"/><iso:rule role="error" context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Datenpunkt-hasDPTyp(., $DP-Typ)]">
			<iso:let name="Markanter_Punkt" value="key('Markanter_Punkt', DP_Typ/DP_Typ_GETCS/ID_DP_Bezug_Funktional/Wert, /*)"/>
			<iso:let name="Signal_Rahmen" value="key('Signal_Rahmen-fuerSignal', $Markanter_Punkt/ID_Markante_Stelle/Wert, /*)"/>
			<iso:let name="Signal_Begriff" value="key('Signal_Signalbegriff-fuerSignal_Rahmen', $Signal_Rahmen/Identitaet/Wert, /*)"/>
			<iso:let name="Signalbegriff_Typ" value="$Signal_Begriff/Signalbegriff_ID/substring-after(@xsi:type,':')"/>
			<iso:let name="Anzahl-Ne14" value="count($Signalbegriff_Typ[. = 'Ne_14'])"/>
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Anzahl-Ne14 = 1">Am ETCS-Datenpunkt <iso:value-of select="if ($Anzahl-Ne14 = 0) then 'ist keine' else 'sind mehr als eine'"/> ETCS-Halt-Tafel projektiert, obwohl für <iso:value-of select="if (count(DP_Typ/DP_Typ_GETCS/DP_Typ_ETCS/Wert[. = $DP-Typ]) = 1) then 'den Typ ' else 'die Typen '"/> <iso:value-of select="string-join(DP_Typ/DP_Typ_GETCS/DP_Typ_ETCS/Wert[. = $DP-Typ], ', ')"/> genau eine ETCS-Halt-Tafel gefordert wird.</iso:assert>
		</iso:rule></iso:pattern>
	<iso:pattern is-a="ID671-abstract" id="ID671"><iso:param name="DP-Typ" value="('20', '21')"/></iso:pattern>
</planpro:pattern>