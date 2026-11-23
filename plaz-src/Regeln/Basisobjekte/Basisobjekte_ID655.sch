<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="1B34C4B6-23F0-4C6D-ACC6-01893D112647" id="ID655-abstract" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3" see="Basisobjekte_ID655"><iso:title>Erforderlicher Richtungsbezug zur Topologie in Bereichsobjekten</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Bei Bahnsteigkanten, Geschwindigkeitsprofilen und Schutzwänden 
			müssen alle Teilbereiche einen Richtungsbezug zur Topologie enthalten.
			
			Bei [Bahnsteig_Kante | Geschwindigkeitsprofil | Technischer_Bereich mit 
			Technischer_Bereich.TB_Art = [Schutzwand_links | Schutzwand_rechts]] 
			müssen alle Bereich_Objekt_Teilbereich einen Bereich_Objekt_Teilbereich.Richtungsbezug enthalten.
</code></pre>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls
				- fehlende TB_Art
				- relevante TB_Art nil
				- relevanter Richtungsbezug nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Der Richtungsbezug zur Topologie existiert für alle Teilbereiche.
				</planpro:success>
				<planpro:error>
					Der Richtungsbezug zur Topologie existiert nicht für alle Teilbereiche.
				</planpro:error>
			</planpro:test>
			<planpro:output>Bahnsteig_Kante | Geschwindigkeitsprofil | Technischer_Bereich </planpro:output>
		</iso:p><iso:include href="../incomplete/Technischer_Bereich-nil_TB_Art.xml"/><iso:include href="../incomplete/_-nil_Richtungsbezug.xml"/><iso:rule abstract="true" id="rule-655">
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="every $i in Bereich_Objekt_Teilbereich satisfies $i/Richtungsbezug">Der Richtungsbezug zur Topologie existiert nicht für alle Teilbereiche.</iso:assert>
		</iso:rule><iso:rule context="Bahnsteig_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-655"/>
		</iso:rule><iso:rule context="Geschwindigkeitsprofil[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-655"/>
		</iso:rule><iso:rule context="Technischer_Bereich[TB_Art/Wert = ('Schutzwand_links', 'Schutzwand_rechts')][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:extends rule="rule-655"/>
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID655" is-a="ID655-abstract"><iso:param name="Role" value="warning"/><iso:param name="ignore-TB_Art" value="('Bahnsteig_ungenutzt', 'Bahnsteigabsenkung', 'Durchlass',     'Eisenbahnkreuzungsbauwerk_unten', 'Eisenbahnkreuzungsbauwerk_oben', 'Eisenbahnueberfuehrung',     'Ueberfuehrung_ueber_Eisenbahn', 'Personenunterfuehrung', 'Tunnel', 'sonstige')"/></iso:pattern>
	
</planpro:pattern>