<?xml version="1.0" encoding="UTF-8" standalone="no"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="6779BE60-2178-11F1-B4AC-0800200C9A66" id="ID662" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3" see="Basisobjekte_ID662">
	<iso:title>Nicht sinnvolle Streckenzuordnung bei Punktobjekten</iso:title>
	<iso:p>
		<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>		Bei Eckpunkten eines BÜ-Gefahrraumes, Höhenpunkten und Überhöhungen
		darf keine Streckenzuordnung angegeben sein.

		Bei [BUE_Gefahrraum_Eckpunkt | Hoehenpunkt | Ueberhoehung] darf Punkt_Objekt_Strecke
		nicht vorhanden sein.
</code></pre>
</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Eine Streckenzuordnung ist nicht vorhanden.
			</planpro:success>
			<planpro:error>
				Eine Streckenzuordnung ist vorhanden.
			</planpro:error>
		</planpro:test>
		<planpro:output>BUE_Gefahrraum_Eckpunkt|Hoehenpunkt|Ueberhoehung</planpro:output>
	</iso:p>
	<iso:rule abstract="true" id="rule-662">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="not(Punkt_Objekt_Strecke)">Eine Streckenzuordnung ist vorhanden.</iso:assert>
	</iso:rule>
	<iso:rule context="BUE_Gefahrraum_Eckpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-662"/>
	</iso:rule>
	<iso:rule context="Hoehenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-662"/>
	</iso:rule>
	<iso:rule context="Ueberhoehung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-662"/>
	</iso:rule>
</iso:pattern>