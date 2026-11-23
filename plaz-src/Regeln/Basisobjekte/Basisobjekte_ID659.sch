<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="93EECBB4-04BD-4821-9C3F-CF6C253E68EC" id="ID659-abstract" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3" see="Basisobjekte_ID659"><iso:title>Erforderliche seitliche Lage zur Topologie bei Punktobjekten</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Bei Achszählpunkten, einschienigen Isolierstößen, Elementen der punktförmigen Zugbeeinflussung, 
			Gleissperren, Schienenkontakten, Einfach- und Doppelsensoren für die Zugeinwirkung und isolierten Schienen
			muss eine seitliche Lage zur Topologie vorhanden sein.
			
			Bei [FMA_Komponente mit FMA_Komponente.FMA_Komponente_Achszaehlpunkt ∨ FMA_Komponente.FMA_Komponente_Art == Isolierstoss_einschienig | 
			PZB_Element | W_Kr_Gsp_Komponente mit W_Kr_Gsp_Komponente.Entgleisungsschuh |
			Zugeinwirkung mit Zugeinwirkung.Zugeinwirkung_Allg.Zugeinwirkung_Art == [Einfach_Sensor | Einfach_Sensor_richtungsabhaengig |
			Doppel_Sensor | Isolierte_Schiene_alleinstehend | Isolierte_Schiene_FMA_Anlage_mitbenutzt | Schienenkontakt]] 
			muss Punkt_Objekt_TOP_Kante.Seitliche_Lage vorhanden sein.
</code></pre>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- relevante FMA_Komponente_Art nil
				- relevante Seitliche_Lage nil
				- relevante Zugeinwirkung_Art nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Die seitliche Lage zur Topologie ist angegeben.
				</planpro:success>
				<planpro:error>
					Die seitliche Lage zur Topologie ist nicht angegeben.
				</planpro:error>
			</planpro:test>
			<planpro:output>FMA_Komponente|PZB_Element|W_Kr_Gsp_Komponente|Zugeinwirkung</planpro:output>
		</iso:p><iso:include href="../incomplete/FMA_Komponente-nil_FMA_Komponente_Art.xml"/><iso:include href="../incomplete/_-nil_Seitliche_Lage.xml"/><iso:include href="../incomplete/Zugeinwirkung-nil_Zugeinwirkung_Art.xml"/><iso:rule abstract="true" id="rule-659">
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Punkt_Objekt_TOP_Kante/Seitliche_Lage">Die seitliche Lage zur Topologie ist nicht angegeben.</iso:assert>
		</iso:rule><iso:rule context="FMA_Komponente[FMA_Komponente_Achszaehlpunkt | FMA_Komponente_Art[Wert = 'Isolierstoss_einschienig']][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-659"/>
		</iso:rule><iso:rule context="PZB_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-659"/>
		</iso:rule><iso:rule context="W_Kr_Gsp_Komponente[Entgleisungsschuh][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-659"/>
		</iso:rule><iso:rule context="Zugeinwirkung[Zugeinwirkung_Allg/Zugeinwirkung_Art/Wert = ('Einfach_Sensor', 'Einfach_Sensor_richtungsabhaengig', 'Doppel_Sensor', 'Isolierte_Schiene_alleinstehend', 'Isolierte_Schiene_FMA_Anlage_mitbenutzt', 'Schienenkontakt')][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-659"/>
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID659" is-a="ID659-abstract"><iso:param name="Role" value="warning"/><iso:param name="ignore-Zugeinwirkung_Art" value="('Doppel_Schleife', 'Dreifach_Schleife', 'Einfach_Schleife', 'sonstige')"/><iso:param name="ignore-FMA_Komponente_Art" value="('elektrischer_Trennstoss', 'Isolierstoss_zweischienig')"/></iso:pattern>
	
</planpro:pattern>