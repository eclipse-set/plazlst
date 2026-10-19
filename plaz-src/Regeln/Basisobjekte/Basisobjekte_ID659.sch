<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="93EECBB4-04BD-4821-9C3F-CF6C253E68EC" see="Basisobjekte_ID659" id="ID659" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3">
	<iso:title>Erforderliche seitliche Lage zur Topologie bei Punktobjekten</iso:title>
	<iso:p>
		<planpro:description>
			Bei Achszählpunkten, einschienigen Isolierstößen, Elementen der punktförmigen Zugbeeinflussung, 
			Gleissperren, Schienenkontakten, Einfach- und Doppelsensoren für die Zugeinwirkung und isolierten Schienen
			muss eine seitliche Lage zur Topologie vorhanden sein.
			
			Bei [FMA_Komponente mit FMA_Komponente.FMA_Komponente_Achszaehlpunkt ∨ FMA_Komponente.FMA_Komponente_Art == Isolierstoss_einschienig | 
			PZB_Element | W_Kr_Gsp_Komponente mit W_Kr_Gsp_Komponente.Entgleisungsschuh |
			Zugeinwirkung mit Zugeinwirkung.Zugeinwirkung_Allg.Zugeinwirkung_Art == [Einfach_Sensor | Einfach_Sensor_richtungsabhaengig |
			Doppel_Sensor | Isolierte_Schiene_alleinstehend | Isolierte_Schiene_FMA_Anlage_mitbenutzt | Schienenkontakt]] 
			muss Punkt_Objekt_TOP_Kante.Seitliche_Lage vorhanden sein.
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
	</iso:p>
	
	<iso:include href="../incomplete/FMA_Komponente-nil_FMA_Komponente_Art-W.xml"/>
	<iso:include href="../incomplete/_-nil_Seitliche_Lage-W.xml"/>
	<iso:include href="../incomplete/Zugeinwirkung-nil_Zugeinwirkung_Art-W.xml"/>
	
	<iso:rule id="rule-659" abstract="true">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Punkt_Objekt_TOP_Kante/Seitliche_Lage">Die seitliche Lage zur Topologie ist nicht angegeben.</iso:assert>
	</iso:rule>
	<iso:rule role="warning" context="FMA_Komponente[FMA_Komponente_Achszaehlpunkt | FMA_Komponente_Art[Wert = 'Isolierstoss_einschienig']][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-659"/>
	</iso:rule>
	<iso:rule role="warning" context="PZB_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-659"/>
	</iso:rule>
	<iso:rule role="warning" context="W_Kr_Gsp_Komponente[Entgleisungsschuh][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-659"/>
	</iso:rule>
	<iso:rule role="warning" context="Zugeinwirkung[Zugeinwirkung_Allg/Zugeinwirkung_Art/Wert = ('Einfach_Sensor', 'Einfach_Sensor_richtungsabhaengig', 'Doppel_Sensor', 'Isolierte_Schiene_alleinstehend', 'Isolierte_Schiene_FMA_Anlage_mitbenutzt', 'Schienenkontakt')][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-659"/>
	</iso:rule>
	
	
	
	
	
	
	
	
	
	
	
</iso:pattern>