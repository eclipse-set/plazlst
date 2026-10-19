<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="43063296-092B-415E-868A-5AF297001F72" see="Fahrstrasse_ID639" id="ID639" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Korrektes Zs 3 für Zugstraße - Restriktionen Fahrweg (Fstr_V_Hg)</iso:title>
	<iso:p>
		<planpro:description>
			Es soll eine Warnung ausgegeben werden, wenn die mittels Zs 3 gezeigte Geschwindigkeit am Fahrstraßenstart
			nicht kleiner als die für den befahrenen Teil (Fahrweg) vorgegebene Höchstgeschwindigkeit (Hg) ist.

			Es soll eine Warnung ausgegeben werden, wenn
			Fstr_Signalisierung.ID_Signal_Signalbegriff → Signal_Signalbegriff.Signalbegriff_ID == "Zs_3" ∧
			this.Signal_Signalbegriff ← Signal_Rahmen.ID_Signal_Signalbegriff → Signal_Rahmen.ID_Signal → Signal ←
			Fstr_Fahrweg.ID_Start ← Fstr_Zug_Rangier.ID_Fstr_Fahrweg ∧
			∃ Fstr_Zug_Rangier.Fstr_Zug ∧
			10 * Zs_3.Symbol ≥
			Fstr_Signalisierung.ID_Fstr_Zug_Rangier → Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.Fstr_V_Hg ist.
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls
			- relevante ID_Signal_Signalbegriff nil
			- referenziertes Signal_Signalbegriff fehlend
			- relevante ID_Fstr_Zug_Rangier nil
			- referenziertes Fstr_Zug_Rangier fehlend
			- relevante ID_Fstr_Fahrweg nil
			- referenziertes Fstr_Fahrweg fehlend
			- relevantes Fstr_V_Hg fehlend
			- relevantes Fstr_V_Hg nil
			(noch fehlend für unvollständig: Signal_Rahmen, Signal, ID_Start)
			(noch fehlend für ungeprüft: Fstr_Zug_Rangier ohne Fstr_Zug)
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist kleiner als die für den befahrenen Teil
				(Fahrweg) vorgegebene Höchstgeschwindigkeit (Hg).
			</planpro:success>
			<planpro:error>
				Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist nicht kleiner als die für den befahrenen Teil
				(Fahrweg) vorgegebene Höchstgeschwindigkeit (Hg).
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Signalisierung</planpro:output>
	</iso:p>
	
	<iso:include href="../incomplete/Fstr_Signalisierung-nil_ID_Signalbegriff-W.xml"/>
	<iso:include href="../incomplete/Fstr_Signalisierung-miss_Signalbegriff-W.xml"/>
	<iso:include href="../incomplete/Fstr_Signalisierung-nil_ID_Fstr_Zug_Rangier-W.xml"/>
	<iso:include href="../incomplete/Fstr_Signalisierung-miss_Fstr_Zug_Rangier-W.xml"/>
	<iso:include href="../incomplete/Fstr_Signalisierung-nil_ID_Fstr_Fahrweg-W.xml"/>
	<iso:include href="../incomplete/Fstr_Signalisierung-miss_Fstr_Fahrweg-W.xml"/>
	<iso:include href="../incomplete/Fstr_Signalisierung-miss_Fstr_V_Hg-W.xml"/>
	<iso:include href="../incomplete/Fstr_Signalisierung-nil_Fstr_V_Hg-W.xml"/>

	<iso:rule role="warning" context="Fstr_Signalisierung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-639(current(), /*)]">
		<iso:let name="Signalbegriff" value="key('Signal_Signalbegriff', ID_Signal_Signalbegriff/Wert, /*)"/>
		<iso:let name="Signalbegriff_Symbol" value="xs:integer($Signalbegriff/Signalbegriff_ID/Symbol)"/>
		<iso:let name="Fstr_Zug_Rangier" value="key('Fstr_Zug_Rangier', ID_Fstr_Zug_Rangier/Wert, parent::*)"/>
		<iso:let name="Fstr_Fahrweg" value="key('Fstr_Fahrweg', $Fstr_Zug_Rangier/ID_Fstr_Fahrweg/Wert, parent::*)"/>
		<iso:let name="Fstr_V_Hg" value="fx:number-or-zero($Fstr_Fahrweg/Fstr_V_Hg/Wert)"/>

		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="10*$Signalbegriff_Symbol lt $Fstr_V_Hg">Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist nicht kleiner als die für den befahrenen Teil (Fahrweg) vorgegebene Höchstgeschwindigkeit (Hg).</iso:assert>
	</iso:rule>
	
	
	
	
	
	
	
	
	
	
	
</iso:pattern>