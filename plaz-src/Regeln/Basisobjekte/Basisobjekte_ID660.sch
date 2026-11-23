<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="4698106C-1F86-4FD0-B923-FAE26971E8C8" id="ID660-abstract" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3" see="Basisobjekte_ID660"><iso:title>Nicht sinnvolle seitliche Lage zur Topologie bei Punktobjekten</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Bei Definierten Punkten in den Infrastrukturdaten für ATO, Bahnsteigzugängen, Bahnübergangsanlagen, 
			Eckpunkten eines BÜ-Gefahrraumes, Gleisbezogenen Abbildungen einer BÜ-Kante, Datenpunkten, ETCS Knoten, 
			Elementen einer Freimeldeanlage, Komponenten einer Freimeldeanlage, die keine Achszählpunkte oder 
			einschienigen Isolierstöße sind, Ortungshilfen für Gefahrraumfreimeldeanlagen, Gleisabschlüssen, 
			Höhenpunkten, Schrankenantrieben, sonstigen Punkten, Technischen Punkten, Überhöhungen, Unterbringungen, 
			Komponenten von Weichen oder Kreuzungen oder Besonderen Fahrwegelementen, 
			Grenzen des Ausrüstungsbereichs eines Zugbeeinflussungssystem oder RBC, 
			Zugeinwirkungen, die nicht aus Einfach- oder Doppelsensoren, Schienenkontakten oder aus isolierten Schienen bestehen oder
			nicht als "sonstige" unbestimmt sind, 
			darf keine seitliche Lage zur Topologie vorhanden sein.
			
			
			Bei [ATO_Timing_Point | Bahnsteig_Zugang | BUE_Anlage | BUE_Gefahrraum_Eckpunkt | BUE_Kante | Datenpunkt |
			ETCS_Knoten mit ETCS_Knoten.Knoten_Auf_TOP_Kante | FMA_Element | 
			FMA_Komponente ohne FMA_Komponente.Achszaehlpunkt und mit FMA_Komponente.FMA_Komponente_Art ≠ 
			Isolierstoss_einschienig | GFR_Tripelspiegel | Gleis_Abschluss | Hoehenpunkt | Schrankenantrieb | 
			Sonstiger_Punkt | Technischer_Punkt | Ueberhoehung | Unterbringung mit Unterbringung.Punkt_Objekt_TOP_Kante |
			W_Kr_Gsp_Komponente ohne W_Kr_Gsp_Komponente.Entgleisungsschuh | ZUB_Bereichsgrenze | 
			Zugeinwirkung mit Zugeinwirkung.Zugeinwirkung_Allg.Zugeinwirkung_Art ≠ [Einfach_Sensor | Einfach_Sensor_richtungsabhaengig | 
			Doppel_Sensor | Isolierte_Schiene_alleinstehend | Isolierte_Schiene_FMA_Anlage_mitbenutzt | sonstige | Schienenkontakt]]
			darf kein Punkt_Objekt_TOP_Kante.Seitliche_Lage vorhanden sein. 
</code></pre>
</planpro:description>
			<planpro:comment>
				In ETCS_Knoten ist Punkt_Objekt_TOP_Kante unter Knoten_Auf_TOP_Kante erforderlich, 
				allerdings kann alternativ ID_TOP_Knoten genutzt werden, wo kein Punkt_Objekt_TOP_Kanten möglich ist.
				
				Prüfung entfällt, falls:
				- relevante Zugeinwirkung_Art nil
				- relevante FMA_Komponente_Art nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Eine seitliche Lage zur Topologie ist nicht angegeben.
				</planpro:success>
				<planpro:error>
					Eine seitliche Lage zur Topologie ist angegeben.
				</planpro:error>
			</planpro:test>
			<planpro:output>ATO_Timing_Point|Bahnsteig_Zugang|BUE_Anlage|BUE_Gefahrraum_Eckpunkt|BUE_Kante|Datenpunkt|ETCS_Knoten|FMA_Element|FMA_Komponente|GFR_Tripelspiegel|Gleis_Abschluss|Hoehenpunkt|Schrankenantrieb|Sonstiger_Punkt|Technischer_Punkt|Ueberhoehung|Unterbringung|W_Kr_Gsp_Komponente|ZUB_Bereichsgrenze|Zugeinwirkung</planpro:output>
		</iso:p><iso:include href="../incomplete/FMA_Komponente-nil_FMA_Komponente_Art.xml"/><iso:include href="../incomplete/Zugeinwirkung-nil_Zugeinwirkung_Art.xml"/><iso:rule abstract="true" id="rule-660">
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="not((. | *)/Punkt_Objekt_TOP_Kante/Seitliche_Lage)">Eine seitliche Lage zur Topologie ist angegeben.</iso:assert>
		</iso:rule><iso:rule context="ATO_Timing_Point[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="Bahnsteig_Zugang[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="BUE_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="BUE_Gefahrraum_Eckpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="BUE_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="ETCS_Knoten[Knoten_Auf_TOP_Kante][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="FMA_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="FMA_Komponente[not(FMA_Komponente_Achszaehlpunkt)][not(FMA_Komponente_Art/Wert = 'Isolierstoss_einschienig')][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="GFR_Tripelspiegel[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="Gleis_Abschluss[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="Hoehenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="Schrankenantrieb[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="Sonstiger_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="Technischer_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="Ueberhoehung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="Unterbringung[Punkt_Objekt_TOP_Kante][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="W_Kr_Gsp_Komponente[not(Entgleisungsschuh)][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="ZUB_Bereichsgrenze[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule><iso:rule context="Zugeinwirkung[not(Zugeinwirkung_Allg/Zugeinwirkung_Art/Wert = ('Einfach_Sensor', 'Einfach_Sensor_richtungsabhaengig', 'Doppel_Sensor', 'Isolierte_Schiene_alleinstehend', 'Isolierte_Schiene_FMA_Anlage_mitbenutzt', 'sonstige', 'Schienenkontakt'))][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-660"/>
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID660" is-a="ID660-abstract"><iso:param name="Role" value="warning"/><iso:param name="ignore-Zugeinwirkung_Art" value="('Einfach_Sensor', 'Einfach_Sensor_richtungsabhaengig', 'Doppel_Sensor',     'Isolierte_Schiene_alleinstehend', 'Isolierte_Schiene_FMA_Anlage_mitbenutzt', 'Schienenkontakt', 'sonstige')"/><iso:param name="ignore-FMA_Komponente_Art" value="('Isolierstoss_einschienig')"/></iso:pattern>
	
</planpro:pattern>