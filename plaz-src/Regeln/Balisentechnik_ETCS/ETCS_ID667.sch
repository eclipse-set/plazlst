<?xml version="1.0" encoding="UTF-8"?><planpro:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur">
	
	<iso:pattern fpi="9A5F64AC-FB2C-4B9D-AB2F-0B28CB2E0125" see="ETCS_ID667" abstract="true" id="ID667-abstract" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3"><iso:title>Anzahl Balisen für zweibalisige Datenpunkttypen</iso:title><iso:p>
			<planpro:description>
				ETCS-Datenpunkte vom Typ 1, 2, 3, 4, 5, 6, 9, 20, 21, 26, 27, 29, 35, 36, 38, 43, 45, 46, 47, 50, 52, 60, 61, 62, 63 müssen genau zwei Balisen zugeordnet sein.
				
				Wenn Datenpunkt.DP_Typ.DP_Typ_GETCS.DP_Typ_ETCSs == [ 1 | 2 | 3 | 4 | 5 | 6 | 9 | 20 | 21 | 26 | 27 | 29 | 35 | 36 | 38 | 43 | 45 | 46 | 47 | 50 | 52 | 60 | 61 | 62 | 63 ],
				dann müssen genau zwei Datenpunkt ← Balise.ID_Datenpunkt hierauf verweisen. 
			</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- DP_Typ_ETCS nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Der ETCS-Datenpunkt ist genau zwei Balisen zugeordnet.
				</planpro:success>
				<planpro:error>
					Der ETCS-Datenpunkt ist [keinen Balisen / einer Balise / mehr als zwei Balisen] zugeordnet,
					obwohl für [die] Typ[en] [relevante DP_Typ_ETCS] zwei Balisen gefordert sind. 
				</planpro:error>
			</planpro:test>
			<planpro:output>Datenpunkt</planpro:output>
		</iso:p><iso:include href="../incomplete/Datenpunkt-nil_DP_Typ_ETCS-E.xml"/><iso:rule role="error" context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Datenpunkt-hasDPTyp(., $DP-Typ)]">
			<iso:let name="Balisenanzahl" value="count(key('Balise_fuerDatenpunkt', Identitaet/Wert, parent::*))"/>
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Balisenanzahl = 2">Der ETCS-Datenpunkt ist <iso:value-of select="if ($Balisenanzahl = 0) then 'keinen Balisen' else if ($Balisenanzahl = 1) then 'einer Balise' else 'mehr als zwei Balisen'"/> zugeordnet, obwohl für <iso:value-of select="if (count(DP_Typ/DP_Typ_GETCS/DP_Typ_ETCS/Wert[. = $DP-Typ]) = 1) then 'den Typ ' else 'die Typen '"/> <iso:value-of select="string-join(DP_Typ/DP_Typ_GETCS/DP_Typ_ETCS/Wert[. = $DP-Typ], ', ')"/> genau zwei Balisen gefordert sind.</iso:assert>
		</iso:rule></iso:pattern>
	
	<iso:pattern is-a="ID667-abstract" id="ID667"><iso:param name="DP-Typ" value="('1', '2', '3', '4', '5', '6', '9', '20', '21', '26', '27', '29', '35', '36', '38', '43', '45', '46', '47', '50', '52', '60', '61', '62', '63')"/></iso:pattern>
	
</planpro:pattern>