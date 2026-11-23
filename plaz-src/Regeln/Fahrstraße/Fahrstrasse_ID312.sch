<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="EB1EC8F9-3899-4C85-90A6-B76BEA99FBDB" id="ID312-abstract" planpro:arbeitspaket="Fahrstrasse" planpro:version="1.10.0.3" see="Fahrstrasse_ID312"><iso:title>Begrenzung des Fahrwegs einer Zugstraße (Ziel)</iso:title><iso:p>
			<planpro:description format="xhtml"><p xmlns="http://www.w3.org/1999/xhtml">Prüfung, ob ein zu einer Zugstraße gehörender Fahrweg an den dafür vorgesehenen Signalen endet.</p>
<p xmlns="http://www.w3.org/1999/xhtml">Wenn <code>Fstr_Zug_Rangier.Fstr_Zug</code> gefüllt ist,
muss <code>Fstr_Zug_Rangier.ID_Fstr_Fahrweg</code> → <code>Fstr_Fahrweg.ID_Ziel</code> ein <code>Signal</code> mit</p>
<ul xmlns="http://www.w3.org/1999/xhtml">
<li><code>Signal.Signal_Real.Signal_Real_Aktiv_Schirm.Signal_Art</code> ==
<ul>
<li><code>Hauptsignal</code>,</li>
<li><code>Hauptsperrsignal</code>,</li>
<li><code>Hauptsperrsignal Ne 14 Ls</code>,</li>
<li><code>Mehrabschnittssignal</code>,</li>
<li><code>Mehrabschnittssperrsignal</code>,</li>
<li><code>Zugdeckungssignal</code>,</li>
<li><code>Sperrsignal</code> mit
*<code>Signal.Signal_Real.Signal_Funktion</code> == <code>Zug_Ziel_Signal</code> oder</li>
</ul>
</li>
<li>∃ <code>Signal.Signal_Real</code> ∧
<ul>
<li>∄
<ul>
<li><code>Signal.Signal_Real.Signal_Real_Aktiv</code> ∧</li>
<li><code>Signal.Signal_Real.Signal_Real_Aktiv_Schirm</code> ∧</li>
</ul>
</li>
<li><code>Signal</code> ← <code>Signal_Rahmen.ID_Signal</code> ← <code>Signal_Rahmen</code> ← <code>Signal_Signalbegriff.ID_Signal_Rahmen</code> → <code>Signal_Signalbegriff.Signalbegriff_ID</code> ==
<ul>
<li><code>Ne_14</code> ∨</li>
<li><code>Oz_Bk</code> oder</li>
</ul>
</li>
</ul>
</li>
<li><code>Signal.Signal_Fiktiv.Fiktives_Signal_Funktion</code> ==
<ul>
<li><code>FAP_Ziel</code>,</li>
<li><code>sonstige</code>,</li>
<li><code>Zentralblock_Ziel</code>,</li>
<li><code>Zug_Ziel_Awanst</code>,</li>
<li><code>Zug_Ziel_ohne_Signal</code>,</li>
<li><code>Zug_Ziel_Strecke</code>,</li>
<li><code>Zug_Start_Ziel_Bk</code>,</li>
<li><code>Zug_Start_Ziel_Bk_mit_Zs_1</code>,</li>
<li><code>Zug_Start_Ziel_Bk_mit_Zs_7</code>,</li>
<li><code>Zug_Start_Ziel_Ne_14</code>,</li>
<li><code>Zug_Start_Ziel_Ne_14_mit_Zs_1</code>,</li>
<li><code>Zug_Start_Ziel_Ne_14_mit_Zs_7</code>,</li>
<li><code>Zug_Start_Ziel_Ne_14_mit_Zs_8</code></li>
</ul>
</li>
</ul>
<p xmlns="http://www.w3.org/1999/xhtml">sein.</p>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls:
				- ID_Fstr_Fahrweg nil
				- referenzierter Fstr_Fahrweg fehlend
				- relevantes ID_Ziel nil
				- relevantes Signal fehlend
				- relevante Signal_Art nil
				- relevante Fiktives_Signal_Funktion nil
				- relevanter Signal_Rahmen fehlend, falls Signal_Real ohne (Signal_Real_Aktiv oder Signal_Real_Aktiv_Schirm)
				- relevanter Signal_Signalbegriff fehlend, falls Signal_Real ohne (Signal_Real_Aktiv oder Signal_Real_Aktiv_Schirm)
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Die Zugstraße endet an einem zulässigen realen oder fiktiven Signal.
				</planpro:success>
				<planpro:error>
					Die Zugstraße endet nicht an einem zulässigen realen oder fiktiven Signal.
				</planpro:error>
			</planpro:test>
			<planpro:output>Fstr_Zug_Rangier</planpro:output>
		</iso:p><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_ID_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-miss_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_Signalreferenz.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-miss_Signal.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_Signal-Art.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-nil_Fiktives_Signal_Funktion.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-miss_Signalrahmen.xml"/><iso:include href="../incomplete/Fstr_Zug_Rangier-miss_Signalbegriff.xml"/><iso:rule context="Fstr_Zug_Rangier[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][$relevanter-Fahrstrassentyp]" role="$Role">
	  	<iso:let name="current_Fahrweg" value="key('Fstr_Fahrweg', ID_Fstr_Fahrweg/Wert, parent::*)"/>		
			<iso:let name="Signal" value="key('Signal', $current_Fahrweg/$Signal-Referenz/Wert, /*)"/>	  	
	  	<!-- gefundene Signalarten -->
	  	<iso:let name="Signal_Real_Art" value="$Signal/Signal_Real/Signal_Real_Aktiv_Schirm/Signal_Art/Wert"/>
	  	<iso:let name="Signal_Fiktiv_Funktion" value="$Signal/Signal_Fiktiv/Fiktives_Signal_Funktion/Wert"/>
	  	<iso:let name="Signal_Real" value="$Signal/Signal_Real[not(Signal_Real_Aktiv|Signal_Real_Aktiv_Schirm)]"/>
	  	<iso:let name="Signal_Rahmen" value="key('Signal_Rahmen-fuerSignal', $Signal/Identitaet/Wert, /*)"/>
	  	<iso:let name="Signal_Begriff" value="key('Signal_Signalbegriff-fuerSignal_Rahmen', $Signal_Rahmen/Identitaet/Wert, /*)"/>
	  	<iso:let name="Signalbegriff_Typ" value="$Signal_Begriff/Signalbegriff_ID/substring-after(@xsi:type,':')"/>
	  	<!-- gesuchte Signalarten -->
	  	<iso:let name="Signal_Real_Art_zulaessig" value="('Hauptsignal', 'Hauptsperrsignal', 'Hauptsperrsignal Ne 14 Ls', 'Mehrabschnittssignal',      'Mehrabschnittssperrsignal', 'Zugdeckungssignal')"/>
	  	<iso:let name="Signal_Fiktiv_Funktion_zulaessig" value="('Zug_Ziel_Strecke','Zug_Ziel_ohne_Signal','Zug_Ziel_Awanst',      'FAP_Ziel', 'sonstige', 'Zentralblock_Ziel', 'Zug_Start_Ziel_Bk', 'Zug_Start_Ziel_Bk_mit_Zs_1', 'Zug_Start_Ziel_Bk_mit_Zs_7',      'Zug_Start_Ziel_Ne_14', 'Zug_Start_Ziel_Ne_14_mit_Zs_1', 'Zug_Start_Ziel_Ne_14_mit_Zs_7', 'Zug_Start_Ziel_Ne_14_mit_Zs_8')"/>
	  	<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Signal_Real_Art = $Signal_Real_Art_zulaessig or      $Signal_Fiktiv_Funktion = $Signal_Fiktiv_Funktion_zulaessig or      ($Signal_Real_Art = 'Sperrsignal' and $Signal/Signal_Real/Signal_Funktion/Wert = 'Zug_Ziel_Signal') or      ($Signal_Real and $Signalbegriff_Typ = ('Ne_14', 'Oz_Bk'))">Die Zugstraße endet nicht an einem zulässigen realen oder fiktiven Signal.</iso:assert>	
		</iso:rule></iso:pattern>
	
	<iso:pattern id="ID312" is-a="ID312-abstract"><iso:param name="Role" value="warning"/><iso:param name="relevanter-Fahrstrassentyp" value="Fstr_Zug"/><iso:param name="relevante-Fahrstrassenart" value="()"/><iso:param name="allow-Gruppenausfahrt" value="true()"/><iso:param name="Signal-Referenz" value="ID_Ziel"/><iso:param name="ignore-Fahrstrassentyp" value="(Fstr_Rangier | Fstr_Mittel)"/></iso:pattern>
	
</planpro:pattern>