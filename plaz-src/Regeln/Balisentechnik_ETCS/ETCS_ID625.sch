<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="28EE517A-9200-DD80-034C-02FD6672D5AA" see="ETCS_ID625" id="ID625" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3">
	<iso:title>Verweis auf RBC bei L2 und L2oS</iso:title>
	<iso:p>
		<planpro:description>
			Wenn ein Datenpunkt für ETCS L2 bzw. L2oS verwendet wird, muss er mindestens einem RBC zugeordnet sein.
			
			Wenn Datenpunkt.DP_Typ.DP_Typ_GETCS vorhanden ist, muss Datenpunkt.ID_RBC gefüllt sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Der Datenpunkt wird für ETCS L2 bzw. L2oS verwendet und ist mindestens einem RBC zugeordnet.
			</planpro:success>
			<planpro:error>
				Der Datenpunkt wird für ETCS L2 bzw. L2oS verwendet, ist jedoch keinem RBC zugeordnet.
			</planpro:error>
		</planpro:test>
		<planpro:output>Datenpunkt</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][DP_Typ/DP_Typ_GETCS]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="ID_RBC/Wert">Der Datenpunkt wird für ETCS L2 bzw. L2oS verwendet, ist jedoch keinem RBC zugeordnet.</iso:assert>
  </iso:rule>
</iso:pattern>