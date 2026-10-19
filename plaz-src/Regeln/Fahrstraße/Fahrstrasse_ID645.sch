<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="D6D51041-C294-4A43-BC54-8A93BBAADDC9" see="Fahrstrasse_ID645" id="ID645" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Ausfahrzugstraße mit Blockabschnitt</iso:title>
	<iso:p>
		<planpro:description>
			Es soll eine Warnung erfolgen, wenn eine Ausfahrzugstraße ohne anschließenden Blockabschnitt geplant wurde.

			Es soll eine Warnung erfolgen, wenn 
			∃ Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel → Signal.Signal_Fiktiv.Fiktives_Signal_Funktion == "Zug_Ziel_Strecke" und 
			∄ this.Signal ← Fstr_Fahrweg.ID_Start ← Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_Art == "B". 
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Neben der Ausfahrzugstraße wurde auch der daran anschließende Blockabschnitt geplant.
			</planpro:success>
			<planpro:error>
				Es wurde eine Ausfahrzugstraße ohne anschließenden Blockabschnitt geplant.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-645(current(), /*)]">
		<iso:let name="FstrFahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
		<iso:let name="Fstr_Fahrweg_mit_Start_Signal" value="key('Fstr_Fahrweg-fuerStart', $FstrFahrweg/ID_Ziel/Wert, parent::*)"/>
		<iso:let name="Fstr_Zug_Rangier_mit_Start_Signal" value="key('Fstr_Zug_Rangier-fuerFstr_Fahrweg', $Fstr_Fahrweg_mit_Start_Signal/Identitaet/Wert, parent::*)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Fstr_Zug_Rangier_mit_Start_Signal/Fstr_Zug/Fstr_Zug_Art/Wert = 'B'">Es wurde eine Ausfahrzugstraße ohne anschließenden Blockabschnitt geplant.</iso:assert>
  </iso:rule>
</iso:pattern>