<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="DD3A6826-2E03-40B1-A0D4-A3F71DB23F8D" see="Bahnsteige_ID343" id="ID343" planpro:arbeitspaket="Bahnsteige" planpro:version="1.10.0.3">
	<iso:title>Bahnsteiganlage mit mind. einer Bahnsteigkante</iso:title>
	<iso:p>
		<planpro:description>
			Existiert eine Bahnsteig-Anlage, so muss mindestens eine Bahnsteig-Kante hierauf verweisen.

			Existiert eine Bahnsteig_Anlage, so muss mindestens eine Bahnsteig_Kante
			mittels Bahnsteig_Kante.ID_Bahnsteig_Anlage hierauf verweisen.
		</planpro:description>
		<planpro:comment>
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Bahnsteig-Anlage hat mindestens eine Bahnsteig-Kante.
			</planpro:success>
			<planpro:error>
				Die Bahnsteig-Anlage hat keine Bahnsteig-Kante.
			</planpro:error>
		</planpro:test>
		<planpro:output>Bahnsteig_Anlage</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Bahnsteig_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="key('Bahnsteig_Kante-fuerBahnsteig_Anlage', Identitaet/Wert, parent::*)">Die Bahnsteig-Anlage hat keine Bahnsteig-Kante.</iso:assert>
  </iso:rule>
</iso:pattern>