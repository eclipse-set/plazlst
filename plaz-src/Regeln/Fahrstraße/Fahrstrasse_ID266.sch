<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="9CD9650B-7AF0-49b3-AA26-86A9C078914A" id="ID266-abstract" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3" see="Fahrstrasse_ID266"><iso:title>Fahrstraßen-Zuordnung bei Flankenschutz für Rangierstraßen</iso:title><iso:p>
			<planpro:description format="xhtml"><p xmlns="http://www.w3.org/1999/xhtml">Zur Definition einer Flankenschutzanforderung für eine Rangierstraße darf nur auf eine solche verwiesen werden.</p>
<p xmlns="http://www.w3.org/1999/xhtml">Mittels <code>Fstr_Rangier_Fla_Zuordnung.ID_Fstr_Rangier</code> muss auf eine <code>Fstr_Zug_Rangier</code>
mit <code>Fstr_Zug_Rangier.Fstr_Rangier</code> verwiesen werden.</p>
</planpro:description>
			<planpro:comment>
				Fehler, falls relevante Fstr_Zug_Rangier fehlt.
				
				Prüfung entfällt, falls
				- relevante ID_Fstr_Rangier nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Die Flankenschutzanforderung für eine Rangierstraße verweist auf eine solche.
				</planpro:success>
				<planpro:error>
					Die Flankenschutzanforderung für eine Rangierstraße verweist nicht auf eine solche.
				</planpro:error>
			</planpro:test>
			<planpro:output>Fstr_Rangier_Fla_Zuordnung</planpro:output>
		</iso:p><iso:include href="../incomplete/Fstr_Rangier_Fla_Zuordnung-nil_ID_Fstr_Rangier.xml"/><iso:rule context="Fstr_Rangier_Fla_Zuordnung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)]" role="$Role">
			<iso:let name="fstr-zug-rangier" value="key('Fstr_Zug_Rangier', ID_Fstr_Rangier/Wert, parent::*)"/>		

			<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="not($fstr-zug-rangier) or $fstr-zug-rangier[not(Fstr_Rangier)]">Die Flankenschutzanforderung für eine Rangierstraße verweist nicht auf eine solche.</iso:report>	
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID266" is-a="ID266-abstract"><iso:param name="Role" value="error"/></iso:pattern>
	
</planpro:pattern>