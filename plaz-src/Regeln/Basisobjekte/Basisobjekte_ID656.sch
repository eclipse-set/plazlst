<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="30A7D31E-DB75-49E5-B8BB-1752971FEE19" see="Basisobjekte_ID656" id="ID656" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3">
	<iso:title>Nicht sinnvoller Richtungsbezug zur Topologie in Bereichsobjekten</iso:title>
	<iso:p>
		<planpro:description>
			Bei Bahnsteigdächern, Gleisbezogenen Gefahrräumen eines BÜ, Fahrwegen, Gleisabschnitten, Gleisarten,
			Baubereichen von Gleisen, Gleisbezeichnungen, Gleisfahrbahnen, Lichträumen von Gleisen, 
			Gleisschaltgruppen, Stellbereichen, Strecken, Bremswegen von Strecken, Technischen Bereichen
			(außer Schutzwand) und Streckeneigenschaften von Zugbeeinflussungssystemen 
			dürfen alle Teilbereiche keinen Richtungsbezug zur Topologie enthalten.
			
			Bei [Bahnsteig_Dach | BUE_Gleisbezogener_Gefahrraum | Fstr_Fahrweg | Gleis_Abschnitt | Gleis_Art |
			Gleis_Baubereich | Gleis_Bezeichnung | Gleis_Fahrbahn | Gleis_Lichtraum | Gleis_Schaltgruppe | 
			Stell_Bereich | Strecke | Strecke_Bremsweg | Technischer_Bereich mit 
			Technischer_Bereich.TB_Art ≠ [Schutzwand_links | Schutzwand_rechts] | ZUB_Streckeneigenschaft]
			dürfen alle Bereich_Objekt_Teilbereich keinen Bereich_Objekt_Teilbereich.Richtungsbezug enthalten. 
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls
			[- fehlende TB_Art]
			- relevante TB_Art nil
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				In keinem Teilbereich ist ein Richtungsbezug zur Topologie enthalten.
			</planpro:success>
			<planpro:error>
				Es existiert (mindestens) ein Richtungsbezug zur Topologie in einem Teilbereich.
			</planpro:error>
		</planpro:test>
		<planpro:output>Bahnsteig_Dach|BUE_Gleisbezogener_Gefahrraum|Fstr_Fahrweg|Gleis_Abschnitt|Gleis_Art|Gleis_Baubereich|Gleis_Bezeichnung|Gleis_Fahrbahn|Gleis_Lichtraum|Gleis_Schaltgruppe|Stell_Bereich|Strecke|Strecke_Bremsweg|ZUB_Streckeneigenschaft|Technischer_Bereich|ZUB_Streckeneigenschaft</planpro:output>
	</iso:p>
	
	<iso:include href="../incomplete/Technischer_Bereich-nil_TB_Art-W.xml"/>
	
	<iso:rule id="rule-656" abstract="true">
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="every $i in Bereich_Objekt_Teilbereich satisfies not($i/Richtungsbezug)">Es existiert (mindestens) ein Richtungsbezug zur Topologie in einem Teilbereich.</iso:assert>
	</iso:rule>
	
	<iso:rule role="warning" context="Bahnsteig_Dach[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="BUE_Gleisbezogener_Gefahrraum[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="Gleis_Abschnitt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="Gleis_Art[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="Gleis_Baubereich[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="Gleis_Bezeichnung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="Gleis_Fahrbahn[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="Gleis_Lichtraum[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="Gleis_Schaltgruppe[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="Stell_Bereich[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="Strecke[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="Strecke_Bremsweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="Technischer_Bereich[not(TB_Art/Wert = ('Schutzwand_links', 'Schutzwand_rechts'))][../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	<iso:rule role="warning" context="ZUB_Streckeneigenschaft[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:extends rule="rule-656"/>
	</iso:rule>

	
</iso:pattern>