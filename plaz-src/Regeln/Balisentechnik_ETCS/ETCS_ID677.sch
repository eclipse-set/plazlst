<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">	
	<iso:pattern abstract="true" fpi="38903317-18FE-4F88-AF6A-BCBAB5D8B20A" id="ID677-abstract" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3" see="ETCS_ID677"><iso:title>ETCS L2: DP-Typen aus Datenpunkt in Fachtelegrammen</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Wenn ein Datenpunkt für ETCS L2 verwendet wird, 
			müssen die ETCS-Datenpunkttypen mit den Typ-Angaben der ETCS-Fachtelegramme übereinstimmen.
			
			Wenn ein Datenpunkt für Datenpunkt.DP_Typ.DP_Typ_GETCS verwendet wird, 
			müssen alle Datenpunkt.DP_Typ.DP_Typ_GETCS.DP_Typ_ETCS == Datenpunkt.DP_Telegramm.ID_Fachtelegramm → 
			Fachtelegramm.FT_ETCS_L2_Merkmale.FT_ETCS_L2_Typ sein. 
</code></pre>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- DP_Typ_ETCS nil
				- ID_Fachtelegramm nil
				- relevantes Fachtelegramm fehlend
				- FT_ETCS_L2_Typ nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Der Datenpunkt wird für ETCS L2 genutzt und alle ETCS-Datenpunkttypen entsprechen
					den Typ-Angaben in den ETCS-Fachtelegrammen. 
				</planpro:success>
				<planpro:error>
					Der Datenpunkt wird für ETCS L2 genutzt und [der/die] ETCS-Datenpunkttyp[en] [fehlende DP-Typen] 
					[entspricht/entsprechen] nicht [der/den] Typ-Angabe[n] [im/in den] ETCS-Fachtelegramm[en]. 
				</planpro:error>
			</planpro:test>
			<planpro:output>Datenpunkt</planpro:output>
		</iso:p><iso:include href="../incomplete/Datenpunkt-nil_DP_Typ_ETCS.xml"/><iso:include href="../incomplete/Datenpunkt-nil_ID_Fachtelegramm.xml"/><iso:include href="../incomplete/Datenpunkt-miss_Fachtelegramm.xml"/><iso:include href="../incomplete/Datenpunkt-nil_FT_ETCS_L2_Typ.xml"/><iso:rule context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][DP_Typ/DP_Typ_GETCS]" role="$Role">
			<iso:let name="fachtelegramm-typen" value="key('Fachtelegramm', DP_Telegramm/ID_Fachtelegramm/Wert, parent::*)/FT_ETCS_L2_Merkmale/FT_ETCS_L2_Typ/Wert"/>
			<iso:let name="DP-not-FT" value="DP_Typ/DP_Typ_GETCS[not(DP_Typ_ETCS/Wert = $fachtelegramm-typen)]"/>
			<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$DP-not-FT">Der Datenpunkt wird für ETCS L2 genutzt und <iso:value-of select="if ($DP-not-FT[2]) then 'die ETCS-Datenpunkttypen ' else 'der ETCS-Datenpunkttyp '"/> <iso:value-of select="string-join($DP-not-FT/DP_Typ_ETCS/Wert, ', ')"/> <iso:value-of select="if ($DP-not-FT[2]) then ' entsprechen' else ' entspricht'"/> nicht <iso:value-of select="if ($fachtelegramm-typen[2]) then 'den Typ-Angaben in den ETCS-Fachtelegrammen' else 'der Typ-Angabe im ETCS-Fachtelegramm'"/>.</iso:report>
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID677" is-a="ID677-abstract"><iso:param name="Role" value="error"/><iso:param name="ignore-DP_Typ" value="(DP_Typ_GESG | DP_Typ_GGNT | DP_Typ_GSonst | DP_Typ_GTrans | DP_Typ_GZBS)"/></iso:pattern>
	
</planpro:pattern>