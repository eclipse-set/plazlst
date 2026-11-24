<?xml version="1.0" encoding="UTF-8" standalone="no"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="40B2536A-73EE-49BC-A42A-31370D890051" id="ID634" planpro:arbeitspaket="Gleis" planpro:version="1.10.0.3" see="Gleis_ID634">
	<iso:title>Definition Streckengleis</iso:title>
	<iso:p>
		<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>		Es soll eine Warnung erfolgen, wenn kein Streckengleis vorhanden ist.

		Es soll eine Warnung erfolgen, wenn Gleis_Art.Gleisart == "Streckengleis" nicht existiert.
</code></pre>
</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Es existiert mindestens ein Streckengleis.
			</planpro:success>
			<planpro:error>
				Es existiert kein Streckengleis.
			</planpro:error>
		</planpro:test>
		<planpro:output>Container</planpro:output>
	</iso:p>
	<iso:rule context="Container[parent::LST_Zustand_Ziel | parent::LST_Zustand][Gleis_Art]" role="warning">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Gleis_Art/Gleisart/Wert = 'Streckengleis'">Es existiert kein Streckengleis.</iso:assert>
 	</iso:rule>
</iso:pattern>