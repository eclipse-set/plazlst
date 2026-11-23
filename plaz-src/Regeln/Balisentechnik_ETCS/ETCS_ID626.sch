<?xml version="1.0" encoding="UTF-8" standalone="no"?><planpro:pattern xmlns:planpro="http://www.plan-pro.org/regeln/struktur" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<iso:pattern abstract="true" fpi="955AADBE-C51C-4DF5-8EB5-B97654F5D2AC" id="ID626-abstract" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3" see="ETCS_ID626"><iso:title>Gleicher Anhang für alle Luft-Telegramme zu einem Fachtelegramm</iso:title><iso:p>
			<planpro:description format="xhtml"><pre xmlns="http://www.w3.org/1999/xhtml"><code>			Wenn in einem Luft-Telegramm der Verweis auf EA-Doku gefüllt ist,
			müssen alle anderen Luft-Telegramme, die dem (oder den) gleichen Fachtelegramm(en) zugeordnet sind,
			den gleichen Verweis auf EA-Doku beinhalten. 

			Wenn Luft_Telegramm.LT_Binaerdaten.ID_Anhang_EA_Doku gefüllt ist,
			müssen für Luft_Telegramm.ID_Fachtelegramm → Fachtelegramm alle weiteren mittels 
			Luft_Telegramm.ID_Fachtelegramm zugeordneten Luft-Telegramme 
			Luft_Telegramm.LT_Binaerdaten.ID_Anhang_EA_Doku enthalten und auf die gleiche 
			Luft_Telegramm.LT_Binaerdaten.ID_Anhang_EA_Doku verweisen.
</code></pre>
</planpro:description>
			<planpro:comment>
				Prüfung entfällt falls:
				- relevantes ID_Anhang_EA_Doku nil
				- relevantes ID_Fachtelegramm nil	
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Alle Luft-Telegramme, die auf ein Fachtelegramm referenzieren, verweisen auf den selben Anhang EA-Doku.
				</planpro:success>
				<planpro:error>
					Die Luft-Telegramme, die auf [das gleiche Fachtelegramm / die gleichen Fachtelegramme] referenzieren, 
					verweisen nicht auf den selben Anhang EA-Doku. 
				</planpro:error>
			</planpro:test>
			<planpro:output>Luft_Telegramm</planpro:output>
		</iso:p><iso:include href="../incomplete/Luft_Telegramm-nil_ID_Anhang_EA_Doku.xml"/><iso:include href="../incomplete/Luft_Telegramm-nil_ID_Fachtelegramm.xml"/><iso:rule context="Luft_Telegramm[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][LT_Binaerdaten/ID_Anhang_EA_Doku]" role="$Role">
			<iso:let name="alle_Luft_Telegramme_mit_gleicher_ID_Fachtelegramm" value="key('Luft_Telegramm-fuerFachtelegramm', ID_Fachtelegramm/Wert, parent::*) except ."/>		
			<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="every $i in $alle_Luft_Telegramme_mit_gleicher_ID_Fachtelegramm satisfies      $i/LT_Binaerdaten/ID_Anhang_EA_Doku/Wert = LT_Binaerdaten/ID_Anhang_EA_Doku/Wert">Die Luft-Telegramme, die auf <iso:value-of select="if (ID_Fachtelegramm[2]) then 'die gleichen Fachtelegramme' else 'das gleiche Fachtelegramm'"/> referenzieren, verweisen nicht auf den selben Anhang EA-Doku.</iso:assert>
	  </iso:rule></iso:pattern>
	
	<iso:pattern id="ID626" is-a="ID626-abstract"><iso:param name="Role" value="error"/></iso:pattern>
	
</planpro:pattern>