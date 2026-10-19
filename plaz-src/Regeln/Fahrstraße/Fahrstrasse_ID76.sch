<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="92BB7DBC-2093-4218-9FE3-F7E0E6827CEC" see="Fahrstrasse_ID76" id="ID76" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Keine Um- und Hilfsfahrstraßen bei aneinandergereihten Fahrstraßen</iso:title>
	<iso:p>
		<planpro:description>
			Bei aneinandergereihten Fahrstraßen dürfen keine Um- und Hilfsfahrstraßen gewählt werden.

			Mittels Fstr_Aneinander ← Fstr_Aneinander_Zuordnung.ID_Fstr_Aneinander → 
			Fstr_Aneinander_Zuordnung.ID_Fstr_Zug_Rangier dürfen einer Fstr_Aneinander nur Fstr_Zug_Rangier mit 
			Fstr_Zug_Rangier.Fstr_Zug.Fstr_Zug_Art == "ZR" oder Fstr_Zug_Rangier.Fstr_Rangier.Fstr_Rangier_Art == "RR"
			zugeordnet werden.
		</planpro:description>
		<planpro:comment>
			Anmerkung Bombardier, WS 23.-24.03.2011
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Die aneinandergereihte Fahrstraße enthält keine Um- bzw. Hilfsfahrstraßen.
			</planpro:success>
			<planpro:error>
				Die aneinandergereihte Fahrstraße enthält Um- bzw. Hilfsfahrstraßen.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Aneinander</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Fstr_Aneinander[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-76(current(), parent::*)]">
		<iso:let name="alle_zuordnungen" value="key('Fstr_Aneinander_Zuordnung-fuerFstr_Aneinander', Identitaet/Wert, parent::*)"/>
		<iso:let name="alle_Zug_Rangier_ids" value="$alle_zuordnungen/ID_Fstr_Zug_Rangier/Wert"/>
		<iso:let name="alle_Zug_Rangier" value="key('Fstr_Zug_Rangier', $alle_Zug_Rangier_ids, parent::*)"/>
				
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="every $i in $alle_Zug_Rangier satisfies ($i/Fstr_Zug/Fstr_Zug_Art/Wert = 'ZR' or                  $i/Fstr_Rangier/Fstr_Rangier_Art/Wert = 'RR')">Die aneinandergereihte Fahrstraße enthält Um- bzw. Hilfsfahrstraßen.</iso:assert>
	</iso:rule>
</iso:pattern>