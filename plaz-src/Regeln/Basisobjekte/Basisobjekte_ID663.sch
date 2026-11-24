<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="96FE834C-FBC9-47E1-94A5-A22DCC31D543" see="Basisobjekte_ID663" id="ID663" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3">
	<iso:title>Erforderliche Wirkrichtung zur Topologie bei Punktobjekten</iso:title>
	<iso:p>
		<planpro:description>
			Bei Definierten Punkten in den Infrastrukturdaten für ATO, Gleisabschlüssen, Signalen,
			Kreuzungen, Gleissperren, abklappbaren Prellböcken und 
			Grenzen des Ausrüstungsbereichs eines Zugbeeinflussungssystem oder RBC 
			muss eine Wirkrichtung zur Topologie vorhanden sein. 
			
			Bei [ATO_Timing_Point | Gleis_Abschluss | Signal | W_Kr_Gsp_Komponente 
			mit [W_Kr_Gsp_Komponente.Kreuzung | W_Kr_Gsp_Komponente.Entgleisungsschuh | 
			W_Kr_Gsp_Komponente.Besonderes_Fahrwegelement == "abklappbarer Prellbock"] | ZUB_Bereichsgrenze]
			muss Punkt_Objekt_TOP_Kante.Wirkrichtung vorhanden sein. 
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls:
			- relevante Wirkrichtung nil
			- relevantes Besonderes_Fahrwegelement nil
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Eine Wirkrichtung zur Topologie ist angegeben.
			</planpro:success>
			<planpro:error>
				Es ist keine Wirkrichtung zur Topologie angegeben.
			</planpro:error>
		</planpro:test>
		<planpro:output>ATO_Timing_Point|Gleis_Abschluss|Signal|W_Kr_Gsp_Komponente|ZUB_Bereichsgrenze</planpro:output>
	</iso:p>
	
	<iso:include href="../incomplete/_-nil_Wirkrichtung-W.xml"/>
	<iso:include href="../incomplete/W_Kr_Gsp_Komponente-nil_Besonderes_Fahrwegelement-W.xml"/>
	
	<iso:rule id="rule-663" abstract="true">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Punkt_Objekt_TOP_Kante/Wirkrichtung">Es ist keine Wirkrichtung zur Topologie angegeben.</iso:assert>
	</iso:rule>
	<iso:rule role="warning" context="ATO_Timing_Point[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-663"/>
	</iso:rule>
	<iso:rule role="warning" context="Gleis_Abschluss[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-663"/>
	</iso:rule>
	<iso:rule role="warning" context="Signal[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-663"/>
	</iso:rule>
	<iso:rule role="warning" context="W_Kr_Gsp_Komponente[Kreuzung | Entgleisungsschuh | Besonderes_Fahrwegelement[Wert = 'abklappbarer Prellbock']][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-663"/>
	</iso:rule>
	<iso:rule role="warning" context="ZUB_Bereichsgrenze[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-663"/>
	</iso:rule>
	
	
	
	
	
	
</iso:pattern>