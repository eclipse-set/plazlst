<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="32A24E0B-2DD6-41B0-BCD0-12C19FE36708" id="ID682-abstract" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3" see="Fahrstrasse_ID682"><iso:title>Keine Angabe zu Verzicht auf Geschwindigkeitsaufwertung</iso:title><iso:p>
			<planpro:description format="xhtml"><p xmlns="http://www.w3.org/1999/xhtml">Beginnt am Startsignal des Durchrutschweges keine Zugstraße,
darf keine Angabe zum Verzicht auf Geschwindigkeitsaufwertung vorhanden sein.</p>
<p xmlns="http://www.w3.org/1999/xhtml">Wenn ∄ <code>Fstr_Zug_Rangier</code> mit</p>
<ul xmlns="http://www.w3.org/1999/xhtml">
<li><code>Fstr_Zug_Rangier.ID_Fstr_Fahrweg</code> → <code>Fstr_Fahrweg.ID_Start</code> =
<code>Fstr_DWeg.ID_Fstr_Fahrweg</code> → <code>Fstr_Fahrweg.ID_Start</code> und</li>
<li><code>Fstr_Zug_Rangier.Fstr_Zug</code>,</li>
</ul>
<p xmlns="http://www.w3.org/1999/xhtml">dann darf <code>Fstr_DWeg.Fstr_DWeg_Spezifisch.DWeg_V_Aufwertung_Verzicht</code> nicht vorhanden sein.</p>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- ID_Fstr_Fahrweg nil
				- relevanter Fstr_Fahrweg fehlend
				- ID_Start nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Am Startsignal des Durchrutschwegs beginnt keine Zugstraße und es ist keine Angabe zum Verzicht auf Geschwindigkeitsaufwertung vorhanden. 
				</planpro:success>
				<planpro:error>
					Am Startsignal des Durchrutschwegs beginnt keine Zugstraße, trotzdem ist eine Angabe zum Verzicht auf Geschwindigkeitsaufwertung vorhanden.
					Im Objekt "Fstr_DWeg" darf das Attribut "DWeg_V_Aufwertung_Verzicht" nicht existieren. 
				</planpro:error>
			</planpro:test>
			<planpro:output>Fstr_DWeg</planpro:output>
		</iso:p><iso:include href="../incomplete/Fstr_DWeg-nil_ID_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_DWeg-miss_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_DWeg-nil_Signalreferenz.xml"/><iso:rule context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][not(fx:Fstr-143(current(), parent::*))]" role="$Role">
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="not(Fstr_DWeg_Spezifisch/DWeg_V_Aufwertung_Verzicht)">Am Startsignal des Durchrutschwegs beginnt keine Zugstraße, trotzdem ist eine Angabe zum Verzicht auf Geschwindigkeitsaufwertung vorhanden. Im Objekt "Fstr_DWeg" darf das Attribut "DWeg_V_Aufwertung_Verzicht" nicht existieren. </iso:assert>
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID682" is-a="ID682-abstract"><iso:param name="Role" value="error"/><iso:param name="Signal-Referenz" value="ID_Start"/></iso:pattern>
	
</planpro:pattern>