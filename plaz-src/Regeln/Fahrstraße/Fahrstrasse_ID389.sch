<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="E4CE6E0D-DC54-4CF8-956D-1AFB15D0AC84" see="Fahrstrasse_ID389" id="ID389" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Einfahrt max. mit 40, wenn Zugstraße in Stumpfgleis führt</iso:title>
	<iso:p>
		<planpro:description>
			Prüfung, ob ein zu einer Zugstraße gehörender Fahrweg an einem fiktiven Signal "Zug_Ziel_ohne_Signal" endet und eine Signalisierung mit Zs 3 (Kennziffer ≤ 4) für diese Zugstraße vorhanden ist.

			Es soll eine Warnung erfolgen, wenn Fstr_Zug_Rangier.Fstr_Zug gefüllt und Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel ein Signal mit Signal.Signal_Fiktiv.Fiktives_Signal_Funktion == 			"Zug_Ziel_ohne_Signal" ist und auf die betrachtetete Instanz Fstr_Zug_Rangier keine Instanz von Fstr_Signalisierung verweist mit Fstr_Signalisierung.ID_Signal_Signalbegriff →
			Signal_Signalbegriff.Signalbegriff_ID == "Zs_3" mit Symbol ≤ "4".
		</planpro:description>
		<planpro:comment>
			Regel optional, da vStrecke = 40 oder La denkbar
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die Zugstraße endet in einem Stumpfgleis und es ist eine Signalisierung mit Zs 3 (Kennziffer ≤ 4) vorgesehen.
			</planpro:success>
			<planpro:error>
				Die Zugstraße endet in einem Stumpfgleis, es ist jedoch keine Signalisierung mit Zs 3 (Kennziffer ≤ 4) vorgesehen.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-389(current(), /*)]">
		<iso:let name="Fstr_Signalisierung" value="key('Fstr_Signalisierung-fuerFstr_Zug_Rangier', Identitaet/Wert, parent::*)"/>
		<iso:let name="Signalbegriffe" value="key('Signal_Signalbegriff', $Fstr_Signalisierung/ID_Signal_Signalbegriff/Wert, parent::*)/Signalbegriff_ID"/>
  		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Signalbegriffe[substring-after(@xsi:type, ':') = 'Zs_3'][number(Symbol) le 4]">Die Zugstraße endet in einem Stumpfgleis, es ist jedoch keine Signalisierung mit Zs 3 (Kennziffer ≤ 4) vorgesehen.</iso:assert>
  </iso:rule>
</iso:pattern>