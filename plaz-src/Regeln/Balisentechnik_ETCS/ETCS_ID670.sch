<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="C58A0579-1540-4E5B-976D-FD9E79F76EDD" id="ID670-abstract" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3" see="ETCS_ID670"><iso:title>ETCS L2: Signal als Bezugspunkt für DP-Typ 20, 21, 22, 23, 24, 26, 28 und 50</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Jedem ETCS-DP-Typ 20, 21, 22, 23, 24, 26, 28 oder 50 muss ein Signal als funktionaler Bezugspunkt zugeordnet sein. 

			Wenn Datenpunkt.DP_Typ.DP_Typ_GETCS.DP_Typ_ETCS == [ 20 | 21 | 22 | 23 | 24 | 26 | 28 | 50 ],
			dann muss in diesem Datenpunkt.DP_Typ.DP_Typ_GETCS ein Verweis auf 
			Datenpunkt.DP_Typ.DP_Typ_GETCS.ID_DP_Bezug_Funktional → Markanter_Punkt.Markante_Stelle → Signal vorhanden sein.
</code></pre>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls: 
				- DP_Typ_ETCS nil 
				- ID_DP_Bezug_Funktional nil 
				- referenzierter Markanter_Punkt fehlend 
				- relevante Markante_Stelle nil 
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Für den ETCS-DP-Typ [DP_Typ_ETCS] ist ein Signal als funktionaler Bezugspunkt angegeben.
				</planpro:success>
				<planpro:error>
					Für [den ETCS-DP-Typ / die ETCS-DP-Typen] [DP_Typ_ETCS] ist kein Signal als funktionaler Bezugspunkt angegeben.
				</planpro:error>
			</planpro:test>
			<planpro:output>Datenpunkt</planpro:output>
		</iso:p><iso:include href="../incomplete/Datenpunkt-nil_DP_Typ_ETCS.xml"/><iso:include href="../incomplete/Datenpunkt-nil_DP_Bezug_Funktional.xml"/><iso:include href="../incomplete/Datenpunkt-miss_Markanter_Punkt.xml"/><iso:include href="../incomplete/Datenpunkt-nil_Markante_Stelle.xml"/><iso:rule context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Datenpunkt-hasDPTyp(., $relevanter-DP_Typ)]" role="$Role">
			<iso:let name="Markanter_Punkt" value="key('Markanter_Punkt', DP_Typ/DP_Typ_GETCS[DP_Typ_ETCS/Wert = $relevanter-DP_Typ]/ID_DP_Bezug_Funktional/Wert, /*)"/>
			<iso:let name="MP-not-Signal" value="$Markanter_Punkt[not(key('Signal', ID_Markante_Stelle/Wert, /*))]"/>
			<iso:let name="DP_Typ-not-Signal" value="DP_Typ/DP_Typ_GETCS[ID_DP_Bezug_Funktional/Wert = $MP-not-Signal/Identitaet/Wert]/DP_Typ_ETCS/Wert[. = $relevanter-DP_Typ]"/>
			<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$MP-not-Signal">Für <iso:value-of select="if ($DP_Typ-not-Signal[2]) then 'die ETCS-DP-Typen ' else 'den ETCS-DP-Typ '"/> <iso:value-of select="string-join($DP_Typ-not-Signal, ', ')"/> ist kein Signal als funktionaler Bezugspunkt angegeben.</iso:report>
		</iso:rule></iso:pattern>
	<iso:pattern id="ID670" is-a="ID670-abstract"><iso:param name="Role" value="error"/><iso:param name="relevanter-DP_Typ" value="('20', '21', '22', '23', '24', '26', '28', '50')"/><iso:param name="ignore-DP_Typ" value="(DP_Typ_GESG | DP_Typ_GGNT | DP_Typ_GSonst | DP_Typ_GTrans | DP_Typ_GZBS)"/></iso:pattern>
</planpro:pattern>