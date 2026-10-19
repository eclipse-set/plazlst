<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="48C20922-1489-41C4-9878-31B31D8493B9" see="Fahrstrasse_ID408" id="ID408" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Teilbereiche der Länge Null bei DWeg-Länge größer Null</iso:title>
	<iso:p>
		<planpro:description>
			Es soll eine Fehlermeldung erfolgen, wenn bei einem DWeg mit Soll-Länge &gt; 0 m mindestens ein Teilbereich mit Länge
			&lt; 1.000 m auftritt und der gefundene Teilbereich kürzer als die zugehörige TOP-Kante ist.
			
			Es soll eine Fehlermeldung erfolgen, wenn Fstr_DWeg.Fstr_DWeg_Allg.Laenge_Soll &gt; 0 und
			für mindestens eine mittels Fstr_DWeg.ID_Fstr_Fahrweg → Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante
			angegebene TOP-Kante gilt:
			Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_B - Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A &lt; 1.000 und
			Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_B - Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A &lt; 
			Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante → TOP_Kante.TOP_Kante_Allg.TOP_Laenge [Toleranz: 0,01 m]. 
		</planpro:description>
		<planpro:comment>
			Bei spitz aneinanderstoßenden Weichen können Top-Kanten und somit Teilbereiche der Länge Null entstehen. 
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Der DWeg hat eine Länge &gt; 0 und alle Teilbereiche weisen eine Länge &gt; 1.000 m auf.
			</planpro:success>
			<planpro:error>
				Der DWeg hat eine Länge &gt; 0, es existiert jedoch mindestens ein Teilbereich mit einer Länge &lt; 1.000 m,
				der kürzer ist als die zugehörige TOP-Kante.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_DWeg</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="Fstr_DWeg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:number-or-zero(Fstr_DWeg_Allg/Laenge_Soll/Wert) gt 0]">
		<iso:let name="DWeg_Laenge_Toleranz" value="1.000"/>
		<iso:let name="TOP_Kante_Toleranz" value="0.01"/>
		<iso:let name="Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>
		<iso:let name="kurze_BOT" value="$Fahrweg/Bereich_Objekt_Teilbereich    [abs(fx:number-or-zero(Begrenzung_B/Wert) - fx:number-or-zero(Begrenzung_A/Wert)) lt $DWeg_Laenge_Toleranz]    [key('TOP_Kante', ID_TOP_Kante/Wert, /*)/TOP_Kante_Allg/TOP_Laenge/Wert -     abs(fx:number-or-zero(Begrenzung_B/Wert) - fx:number-or-zero(Begrenzung_A/Wert)) gt $TOP_Kante_Toleranz]"/>
    	<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$kurze_BOT">Der DWeg hat eine Länge &gt; 0, es existiert jedoch mindestens ein Teilbereich mit einer Länge &lt; 1.000 m, der kürzer ist als die zugehörige TOP-Kante.</iso:report>
  </iso:rule>
</iso:pattern>