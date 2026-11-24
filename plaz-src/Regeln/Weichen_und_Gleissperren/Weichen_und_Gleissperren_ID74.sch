<?xml version="1.0" encoding="UTF-8" standalone="no"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="ECFDE6B0-7B40-4AB9-A9DE-0D4C7C40814F" id="ID74" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3" see="Weichen_und_Gleissperren_ID74">
	<iso:title>Anzahl Komponenten je Weichen-/Kreuzungs-/Gsp-Element</iso:title>
	<iso:p>
	    <planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>    	Existiert ein Weichen-, Kreuzungs- oder Gleissperren-Element, dann muss diesem mindestens eine entsprechende Komponente zugeordnet sein.
    	
    	Existiert ein "W_Kr_Gsp_Element", muss mindestens eine "W_Kr_Gsp_Komponente" auf dieses "W_Kr_Gsp_Element" verweisen.
</code></pre>
</planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Dem Weichen-, Kreuzungs- bzw. Gleissperren-Element ist mindestens eine entsprechende Komponente zugeordnet.
			</planpro:success>
			<planpro:error>
				Dem Weichen-, Kreuzungs- bzw. Gleissperren-Element ist nicht mindestens eine entsprechende Komponente zugeordnet.
			</planpro:error>					
		</planpro:test>
		<planpro:output>W_Kr_Gsp_Element</planpro:output>
	  </iso:p>
	  <iso:rule context="W_Kr_Gsp_Element[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="error">
	  	<iso:let name="W_Kr_Gsp_Komponente" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', Identitaet/Wert, parent::*)"/>
	  	<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$W_Kr_Gsp_Komponente">Dem Weichen-, Kreuzungs- bzw. Gleissperren-Element ist nicht mindestens eine entsprechende Komponente zugeordnet.</iso:assert>
	  </iso:rule>
</iso:pattern>