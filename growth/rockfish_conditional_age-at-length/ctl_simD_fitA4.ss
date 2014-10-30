#C This control file created in R by modifying c:/SS/morphs/trial76/ctl_master.ss
#C to have 5 morphs and dome-shaped selectivity
#C Parameters are estimated
#C File creation date: 2012-08-03 17:13:12
#C estimation model CaseA
#C 
1  #_N_Growth_Patterns
5 #_N_Morphs
0.5 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
-1 -1 -1 -1 -1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
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
# 1 #_blocks_per_pattern
# begin and end years of blocks
#
0.5 #_fracfemale
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=not implemented; 4=not implemented
1 #_Growth_Age_for_L1
70 #_Growth_Age_for_L2 (999 to use as Linf)
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=read fec and wt from wtatage.ss
#_placeholder for empirical age-maturity by growth pattern
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=age-specific fxn
3 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)
#
#_growth_parms
 #_LO     HI     INIT    PRIOR PR_type  SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn # Label                     
 0.01   0.15     0.05     0.05       0 0.1     6       0       0         0         0          0     0         0 #       NatM_p_1_Fem_GP_1   
   10     35       18       30      -1  99     2       0       0         0         0          0     0         0 #       L_at_Amin_Fem_GP_1  
   40    120       62       66      -1  99     2       0       0         0         0          0     0         0 #       L_at_Amax_Fem_GP_1  
 0.01    0.2    0.047     0.05      -1  99     2       0       0         0         0          0     0         0 #       VonBert_K_Fem_GP_1  
 0.05    0.2     0.13     0.19      -1  99     3       0       0         0         0          0     0         0 #       CV_young_Fem_GP_1   
   -2      2     -0.6      0.1      -1  99     3       0       0         0         0          0     0         0 #       CV_old_Fem_GP_1     
   -3      3        0        0      -1 0.8    -3       0       0         0         0          0     0         0 #       NatM_p_1_Mal_GP_1   
   -3      3        0        0      -1 0.8    -3       0       0         0         0          0     0         0 #       L_at_Amin_Mal_GP_1  
   -3      3        0        0      -1 0.8    -2       0       0         0         0          0     0         0 #       L_at_Amax_Mal_GP_1  
   -3      3        0        0      -1 0.8    -3       0       0         0         0          0     0         0 #       VonBert_K_Mal_GP_1  
   -3      3        0        0      -1 0.8    -3       0       0         0         0          0     0         0 #       CV_young_Mal_GP_1   
   -2      2     -0.6      0.1      -1  99    -3       0       0         0         0          0     0         0 #       CV_old_Mal_GP_1     
   -3      3 9.77E-06 2.09E-05      -1  99   -50       0       0         0         0          0     0         0 #       Wtlen_1_Fem         
   -3      4  3.17125  2.96956      -1  99   -50       0       0         0         0          0     0         0 #       Wtlen_2_Fem         
   38     39    38.78       40      -1  99   -50       0       0         0         0          0     0         0 #       Mat50%_Fem          
   -3      3   -0.437     -0.4      -1  99   -50       0       0         0         0          0     0         0 #       Mat_slope_Fem       
   -3 300000   137900   137900      -1   1    -6       0       0         0         0          0     0         0 #       Eggs/kg_inter_Fem   
   -3  39000    36500    36500      -1   1    -6       0       0         0         0          0     0         0 #       Eggs/kg_slope_wt_Fem
   -3      3 9.77E-06 2.09E-05      -1  99   -50       0       0         0         0          0     0         0 #       Wtlen_1_Mal         
   -3      4  3.17125  2.96956      -1  99   -50       0       0         0         0          0     0         0 #       Wtlen_2_Mal         
    0      2        1        1      -1  99   -50       0       0         0         0          0     0         0 #       RecrDist_GP_1       
    0      2        1        1      -1  99   -50       0       0         0         0          0     0         0 #       RecrDist_Area_1     
    0      2        1        1      -1  99   -50       0       0         0         0          0     0         0 #       RecrDist_Seas_1     
    0      2        1        1      -1  99   -50       0       0         0         0          0     0         0 #       CohortGrowDev       
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
 #_LO HI INIT PRIOR PR_type   SD PHASE # Label       
    3 15  5.6     5      -1   99     1 # SR_LN(R0)   
  0.2  1 0.44   0.6       1 0.07     7 # SR_BH_steep 
    0  5  0.5     1      -1   99   -50 # SR_sigmaR   
   -5  5    0     0      -1   99   -50 # SR_envlink  
   -5  5    0     0      -1   99   -50 # SR_R1_offset
   -1  2    0     1      -1   99   -50 # SR_autocorr 
