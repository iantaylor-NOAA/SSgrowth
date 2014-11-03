#V3.24S
#C rockfish_simulation_control.ss
#C example model for simulating a variety of composition data
#C Parameters are fixed for simulation.
#C 
#_data_and_control_files: rockfish_simulation_dataB.ss // control_modified.ss
#_SS-V3.24S-safe-win64;_07/24/2013;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.1
1  #_N_Growth_Patterns
1 #_N_Morphs_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
#_Cond 0  #  N recruitment designs goes here if N_GP*nseas*area>1
#_Cond 0  #  placeholder for recruitment interaction request
#_Cond 1 1 1  # example recruitment design element for GP=1, seas=1, area=1
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
0 #_Nblock_Patterns
#_Cond 0 #_blocks_per_pattern 
# begin and end years of blocks
#
0.5 #_fracfemale 
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
2 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_speciific_K; 4=not implemented
1 #_Growth_Age_for_L1
70 #_Growth_Age_for_L2 (999 to use as Linf)
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity by GP; 4=read age-fecundity by GP; 5=read fec and wt from wtatage.ss; 6=read length-maturity by GP
#_placeholder for empirical age- or length- maturity by growth pattern (female only)
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=age-specific fxn
3 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)
#
#_growth_parms
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
 0.01 0.15 0.05 0.05 0 0.1 -6 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
 10 35 18 30 -1 99 -2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 40 120 62 66 -1 99 -2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.2 0.047 0.05 -1 99 -2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 20 3 1 -1 99 -2 0 0 0 0 0 0 0 # Richards_Fem_GP_1
 0.05 0.2 0.13 0.19 -1 99 -3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 -2 2 -0.6 0.1 -1 99 -3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
 -3 3 0 0 -1 0.8 -3 0 0 0 0 0 0 0 # NatM_p_1_Mal_GP_1
 -3 3 0 0 -1 0.8 -3 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -3 3 0 0 -1 0.8 -2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0 0 -1 0.8 -3 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 0.01 20 1 1 -1 99 -2 0 0 0 0 0 0 0 # Richards_Mal_GP_1
 -3 3 0 0 -1 0.8 -3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -2 2 -0.6 0.1 -1 99 -3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
 -3 3 9.77e-006 2.09e-005 -1 99 -50 0 0 0 0 0 0 0 # Wtlen_1_Fem
 -3 4 3.17125 2.96956 -1 99 -50 0 0 0 0 0 0 0 # Wtlen_2_Fem
 38 39 38.78 40 -1 99 -50 0 0 0 0 0 0 0 # Mat50%_Fem
 -3 3 -0.437 -0.4 -1 99 -50 0 0 0 0 0 0 0 # Mat_slope_Fem
 -3 300000 137900 137900 -1 1 -6 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem
 -3 39000 36500 36500 -1 1 -6 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem
 -3 3 9.77e-006 2.09e-005 -1 99 -50 0 0 0 0 0 0 0 # Wtlen_1_Mal
 -3 4 3.17125 2.96956 -1 99 -50 0 0 0 0 0 0 0 # Wtlen_2_Mal
 0 2 1 1 -1 99 -50 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 2 1 1 -1 99 -50 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 2 1 1 -1 99 -50 0 0 0 0 0 0 0 # RecrDist_Seas_1
 0 2 1 1 -1 99 -50 0 0 0 0 0 0 0 # CohortGrowDev
#
#_Cond 0  #custom_MG-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-environ parameters
#
#_Cond 0  #custom_MG-block_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-block parameters
#_Cond No MG parm trends 
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Cond -4 #_MGparm_Dev_Phase
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm
#_LO HI INIT PRIOR PR_type SD PHASE
 3 15 5.6 5 -1 99 -1 # SR_LN(R0)
 0.2 1 0.44 0.6 1 0.07 -7 # SR_BH_steep
 0 5 0.5 1 -1 99 -50 # SR_sigmaR
 -5 5 0 0 -1 99 -50 # SR_envlink
 -5 5 0 0 -1 99 -50 # SR_R1_offset
 -1 2 0 1 -1 99 -50 # SR_autocorr
0 #_SR_env_link
0 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1921 # first year of main recr_devs; early devs can preceed this era
2010 # last year of main recr_devs; forecast devs start in following year
-2 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1800 #_last_early_yr_nobias_adj_in_MPD
 1801 #_first_yr_fullbias_adj_in_MPD
 2100 #_last_yr_fullbias_adj_in_MPD
 2101 #_first_recent_yr_nobias_adj_in_MPD
 1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 90 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# Specified recr devs to read
