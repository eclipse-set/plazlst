<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="E32CA12B-C79D-45E1-912F-DE167D182297" see="Fahrstrasse_ID617" id="ID617" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Korrektes Zs 3 für Zugstraße - Restriktionen Fahrstraße</iso:title>
	<iso:p>
		<planpro:description>
			Die mittels Zs 3 gezeigte Geschwindigkeit am Fahrstraßenstart darf nicht größer sein als die in der Fahrstraße
			hinterlegte Geschwindigkeit.
			
			Wenn Fstr_Signalisierung.ID_Signal_Signalbegriff → Signal_Signalbegriff.Signalbegriff_ID == "Zs_3" und
			Fstr_Zug_Rangier mit Fstr_V vorhanden ist,
			dann muss 10 * Zs_3.Symbol ≤ Fstr_Signalisierung.ID_Fstr_Zug_Rangier → Fstr_Zug_Rangier.Fstr_Zug_Rangier_Allg.Fstr_V sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist nicht größer als die in der Fahrstraße
				hinterlegte Geschwindigkeit.
			</planpro:success>
			<planpro:error>
				Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist größer als die in der Fahrstraße
				hinterlegte Geschwindigkeit.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Signalisierung</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_Signalisierung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-617(current(), /*)]">
		<iso:let name="Signalbegriff" value="key('Signal_Signalbegriff', ID_Signal_Signalbegriff/Wert, /*)"/>
		<iso:let name="Signalbegriff_Symbol" value="xs:integer($Signalbegriff/Signalbegriff_ID/Symbol)"/>
		<iso:let name="Fstr_Zug_Rangier" value="key('Fstr_Zug_Rangier', ID_Fstr_Zug_Rangier/Wert, /*)"/>
		<iso:let name="Fstr_V" value="fx:number-or-zero($Fstr_Zug_Rangier/*/Fstr_V/Wert)"/>		
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="10 * $Signalbegriff_Symbol le $Fstr_V ">Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist größer als die in der Fahrstraße hinterlegte Geschwindigkeit.</iso:assert>
  </iso:rule>
</iso:pattern>