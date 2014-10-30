#V3.24s
#C growth parameters are estimated
1   #_N_Growth_Patterns
1   #_N_Morphs_Within_GrowthPattern 
0   #_Nblock_Patterns
0.5 #_fracfemale 
0   #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
    #_no additional input for selected M option; read 1P per morph
1   # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=not implemented; 4=not implemented
2.5 #_Growth_Age_for_L1
25  #_Growth_Age_for_L2 (999 to use as Linf)
0   #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
1   #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1   #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=read fec and wt from wtatage.ss
#_placeholder for empirical age-maturity by growth pattern
1   #_First_Mature_Age
1   #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0   #_hermaphroditism option:  0=none; 1=age-specific fxn
3   #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
2   #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE	env-var	use_dev	dv_mnyr	dev_mxyr dev_SD	Block	Block_Fxn		
0.05	0.15	0.01	0.1	-1	0.8	-3	0	0	0	0	0	0	0	#	NatM_p_1_Fem_GP_1
-10	45	30	36	0	10	-2	0	0	0	0	0	0	0	#	L_at_Amin_Fem_GP_1
40	90	80	70	0	10	-4	0	0	0	0	0	0	0	#	L_at_Amax_Fem_GP_1
0.05	0.25	0.07	0.15	0	0.8	-4	0	0	0	0	0	0	0	#	VonBert_K_Fem_GP_1
0.05	0.25	0.1	0.1	-1	0.8	-3	0	0	0	0	0	0	0	#	CV_young_Fem_GP_1
0.05	0.25	0.2	0.1	-1	0.8	-3	0	0	0	0	0	0	0	#	CV_old_Fem_GP_1
0.05	0.15	0.1	0.1	-1	0.8	-3	0	0	0	0	0	0	0	#	NatM_p_1_Mal_GP_1
-5	5	-0.2	0       -1	10	-3	0	0	0	0	0	0	0	#	L_at_Amin_Mal_GP_1
-5	5	-0.4	0       0	10	-4	0	0	0	0	0	0	0	#	L_at_Amax_Mal_GP_1
-5	5	-0.05	0   	0	0.8	-4	0	0	0	0	0	0	0	#	VonBert_K_Mal_GP_1
-5	5	0	0   	-1	0.8	-3	0	0	0	0	0	0	0	#	CV_young_Mal_GP_1
-5	5	0	0   	-1	0.8	-3	0	0	0	0	0	0	0	#	CV_old_Mal_GP_1
-3	3	2.44E-6	2.44E-6	-1	0.8	-3	0	0	0	0	0	0	0	#	Wtlen_1_Fem
-3	4	3.34694	3.34694	-1	0.8	-3	0	0	0	0	0	0	0	#	Wtlen_2_Fem
50	60	55	55	-1	0.8	-3	0	0	0	0	0	0	0	#	Mat50%_Fem
-3	3	-0.25	-0.25	-1	0.8	-3	0	0	0	0	0	0	0	#	Mat_slope_Fem
-3	3	1	1	-1	0.8	-3	0	0	0	0	0	0	0	#	Eggs/kg_inter_Fem
-3	3	0	0	-1	0.8	-3	0	0	0	0	0	0	0	#	Eggs/kg_slope_wt_Fem
-3	3	2.44E-6	2.44E-6	-1	0.8	-3	0	0	0	0	0	0	0	#	Wtlen_1_Mal
-3	4	3.34694	3.34694	-1	0.8	-3	0	0	0	0	0	0	0	#	Wtlen_2_Mal
0	0	0	0	-1	0	-4	0	0	0	0	0	0	0	#	RecrDist_GP_1
0	0	0	0	-1	0	-4	0	0	0	0	0	0	0	#	RecrDist_Area_1
0	0	0	0	-1	0	-4	0	0	0	0	0	0	0	#	RecrDist_Seas_1
0	0	0	0	-1	0	-4	0	0	0	0	0	0	0	#	CohortGrowDev
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE
3	31	9.0	10.3	-1	99	-1	# SR_LN(R0)
0.2	1	0.6	0.6	-1	99	-4	# SR_BH_steep
0	2	0.6	0.6	-1	99	-4	# SR_sigmaR
-5	5	0.1	0	-1	1	-3	# SR_envlink
-5	5	0	0	-1	1	-4	# SR_R1_offset
0	0	0	0	-1	0	-99	# SR_autocorr
0 #_SR_env_link
0 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness
0 #do_recdev:  0=none; 1=devvector; 2=simple deviations
0 #recdev_start
0  #recdev_end
-5 #recdev_PH
0 #recdev_adv
#
#Fishing Mortality info 
0.3   # F ballpark for tuning early phases
-2001 # F ballpark year (neg value to disable)
3     # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
2.9   # max F or harvest rate, depends on F_Method
4     # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE
0	1	0	0.01	0	99	-1	# InitF_1FISHERY1
#
#_Q_setup
 # Q_type options:  <0=mirror, 0=median_float, 1=mean_float, 2=parameter, 3=parm_w_random_dev, 4=parm_w_randwalk, 5=mean_unbiased_float_assign_to_parm
 #_Den-dep  env-var  extra_se  Q_type
 0          0        0         0 # 1 FISHERY1
#
#_size_selex_types
#_Pattern Discard Male Special
 1        0       0    0 # 1 FISHERY1
#
#_age_selex_types
#_Pattern ___ Male Special
 11       0   0    0 # 1 FISHERY1
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE	env-var	use_dev	dv_mnyr	dev_mxyr dev_SD	Block	Block_Fxn		
19	80	50	50	1	0.01	-2	0	0	0	0	0	0	0	# SizeSel_1P_1_FISHERY1
0.01	60	15	15	1	0.01	-3	0	0	0	0	0	0	0	# SizeSel_1P_2_FISHERY1
0	40	0	5	-1	99	-1	0	0	0	0	0	0	0	# AgeSel_1P_1_FISHERY1
0	40	40	6	-1	99	-1	0	0	0	0	0	0	0	# AgeSel_1P_2_FISHERY1
0  # TG_custom:  0=no read; 1=read if tags exist
0 #_Variance_adjustments_to_input_values
4 #_maxlambdaphase
1 #_sd_offset
0 #N lambda changes 
#
0 # (0/1) read specs for more stddev reporting 
999