#_Yr Input_value # Final_value
 1921 -0.329323 # -0.329323
 1922 0.260231 # 0.260231
 1923 -0.233245 # -0.233245
 1924 0.230897 # 0.230897
 1925 0.285607 # 0.285607
 1926 0.646348 # 0.646348
 1927 -0.946784 # -0.946784
 1928 -0.439115 # -0.439115
 1929 0.162925 # 0.162925
 1930 -0.739697 # -0.739697
 1931 -0.430808 # -0.430808
 1932 0.598381 # 0.598381
 1933 -0.308496 # -0.308496
 1934 0.267881 # 0.267881
 1935 0.103553 # 0.103553
 1936 -0.710851 # -0.710851
 1937 -0.462526 # -0.462526
 1938 -0.591986 # -0.591986
 1939 0.530575 # 0.530575
 1940 -0.521133 # -0.521133
 1941 0.0684832 # 0.0684832
 1942 0.67277 # 0.67277
 1943 -0.165651 # -0.165651
 1944 0.699937 # 0.699937
 1945 -0.0373093 # -0.0373093
 1946 -0.261568 # -0.261568
 1947 -0.0771608 # -0.0771608
 1948 0.572316 # 0.572316
 1949 0.530621 # 0.530621
 1950 0.520755 # 0.520755
 1951 0.159143 # 0.159143
 1952 -0.00975594 # -0.00975594
 1953 0.00517941 # 0.00517941
 1954 -0.753898 # -0.753898
 1955 0.415998 # 0.415998
 1956 -0.641045 # -0.641045
 1957 0.197021 # 0.197021
 1958 -0.227771 # -0.227771
 1959 -0.589975 # -0.589975
 1960 0.0841504 # 0.0841504
 1961 0.846941 # 0.846941
 1962 0.6324 # 0.6324
 1963 0.287501 # 0.287501
 1964 0.0690218 # 0.0690218
 1965 0.671978 # 0.671978
 1966 0.178541 # 0.178541
 1967 0.0659014 # 0.0659014
 1968 -0.962095 # -0.962095
 1969 -0.253271 # -0.253271
 1970 0.315514 # 0.315514
 1971 0.038549 # 0.038549
 1972 -0.217065 # -0.217065
 1973 0.0939265 # 0.0939265
 1974 -1.89713 # -1.89713
 1975 -0.739887 # -0.739887
 1976 0.170105 # 0.170105
 1977 0.245027 # 0.245027
 1978 -1.2858 # -1.2858
 1979 -0.684265 # -0.684265
 1980 -0.522124 # -0.522124
 1981 0.3795 # 0.3795
 1982 -0.325447 # -0.325447
 1983 0.401004 # 0.401004
 1984 -0.240088 # -0.240088
 1985 1.03667 # 1.03667
 1986 0.460545 # 0.460545
 1987 0.0651001 # 0.0651001
 1988 0.091014 # 0.091014
 1989 0.58676 # 0.58676
 1990 -0.165366 # -0.165366
 1991 0.276186 # 0.276186
 1992 0.000320276 # 0.000320276
 1993 -0.145301 # -0.145301
 1994 -0.19778 # -0.19778
 1995 -0.296339 # -0.296339
 1996 0.122622 # 0.122622
 1997 0.740115 # 0.740115
 1998 0.194478 # 0.194478
 1999 0.142028 # 0.142028
 2000 -0.144417 # -0.144417
 2001 0.576599 # 0.576599
 2002 0.0682481 # 0.0682481
 2003 0.335319 # 0.335319
 2004 0.270508 # 0.270508
 2005 0.0189229 # 0.0189229
 2006 0.080788 # 0.080788
 2007 -0.598553 # -0.598553
 2008 -0.273703 # -0.273703
 2009 0.387909 # 0.387909
 2010 0.563911 # 0.563911
