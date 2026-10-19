<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="92DB2380-9699-4DA2-AC23-8827EEDB2186" see="Fahrstrasse_ID616" id="ID616" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Einfahrt max. mit 20 bei Fahrt auf Zugdeckungssignal im DS-Bereich</iso:title>
	<iso:p>
		<planpro:description>
			Endet eine Zugstraße an einem Zugdeckungssignal im DS-Bereich, dann muss eine Signalisierung mit
			Zs 3 (Kennziffer ≤ 2) für diese Zugstraße vorhanden sein.
			
			Wenn Fstr_Zug_Rangier.Fstr_Zug gefüllt und Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.ID_Ziel
			ein Signal mit Signal.Signal_Real.Signal_Real_Aktiv_Schirm.Signal_Art == "Zugdeckungssignal" und
			Signal.Signal_Real.Geltungsbereich == "DS" ist,
			dann muss auf die betrachtetete Instanz Fstr_Zug_Rangier eine Instanz von Fstr_Signalisierung verweisen
			mit Fstr_Signalisierung.ID_Signal_Signalbegriff → Signal_Signalbegriff.Signalbegriff_ID == "Zs_3"
			mit Symbol ≤ "2".
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die Zugstraße endet an einem Zugdeckungssignal (DS-Bereich) und es ist eine Signalisierung mit Zs 3
				(Kennziffer ≤ 2) vorgesehen.
			</planpro:success>
			<planpro:error>
				Die Zugstraße endet an einem Zugdeckungssignal (DS-Bereich), es ist jedoch keine Signalisierung mit 
				Zs 3 (Kennziffer ≤ 2) vorgesehen.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Zug_Rangier</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-616(current(), /*)]">
		<iso:let name="Fstr_Signalisierung" value="key('Fstr_Signalisierung-fuerFstr_Zug_Rangier', Identitaet/Wert, /*)"/>
		<iso:let name="Signalbegriffe" value="key('Signal_Signalbegriff', $Fstr_Signalisierung/ID_Signal_Signalbegriff/Wert, /*)/Signalbegriff_ID"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Signalbegriffe[substring-after(@xsi:type, ':') = 'Zs_3'][number(Symbol) le 2]">Die Zugstraße endet an einem Zugdeckungssignal (DS-Bereich), es ist jedoch keine Signalisierung mit Zs 3 (Kennziffer ≤ 2) vorgesehen.</iso:assert>
  </iso:rule>
</iso:pattern>