0 #_SR_env_link
0 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1921 # first year of main recr_devs; early devs can preceed this era
2010 # last year of main recr_devs; forecast devs start in following year
2 #_recdev phase
1 # (0/1) to read 11 advanced options
0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
-4 #_recdev_early_phase
0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for prior_fore_recr occurring before endyr+1
1944
1983.3984
2006.7837
2011.9039
0.5884
0.0 #_placeholder
-5 #min rec_dev
5 #max rec_dev
0 #_read_recdevs
#_end of advanced SR options
#
# read specified recr devs
#_Yr Input_value
#
#
#Fishing Mortality info
0.1 # F ballpark for tuning early phases
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
 # A=do power, B=env-var, C=extra SD, D=devtype(<0=mirror, 0/1=none, 2=cons, 3=rand, 4=randwalk); E:0=num/1=bio/2=F, F:-1=norm/0=lognorm/>0=T
 #_A  B  C  D  
   0  0  0  0  # 1 fishery1
   0  0  0  0  # 2 survey1
   0  0  0  0  # 2 survey1
#
#_Cond 0 #_If q has random component, then 0=read one parm for each fleet with random q; 1=read a parm for each year of index
#_Q_parms(if_any)
#
#_size_selex_types
#_Pattern Discard Male Special
 24 0 0 0 # 1 fishery1
  0 0 0 0 # 2 survey1
  0 0 0 0 # 3 survey2
#
#_age_selex_types
#_Pattern ___ Male Special
 10 0 0 0 # 1 fishery1
 10 0 0 0 # 2 survey1
 10 0 0 0 # 3 survey2
 #_LO HI INIT PRIOR PR_type SD PHASE env.var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn # Label                 
   40 89   55    55       0 99     3       0       0         0         0        0.5     0         0  # SizeSel_1P_1_fishery1
   -5  5   -2    -2       0 99     3       0       0         0         0        0.5     0         0  # SizeSel_1P_2_fishery1
    0 10    5     5       0 99     3       0       0         0         0        0.5     0         0  # SizeSel_1P_3_fishery1
    0 15    7     7       0 99     3       0       0         0         0        0.5     0         0  # SizeSel_1P_4_fishery1
  -15  0  -15   -15       0 99     3       0       0         0         0        0.5     0         0  # SizeSel_1P_5_fishery1
 -999  5 -999     0       0 99    -3       0       0         0         0        0.5     0         0  # SizeSel_1P_6_fishery1
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#
1 #_Variance_adjustments_to_input_values
#_1 2 3
  0 0 0 #_add_to_survey_CV
  0 0 0 #_add_to_discard_stddev
  0 0 0 #_add_to_bodywt_CV
  1 1 1 #_mult_by_lencomp_N
  1 1 1 #_mult_by_agecomp_N
  1 1 1 #_mult_by_size-at-age_N
#
1 #_maxlambdaphase
1 #_sd_offset
#
1 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 
# 9=init_equ_catch; 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin
#like_comp fleet/survey  phase  value  sizefreq_method
7 2 1 0 0
# lambdas (for info only; columns are phases)
#  1 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  1 #_lencomp:_1
#  0 #_lencomp:_2
#  1 #_agecomp:_1
#  0 #_agecomp:_2
#  0 #_size-age:_1
#  1 #_size-age:_2
#  1 #_init_equ_catch
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
0 # (0/1) read specs for more stddev reporting
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999
