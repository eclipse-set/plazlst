<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="BAD8E1B6-494C-4CDD-943B-FE6DBFA4BF00" see="ETCS_ID628" id="ID628" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3">
	<iso:title>Anzahl primärer und sekundärer Anwendungssysteme je DP</iso:title>
	<iso:p>
		<planpro:description>
			Der Datenpunkt wird in mehreren Anwendungssystemen genutzt und dabei darf nur eines als primäres klassifiziert sein.

			Wenn Datenpunkt.DP_Typ mehrfach vorhanden ist, dann muss Datenpunkt.DP_Typ.DP_Typ_Art genau einmal fehlen.
		</planpro:description>
		<planpro:comment>
			Die Anzahl der Attributgruppen mit fehlendem Attribut Datenpunkt.DP_Typ.DP_Typ_Art sowie die Anzahl der
			Attributgruppen mit Datenpunkt.DP_Typ.DP_Typ_Art == "sekundaer" soll ausgegeben werden, 
			wenn die Bedingung verletzt ist. 
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Der Datenpunkt wird in mehreren Anwendungssystemen genutzt und dabei ist nur eines als primäres klassifiziert.
			</planpro:success>
			<planpro:error>
				Der Datenpunkt wird in mehreren Anwendungssystemen genutzt, jedoch ist nicht genau eines als primäres klassifiziert.
				Anzahl der primären Anwendungssysteme: [Anzahl], Anzahl der sekundären Anwendungssysteme: [Anzahl]
			</planpro:error>
		</planpro:test>
		<planpro:output>Datenpunkt</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Datenpunkt[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][count(DP_Typ) gt 1]">
		<iso:let name="AnzahlLeererDP_Typ_Art" value="count(DP_Typ[not(DP_Typ_Art)])"/>
		<iso:let name="AnzahlSekundearerDP_Typ_Art" value="count(DP_Typ[DP_Typ_Art/Wert = 'sekundaer'])"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$AnzahlLeererDP_Typ_Art = 1">Der Datenpunkt wird in mehreren Anwendungssystemen genutzt, jedoch ist nicht genau eines als primäres klassifiziert. Anzahl der primären Anwendungssysteme: <iso:value-of select="$AnzahlLeererDP_Typ_Art"/>, Anzahl der sekundären Anwendungssysteme: <iso:value-of select="$AnzahlSekundearerDP_Typ_Art"/></iso:assert>
  </iso:rule>
</iso:pattern>