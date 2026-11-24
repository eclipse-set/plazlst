<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">	
	<iso:pattern abstract="true" fpi="9A5F64AC-FB2C-4B9D-AB2F-0B28CB2E0125" id="ID667-abstract" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3" see="ETCS_ID667"><iso:title>ETCS L2: Anzahl Balisen für zweibalisige DP-Typen</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			ETCS-Datenpunkte vom Typ 1, 2, 3, 4, 5, 6, 9, 20, 21, 26, 27, 29, 35, 36, 38, 43, 45, 46, 47, 50, 52, 60, 61, 62, 63 
			müssen genau zwei Balisen zugeordnet sein.
			
			Wenn Datenpunkt.DP_Typ.DP_Typ_GETCS.DP_Typ_ETCS == 
			[ 1 | 2 | 3 | 4 | 5 | 6 | 9 | 20 | 21 | 26 | 27 | 29 | 35 | 36 | 38 | 43 | 45 | 46 | 47 | 50 | 52 | 60 | 61 | 62 | 63 ],
			dann müssen genau zwei Balisen mittels Balise.ID_Datenpunkt hierauf verweisen. 
</code></pre>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- DP_Typ_ETCS nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Dem ETCS-Datenpunkt sind zwei Balisen zugeordnet.
				</planpro:success>
				<planpro:error>
					Dem ETCS-Datenpunkt [ist keine Balise / ist eine Balise / sind mehr als zwei Balisen] zugeordnet, 
					obwohl für [den Typ / die Typen] [relevante DP_Typ_GETCS] zwei Balisen gefordert sind.  
				</planpro:error>
			</planpro:test>
			<planpro:output>Datenpunkt</planpro:output>
		</iso:p><iso:include href="../incomplete/Datenpunkt-nil_DP_Typ_ETCS.xml"/><iso:rule context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Datenpunkt-hasDPTyp(., $relevanter-DP_Typ)]" role="$Role">
			<iso:let name="Balisenanzahl" value="count(key('Balise_fuerDatenpunkt', Identitaet/Wert, parent::*))"/>
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Balisenanzahl = 2">Dem ETCS-Datenpunkt <iso:value-of select="if ($Balisenanzahl = 0) then 'ist keine Balise' else        if ($Balisenanzahl = 1) then 'ist eine Balise' else 'sind mehr als zwei Balisen'"/> zugeordnet, obwohl für <iso:value-of select="if (count(DP_Typ/DP_Typ_GETCS/DP_Typ_ETCS/Wert[. = $relevanter-DP_Typ]) = 1) then 'den Typ ' else 'die Typen '"/> <iso:value-of select="string-join(DP_Typ/DP_Typ_GETCS/DP_Typ_ETCS/Wert[. = $relevanter-DP_Typ], ', ')"/> zwei Balisen gefordert sind.</iso:assert>
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID667" is-a="ID667-abstract"><iso:param name="Role" value="error"/><iso:param name="relevanter-DP_Typ" value="('1', '2', '3', '4', '5', '6', '9', '20', '21', '26', '27', '29',    '35', '36', '38', '43', '45', '46', '47', '50', '52', '60', '61', '62', '63')"/><iso:param name="ignore-DP_Typ" value="(DP_Typ_GESG | DP_Typ_GGNT | DP_Typ_GSonst | DP_Typ_GTrans | DP_Typ_GZBS)"/></iso:pattern>
	
</planpro:pattern>