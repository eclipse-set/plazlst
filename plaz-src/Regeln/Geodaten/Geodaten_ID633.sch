<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="3500EB86-70FE-A1AE-99BC-789066B513EB" see="Geodaten_ID633" id="ID633" planpro:arbeitspaket="Geodaten" planpro:version="1.10.0.3">
	<iso:title>Verwendung TOP-Anschluss "Verbindung"</iso:title>
	<iso:p>
		<planpro:description>
			Es soll eine Warnung erfolgen, wenn TOP-Kanten mit Anschlussart "Verbindung" vorhanden sind. Diese sind nur bei Auftrennung
			von TOP-Kanten an der Grenze des Planungsbereichs zu verwenden und erfordern eine vorherige Verbindungsknotenplanung.
			
			Es soll eine Warnung erfolgen, wenn TOP_Kante.TOP_Kante_Allg.TOP_Anschluss_A oder 
			TOP_Kante.TOP_Kante_Allg.TOP_Anschluss_B == "Verbindung" gesetzt ist.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Es sind keine TOP-Kanten mit Anschlussart "Verbindung" vorhanden.
			</planpro:success>
			<planpro:error>
				Es sind TOP-Kanten mit Anschlussart "Verbindung" vorhanden. Diese sind nur bei Auftrennung von TOP-Kanten
				an der Grenze des Planungsbereichs zu verwenden und erfordern eine vorherige Verbindungsknotenplanung.
			</planpro:error>
		</planpro:test>
		<planpro:output>TOP_Kante</planpro:output>
	</iso:p>
	<iso:rule role="warning" context="TOP_Kante[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
		<iso:let name="Anschlussart" value="TOP_Kante_Allg/(TOP_Anschluss_A | TOP_Anschluss_B)/Wert"/>
		<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Anschlussart = 'Verbindung'">Es sind TOP-Kanten mit Anschlussart "Verbindung" vorhanden. Diese sind nur bei Auftrennung von TOP-Kanten an der Grenze des Planungsbereichs zu verwenden und erfordern eine vorherige Verbindungsknotenplanung.</iso:report>
  </iso:rule>
</iso:pattern>