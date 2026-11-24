<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="EEC87B78-A135-4E15-AF45-89467E0F186A" see="Weichen_und_Gleissperren_ID72" id="ID72" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3">
	<iso:title>Anzahl der Elemente je Weichen-/Kreuzungs-Anlage</iso:title>
	<iso:p>
	    <planpro:description>
	    	Existiert eine Weichen- bzw. Kreuzungs-Anlage, dann muss dieser mindestens ein entsprechendes Element zugeordnet sein.
	    	
	    	Existiert eine "W_Kr_Anlage", muss mindestens ein "W_Kr_Gsp_Element" auf diese "W_Kr_Anlage" verweisen.
	    </planpro:description>
		<planpro:comment/>
		<planpro:test>
			<planpro:success>
				Der Weichen- bzw. Kreuzungs-Anlage ist mindestens ein entsprechendes Element zugeordnet.
			</planpro:success>
			<planpro:error>
				Der Weichen- bzw. Kreuzungs-Anlage ist nicht mindestens ein entsprechendes Element zugeordnet.
			</planpro:error>					
		</planpro:test>
		<planpro:output>W_Kr_Anlage</planpro:output>
	  </iso:p>
	  <iso:rule role="error" context="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]">
	  	<iso:let name="W_Kr_Gsp_Element" value="key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', Identitaet/Wert, parent::*)"/>
	  	<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$W_Kr_Gsp_Element">Der Weichen- bzw. Kreuzungs-Anlage ist nicht mindestens ein entsprechendes Element zugeordnet.</iso:assert>
	  </iso:rule>
</iso:pattern>