#
# all recruitment deviations
#DisplayOnly -0.329323 # Main_InitAge_30
#DisplayOnly 0.260231 # Main_InitAge_29
#DisplayOnly -0.233245 # Main_InitAge_28
#DisplayOnly 0.230897 # Main_InitAge_27
#DisplayOnly 0.285607 # Main_InitAge_26
#DisplayOnly 0.646348 # Main_InitAge_25
#DisplayOnly -0.946784 # Main_InitAge_24
#DisplayOnly -0.439115 # Main_InitAge_23
#DisplayOnly 0.162925 # Main_InitAge_22
#DisplayOnly -0.739697 # Main_InitAge_21
#DisplayOnly -0.430808 # Main_InitAge_20
#DisplayOnly 0.598381 # Main_InitAge_19
#DisplayOnly -0.308496 # Main_InitAge_18
#DisplayOnly 0.267881 # Main_InitAge_17
#DisplayOnly 0.103553 # Main_InitAge_16
#DisplayOnly -0.710851 # Main_InitAge_15
#DisplayOnly -0.462526 # Main_InitAge_14
#DisplayOnly -0.591986 # Main_InitAge_13
#DisplayOnly 0.530575 # Main_InitAge_12
#DisplayOnly -0.521133 # Main_InitAge_11
#DisplayOnly 0.0684832 # Main_InitAge_10
#DisplayOnly 0.67277 # Main_InitAge_9
#DisplayOnly -0.165651 # Main_InitAge_8
#DisplayOnly 0.699937 # Main_InitAge_7
#DisplayOnly -0.0373093 # Main_InitAge_6
#DisplayOnly -0.261568 # Main_InitAge_5
#DisplayOnly -0.0771608 # Main_InitAge_4
#DisplayOnly 0.572316 # Main_InitAge_3
#DisplayOnly 0.530621 # Main_InitAge_2
#DisplayOnly 0.520755 # Main_InitAge_1
#DisplayOnly 0.159143 # Main_RecrDev_1951
#DisplayOnly -0.00975594 # Main_RecrDev_1952
#DisplayOnly 0.00517941 # Main_RecrDev_1953
#DisplayOnly -0.753898 # Main_RecrDev_1954
#DisplayOnly 0.415998 # Main_RecrDev_1955
#DisplayOnly -0.641045 # Main_RecrDev_1956
#DisplayOnly 0.197021 # Main_RecrDev_1957
#DisplayOnly -0.227771 # Main_RecrDev_1958
#DisplayOnly -0.589975 # Main_RecrDev_1959
#DisplayOnly 0.0841504 # Main_RecrDev_1960
#DisplayOnly 0.846941 # Main_RecrDev_1961
#DisplayOnly 0.6324 # Main_RecrDev_1962
#DisplayOnly 0.287501 # Main_RecrDev_1963
#DisplayOnly 0.0690218 # Main_RecrDev_1964
#DisplayOnly 0.671978 # Main_RecrDev_1965
#DisplayOnly 0.178541 # Main_RecrDev_1966
#DisplayOnly 0.0659014 # Main_RecrDev_1967
#DisplayOnly -0.962095 # Main_RecrDev_1968
#DisplayOnly -0.253271 # Main_RecrDev_1969
#DisplayOnly 0.315514 # Main_RecrDev_1970
#DisplayOnly 0.038549 # Main_RecrDev_1971
#DisplayOnly -0.217065 # Main_RecrDev_1972
#DisplayOnly 0.0939265 # Main_RecrDev_1973
#DisplayOnly -1.89713 # Main_RecrDev_1974
#DisplayOnly -0.739887 # Main_RecrDev_1975
#DisplayOnly 0.170105 # Main_RecrDev_1976
#DisplayOnly 0.245027 # Main_RecrDev_1977
#DisplayOnly -1.2858 # Main_RecrDev_1978
#DisplayOnly -0.684265 # Main_RecrDev_1979
#DisplayOnly -0.522124 # Main_RecrDev_1980
#DisplayOnly 0.3795 # Main_RecrDev_1981
#DisplayOnly -0.325447 # Main_RecrDev_1982
#DisplayOnly 0.401004 # Main_RecrDev_1983
#DisplayOnly -0.240088 # Main_RecrDev_1984
#DisplayOnly 1.03667 # Main_RecrDev_1985
#DisplayOnly 0.460545 # Main_RecrDev_1986
#DisplayOnly 0.0651001 # Main_RecrDev_1987
#DisplayOnly 0.091014 # Main_RecrDev_1988
#DisplayOnly 0.58676 # Main_RecrDev_1989
#DisplayOnly -0.165366 # Main_RecrDev_1990
#DisplayOnly 0.276186 # Main_RecrDev_1991
#DisplayOnly 0.000320276 # Main_RecrDev_1992
#DisplayOnly -0.145301 # Main_RecrDev_1993
#DisplayOnly -0.19778 # Main_RecrDev_1994
#DisplayOnly -0.296339 # Main_RecrDev_1995
#DisplayOnly 0.122622 # Main_RecrDev_1996
#DisplayOnly 0.740115 # Main_RecrDev_1997
#DisplayOnly 0.194478 # Main_RecrDev_1998
#DisplayOnly 0.142028 # Main_RecrDev_1999
#DisplayOnly -0.144417 # Main_RecrDev_2000
#DisplayOnly 0.576599 # Main_RecrDev_2001
#DisplayOnly 0.0682481 # Main_RecrDev_2002
#DisplayOnly 0.335319 # Main_RecrDev_2003
#DisplayOnly 0.270508 # Main_RecrDev_2004
#DisplayOnly 0.0189229 # Main_RecrDev_2005
#DisplayOnly 0.080788 # Main_RecrDev_2006
#DisplayOnly -0.598553 # Main_RecrDev_2007
#DisplayOnly -0.273703 # Main_RecrDev_2008
#DisplayOnly 0.387909 # Main_RecrDev_2009
#DisplayOnly 0.563911 # Main_RecrDev_2010
#
#Fishing Mortality info 
0.1 # F ballpark for annual F (=Z-M) for specified year
2005 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
1.5 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms
#_LO HI INIT PRIOR PR_type SD PHASE
 0 1 0 0.01 0 99 -1 # InitF_1fishery1
