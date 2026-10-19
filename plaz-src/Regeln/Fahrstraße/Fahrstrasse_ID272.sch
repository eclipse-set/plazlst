<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="F068197C-5F18-47d0-BC4E-BD1219DC3BB8" see="Fahrstrasse_ID272" id="ID272" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
  <iso:title>Keine Abspeicherung der Signalisierungen Ks 1, Ks 2 und Sh 1</iso:title>
    <iso:p>
      <planpro:description>
      	Die Anschaltung der Signalbegriffe Ks 1, Ks 2 und Sh 1 ist nicht anzugeben.
      	
      	Fstr_Signalisierung.ID_Signal_Signalbegriff → Signal_Signalbegriff.Signalbegriff_ID darf nicht mit den 
      	Werten "Ks_1", "Ks_2" oder "Sh_1" gefüllt sein.
      </planpro:description>
      <planpro:comment>
      	Signalisierungen leicht herleitbar. 
	  </planpro:comment>
      <planpro:test>
        <planpro:success>
        	Für die Fahrstraße ist keine Signalisierung mit Ks 1, Ks 2 oder Sh 1 angegeben.
		</planpro:success>
        <planpro:error>
        	Für die Fahrstraße ist eine Signalisierung mit Ks 1, Ks 2 oder Sh 1 angegeben.
        	Die Signalisierungen sollen jedoch nicht abgespeichert werden.
		</planpro:error>
      </planpro:test>
      <planpro:output>Fstr_Signalisierung</planpro:output>
    </iso:p>
	<iso:rule role="error" context="Fstr_Signalisierung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:let name="Signalbegriff" value="key('Signal_Signalbegriff', ID_Signal_Signalbegriff/Wert, /*)"/>
		<iso:let name="Signalbegriff_konkret" value="$Signalbegriff/Signalbegriff_ID/substring-after(@xsi:type, ':')"/>
		<iso:let name="Signalbegriff_unzulaessig" value="('Ks_1', 'Ks_2', 'Sh_1')"/>
		<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Signalbegriff_konkret = $Signalbegriff_unzulaessig">Für die Fahrstraße ist eine Signalisierung mit Ks 1, Ks 2 oder Sh 1 angegeben. Die Signalisierungen sollen jedoch nicht abgespeichert werden.</iso:report>
	</iso:rule>
</iso:pattern>