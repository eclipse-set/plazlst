<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="05734C62-C731-498A-8D49-5C3DF3AD84D5" id="ID664-abstract" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3" see="Basisobjekte_ID664"><iso:title>Nicht sinnvolle Wirkrichtung zur Topologie bei Punktobjekten</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Bei Bahnsteigzugängen, Bahnübergangsanlagen, Eckpunkten eines BÜ-Gefahrraums,
			Gleisbezogenen Abbildungen einer BÜ-Kante, Datenpunkten, ETCS Knoten, 
			Elementen und Komponenten einer Freimeldeanlage, Ortungshilfen für Gefahrraumfreimeldeanlagen, 
			Höhenpunkten, Elementen der punktförmigen Zugbeeinflussung, Schrankenantrieben, Signalbefestigungen,
			Sonstigen Punkten, Technischen Punkten, Überhöhungen, Unterbringungen, 
			Komponenten von Weichen oder besonderen Fahrwegelementen (außer abklappbarer Prellbock, sonstige)
			und Zugeinwirkungen 
			darf keine Wirkrichtung zur Topologie angegeben sein. 
			
			Bei [Bahnsteig_Zugang | BUE_Anlage | BUE_Gefahrraum_Eckpunkt | BUE_Kante | Datenpunkt | ETCS_Knoten mit ETCS_Knoten.Knoten_Auf_TOP_Kante | 
			FMA_Element | FMA_Komponente | GFR_Tripelspiegel | Hoehenpunkt | PZB_Element | Schrankenantrieb | 
			Signal_Befestigung | Sonstiger_Punkt | Technischer_Punkt | Ueberhoehung | Unterbringung mit Unterbringung.Punkt_Objekt_TOP_Kante | 
			W_Kr_Gsp_Komponente mit [W_Kr_Gsp_Komponente.Zungenpaar | W_Kr_Gsp_Komponente.Besonderes_Fahrwegelement ≠ 
			["abklappbarer Prellbock" | "sonstige"]] | Zugeinwirkung]
			darf Punkt_Objekt_TOP_Kante.Wirkrichtung nicht vorhanden sein.
</code></pre>
</planpro:description>
			<planpro:comment>
				In ETCS_Knoten ist Punkt_Objekt_TOP_Kante unter Knoten_Auf_TOP_Kante erforderlich, 
				allerdings kann alternativ ID_TOP_Knoten genutzt werden, wo kein Punkt_Objekt_TOP_Kanten möglich ist.
				
				Prüfung entfällt, falls:
				- relevantes Besonderes_Fahrwegelement nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Es ist keine Wirkrichtung zur Topologie angegeben.
				</planpro:success>
				<planpro:error>
					Eine Wirkrichtung zur Topologie ist angegeben.
				</planpro:error>
			</planpro:test>
			<planpro:output>Bahnsteig_Zugang|BUE_Anlage|BUE_Gefahrraum_Eckpunkt|BUE_Kante|Datenpunkt|ETCS_Knoten|FMA_Element|FMA_Komponente|GFR_Tripelspiegel|Hoehenpunkt|PZB_Element|Schrankenantrieb|Signal_Befestigung|Sonstiger_Punkt|Technischer_Punkt|Ueberhoehung|Unterbringung|W_Kr_Gsp_Komponente|Zugeinwirkung</planpro:output>
		</iso:p><iso:include href="../incomplete/W_Kr_Gsp_Komponente-nil_Besonderes_Fahrwegelement.xml"/><iso:rule abstract="true" id="rule-664">
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="not((. | *)/Punkt_Objekt_TOP_Kante/Wirkrichtung)">Eine Wirkrichtung zur Topologie ist angegeben.</iso:assert>
		</iso:rule><iso:rule context="Bahnsteig_Zugang[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="BUE_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="BUE_Gefahrraum_Eckpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="BUE_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="ETCS_Knoten[Knoten_Auf_TOP_Kante][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="FMA_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="FMA_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="GFR_Tripelspiegel[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="Hoehenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="PZB_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="Schrankenantrieb[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="Signal_Befestigung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="Sonstiger_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="Technischer_Punkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="Ueberhoehung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="Unterbringung[Punkt_Objekt_TOP_Kante][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="W_Kr_Gsp_Komponente[Zungenpaar | Besonderes_Fahrwegelement[not(Wert = ('abklappbarer Prellbock', 'sonstige'))]][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule><iso:rule context="Zugeinwirkung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-664"/>
		</iso:rule></iso:pattern>
		
	<iso:pattern id="ID664" is-a="ID664-abstract"><iso:param name="Role" value="warning"/><iso:param name="ignore-Besonderes_Fahrwegelement" value="('abklappbarer Prellbock', 'sonstige')"/></iso:pattern>
	
</planpro:pattern>