<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="A260C68F-F1CB-4827-8167-50235FEC3C95" see="ETCS_ID638" id="ID638" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3">
	<iso:title>Zulässige Werte NID_C</iso:title>
	<iso:p>
		<planpro:description>
			Es soll eine Warnung erfolgen, wenn für NID_C ein Wert außerhalb des Bereichs 64 - 127 gewählt wurde.

			Es soll eine Warnung erfolgen, wenn für [Datenpunkt.DP_ETCS_Adresse.NID_C|RBC.ETCS_Adresse.NID_C] ein Wert
			außerhalb des Bereichs 64 - 127 gewählt wurde.
		</planpro:description>
		<planpro:comment>
			Der DB InfraGO AG wurde stellvertretend für alle Netzbetreiber in Deutschland der Bereich 64 - 127 zugeteilt.
			
			Prüfung entfällt, falls
			- relevantes NID_C nil
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Für [den Datenpunkt|das RBC] wurde NID_C mit einem Wert im Bereich 64 - 127 belegt.
			</planpro:success>
			<planpro:error>
				Für [den Datenpunkt|das RBC] wurde NID_C nicht mit einem Wert im Bereich 64 - 127 belegt.
				Für den Bereich der Bundesrepublik Deutschland ist dieser Wertebereich gem. Ril 819.1303 vorgegeben.
			</planpro:error>
		</planpro:test>
		<planpro:output>Datenpunkt|RBC</planpro:output>
	</iso:p>

	<iso:include href="../incomplete/Datenpunkt-nil_NID_C-W.xml"/>
	<iso:include href="../incomplete/RBC-nil_NID_C-W.xml"/>

	<iso:rule role="warning" context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][DP_ETCS_Adresse/NID_C]">
		<iso:let name="NID_C" value="fx:number-or-zero(DP_ETCS_Adresse/NID_C/Wert)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$NID_C ge 64 and $NID_C le 127">Für den Datenpunkt wurde NID_C nicht mit einem Wert im Bereich 64 - 127 belegt. Für den Bereich der Bundesrepublik Deutschland ist dieser Wertebereich gem. Ril 819.1303 vorgegeben.</iso:assert>
	</iso:rule>

	<iso:rule role="warning" context="RBC[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][ETCS_Adresse/NID_C]">
		<iso:let name="NID_C" value="fx:number-or-zero(ETCS_Adresse/NID_C/Wert)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$NID_C ge 64 and $NID_C le 127">Für das RBC wurde NID_C nicht mit einem Wert im Bereich 64 - 127 belegt. Für den Bereich der Bundesrepublik Deutschland ist dieser Wertebereich gem. Ril 819.1303 vorgegeben.</iso:assert>
	</iso:rule>
	
	
</iso:pattern>