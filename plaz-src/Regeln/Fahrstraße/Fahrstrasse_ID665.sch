<?xml version="1.0" encoding="UTF-8"?><planpro:pattern xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:planpro="http://www.plan-pro.org/regeln/struktur">
	<iso:pattern fpi="A58995CF-865B-47EF-9914-755CB8D0B10A" see="Fahrstrasse_ID665" id="ID665-abstract" abstract="true" planpro:arbeitspaket="Fahrstraße" planpro:version="1.10.0.3"><iso:title>Zs 3 für Zugstraße - zulässige Höchstgeschwindigkeit Fahrweg</iso:title><iso:p>
			<planpro:description>
				Die mittels Zs 3 gezeigte Geschwindigkeit am Fahrstraßenstart darf nicht größer sein 
				als die im befahrenen Teil hinterlegte zulässige Höchstgeschwindigkeit (Vzul).
				
				Wenn Fstr_Signalisierung.ID_Signal_Signalbegriff → Signal_Signalbegriff.Signalbegriff_ID == "Zs_3" ∧
				this.Signal_Signalbegriff.ID_Signal_Rahmen → Signal_Rahmen.ID_Signal → Signal ← Fstr_Fahrweg.ID_Start ←
				Fstr_Zug_Rangier.ID_Fstr_Fahrweg ∧ ∃ Fstr_Zug_Rangier.Fstr_Zug,
				dann muss Zs_3.Symbol * 10 ≤
				Fstr_Signalisierung.ID_Fstr_Zug_Rangier → Fstr_Zug_Rangier.ID_Fstr_Fahrweg → Fstr_Fahrweg.Fstr_V_Hg sein.
			</planpro:description>
			<planpro:comment>
				Prüfung entfällt, falls
				- relevante ID_Signal_Signalbegriff nil
				- referenziertes Signal_Signalbegriff fehlend
				- relevante ID_Fstr_Zug_Rangier nil
				- referenziertes Fstr_Zug_Rangier fehlend
				- relevante Fstr_Zug_Rangier.ID_Fstr_Fahrweg nil
				- referenziertes Fstr_Fahrweg fehlend
				- relevantes Fstr_V_Hg fehlend
			</planpro:comment>
			<planpro:test>
				<planpro:success>
					Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist nicht größer als die im befahrenen Teil (Fahrweg)
					hinterlegte zulässige Höchstgeschwindigkeit (Vzul).
				</planpro:success>
				<planpro:error>
					Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist größer als die im befahrenen Teil (Fahrweg)
					hinterlegte zulässige Höchstgeschwindigkeit (Vzul). 
				</planpro:error>
			</planpro:test>
			<planpro:output>Fstr_Signalisierung</planpro:output>
		</iso:p><iso:include href="../incomplete/Fstr_Signalisierung-nil_ID_Signalbegriff.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-miss_Signalbegriff.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-nil_ID_Fstr_Zug_Rangier.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-miss_Fstr_Zug_Rangier.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-nil_ID_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-miss_Fstr_Fahrweg.xml"/><iso:include href="../incomplete/Fstr_Signalisierung-miss_Fstr_V_Hg.xml"/><iso:rule role="$Role" context="Fstr_Signalisierung[../(parent::LST_Zustand_Ziel | parent::LST_Zustand)][fx:Fstr-639(current(), /*)]">
			<iso:let name="Symbol" value="key('Signal_Signalbegriff', $Signalbegriff-Referenz/Wert, /*)/Signalbegriff_ID/Symbol"/>
			<iso:let name="Fstr_Zug_Rangier" value="key('Fstr_Zug_Rangier', ID_Fstr_Zug_Rangier/Wert, parent::*)"/>
			<iso:let name="Fstr_Fahrweg" value="key('Fstr_Fahrweg', $Fstr_Zug_Rangier/ID_Fstr_Fahrweg/Wert, parent::*)"/>
					
			<iso:report diagnostics="guid typ bereich aufbau s1 s2 s3 s4 s5 s6 s7" test="$Fstr_Fahrweg/Fstr_V_Hg/fx:number-or-zero(Wert) &lt; 10*fx:number-or-zero($Symbol)">Die am Fahrstraßenstart geplante Geschwindigkeit (Zs 3) ist größer als die im befahrenen Teil (Fahrweg) hinterlegte zulässige Höchstgeschwindigkeit (Vzul).</iso:report>
		</iso:rule></iso:pattern>
	
	<iso:pattern is-a="ID665-abstract" id="ID665"><iso:param name="Role" value="error"/><iso:param name="Signalbegriff-Referenz" value="ID_Signal_Signalbegriff"/><iso:param name="relevanter-Signalbegriff" value="'Zs_3'"/><iso:param name="ignore-Signalbegriff" value="('BS_Wdh', 'BS_ZBS-Ber', 'BS_Zusatz', 'BS_vA_UES', 'BS_vRVA', 'Bue_0_0Lp', 'Bue_0_1Lp', 'Bue_0_1S', 'Bue_0_2Lp', 'Bue_0_2S', 'Bue_1_0Lp_bli', 'Bue_1_1Lp_bli', 'Bue_1_1S_bli', 'Bue_1_2Lp_st', 'Bue_1_2S_st', 'Bue_2', 'Bue_2_1R', 'Bue_2_2R', 'Bue_2_3R', 'Bue_3', 'Bue_4', 'Bue_5', 'Bue_AT', 'Bue_AT_Zusatz', 'Bue_KT', 'El_1', 'El_1v', 'El_2', 'El_3', 'El_3_4_Zusatz', 'El_3_4_Zusatz_Kombi', 'El_4', 'El_5', 'El_6', 'El_Pf_b', 'El_Pf_l', 'El_Pf_o', 'El_Pf_r', 'El_T_AC', 'El_T_DC', 'Hl_1', 'Hl_10', 'Hl_11', 'Hl_12a', 'Hl_12b', 'Hl_2', 'Hl_3a', 'Hl_3b', 'Hl_4', 'Hl_5', 'Hl_6a', 'Hl_6b', 'Hl_7', 'Hl_8', 'Hl_9a', 'Hl_9b', 'Hp_0', 'Hp_0_2Lp', 'Hp_0_F', 'Hp_1', 'Hp_1_F', 'Hp_2', 'Hp_2_F', 'Kl', 'Ks_1', 'Ks_2', 'Lf_1', 'Lf_1_2', 'Lf_1_Wdh', 'Lf_2', 'Lf_3', 'Lf_4_DS', 'Lf_4_DV', 'Lf_5_DS', 'Lf_5_DV', 'Lf_6', 'Lf_7', 'Lf_Pf_l', 'Lf_Pf_r', 'Ms_Sk_ge', 'Ms_Sk_rt', 'Ms_UES_Wdh', 'Ms_Vw', 'Ms_ge_D', 'Ms_rt', 'Ms_ws_2swP', 'Ms_ws_ge_ws', 'Ms_ws_rt_ws', 'Ms_ws_sw_ws', 'Ne_1', 'Ne_12', 'Ne_13a', 'Ne_13b', 'Ne_14', 'Ne_2', 'Ne_2_vRVA', 'Ne_3_1str', 'Ne_3_2str', 'Ne_3_3str', 'Ne_3_4str', 'Ne_3_5str', 'Ne_4', 'Ne_5', 'Ne_6', 'Ne_7a', 'Ne_7b', 'Oz_Auto_ET', 'Oz_Auto_HET', 'Oz_Bk', 'Oz_ET', 'Oz_Fa', 'Oz_Fak', 'Oz_GSM-R', 'Oz_HET', 'Oz_HM', 'Oz_ICE', 'Oz_LZB-Ber', 'Oz_OB_Grenze', 'Oz_PZB_2000_Hz', 'Oz_PZB_BUE', 'Oz_Zf', 'Oz_Zugl', 'Pf_2', 'Ra_10', 'Ra_11', 'Ra_11b', 'Ra_12', 'Ra_13', 'Sh_0', 'Sh_1', 'Sh_2', 'Sk_1', 'Sk_2', 'So_1', 'So_106', 'So_14', 'So_15', 'So_19_1P', 'So_19_2P', 'So_19_3P', 'So_20', 'Sv_0', 'Sv_1', 'Sv_2', 'Sv_3', 'Sv_4', 'Sv_5', 'Sv_6', 'Sv_wPf', 'Ts_1', 'Ts_2', 'Ts_3', 'Ukr', 'Vr_0', 'Vr_0_F', 'Vr_1', 'Vr_1_2_F', 'Vr_1_F', 'Vr_2', 'Vr_2_F', 'Wn_1', 'Wn_2', 'Wn_3', 'Wn_4', 'Wn_5', 'Wn_6', 'Wn_7', 'Wvs', 'Zl_o', 'Zl_u', 'Zp_10', 'Zp_10_Ls', 'Zp_6', 'Zp_7', 'Zp_8', 'Zp_9', 'Zp_9_Ls', 'Zs_1', 'Zs_10', 'Zs_103', 'Zs_12', 'Zs_13', 'Zs_1_A', 'Zs_2', 'Zs_2v', 'Zs_3v', 'Zs_6', 'Zs_7', 'Zs_8', 'Zs_8_A', 'Zs_9')"/><iso:param name="ignore-Fahrstrassentyp" value="Fstr_Mittel | Fstr_Rangier"/></iso:pattern>
	
</planpro:pattern>