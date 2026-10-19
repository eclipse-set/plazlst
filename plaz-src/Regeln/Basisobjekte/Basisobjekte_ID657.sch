<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="7D27A968-47AB-48DA-8FF2-5AB26AD4AC88" see="Basisobjekte_ID657" id="ID657" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3">
	<iso:title>Erforderlicher seitlicher Abstand zur Topologie bei Punktobjekten</iso:title>
	<iso:p>
		<planpro:description>
			Bei Bahnübergangsanlagen, Eckpunkten eines BÜ-Gefahrraums, Elementen einer Freimeldeanlage,
			Ortungshilfen für Gefahrraumfreimeldeanlagen, Schrankenantrieben, Technischen Punkten und Unterbringungen mit topologischer Verortung
			muss ein seitlicher Abstand angegeben sein.
			
			Bei [BUE_Anlage | BUE_Gefahrraum_Eckpunkt | FMA_Element | GFR_Tripelspiegel | Schrankenantrieb | Technischer_Punkt |
			Unterbringung mit Unterbringung.Punkt_Objekt_TOP_Kante] muss Punkt_Objekt_TOP_Kante.Seitlicher_Abstand angegeben sein. 
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
	</iso:p>
	
	<iso:include href="../incomplete/_-nil_SeitlicherAbstand-W.xml"/>
	
	<iso:rule id="rule-657" abstract="true">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Punkt_Objekt_TOP_Kante/Seitlicher_Abstand">Der seitliche Abstand zur Topologie ist nicht angegeben.</iso:assert>
	</iso:rule>
	<iso:rule role="warning" context="BUE_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-657"/>
	</iso:rule>
	<iso:rule role="warning" context="BUE_Gefahrraum_Eckpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-657"/>
	</iso:rule>
	<iso:rule role="warning" context="FMA_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-657"/>
	</iso:rule>
	<iso:rule role="warning" context="GFR_Tripelspiegel[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-657"/>
	</iso:rule>
	<iso:rule role="warning" context="Schrankenantrieb[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-657"/>
	</iso:rule>
	<iso:rule role="warning" context="Technischer_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-657"/>
	</iso:rule>
	<iso:rule role="warning" context="Unterbringung[Punkt_Objekt_TOP_Kante][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-657"/>
	</iso:rule>

	
	
	
</iso:pattern>