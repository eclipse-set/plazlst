<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="DD503176-04B9-4514-93AA-8488B4AAC7F5" id="ID178-abstract" planpro:arbeitspaket="Basisobjekte" planpro:version="1.10.0.3" see="Basisobjekte_ID178"><iso:title>Mehrfache GUID-Vergabe</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Eine Identität (GUID) darf innerhalb eines LST-Zustands nur einmalig vergeben werden.
			Im Falle einer LST-Planung werden die Ziel-Zustände aller Untergewerke gemeinsam betrachtet.
			
			Es ist zu prüfen, ob innerhalb PlanPro_Schnittstelle.LST_Planung.Fachdaten.Ausgabe_Fachdaten.LST_Zustand_Ziel
			bzw. PlanPro_Schnittstelle.LST_Zustand der Wert [Objektname].Identitaet mehrfach vorhanden ist.
</code></pre>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls
				- relevante Identitaet nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Die Identität (GUID) wurde innerhalb eines LST-Zustands nur für eine Objektinstanz vergeben.
				</planpro:success>
				<planpro:error>
					Innerhalb des [Ziel/LST]-Zustands wurde für mehrere Objektinstanzen die gleiche Identität (GUID) vergeben.
				</planpro:error>
			</planpro:test>
			<planpro:output>Container-Objekt</planpro:output>
			<!--
				Um alle Objekte mit gleicher GUID anzuzeigen, wäre folgende Bedingung im "assert" zu wählen
				test="count(key('Identitaet', current()/Wert, ancestor::$Bereich)) = 1"
			
				Um nur die doppelt genutzte GUID beim Wiederholen anzuzeigen, wäre folgende Bedingung im "report" zu wählen
				test="(current()|key('Identitaet', current()/Wert, ancestor::$Bereich)[1])[2]
	
				Um nur die doppelt genutzte GUID beim ersten Auftreten anzuzeigen, wäre folgende Bedingung im "assert" zu wählen
				test="not((current()|key('Identitaet', current()/Wert, ancestor::$Bereich)[2])[2])"
	
				Um nur anzuzeigen, wo die GUID wiederholt auftritt, unabhängig von der Wiederholungszahl, nicht jedoch beim ersten Auftreten
				dabei wird im "assert" folgende Bedingung gewählt:
				test="count(current()|key('Identitaet', current()/Wert, ancestor::$Bereich)[1]) = 1"
			-->
		</iso:p><iso:include href="../incomplete/_-nil_Identitaet.xml"/><iso:rule context="Container[parent::LST_Zustand_Ziel | parent::LST_Zustand]/*[Identitaet]" role="$Role">
			<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="key('Identitaet', Identitaet/Wert, /)[2]">Innerhalb des '<iso:value-of select="if (../../local-name() = 'LST_Zustand_Ziel') then 'Ziel' else 'LST'"/>-Zustands' wurde für mehrere Objektinstanzen die gleiche Identität (GUID) vergeben.</iso:report>
	  </iso:rule></iso:pattern>
	
	<iso:pattern id="ID178" is-a="ID178-abstract"><iso:param name="Role" value="error"/></iso:pattern>
	
</planpro:pattern>