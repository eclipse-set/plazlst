<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="3B7850F3-4FA4-4666-8ED6-EC0D18EB2B44" id="ID671-abstract" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3" see="ETCS_ID671"><iso:title>ETCS L2: Vorhandensein Ne 14 bei DP-Typ 20/21</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Wenn ein ETCS-Datenpunkt vom Typ 20 oder 21 vorhanden ist,
			muss ein Signal mit ETCS-Halt-Tafel (Ne 14) als funktionaler Bezugspunkt projektiert sein.
			
			Wenn Datenpunkt.DP_Typ.DP_Typ_GETCS.DP_Typ_ETCS == [20 | 21] vorhanden ist, 
			muss für DP_Typ.DP_Typ_GETCS.DP_Typ_ETCS == [20 | 21] gelten:
			DP_Typ.DP_Typ_GETCS.ID_DP_Bezug_Funktional → Markanter_Punkt.Markante_Stelle → 
			Signal ← Signal_Rahmen.ID_Signal ← Signal_Rahmen ← Signal_Signalbegriff.ID_Signal_Rahmen
			→ Signal_Signalbegriff.Signalbegriff_ID == "Ne_14".
</code></pre>
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
					Für den ETCS-Datenpunkt vom Typ 20 bzw. 21 ist als funktionaler Bezugspunkt ein Signal mit ETCS-Halt-Tafel (Ne 14) projektiert.
				</planpro:success>
				<planpro:error>
					Für den ETCS-Datenpunkt ist für [den Typ / die Typen] [relevante DP_Typ_ETCS] 
					als funktionaler Bezugspunkt ein Signal ohne ETCS-Halt-Tafel (Ne 14) projektiert. 
				</planpro:error>
			</planpro:test>
			<planpro:output>Datenpunkt</planpro:output>
		</iso:p><iso:include href="../incomplete/Datenpunkt-nil_DP_Typ_ETCS.xml"/><iso:include href="../incomplete/Datenpunkt-nil_DP_Bezug_Funktional.xml"/><iso:include href="../incomplete/Datenpunkt-miss_Markanter_Punkt.xml"/><iso:include href="../incomplete/Datenpunkt-nil_Markante_Stelle.xml"/><iso:include href="../incomplete/Datenpunkt-miss_Signal_Rahmen.xml"/><iso:include href="../incomplete/Datenpunkt-miss_Signal_Begriff.xml"/><iso:rule context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Datenpunkt-hasDPTyp(., $relevanter-DP_Typ)]" role="$Role">
			<iso:let name="Markanter_Punkt" value="key('Markanter_Punkt', DP_Typ/DP_Typ_GETCS[DP_Typ_ETCS/Wert = $relevanter-DP_Typ]/ID_DP_Bezug_Funktional/Wert, /*)"/>
			<iso:let name="MP-not-Ne14" value="$Markanter_Punkt[not(key('Signal_Signalbegriff-fuerSignal_Rahmen',      key('Signal_Rahmen-fuerSignal', ID_Markante_Stelle/Wert, /*)/Identitaet/Wert, /*)     /Signalbegriff_ID/substring-after(@xsi:type,':') = 'Ne_14')]"/>
			<iso:let name="DP_Typ-not-Ne14" value="DP_Typ/DP_Typ_GETCS[ID_DP_Bezug_Funktional/Wert = $MP-not-Ne14/Identitaet/Wert]/DP_Typ_ETCS/Wert[. = $relevanter-DP_Typ]"/>
			<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$MP-not-Ne14">Für den ETCS-Datenpunkt ist für <iso:value-of select="if ($DP_Typ-not-Ne14[2]) then 'die Typen ' else 'den Typ '"/> <iso:value-of select="string-join($DP_Typ-not-Ne14, ', ')"/> als funktionaler Bezugspunkt ein Signal ohne ETCS-Halt-Tafel (Ne 14) projektiert.</iso:report>
		</iso:rule></iso:pattern>

	<iso:pattern id="ID671" is-a="ID671-abstract"><iso:param name="Role" value="error"/><iso:param name="relevanter-DP_Typ" value="('20', '21')"/><iso:param name="ignore-DP_Typ" value="(DP_Typ_GESG | DP_Typ_GGNT | DP_Typ_GSonst | DP_Typ_GTrans | DP_Typ_GZBS)"/></iso:pattern>
</planpro:pattern>