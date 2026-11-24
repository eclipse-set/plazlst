<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="76FEB1C6-9B5D-47D6-BD92-E3D9AAB2E04D" see="Basisobjekte_ID658" id="ID658" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3">
	<iso:title>Nicht sinnvoller seitlicher Abstand zur Topologie bei Punktobjekten</iso:title>
	<iso:p>
		<planpro:description>
			Bei Definierten Punkten in den Infrastrukturdaten für ATO, Bahnsteigzugängen, Gleisbezogenen Abbildungen einer BÜ-Kante, 
			Datenpunkten, ETCS Knoten, Komponenten einer Freimeldeanlage, Gleisabschlüssen, Höhenpunkten, 
			Elementen der punktförmigen Zugbeeinflussung, Sonstigen Punkten, Überhöhungen, Komponenten von Weichen, Kreuzungen oder Gleissperren,
			Grenzen des Ausrüstungsbereichs eines Zugbeeinflussungssystems oder RBC und Zugeinwirkungen
			darf kein seitlicher Abstand zur Topologie angegeben sein.
			
			Bei [ATO_Timing_Point | Bahnsteig_Zugang | BUE_Kante | Datenpunkt | ETCS_Knoten mit ETCS_Knoten.Knoten_Auf_TOP_Kante | FMA_Komponente | Gleis_Abschluss |
			Hoehenpunkt | PZB_Element | Sonstiger_Punkt | Ueberhoehung | W_Kr_Gsp_Komponente | ZUB_Bereichsgrenze | Zugeinwirkung]
			darf kein Punkt_Objekt_TOP_Kante.Seitlicher_Abstand vorhanden sein. 
		</planpro:description>
		<planpro:comment>
			In ETCS_Knoten ist Punkt_Objekt_TOP_Kante unter Knoten_Auf_TOP_Kante erforderlich, 
			allerdings kann alternativ ID_TOP_Knoten genutzt werden, wo kein Punkt_Objekt_TOP_Kanten möglich ist.
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Ein seitlicher Abstand zur Topologie ist nicht angegeben.
			</planpro:success>
			<planpro:error>
				Ein seitlicher Abstand zur Topologie ist angegeben.
			</planpro:error>
		</planpro:test>
		<planpro:output>ATO_Timing_Point|Bahnsteig_Zugang|BUE_Kante|Datenpunkt|ETCS_Knoten|FMA_Komponente|Gleis_Abschluss|Hoehenpunkt|PZB_Element|Sonstiger_Punkt|Ueberhoehung|W_Kr_Gsp_Komponente|ZUB_Bereichsgrenze|Zugeinwirkung</planpro:output>
	</iso:p>

	<iso:rule id="rule-658" abstract="true">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="not((. | *)/Punkt_Objekt_TOP_Kante/Seitlicher_Abstand)">Ein seitlicher Abstand zur Topologie ist angegeben.</iso:assert>
	</iso:rule>
	<iso:rule role="warning" context="ATO_Timing_Point[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="Bahnsteig_Zugang[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="BUE_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="ETCS_Knoten[Knoten_Auf_TOP_Kante][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="FMA_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="Gleis_Abschluss[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="Hoehenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="PZB_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="Sonstiger_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="Ueberhoehung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="ZUB_Bereichsgrenze[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	<iso:rule role="warning" context="Zugeinwirkung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-658"/>
	</iso:rule>
	

	
</iso:pattern>