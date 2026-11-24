<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="B6C1BA87-E377-417E-B479-08FA146A7BB9 " id="ID282-abstract" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3" see="Fahrstrasse_ID282"><iso:title>Zugstraßen ohne DWeg</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Bei Ausfahrt auf die Strecke oder zu einer Awanst darf kein DWeg vorhanden sein.
			
			Wenn Fstr_Zug_Rangier.Fstr_Zug gefüllt und Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel 
			== Signal mit Signal.Signal_Fiktiv.Fiktives_Signal_Funktion == "Zug_Ziel_Awanst" oder "Zug_Ziel_Strecke",
			dann darf die Attributgruppe Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_DWeg nicht gefüllt sein. 
</code></pre>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- ID_Fstr_Fahrweg nil
				- fehlender Fstr_Fahrweg
				- relevantes ID_Ziel nil
				- fehlendes Zielsignal
				- relevante Fiktives_Signal_Funktion nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Die Ausfahrzugstraße zur Ausweichanschlussstelle bzw. auf die Strecke hat keinen Durchrutschweg.
				</planpro:success>
				<planpro:error>
					Es ist eine Ausfahrzugstraße zur Ausweichanschlussstelle bzw. auf die Strecke angelegt, jedoch wurde ein Durchrutschweg geplant.
				</planpro:error>
			</planpro:test>
			<planpro:output>Fstr_Zug_Rangier</planpro:output>
		</iso:p><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_ID_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-miss_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_Signalreferenz.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-miss_Signal.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_Fiktives_Signal_Funktion.xml"/><iso:rule context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-282(current(), /*, $relevanter-Fahrstrassentyp, $relevante-Fiktives_Signal_Funktion)]" role="$Role">
	  	<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Fstr_Zug/Fstr_Zug_DWeg">Es ist eine Ausfahrzugstraße zur Ausweichanschlussstelle bzw. auf die Strecke angelegt, jedoch wurde ein Durchrutschweg geplant.</iso:report>
	  </iso:rule></iso:pattern>
	
	<iso:pattern id="ID282" is-a="ID282-abstract"><iso:param name="Role" value="error"/><iso:param name="relevanter-Fahrstrassentyp" value="Fstr_Zug"/><iso:param name="relevante-Fahrstrassenart" value="()"/><iso:param name="allow-Gruppenausfahrt" value="true()"/><iso:param name="Signal-Referenz" value="ID_Ziel"/><iso:param name="relevante-Fiktives_Signal_Funktion" value="('Zug_Ziel_Awanst', 'Zug_Ziel_Strecke')"/><iso:param name="ignore-Fahrstrassentyp" value="(Fstr_Mittel | Fstr_Rangier)"/><iso:param name="ignore-Fiktives_Signal_Funktion" value="('FAP_Start', 'FAP_Ziel', 'Rangier_Start_Ziel_Ne_14',     'Rangier_Start_Ziel_ohne_Signal', 'sonstige', 'Vsig_virtuell', 'Zentralblock_Start', 'Zentralblock_Ziel',     'Zug_Start_Awanst', 'Zug_Start_Mittelweiche', 'Zug_Start_ohne_Signal', 'Zug_Ziel_ohne_Signal',     'Zug_Start_Ziel_Bk', 'Zug_Start_Ziel_Bk_mit_Zs_1', 'Zug_Start_Ziel_Bk_mit_Zs_7',     'Zug_Start_Ziel_Ne_14', 'Zug_Start_Ziel_Ne_14_mit_Zs_1', 'Zug_Start_Ziel_Ne_14_mit_Zs_7', 'Zug_Start_Ziel_Ne_14_mit_Zs_8')"/></iso:pattern>
	
</planpro:pattern>