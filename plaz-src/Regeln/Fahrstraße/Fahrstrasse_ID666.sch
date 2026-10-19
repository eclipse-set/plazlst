<?xml version="1.0" encoding="UTF-8"?><planpro:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur">
	<iso:pattern fpi="39C0E690-D1CF-460C-BC9A-6C50F0A47FEF" see="Fahrstrasse_ID666" id="ID666-abstract" abstract="true" planpro:arbeitspaket="Fahrstraße" planpro:version="1.10.0.3"><iso:title>Zs 3 für Zugstraße - Geschwindigkeit der Fahrwegelemente</iso:title><iso:p>
			<planpro:description>
				Die mittels Zs 3 gezeigte Geschwindigkeit am Fahrstraßenstart darf nicht größer sein
				als die in den Fahrwegelementen (Weichen oder Kreuzungen) hinterlegten Geschwindigkeiten. 
	
				Wenn Fstr_Signalisierung.ID_Signal_Signalbegriff → Signal_Signalbegriff.Signalbegriff_ID == "Zs_3" ∧
				this.Signal_Signalbegriff.ID_Signal_Rahmen → Signal_Rahmen.ID_Signal → Signal ← Fstr_Fahrweg.ID_Start ←
				Fstr_Zug_Rangier.ID_Fstr_Fahrweg ∧ 
				∃ Fstr_Zug_Rangier.Fstr_Zug ∧ 
				für alle W_Kr_Gsp_Komponente, deren topologische Verortung 
				(ermittelbar über W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.ID_TOP_Kante / W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Abstand)
				innerhalb eines Teilbereichs von Fstr_Fahrweg liegt
				∃ W_Kr_Gsp_Komponente.Zungenpaar oder W_Kr_Gsp_Komponente.Kreuzung 
				dann muss Zs_3.Symbol * 10 ≤
				W_Kr_Gsp_Komponente.Zungenpaar.Geschwindigkeit_L ∨
				W_Kr_Gsp_Komponente.Zungenpaar.Geschwindigkeit_R ∨
				W_Kr_Gsp_Komponente.Kreuzung.Geschwindigkeit_L ∨
				W_Kr_Gsp_Komponente.Kreuzung.Geschwindigkeit_R für alle W_Kr_Gsp_Komponente in Fstr_Fahrweg sein. 
			</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls
				- relevante ID_Signal_Signalbegriff nil
				- referenziertes Signal_Signalbegriff fehlend
				- relevante ID_Fstr_Zug_Rangier nil
				- referenziertes Fstr_Zug_Rangier fehlend
				- relevante Fstr_Zug_Rangier.ID_Fstr_Fahrweg nil
				- referenziertes Fstr_Fahrweg fehlend
				- relevante Fstr_Fahrweg.Bereich_Objekt_Teilbereich.Begrenzung_A oder Begrenzung_B nil
				- relevante Fstr_Fahrweg.Bereich_Objekt_Teilbereich.ID_TOP_Kante nil
				- relevante TOP_Kante.TOP_Kante_Allg.TOP_Anschluss_A oder TOP_Anschluss_B nil
				- relevante TOP_Kante.TOP_Kante_Allg.TOP_Laenge nil
				- relevante W_Kr_Gsp_Komponente.Punkt_Objekt_TOP_Kante.Abstand nil
				- relevante W_Kr_Gsp_Komponente.Kreuzung.Geschwindigkeit_L oder Geschwindigkeit_R nil
				- relevante W_Kr_Gsp_Komponente.Zungenpaar.Geschwindigkeit_L oder Geschwindigkeit_R nil
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist nicht größer als die in den zugehörigen Fahrwegelementen 
					(Weichen oder Kreuzungen) hinterlegten Geschwindigkeiten.
				</planpro:success>
				<planpro:error>
					Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist größer als die in den zugehörigen Fahrwegelementen 
					(Weichen oder Kreuzungen) hinterlegten Geschwindigkeiten.
				</planpro:error>
			</planpro:test>
			<planpro:output>Fstr_Signalisierung</planpro:output>
		</iso:p><iso:include href="../incomplete/Fstr_Signalisierung-nil_ID_Signalbegriff.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-miss_Signalbegriff.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-nil_ID_Fstr_Zug_Rangier.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-miss_Fstr_Zug_Rangier.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-nil_ID_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-miss_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-nil_Begrenzung_A_B.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-nil_ID_TOP_Kante.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-nil_TOP_Anschluss_A_B.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-nil_TOP_Laenge.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-nil_Abstand.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-nil_Geschwindigkeit_L_R.xml"/><iso:rule role="$Role" context="Fstr_Signalisierung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-666(current(), /*)]">
			<iso:let name="Symbol" value="key('Signal_Signalbegriff', $Signalbegriff-Referenz/Wert, /*)             /Signalbegriff_ID/Symbol"/>
			<iso:let name="Fstr_Zug_Rangier" value="key('Fstr_Zug_Rangier', ID_Fstr_Zug_Rangier/Wert, parent::*)"/>
			<iso:let name="Fstr_Fahrweg" value="key('Fstr_Fahrweg', $Fstr_Zug_Rangier/ID_Fstr_Fahrweg/Wert, parent::*)"/>
			<iso:let name="Fstr_Fahrweg_BOT" value="$Fstr_Fahrweg/Bereich_Objekt_Teilbereich"/>
	
			<!-- alle betroffenen TOP_Kanten unter der Bedingung, dass in Fahrweg/Bereich_Objekt_Teilbereich/Begrenzung_A = 0 und
				TOP_Anschluss_A gleich Rechts oder Links -->
			<iso:let name="betroffene-TOP_Kanten-Anfaenge" value="key('TOP_Kante',      $Fstr_Fahrweg_BOT[fx:number-or-zero(Begrenzung_A/Wert) = 0.0]/ID_TOP_Kante/Wert, /*)     [*/TOP_Anschluss_A/Wert = ('Rechts', 'Links')]"/>
			
			<!-- alle W_Kr-Komponenten bzw. deren Geschwindigkeiten unter der Bedingung,
				dass Punkt_Objekt_TOP_Kante in betroffenen TOP_Kanten enthalten und darin auch Abstand = 0 ist,
				dann darin bei TOP_Anschluss_A Rechts bzw. Links die Geschwindigkeit_R bzw. Geschwindigkeit_L auswählen -->
	
			<iso:let name="W_Kr-Geschwindigkeiten-amKnotenAnfang" value="for $i in $betroffene-TOP_Kanten-Anfaenge return     key('W_Kr_Gsp_Komponente_POT-fuerTOP_Kante', $i/Identitaet/Wert, /*)     [fx:number-or-zero(Abstand/Wert) = 0.0]/../(Zungenpaar|Kreuzung)/     (Geschwindigkeit_L[$i/*/TOP_Anschluss_A/Wert = 'Links'] |       Geschwindigkeit_R[$i/*/TOP_Anschluss_A/Wert = 'Rechts'])"/>
	
			<!-- alle betroffenen TOP_Kanten unter der Bedingung, dass in Fahrweg/Bereich_Objekt_Teilbereich/Begrenzung_B = (Zahl) 
				und TOP_Kante/TOP_Laenge/Wert = (Zahl) und TOP_Anschluss_B gleich Rechts oder Links -->
			<iso:let name="betroffene-TOP_Kanten-Enden" value="for $i in $Fstr_Fahrweg_BOT return      key('TOP_Kante', $i/ID_TOP_Kante/Wert, /*)      [fx:number-or-zero(*/TOP_Laenge/Wert) = fx:number-or-zero($i/Begrenzung_B/Wert)]      [*/TOP_Anschluss_B/Wert = ('Rechts', 'Links')]"/>
			
			<!-- alle W_Kr-Komponenten bzw. deren Geschwindigkeiten unter der Bedingung,
				dass Punkt_Objekt_TOP_Kante in betroffenen TOP_Kanten enthalten und darin auch Abstand = TOP_Laenge ist,
				dann darin bei TOP_Anschluss_B Rechts bzw. Links die Geschwindigkeit_R bzw. Geschwindigkeit_L auswählen -->
			<iso:let name="W_Kr-Geschwindigkeiten-amKnotenEnde" value="for $i in $betroffene-TOP_Kanten-Enden return     key('W_Kr_Gsp_Komponente_POT-fuerTOP_Kante', $i/Identitaet/Wert, /*)     [fx:number-or-zero(Abstand/Wert) = fx:number-or-zero($i/*/TOP_Laenge/Wert)]/../(Zungenpaar|Kreuzung)/     (Geschwindigkeit_L[$i/*/TOP_Anschluss_B/Wert = 'Links'] |      Geschwindigkeit_R[$i/*/TOP_Anschluss_B/Wert = 'Rechts'])"/>
			
			<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="($W_Kr-Geschwindigkeiten-amKnotenAnfang | $W_Kr-Geschwindigkeiten-amKnotenEnde)/fx:number-or-zero(Wert) &lt; 10*fx:number-or-zero($Symbol)">Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist größer als die in den zugehörigen Fahrwegelementen (Weichen oder Kreuzungen) hinterlegten Geschwindigkeiten.</iso:report>
		</iso:rule></iso:pattern>
	
	<iso:pattern is-a="ID666-abstract" id="ID666"><iso:param name="Role" value="error"/><iso:param name="Signalbegriff-Referenz" value="ID_Signal_Signalbegriff"/><iso:param name="relevanter-Signalbegriff" value="'Zs_3'"/><iso:param name="ignore-Signalbegriff" value="('BS_Wdh', 'BS_ZBS-Ber', 'BS_Zusatz', 'BS_vA_UES', 'BS_vRVA', 'Bue_0_0Lp', 'Bue_0_1Lp', 'Bue_0_1S', 'Bue_0_2Lp', 'Bue_0_2S', 'Bue_1_0Lp_bli', 'Bue_1_1Lp_bli', 'Bue_1_1S_bli', 'Bue_1_2Lp_st', 'Bue_1_2S_st', 'Bue_2', 'Bue_2_1R', 'Bue_2_2R', 'Bue_2_3R', 'Bue_3', 'Bue_4', 'Bue_5', 'Bue_AT', 'Bue_AT_Zusatz', 'Bue_KT', 'El_1', 'El_1v', 'El_2', 'El_3', 'El_3_4_Zusatz', 'El_3_4_Zusatz_Kombi', 'El_4', 'El_5', 'El_6', 'El_Pf_b', 'El_Pf_l', 'El_Pf_o', 'El_Pf_r', 'El_T_AC', 'El_T_DC', 'Hl_1', 'Hl_10', 'Hl_11', 'Hl_12a', 'Hl_12b', 'Hl_2', 'Hl_3a', 'Hl_3b', 'Hl_4', 'Hl_5', 'Hl_6a', 'Hl_6b', 'Hl_7', 'Hl_8', 'Hl_9a', 'Hl_9b', 'Hp_0', 'Hp_0_2Lp', 'Hp_0_F', 'Hp_1', 'Hp_1_F', 'Hp_2', 'Hp_2_F', 'Kl', 'Ks_1', 'Ks_2', 'Lf_1', 'Lf_1_2', 'Lf_1_Wdh', 'Lf_2', 'Lf_3', 'Lf_4_DS', 'Lf_4_DV', 'Lf_5_DS', 'Lf_5_DV', 'Lf_6', 'Lf_7', 'Lf_Pf_l', 'Lf_Pf_r', 'Ms_Sk_ge', 'Ms_Sk_rt', 'Ms_UES_Wdh', 'Ms_Vw', 'Ms_ge_D', 'Ms_rt', 'Ms_ws_2swP', 'Ms_ws_ge_ws', 'Ms_ws_rt_ws', 'Ms_ws_sw_ws', 'Ne_1', 'Ne_12', 'Ne_13a', 'Ne_13b', 'Ne_14', 'Ne_2', 'Ne_2_vRVA', 'Ne_3_1str', 'Ne_3_2str', 'Ne_3_3str', 'Ne_3_4str', 'Ne_3_5str', 'Ne_4', 'Ne_5', 'Ne_6', 'Ne_7a', 'Ne_7b', 'Oz_Auto_ET', 'Oz_Auto_HET', 'Oz_Bk', 'Oz_ET', 'Oz_Fa', 'Oz_Fak', 'Oz_GSM-R', 'Oz_HET', 'Oz_HM', 'Oz_ICE', 'Oz_LZB-Ber', 'Oz_OB_Grenze', 'Oz_PZB_2000_Hz', 'Oz_PZB_BUE', 'Oz_Zf', 'Oz_Zugl', 'Pf_2', 'Ra_10', 'Ra_11', 'Ra_11b', 'Ra_12', 'Ra_13', 'Sh_0', 'Sh_1', 'Sh_2', 'Sk_1', 'Sk_2', 'So_1', 'So_106', 'So_14', 'So_15', 'So_19_1P', 'So_19_2P', 'So_19_3P', 'So_20', 'Sv_0', 'Sv_1', 'Sv_2', 'Sv_3', 'Sv_4', 'Sv_5', 'Sv_6', 'Sv_wPf', 'Ts_1', 'Ts_2', 'Ts_3', 'Ukr', 'Vr_0', 'Vr_0_F', 'Vr_1', 'Vr_1_2_F', 'Vr_1_F', 'Vr_2', 'Vr_2_F', 'Wn_1', 'Wn_2', 'Wn_3', 'Wn_4', 'Wn_5', 'Wn_6', 'Wn_7', 'Wvs', 'Zl_o', 'Zl_u', 'Zp_10', 'Zp_10_Ls', 'Zp_6', 'Zp_7', 'Zp_8', 'Zp_9', 'Zp_9_Ls', 'Zs_1', 'Zs_10', 'Zs_103', 'Zs_12', 'Zs_13', 'Zs_1_A', 'Zs_2', 'Zs_2v', 'Zs_3v', 'Zs_6', 'Zs_7', 'Zs_8', 'Zs_8_A', 'Zs_9')"/><iso:param name="ignore-Fahrstrassentyp" value="Fstr_Mittel | Fstr_Rangier"/></iso:pattern>
	
</planpro:pattern>