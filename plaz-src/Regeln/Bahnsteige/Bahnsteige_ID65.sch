<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="EBA44918-79B7-4C64-8157-55A417E48CAC" see="Bahnsteige_ID65" id="ID65" planpro:arbeitspaket="Bahnsteige" planpro:version="1.10.0.3">
	<iso:title>Vorhandensein eines Bahnsteigzugangs</iso:title>
	<iso:p>
		<planpro:description>
			Existiert eine Bahnsteig-Anlage, so muss auch ein Bahnsteig-Zugang hierauf verweisen.

			Wenn Bahnsteig_Anlage existiert, muss mindestens ein Verweis Bahnsteig_Zugang.ID_Bahnsteig_Anlage
			hierauf vorhanden sein.
		</planpro:description>
		<planpro:comment>
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Bahnsteig-Anlage hat mindestens einen Zugang.
			</planpro:success>
			<planpro:error>
				Die Bahnsteig-Anlage hat keinen Zugang.
			</planpro:error>
		</planpro:test>
		<planpro:output>Bahnsteig_Anlage</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Bahnsteig_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="key('Bahnsteig_Zugang-fuerBahnsteig_Anlage', Identitaet/Wert, parent::*)">Die Bahnsteig-Anlage hat keinen Zugang.</iso:assert>
  </iso:rule>
</iso:pattern>