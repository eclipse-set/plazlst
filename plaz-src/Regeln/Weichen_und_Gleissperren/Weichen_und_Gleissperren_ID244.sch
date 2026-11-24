<?xml version="1.0" encoding="UTF-8"?><planpro:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur">
	<iso:pattern fpi="02CE8AD9-1833-4FCE-82FF-B25B9ACDF17D" see="Weichen_und_Gleissperren_ID244" id="ID244-abstract" abstract="true" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3"><iso:title>Verortung von Weichenkomponenten am Anfang/Ende einer TOP-Kante</iso:title><iso:p>
		    <planpro:description>
		    	Die Verortung einer Weichenkomponente muss jeweils am Anfang oder Ende der TOP-Kante erfolgen. 
		    	Der Abstand auf der TOP-Kante muss demzufolge gleich 0.000 m sein oder der Länge der TOP-Kante entsprechen. 
		    	
		    	Wenn W_Kr_Gsp_Komponente.Zungenpaar existiert,
		    	dann muss in allen W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Abstand == "0.000" oder
		    	"[W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.ID_TOP_Kante → TOP_Kante.TOP_Kante_Allg.TOP_Laenge]" sein. 
		    </planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- Abstand nil
				- ID_TOP_Kante nil
				- referenzierte TOP_Kante fehlend
				- TOP_Laenge nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Die Verortung der Weichenkomponente ist jeweils am Anfang/Ende der TOP-Kante.
				</planpro:success>
				<planpro:error>
					Die Verortung der Weichenkomponente ist nicht jeweils am Anfang/Ende der TOP-Kante.
				</planpro:error>					
			</planpro:test>
			<planpro:output>W_Kr_Gsp_Komponente</planpro:output>
		</iso:p><iso:include href="../incomplete/W_Kr_Gsp_Komponente-nil_Abstand.xml"/><iso:include href="../incomplete/W_Kr_Gsp_Komponente-nil_ID_TOP_Kante.xml"/><iso:include href="../incomplete/W_Kr_Gsp_Komponente-miss_TOP_Kante.xml"/><iso:include href="../incomplete/W_Kr_Gsp_Komponente-nil_TOP_Laenge.xml"/><iso:rule role="$Role" context="W_Kr_Gsp_Komponente[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][Zungenpaar]">
			<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="Punkt_Objekt_TOP_Kante[fx:number-or-zero(Abstand/Wert) != 0.0 and      fx:number-or-zero(Abstand/Wert) != fx:number-or-zero(key('TOP_Kante', ID_TOP_Kante/Wert, /*)/TOP_Kante_Allg/TOP_Laenge/Wert)]">Die Verortung der Weichenkomponente ist nicht jeweils am Anfang/Ende der TOP-Kante.</iso:report>
		</iso:rule></iso:pattern>
	
	<iso:pattern is-a="ID244-abstract" id="ID244"><iso:param name="Role" value="error"/></iso:pattern>
	
</planpro:pattern>