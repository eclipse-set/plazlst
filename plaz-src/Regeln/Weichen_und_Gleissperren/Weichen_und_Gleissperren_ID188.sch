<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="160B14EE-714B-492c-AA87-6585F2038DC5" id="ID188-abstract" planpro:arbeitspaket="Weichen_und_Gleissperren" planpro:version="1.10.0.3" see="Weichen_und_Gleissperren_ID188"><iso:title>Bei Kreuzungen kein Verweis auf Regelzeichnung</iso:title><iso:p>
	    <planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>      Für Kreuzungen dürfen keine Regelzeichnungen angegeben werden.

      Wenn W_Kr_Anlage.W_Kr_Anlage_Allg.W_Kr_Art == "BKr", "Kr", oder "IBKr",
      dann darf weder in einem der auf die W_Kr_Anlage verweisenden W_Kr_Gsp_Element noch in der jeweils auf dieses W_Kr_Gsp_Element
      verweisenden W_Kr_Gsp_Komponente das Attribut ID_Regelzeichnung gefüllt sein. 
</code></pre>
</planpro:description>
	    <planpro:comment>
	    Wenn ID_Regelzeichnung den Wert nil hat, ist es ein Fehler.
	    
	    Prüfung entfällt, falls:
	    - W_Kr_Art nil
	    </planpro:comment>
	    <planpro:test>
	      <planpro:success>
	        Eine Kreuzung hat im Export keinen Verweis auf eine Regelzeichnung.
	      </planpro:success>
	      <planpro:error>
	        Eine Kreuzung hat im Export einen Verweis auf eine Regelzeichnung.
	      </planpro:error>
	    </planpro:test>
	    <planpro:output>W_Kr_Anlage</planpro:output>
	  </iso:p><iso:include href="../incomplete/W_Kr_Anlage-nil_W_Kr_Art.xml"/><iso:rule context="W_Kr_Anlage[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][W_Kr_Anlage_Allg/W_Kr_Art/Wert = ('BKr', 'Kr', 'IBKr')]" role="$Role">
	    <iso:let name="verweisende_Elemente" value="key('W_Kr_Gsp_Element-fuerW_Kr_Anlage', Identitaet/Wert, parent::*)"/>
	    <iso:let name="verweisende_Komponenten" value="key('W_Kr_Gsp_Komponente-fuerW_Kr_Gsp_Element', $verweisende_Elemente/Identitaet/Wert, parent::*)"/>
	    <iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="($verweisende_Elemente | $verweisende_Komponenten)/ID_Regelzeichnung">Eine Kreuzung hat im Export einen Verweis auf eine Regelzeichnung.</iso:report>
	  </iso:rule></iso:pattern>
	
	<iso:pattern id="ID188" is-a="ID188-abstract"><iso:param name="Role" value="error"/><iso:param name="ignore-W_Kr_Art" value="('ABW','ABW/IBW','DBKW','DKW','DW','EABKW','EBKW','EIBKW','Eins. DW','EKW','EW','Flachkreuzung','IBW','IBW/ABW','Klothoidenweiche','Korbbogenweiche','sonstige','Sym. ABW','ZHA','ZHV ABW','ZHV IBW')"/></iso:pattern>
	
</planpro:pattern>