<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="82A2E480-9EE1-4425-AC85-3DAEEC145808" id="ID194-abstract" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3" see="Weichen_und_Gleissperren_ID194"><iso:title>Herzstück-Antriebe einer Flachkreuzung</iso:title><iso:p>
			<planpro:description format="xhtml"><p xmlns="http://www.w3.org/1999/xhtml">Für eine Flachkreuzung müssen ein oder zwei elektrische Antriebe für die beweglichen Herzstückspitzen
geplant werden, wobei je Kreuzungskomponente max. ein Antrieb möglich ist.</p>
<p xmlns="http://www.w3.org/1999/xhtml">Wenn <code>W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art</code> == <code>Flachkreuzung</code>,
dann darf <code>W_Kr_Anlage</code> ← <code>W_Kr_Gsp_Element.ID_W_Kr_Anlage</code> → <code>W_Kr_Gsp_Element</code> ← <code>W_Kr_Gsp_Komponente.ID_W_Kr_Gsp_Element</code> →
<code>W_Kr_Gsp_Komponente.Kreuzung.Elektrischer_Antrieb_Anzahl</code> max. == 1 und die Summe der Werte nur == 1 oder 2 sein.</p>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- W_Kr_Art nil
				- relevantes W_Kr_Gsp_Element fehlend
				- relevante W_Kr_Gsp_Komponente fehlend
				- Elektrischer_Antrieb_Anzahl nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Je Kreuzungskomponente ist max. ein Antrieb vorgesehen und die Flachkreuzung hat einen oder zwei Herzstück-Antriebe.
				</planpro:success>
				<planpro:error>					
					[Einer Kreuzungskomponente sind mehrere Herzstück-Antriebe zugeordnet.]
					[Die Flachkreuzung hat [weniger als einen Herzstück-Antrieb/mehr als zwei Herzstück-Antriebe].]					
				</planpro:error>
			</planpro:test>
			<planpro:output>W_Kr_Anlage</planpro:output>
		</iso:p><iso:include href="../incomplete/W_Kr_Anlage-nil_W_Kr_Art.xml"/><iso:include href="../incomplete/W_Kr_Anlage-miss_W_Kr_Gsp_Element.xml"/><iso:include href="../incomplete/W_Kr_Anlage-miss_W_Kr_Gsp_Komponente.xml"/><iso:include href="../incomplete/W_Kr_Anlage-nil_Elektrischer_Antrieb_Anzahl.xml"/><iso:rule context="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][W_Kr_Anlage_Allg/W_Kr_Art/Wert = $relevante-W_Kr_Art]" role="$Role">
			<iso:let name="verweisende_Elemente" value="key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', Identitaet/Wert, parent::*)"/>
			<iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $verweisende_Elemente/Identitaet/Wert, parent::*)"/>
			<iso:let name="Anzahlen_Herzstueckantriebe" value="$verweisende_Komponenten/Kreuzung/Elektrischer_Antrieb_Anzahl/fx:number-or-zero(Wert)"/>
			<iso:let name="Summe_Herzstueckantriebe" value="sum($Anzahlen_Herzstueckantriebe)"/>
			<iso:let name="maximaleHerzstueckantriebe" value="every $x in $Anzahlen_Herzstueckantriebe satisfies $x le 1"/>
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test=" $maximaleHerzstueckantriebe and $Summe_Herzstueckantriebe = (1, 2)">        	     		
        		<iso:value-of select="if (not($maximaleHerzstueckantriebe)) then 'Einer Kreuzungskomponente sind mehrere Herzstück-Antriebe zugeordnet. ' else ''"/>
        		<iso:value-of select="if ($Summe_Herzstueckantriebe = 0) then 'Die Flachkreuzung hat weniger als einen Herzstück-Antrieb.' else ''"/>
        		<iso:value-of select="if ($Summe_Herzstueckantriebe &gt; 2) then 'Die Flachkreuzung hat mehr als zwei Herzstück-Antriebe.' else ''"/>        		 					    		
    		</iso:assert>
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID194" is-a="ID194-abstract"><iso:param name="Role" value="error"/><iso:param name="relevante-W_Kr_Art" value="'Flachkreuzung'"/><iso:param name="ignore-W_Kr_Art" value="('ABW','ABW/IBW','BKr','DBKW','DKW','DW','EABKW','EBKW','EIBKW','Eins. DW','EKW','EW','IBKr','IBW','IBW/ABW','Klothoidenweiche','Korbbogenweiche','Kr','sonstige','Sym. ABW','ZHA','ZHV ABW','ZHV IBW')"/></iso:pattern>
	
</planpro:pattern>