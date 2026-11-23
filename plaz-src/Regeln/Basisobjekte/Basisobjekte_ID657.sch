<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="7D27A968-47AB-48DA-8FF2-5AB26AD4AC88" id="ID657-abstract" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3" see="Basisobjekte_ID657"><iso:title>Erforderlicher seitlicher Abstand zur Topologie bei Punktobjekten</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Bei Bahnübergangsanlagen, Eckpunkten eines BÜ-Gefahrraums, Elementen einer Freimeldeanlage,
			Ortungshilfen für Gefahrraumfreimeldeanlagen, Schrankenantrieben, Technischen Punkten und Unterbringungen mit topologischer Verortung
			muss ein seitlicher Abstand angegeben sein.
			
			Bei [BUE_Anlage | BUE_Gefahrraum_Eckpunkt | FMA_Element | GFR_Tripelspiegel | Schrankenantrieb | Technischer_Punkt |
			Unterbringung mit Unterbringung.Punkt_Objekt_TOP_Kante] muss Punkt_Objekt_TOP_Kante.Seitlicher_Abstand angegeben sein. 
</code></pre>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- relevanter Seitlicher_Abstand nil 
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Der seitliche Abstand zur Topologie ist angegeben. 
				</planpro:success>
				<planpro:error>
					Der seitliche Abstand zur Topologie ist nicht angegeben. 
				</planpro:error>
			</planpro:test>
			<planpro:output>BUE_Anlage|BUE_Gefahrraum_Eckpunkt|FMA_Element|GFR_Tripelspiegel|Schrankenantrieb|Technischer_Punkt|Unterbringung</planpro:output>
		</iso:p><iso:include href="../incomplete/_-nil_SeitlicherAbstand.xml"/><iso:rule abstract="true" id="rule-657">
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Punkt_Objekt_TOP_Kante/Seitlicher_Abstand">Der seitliche Abstand zur Topologie ist nicht angegeben.</iso:assert>
		</iso:rule><iso:rule context="BUE_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-657"/>
		</iso:rule><iso:rule context="BUE_Gefahrraum_Eckpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-657"/>
		</iso:rule><iso:rule context="FMA_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-657"/>
		</iso:rule><iso:rule context="GFR_Tripelspiegel[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-657"/>
		</iso:rule><iso:rule context="Schrankenantrieb[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-657"/>
		</iso:rule><iso:rule context="Technischer_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-657"/>
		</iso:rule><iso:rule context="Unterbringung[Punkt_Objekt_TOP_Kante][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-657"/>
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID657" is-a="ID657-abstract"><iso:param name="Role" value="warning"/></iso:pattern>
	
</planpro:pattern>