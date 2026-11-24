<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="DC5D519A-CA91-4F9E-99F4-9DB4911B167D" id="ID351-abstract" planpro:arbeitspaket="Ansteuerung_Element" planpro:version="1.10.0.3" see="Ansteuerung_Element_ID351"><iso:title>Fachobjekt zu Stellelement</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Existiert ein Stellelement, so muss genau 
			eine Bahnübergangsschnittstelle, 
			ein Element der punktförmigen Zugbeeinflussung, 
			eine Schlüsselsperre, 
			ein aktives Signal oder
			ein Element einer Weiche, Kreuzung oder Gleissperre hierauf verweisen.
			
			Existiert ein Stellelement, so muss genau
			eine BUE_Schnittstelle mittels BUE_Schnittstelle.ID_Stellelement,
			ein PZB_Element mittels PZB_Element.ID_Stellelement,
			eine Schluesselsperre mittel Schluesselsperre.ID_Stellelement,
			ein Signal mittels Signal.Signal_Real.Signal_Real_Aktiv.ID_Stellelement oder
			ein W_Kr_Gsp_Element mittels W_Kr_Gsp_Element.ID_Stellelement hierauf verweisen. 
</code></pre>
</planpro:description>
			<planpro:comment>
				Keine Unvollständigkeitsprüfung
			</planpro:comment>		
			<planpro:test>
				<planpro:success>
					Auf das Stellelement verweist genau eines der folgenden Fachobjekte: 
					Bahnübergangsschnittstelle, Element der punktförmigen Zugbeeinflussung, Schlüsselsperre, aktives Signal oder Element einer Weiche, Kreuzung oder Gleissperre. 
				</planpro:success>
				<planpro:error>
					Auf das Stellelement [verweist keines/verweisen mehrere] der folgenden Fachobjekte: 
					Bahnübergangsschnittstelle, Element der punktförmigen Zugbeeinflussung, Schlüsselsperre, aktives Signal oder Element einer Weiche, Kreuzung oder Gleissperre. 
				</planpro:error>
			</planpro:test>
			<planpro:output>Stellelement</planpro:output>
		</iso:p><iso:rule context="Stellelement[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:let name="verweise" value="key('BUE_Schnittstelle-fuerStellelement', Identitaet/Wert, /*) |      key('PZB_Element-fuerStellelement', Identitaet/Wert, /*) |     key('Schluesselsperre-fuerStellelement', Identitaet/Wert, /*) |     key('Signal-fuerStellelement', Identitaet/Wert, /*) |     key('W_Kr_Gsp_Element-fuerStellelement', Identitaet/Wert, /*)"/>
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$verweise and not($verweise[2])">Auf das Stellelement <iso:value-of select="if (not($verweise[1])) then 'verweist keines' else 'verweisen mehrere'"/> der folgenden Fachobjekte: Bahnübergangsschnittstelle, Element der punktförmigen Zugbeeinflussung, Schlüsselsperre, aktives Signal oder Element einer Weiche, Kreuzung oder Gleissperre.</iso:assert>
	  </iso:rule></iso:pattern>
	
	<iso:pattern id="ID351" is-a="ID351-abstract"><iso:param name="Role" value="error"/></iso:pattern>
	
</planpro:pattern>