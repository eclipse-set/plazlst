<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">	
	<iso:pattern abstract="true" fpi="A74B219C-69D3-4505-8E56-50C0B5D8E031" id="ID678-abstract" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3" see="ETCS_ID678"><iso:title>ETCS L2: DP-Typ aus Fachtelegramm im Datenpunkt</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Wenn ein Fachtelegramm für ETCS L2 verwendet wird, 
			muss der Typ des Fachtelegramms mit einem Datenpunkttyp im Datenpunkt übereinstimmen.
			
			Wenn Fachtelegramm.FT_ETCS_L2_Merkmale vorhanden, muss
			Fachtelegramm.FT_ETCS_L2_Merkmale.FT_ETCS_L2_Typ ==
			Fachtelegramm ← Datenpunkt.DP_Telegramm.ID_Fachtelegramm → Datenpunkt.DP_Typ.DP_Typ_GETCS.DP_Typ_ETCS sein. 
</code></pre>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- FT_ETCS_L2_Typ nil
				- relevanter Datenpunkt fehlend
				- DP_Typ_ETCS nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Das Fachtelegramm (DP-Typ) wird für ETCS L2 genutzt und die Typ-Angabe im Fachtelegramm entspricht einer Typ-Angabe im Datenpunkt. 
				</planpro:success>
				<planpro:error>
					Das Fachtelegramm (DP-Typ) wird für ETCS L2 genutzt, die Typ-Angabe [fehlender DP-Typ] im Fachtelegramm entspricht jedoch nicht einer Typ-Angabe im Datenpunkt.
				</planpro:error>
			</planpro:test>
			<planpro:output>Fachtelegramm</planpro:output>
		</iso:p><iso:include href="../incomplete/Fachtelegramm-nil_FT_ETCS_L2_Typ.xml"/><iso:include href="../incomplete/Fachtelegramm-miss_Datenpunkt.xml"/><iso:include href="../incomplete/Fachtelegramm-nil_DP_Typ_ETCS.xml"/><iso:rule context="Fachtelegramm[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][FT_ETCS_L2_Merkmale/FT_ETCS_L2_Typ]" role="$Role">
			<iso:let name="dp" value="key('Datenpunkt-fuerFachtelegramm', Identitaet/Wert, parent::*)"/>
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="every $i in $dp satisfies $i/DP_Typ/DP_Typ_GETCS/DP_Typ_ETCS/Wert = FT_ETCS_L2_Merkmale/FT_ETCS_L2_Typ/Wert">Das Fachtelegramm (DP-Typ) wird für ETCS L2 genutzt, die Typ-Angabe <iso:value-of select="FT_ETCS_L2_Merkmale/FT_ETCS_L2_Typ/Wert"/> im Fachtelegramm entspricht jedoch nicht einer Typ-Angabe im Datenpunkt.</iso:assert>
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID678" is-a="ID678-abstract"><iso:param name="Role" value="error"/></iso:pattern>
	
</planpro:pattern>