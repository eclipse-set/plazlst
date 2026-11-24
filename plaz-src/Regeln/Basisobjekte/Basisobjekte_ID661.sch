<?xml version="1.0" encoding="UTF-8" standalone="no"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="185B1D90-223D-11F1-B4AC-0800200C9A66" id="ID661" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3" see="Basisobjekte_ID661">
	<iso:title>Erforderliche Streckenzuordnung bei Punktobjekten</iso:title>
	<iso:p>
		<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>		Bei Definierten Punkten in den Infrastrukturdaten für ATO, Bahnsteigzugängen, Bahnübergangsanlagen, 
		Gleisbezogenen Abbildungen einer BÜ-Kante, Datenpunkten, Elementen und Komponenten einer Freimeldeanlage, 
		Ortungshilfen für Gefahrraumfreimeldeanlagen, Gleisabschlüssen, Elementen der punktförmigen Zugbeeinflussung, 
		Schrankenantrieben, Signalen, Signalbefestigungen, Sonstigen Punkten, Technischen Punkten, Komponenten von Weichen, 
		Kreuzungen und Gleissperren, Grenzen des Ausrüstungsbereichs eines Zugbeeinflussungssystems oder RBC und Zugeinwirkungen
		muss eine Streckenzuordnung vorhanden sein.
		
		Bei [ATO_Timing_Point | Bahnsteig_Zugang | BUE_Anlage | BUE_Kante | Datenpunkt | FMA_Element | FMA_Komponente |
		GFR_Tripelspiegel | Gleis_Abschluss | PZB_Element | Schrankenantrieb | Signal | Signal_Befestigung | Sonstiger_Punkt |
		Technischer_Punkt | W_Kr_Gsp_Komponente | ZUB_Bereichsgrenze | Zugeinwirkung] muss Punkt_Objekt_Strecke vorhanden sein.
</code></pre>
</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Eine Streckenzuordnung ist vorhanden.
			</planpro:success>
			<planpro:error>
				Eine Streckenzuordnung ist nicht vorhanden.
			</planpro:error>
		</planpro:test>
		<planpro:output>ATO_Timing_Point|Bahnsteig_Zugang|BUE_Anlage|BUE_Kante|Datenpunkt|FMA_Element|FMA_Komponente|GFR_Tripelspiegel|Gleis_Abschluss|PZB_Element|Schrankenantrieb|Signal|Signal_Befestigung|Sonstiger_Punkt|Technischer_Punkt|W_Kr_Gsp_Komponente|ZUB_Bereichsgrenze|Zugeinwirkung</planpro:output>
	</iso:p>

	<iso:rule abstract="true" id="rule-661">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Punkt_Objekt_Strecke">Eine Streckenzuordnung ist nicht vorhanden.</iso:assert>
	</iso:rule>
	<iso:rule context="ATO_Timing_Point[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="Bahnsteig_Zugang[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="BUE_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="BUE_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="FMA_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="FMA_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="GFR_Tripelspiegel[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="Gleis_Abschluss[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="PZB_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="Schrankenantrieb[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="Signal[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="Signal_Befestigung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="Sonstiger_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="Technischer_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="ZUB_Bereichsgrenze[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
	<iso:rule context="Zugeinwirkung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="warning">
		<iso:extends rule="rule-661"/>
	</iso:rule>
</iso:pattern>