#
#_Q_setup
 # Q_type options:  <0=mirror, 0=float_nobiasadj, 1=float_biasadj, 2=parm_nobiasadj, 3=parm_w_random_dev, 4=parm_w_randwalk, 5=mean_unbiased_float_assign_to_parm
#_for_env-var:_enter_index_of_the_env-var_to_be_linked
#_Den-dep  env-var  extra_se  Q_type
 0 0 0 0 # 1 fishery1
 0 0 0 0 # 2 survey1
#
#_Cond 0 #_If q has random component, then 0=read one parm for each fleet with random q; 1=read a parm for each year of index
#_Q_parms(if_any);Qunits_are_ln(q)
#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern Discard Male Special
 24 0 0 0 # 1 fishery1
 24 0 0 0 # 2 survey1
#
#_age_selex_types
#_Pattern ___ Male Special
 10 0 0 0 # 1 fishery1
 10 0 0 0 # 2 survey1
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
 40 89 55 55 0 99 -3 0 0 0 0 0.5 0 0 # SizeSel_1P_1_fishery1
 -5 5 -2 -2 0 99 -3 0 0 0 0 0.5 0 0 # SizeSel_1P_2_fishery1
 0 10 5 5 0 99 -3 0 0 0 0 0.5 0 0 # SizeSel_1P_3_fishery1
 0 15 15 15 0 99 -3 0 0 0 0 0.5 0 0 # SizeSel_1P_4_fishery1
 -15 0 -15 -15 0 99 -3 0 0 0 0 0.5 0 0 # SizeSel_1P_5_fishery1
 -999 5 -999 0 0 99 -3 0 0 0 0 0.5 0 0 # SizeSel_1P_6_fishery1
 40 89 55 55 0 99 -3 0 0 0 0 0.5 0 0 # SizeSel_2P_1_survey1
 -5 5 -2 -2 0 99 -3 0 0 0 0 0.5 0 0 # SizeSel_2P_2_survey1
 0 10 5 5 0 99 -3 0 0 0 0 0.5 0 0 # SizeSel_2P_3_survey1
 0 15 15 15 0 99 -3 0 0 0 0 0.5 0 0 # SizeSel_2P_4_survey1
 -15 0 -15 -15 0 99 -3 0 0 0 0 0.5 0 0 # SizeSel_2P_5_survey1
 -999 5 -999 0 0 99 -3 0 0 0 0 0.5 0 0 # SizeSel_2P_6_survey1
#_Cond 0 #_custom_sel-env_setup (0/1) 
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns
#_Cond 0 #_custom_sel-blk_setup (0/1) 
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no block usage
#_Cond No selex parm trends 
#_Cond -4 # placeholder for selparm_Dev_Phase
#_Cond 0 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
1 #_Variance_adjustments_to_input_values
#_fleet: 1 2 
  0 0 #_add_to_survey_CV
  0 0 #_add_to_discard_stddev
  0 0 #_add_to_bodywt_CV
  1 1 #_mult_by_lencomp_N
  1 1 #_mult_by_agecomp_N
  1 1 #_mult_by_size-at-age_N
#
1 #_maxlambdaphase
1 #_sd_offset
#
0 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet/survey  phase  value  sizefreq_method
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  1 #_CPUE/survey:_2
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  0 #_agecomp:_1
#  1 #_agecomp:_2
#  0 #_size-age:_1
#  1 #_size-age:_2
#  1 #_init_equ_catch
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  1 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

