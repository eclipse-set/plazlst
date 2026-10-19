<?xml version="1.0" encoding="UTF-8"?><iso:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur" fpi="955AADBE-C51C-4DF5-8EB5-B97654F5D2AC" see="ETCS_ID626" id="ID626" planpro:arbeitspaket="Balisentechnik_ETCS" planpro:version="1.10.0.3">
	<iso:title>Gleicher Anhang für alle Luft-Telegramme zu einem Fachtelegramm</iso:title>
	<iso:p>
		<planpro:description>
			Wenn in einem Luft-Telegramm der Verweis auf EA-Doku gefüllt ist, müssen alle anderen Luft-Telegramme,
			die dem (oder den) gleichen Fachtelegramm(en) zugeordnet sind, auf den gleichen Anhang EA-Doku verweisen.

			Wenn Luft_Telegramm.LT_Binaerdaten.ID_Anhang_EA_Doku gefüllt ist, müssen für Luft_Telegramm.ID_Fachtelegramm →
			Fachtelegramm alle weiteren mittels Luft_Telegramm.ID_Fachtelegramm zugeordneten Luft-Telegramme den selben Verweis
			Luft_Telegramm.LT_Binaerdaten.ID_Anhang_EA_Doku enthalten.
		</planpro:description>
		<planpro:comment>
			Prüfung entfällt falls:
			- relevantes ID_Anhang_EA_Doku nil
			- relevantes ID_Fachtelegramm nil
			- fehlendes ID_Anhang_EA_Doku 
		</planpro:comment>
		<planpro:test>
			<planpro:success>
				Alle Luft-Telegramme, die auf ein Fachtelegramm referenzieren, verweisen auf den selben Anhang EA-Doku.
			</planpro:success>
			<planpro:error>
				Die Luft-Telegramme, die auf ein Fachtelegramm referenzieren, verweisen nicht auf den selben Anhang EA-Doku.
			</planpro:error>
		</planpro:test>
		<planpro:output>Luft_Telegramm</planpro:output>
	</iso:p>
	<iso:rule role="error" context="Luft_Telegramm[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][LT_Binaerdaten/ID_Anhang_EA_Doku]">
		<iso:let name="alle_Luft_Telegramme_mit_gleicher_ID_Fachtelegramm" value="key('Luft_Telegramm-fuerFachtelegramm', ID_Fachtelegramm/Wert, parent::*)"/>
		<iso:let name="EA_Doku_Id" value="LT_Binaerdaten/ID_Anhang_EA_Doku/Wert"/>
		<iso:assert diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="every $i in $alle_Luft_Telegramme_mit_gleicher_ID_Fachtelegramm satisfies $i/LT_Binaerdaten/ID_Anhang_EA_Doku/Wert = $EA_Doku_Id">Die Luft-Telegramme, die auf ein Fachtelegramm referenzieren, verweisen nicht auf den selben Anhang EA-Doku.</iso:assert>
  </iso:rule>
</iso:pattern>