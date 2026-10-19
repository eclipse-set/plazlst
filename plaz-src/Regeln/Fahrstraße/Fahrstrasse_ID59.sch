<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="08CF4686-7E9A-4EE4-95DE-9F428C0469A4" see="Fahrstrasse_ID59" id="ID59" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3">
	<iso:title>Ausschluss eines Fahrwegs über beide Schenkel einer Weiche</iso:title>
	<iso:p>
		<planpro:description>
			Ein Fahrweg darf nicht über beide Schenkel einer Weiche verlaufen. Somit muss ausgeschlossen werden, 
			dass ein Fahrweg auf zwei Top-Kanten verweist, die beide den gleichen Top-Knoten referenzieren und
			dabei einmal die Anschluss-Eigenschaft "links" und einmal die Anschluss-Eigenschaft "rechts" tragen.
			
			Wenn für zwei TOP_Kante, auf die mittels Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante verwiesen wird, gilt:
			TOP_Kante1.ID_TOP_Knoten_A / ..._B == TOP_Kante2.ID_TOP_Knoten_A / ..._B,
			dann dürfen folgende Fälle nicht auftreten:
			TOP_Kante1.TOP_Kante_Allg.TOP_Anschluss_A / ..._B == "links" und 
			TOP_Kante2.TOP_Kante_Allg.TOP_Anschluss_A / ..._B == "rechts",
			
			TOP_Kante1.TOP_Kante_Allg.TOP_Anschluss_A / ..._B == "rechts" und 
			TOP_Kante2.TOP_Kante_Allg.TOP_Anschluss_A / ..._B == "links".
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt, falls
			- relevante ID_TOP_Kante nil
			- referenzierte TOP_Kante fehlend
			- relevante ID_TOP_Knoten_A nil
			- relevante ID_TOP_Knoten_B nil
			- relevante TOP_Anschluss_A nil
			- relevante TOP_Anschluss_B nil
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Der Fahrweg verläuft nicht über die beiden Schenkel einer Weiche.
			</planpro:success>
			<planpro:error>
				Der Fahrweg verläuft über die beiden Schenkel einer Weiche.
			</planpro:error>
		</planpro:test>
		<planpro:output>Fstr_Fahrweg</planpro:output>
	</iso:p>
	
	<iso:include href="../incomplete/Fstr_Fahrweg-nil_BOT_ID_TOP_Kante-E.xml"/>
	<iso:include href="../incomplete/Fstr_Fahrweg-miss_TOP_Kante-E.xml"/>
	<iso:include href="../incomplete/Fstr_Fahrweg-nil_ID_TOP_Knoten_A_B-E.xml"/>
	<iso:include href="../incomplete/Fstr_Fahrweg-nil_TOP_Anschluss_A_B-E.xml"/>
	
	<iso:rule role="error" context="Fstr_Fahrweg[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-59(current(), /*)]">
		<iso:let name="enthaltene_TOP_Kanten" value="key('TOP_Kante', Bereich_Objekt_Teilbereich/ID_TOP_Kante/Wert, /*)/(ID_TOP_Knoten_A|ID_TOP_Knoten_B)"/>		
		<!--<iso:let name="gemeinsame_TOP_Knoten" value="for $i in $enthaltene_TOP_Kanten
			return $i[./Wert = subsequence($enthaltene_TOP_Kanten, ./position() + 1)/Wert]"/>-->
		<iso:let name="gemeinsame_TOP_Knoten" value="$enthaltene_TOP_Kanten[index-of($enthaltene_TOP_Kanten,.)[2]]"/>
		<iso:let name="gruppierte_Liste_der_Anschlusswerte" value="for $i in $gemeinsame_TOP_Knoten return      string-join($enthaltene_TOP_Kanten[Wert = $i/Wert]/    ((self::ID_TOP_Knoten_A/../TOP_Kante_Allg/TOP_Anschluss_A)|    (self::ID_TOP_Knoten_B/../TOP_Kante_Allg/TOP_Anschluss_B))/Wert, ':')"/>
  	<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$gruppierte_Liste_der_Anschlusswerte = ('Rechts:Links', 'Links:Rechts')">Der Fahrweg verläuft über die beiden Schenkel einer Weiche.</iso:report>
  </iso:rule>
	
	
</iso:pattern>