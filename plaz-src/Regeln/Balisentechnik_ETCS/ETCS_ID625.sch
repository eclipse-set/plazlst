<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">	
	<iso:pattern abstract="true" fpi="28EE517A-9200-DD80-034C-02FD6672D5AA" id="ID625-abstract" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3" see="ETCS_ID625"><iso:title>ETCS L2: Verweis auf RBC</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Wenn ein Datenpunkt für ETCS L2 bzw. L2oS verwendet wird, muss er mindestens einem RBC zugeordnet sein.
			
			Wenn Datenpunkt.DP_Typ.DP_Typ_GETCS vorhanden ist, muss Datenpunkt.ID_RBC gefüllt sein.
</code></pre>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- ID_RBC nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Der Datenpunkt wird für ETCS L2 bzw. L2oS verwendet und ist mindestens einem RBC zugeordnet.
				</planpro:success>
				<planpro:error>
					Der Datenpunkt wird für ETCS L2 bzw. L2oS verwendet, ist jedoch keinem RBC zugeordnet.
				</planpro:error>
			</planpro:test>
			<planpro:output>Datenpunkt</planpro:output>
		</iso:p><iso:include href="../incomplete/Datenpunkt-nil_ID_RBC.xml"/><iso:rule context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][DP_Typ/DP_Typ_GETCS]" role="$Role">
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="ID_RBC">Der Datenpunkt wird für ETCS L2 bzw. L2oS verwendet, ist jedoch keinem RBC zugeordnet.</iso:assert>
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID625" is-a="ID625-abstract"><iso:param name="Role" value="error"/><iso:param name="ignore-DP_Typ" value="(DP_Typ_GESG | DP_Typ_GGNT | DP_Typ_GSonst | DP_Typ_GTrans | DP_Typ_GZBS)"/></iso:pattern>
	
</planpro:pattern>