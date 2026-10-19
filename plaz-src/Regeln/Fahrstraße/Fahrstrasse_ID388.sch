<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="6413586E-4172-4FC0-8110-EFFFF2B7A2B9" see="Fahrstrasse_ID388" id="ID388" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Einfahrt max. mit 40, wenn Zugstraße am Sperr- oder Zugdeckungssignal endet</iso:title>
	<iso:p>
		<planpro:description>
			Endet eine Zugstraße an einem Sperr- oder Zugdeckungssignal, dann muss eine Signalisierung mit Zs 3 (Symbol ≤ 4)
			für diese Zugstraße vorhanden sein.

			Wenn Fstr_Zug_Rangier.Fstr_Zug gefüllt und Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel ein Signal
			mit Signal.Signal_Real.Signal_Real_Aktiv_Schirm.Signal_Art == "Sperrsignal" oder "Zugdeckungssignal" ist,
			dann muss auf die betrachtetete Instanz Fstr_Zug_Rangier eine Instanz von Fstr_Signalisierung verweisen mit
			Fstr_Signalisierung.ID_Signal_Signalbegriff → Signal_Signalbegriff.Signalbegriff_ID == "Zs_3" mit Symbol ≤ "4".
			</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Zugstraße endet an einem Sperrsignal oder Zugdeckungssignal und es ist eine Signalisierung mit Zs 3
				(Symbol ≤ 4) vorgesehen.
			</planpro:success>
			<planpro:error>
				Die Zugstraße endet an einem Sperrsignal oder Zugdeckungssignal, es ist jedoch keine Signalisierung mit Zs 3
				(Symbol ≤ 4) vorgesehen.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-388(current(), /*)]">
		<iso:let name="Fstr_Signalisierung" value="key('Fstr_Signalisierung-fuerFstr_Zug_Rangier', Identitaet/Wert, parent::*)"/>
		<iso:let name="Signalbegriffe" value="key('Signal_Signalbegriff', $Fstr_Signalisierung/ID_Signal_Signalbegriff/Wert, /*)/Signalbegriff_ID"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Signalbegriffe[substring-after(@xsi:type, ':') = 'Zs_3'][number(Symbol) le 4]">Die Zugstraße endet an einem Sperrsignal oder Zugdeckungssignal, es ist jedoch keine Signalisierung mit Zs 3 (Symbol ≤ 4) vorgesehen.</iso:assert>
	</iso:rule>
</iso:pattern>