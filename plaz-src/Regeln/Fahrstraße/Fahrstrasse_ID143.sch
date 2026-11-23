<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="3F7A95BA-E948-48AE-97B6-9A2EDE7D9854" id="ID143-abstract" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3" see="Fahrstrasse_ID143"><iso:title>Verzicht auf Geschwindigkeitsaufwertung</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Beginnt am Startsignal des Durchrutschweges auch eine Zugstraße, 
			muss eine Angabe zum Verzicht auf Geschwindigkeitsaufwertung vorhanden sein.
			
			Wenn [Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Start] == 
			[Fstr_Fahrweg.ID_Start ← Fstr_Zug_Rangier.ID_Fstr_Fahrweg] mit [Fstr_Zug_Rangier.Fstr_Zug], 
			dann muss Fstr_DWeg.Fstr_DWeg_Spezifisch.DWeg_V_Aufwertung_Verzicht vorhanden sein.
</code></pre>
</planpro:description>
			<planpro:comment>
				Fehlendes Fstr_DWeg_Spezifisch ist ein Fehler.
				Fehlendes DWeg_V_Aufwertung_Verzicht ist ein Fehler.
				DWeg_V_Aufwertung_Verzicht nil ist ein Fehler.
				
				Prüfung entfällt, falls:
				- ID_Fstr_Fahrweg nil
				- relevanter Fstr_Fahrweg fehlend
				- ID_Start nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Am Startsignal des Durchrutschwegs beginnt eine Zugstraße und eine Angabe zum Verzicht auf die Geschwindigkeitsaufwertung ist vorhanden.
				</planpro:success>
				<planpro:error>
					Am Startsignal des Durchrutschwegs beginnt eine Zugstraße und es ist keine Angabe zum Verzicht auf die Geschwindigkeitsaufwertung vorhanden.
					Im Objekt "Fstr_DWeg" muss das Attribut "DWeg_V_Aufwertung_Verzicht" gefüllt werden.
				</planpro:error>
			</planpro:test>
			<planpro:output>Fstr_DWeg</planpro:output>
		</iso:p><iso:include href="../incomplete/Fstr_DWeg-nil_ID_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_DWeg-miss_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_DWeg-nil_Signalreferenz.xml"/><iso:rule context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-143(current(), parent::*)]" role="$Role">
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Fstr_DWeg_Spezifisch/DWeg_V_Aufwertung_Verzicht/Wert/text()">Am Startsignal des Durchrutschwegs beginnt eine Zugstraße und es ist keine Angabe zum Verzicht auf die Geschwindigkeitsaufwertung vorhanden. Im Objekt "Fstr_DWeg" muss das Attribut "DWeg_V_Aufwertung_Verzicht" gefüllt werden.</iso:assert>
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID143" is-a="ID143-abstract"><iso:param name="Role" value="error"/><iso:param name="Signal-Referenz" value="ID_Start"/><iso:param name="ignore-Fahrstrassentyp" value="(Fstr_Mittel | Fstr_Rangier)"/></iso:pattern>
	
</planpro:pattern>