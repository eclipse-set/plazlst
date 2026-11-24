<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="C19DAC35-91EF-4890-8389-B216D49A4113" id="ID345-abstract" planpro:arbeitspaket="Ansteuerung_Element" planpro:version="1.10.0.3" see="Ansteuerung_Element_ID345"><iso:title>Außenelementansteuerung mit angesteuertem Fachobjekt</iso:title><iso:p>
			<planpro:description format="xhtml"><p xmlns="http://www.w3.org/1999/xhtml">Existiert eine Außenelementansteuerung, so muss dieser mindestens
ein Stellelement (z. B. Signal),
eine Komponente einer Freimeldeanlage (z. B. Azp) oder
eine andere Außenelementansteuerung zugeordnet sein.</p>
<p xmlns="http://www.w3.org/1999/xhtml">Existiert eine <code>Aussenelementansteuerung</code>, so muss mindestens</p>
<ul xmlns="http://www.w3.org/1999/xhtml">
<li><code>Stellelement.ID_Information</code>,</li>
<li><code>FMA_Komponente.FMA_Komponente_Achszaehlpunkt.ID_Information</code> oder</li>
<li><code>Aussenelementansteuerung.ID_Information_Primaer</code></li>
</ul>
<p xmlns="http://www.w3.org/1999/xhtml">hierauf verweisen.</p>
</planpro:description>
			<planpro:comment>
				Keine Unvollständigkeitsprüfung
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Auf die Außenelementansteuerung verweist mindestens ein Stellelement, eine Freimelde-Komponente oder eine andere Außenelementansteuerung.
				</planpro:success>
				<planpro:error>
					Auf die Außenelementansteuerung verweist weder ein Stellelement noch eine Freimelde-Komponente oder eine andere Außenelementansteuerung.
				</planpro:error>
			</planpro:test>
			<planpro:output>Aussenelementansteuerung</planpro:output>
		</iso:p><iso:rule context="Aussenelementansteuerung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="key('Stellelement-fuerAussenelementansteuerung', Identitaet/Wert, /*) or      key('FMA_Komponente-fuerAussenelementansteuerung', Identitaet/Wert, parent::*) or      key('Aussenelementansteuerung-fuerAussenelementansteuerung', Identitaet/Wert, parent::*)">Auf die Außenelementansteuerung verweist weder ein Stellelement noch eine Freimelde-Komponente oder eine andere Außenelementansteuerung.</iso:assert>
	  </iso:rule></iso:pattern>
	
	<iso:pattern id="ID345" is-a="ID345-abstract"><iso:param name="Role" value="warning"/></iso:pattern>
	
</planpro:pattern>