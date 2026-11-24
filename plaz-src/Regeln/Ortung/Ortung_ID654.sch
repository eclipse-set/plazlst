<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="B70E2380-8196-11F0-B558-0800200C9A66" see="Ortung_ID654" id="ID654" planpro:arbeitspaket="Ortung" planpro:version="1.10.0.3">
	<iso:title>Zuordnung Achszählanlage - Azp</iso:title>
	<iso:p>
		<planpro:description>
			Einer Achszählanlage dürfen nur Achszählpunkte (Azp) zugeordnet sein.

			Wenn FMA_Anlage.FMA_Anlage_Allg.FMA_Art == "Achszaehlanlage", 
			dann muss in allen hierauf mittels FMA_Komponente.ID_FMAgrenze verweisenden FMA_Komponente 
			die Attributgruppe FMA_Komponente.FMA_Komponente_Achszaehlpunkt vorhanden sein.
		</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Der Achszählanlage sind nur Azp als begrenzende Elemente zugeordnet.
			</planpro:success>
			<planpro:error>
				Der Achszählanlage sind begrenzende Elemente zugeordnet, die keine Azp sind.
			</planpro:error>
		</planpro:test>
		<planpro:output>FMA_Anlage</planpro:output>
	</iso:p>
	<iso:rule role="error" context="FMA_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][FMA_Anlage_Allg/FMA_Art/Wert = 'Achszaehlanlage']">
		<iso:let name="aktuelle_FMA_Komponenten" value="key('FMA_Komponente-fuerFMA_Anlage', Identitaet/Wert, parent::*)"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$aktuelle_FMA_Komponenten and (every $i in $aktuelle_FMA_Komponenten satisfies $i/FMA_Komponente_Achszaehlpunkt)">Der Achszählanlage sind begrenzende Elemente zugeordnet, die keine Azp sind. </iso:assert>
	</iso:rule>
</iso:pattern>