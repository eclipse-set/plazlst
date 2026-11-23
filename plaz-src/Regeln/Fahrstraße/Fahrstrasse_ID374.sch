<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="C9BD51A8-6BE8-4129-AD49-E822F8E989E6" id="ID374-abstract" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3" see="Fahrstrasse_ID374"><iso:title>2. Teil-Zugstraße mit DWeg</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Bei zwei folgeabhängigen Teil-Zugstraßen (Start-Signal der 2. Teil-Zugstraße = Ziel-Signal der 1. Teil-Zugstraße)
			muss für die zweite Teil-Zugstraße ein D-Weg definiert sein,
			sofern es sich nicht um eine Ausfahrzugstraße auf die Strecke oder zu einer Awanst handelt.
			
			Wenn zwei Fstr_Zug_Rangier mit Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_Art == "ZT" ∨ "ZTU" gefunden werden, 
			bei denen Fstr_Zug_Rangier2.ID_Fstr_Fahrweg → Fahrweg.ID_Start == Fstr_Zug_Rangier1.ID_Fstr_Fahrweg
			→ Fstr_Fahrweg.ID_Ziel und Fstr_Fahrweg.ID_Ziel == Signal mit Signal.Signal_Fiktiv.Fiktives_Signal_Funktion ≠
			"Zug_Ziel_Awanst" ∨ "Zug_Ziel_Strecke",
			dann muss Fstr_Zug_Rangier2.Fstr_Zug.Fstr_Zug_DWeg vorhanden sein.
</code></pre>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- Fstr_Zug_Art nil
				- ID_Fstr_Fahrweg nil
				- fehlender Fstr_Fahrweg
				- relevantes ID_Ziel nil
				- fehlendes Zielsignal
				- relevante Fiktives_Signal_Funktion nil
				- relevantes ID_Start nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Es wurden zwei folgeabhängige Teil-Zugstraßen definiert und für die zweite Teil-Zugstraße ist ein Durchrutschweg angegeben.
				</planpro:success>
				<planpro:error>
					Es wurden zwei folgeabhängige Teil-Zugstraßen definiert und für die zweite Teil-Zugstraße ist kein Durchrutschweg angegeben.
				</planpro:error>
			</planpro:test>
			<planpro:output>Fstr_Zug_Rangier</planpro:output>
		</iso:p><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_ID_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-miss_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_Signalreferenz.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-miss_Signal.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_Fiktives_Signal_Funktion.xml"/><iso:rule context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-374(current(), /*, $relevanter-Fahrstrassentyp, $relevante-Fahrstrassenart, $ignore-Fiktives_Signal_Funktion)]" role="$Role">
	  	<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Fstr_Zug/Fstr_Zug_DWeg">Es wurden zwei folgeabhängige Teil-Zugstraßen definiert und für die zweite Teil-Zugstraße ist kein Durchrutschweg angegeben.</iso:assert>
	  </iso:rule></iso:pattern>
	
	<iso:pattern id="ID374" is-a="ID374-abstract"><iso:param name="Role" value="warning"/><iso:param name="relevanter-Fahrstrassentyp" value="Fstr_Zug"/><iso:param name="relevante-Fahrstrassenart" value="('ZT', 'ZTU')"/><iso:param name="allow-Gruppenausfahrt" value="true()"/><iso:param name="Signal-Referenz" value="(ID_Ziel | ID_Start)"/><iso:param name="ignore-Fahrstrassentyp" value="(Fstr_Mittel | Fstr_Rangier)"/><iso:param name="ignore-Fahrstrassenart" value="('B', 'ZH', 'ZR', 'ZU', 'ZUH', 'ZZ')"/><iso:param name="ignore-Fiktives_Signal_Funktion" value="('Zug_Ziel_Awanst', 'Zug_Ziel_Strecke')"/></iso:pattern>
	
</planpro:pattern>