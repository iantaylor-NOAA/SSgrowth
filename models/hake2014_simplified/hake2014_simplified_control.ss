#C 2014 Hake control file - simplified to use logistic selectivity
###################################################

1       # N growth patterns
1       # N sub morphs within patterns
0       # Number of block designs for time varying parameters

# Mortality and growth specifications
0.5     # Fraction female (birth)
0       #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
1       # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_speciific_K; 4=not implemented
1       #_Growth_Age_for_L1
20      #_Growth_Age_for_L2 (999 to use as Linf)
0       #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0       #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
# NOTE: option 5 below turns on wtatage.ss input file and ignore growth parameters
5       #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity by GP; 4=read age-fecundity by GP; 5=read fec and wt from wtatage.ss; 6=read length-maturity by GP
2       #_First_Mature_Age
1       #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0       #_hermaphroditism option:  0=none; 1=age-specific fxn
1       #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1       #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)

# Lo     Hi     Init    Prior   Prior   Prior   Param   Env     Use     Dev     Dev     Dev     Block   block
# bnd    bnd    value   mean    type    SD      phase   var     dev     minyr   maxyr   SD      design  switch
### Mortality
0.05     0.4    0.2     -1.609438 3     0.1     4       0       0       0       0       0       0       0       # M
### Growth parameters ignored in empirical input approach
2       15      5       32      -1      99      -5      0       0       0       0       0       0       0       # A0
45      60      53.2    50      -1      99      -3      0       0       0       0       0       0       0       # Linf
0.2     0.4     0.30    0.3     -1      99      -3      0       0       0       0       0       0       0       # VBK
0.03    0.16    0.066   0.1     -1      99      -5      0       0       0       0       0       0       0       # CV of len@age 0
0.03    0.16    0.062   0.1     -1      99      -5      0       0       0       0       0       0       0       # CV of len@age inf
# W-L, maturity and fecundity parameters
# Female placeholders (wtatage overrides these)
-3      3       7.0E-06 7.0E-06 -1      99      -50     0       0       0       0       0       0       0       # F W-L slope
-3      3       2.9624  2.9624  -1      99      -50     0       0       0       0       0       0       0       # F W-L exponent
# Maturity ok from 2010 assessment
-3      43      36.89   36.89   -1      99      -50     0       0       0       0       0       0       0       # L at 50% maturity
-3      3       -0.48   -0.48   -1      99      -50     0       0       0       0       0       0       0       # F Logistic maturity slope
# No fecundity relationship
-3      3       1.0     1.0     -1      99      -50     0       0       0       0       0       0       0       # F Eggs/gm intercept
-3      3       0.0     0.0     -1      99      -50     0       0       0       0       0       0       0       # F Eggs/gm slope
# Unused recruitment interactions
0       2       1       1       -1      99      -50     0       0       0       0       0       0       0       # placeholder only
0       2       1       1       -1      99      -50     0       0       0       0       0       0       0       # placeholder only
0       2       1       1       -1      99      -50     0       0       0       0       0       0       0       # placeholder only
0       2       1       1       -1      99      -50     0       0       0       0       0       0       0       # placeholder only
0 0 0 0 0 0 0 0 0 0 # Unused MGparm_seas_effects

# Spawner-recruit parameters
3 # S-R function: 1=B-H w/flat top, 2=Ricker, 3=standard B-H, 4=no steepness or bias adjustment
# Lo    Hi      Init    Prior   Prior   Prior   Param
# bnd   bnd     value   mean    type    SD      phase
13      17      15.9    15      -1      99      1       # Ln(R0)
0.2     1       0.88    0.777   2       0.113   4       # Steepness with Myers' prior
1.0     1.6     1.4     1.1     -1      99      -6      # Sigma-R
-5      5       0       0       -1      99      -50     # Env link coefficient
-5      5       0       0       -1      99      -50     # Initial equilibrium recruitment offset
 0      2       0       1       -1      99      -50     # Autocorrelation in rec devs
0 # index of environmental variable to be used
0 # SR environmental target: 0=none;1=devs;_2=R0;_3=steepness
1 # Recruitment deviation type: 0=none; 1=devvector; 2=simple deviations

# Recruitment deviations
1970    # Start year standard recruitment devs
2009    # End year standard recruitment devs
1       # Rec Dev phase

1 # Read 11 advanced recruitment options: 0=no, 1=yes
1946    # Start year for early rec devs
3       # Phase for early rec devs
5       # Phase for forecast recruit deviations
1       # Lambda for forecast recr devs before endyr+1
1965    # Last recruit dev with no bias_adjustment
1971    # First year of full bias correction (linear ramp from year above)
2010    # Last year for full bias correction in_MPD
2012    # First_recent_yr_nobias_adj_in_MPD
0.87    # Maximum bias adjustment in MPD
0       # Period of cycles in recruitment (N parms read below)
-6      # Lower bound rec devs
6       # Upper bound rec devs
0       # Read init values for rec devs

# Fishing mortality setup
0.1     # F ballpark for tuning early phases
-1999   # F ballpark year
1       # F method:  1=Pope's; 2=Instan. F; 3=Hybrid
0.95    # Max F or harvest rate (depends on F_Method)

# Init F parameters by fleet
#LO     HI      INIT    PRIOR   PR_type SD      PHASE
0       1       0.0     0.01    -1      99       -50

# Catchability setup
# A=do power: 0=skip, survey is prop. to abundance, 1= add par for non-linearity
# B=env. link: 0=skip, 1= add par for env. effect on Q
# C=extra SD: 0=skip, 1= add par. for additive constant to input SE (in ln space)
# D=type: <0=mirror lower abs(#) fleet, 0=no par Q is median unbiased, 1=no par Q is mean unbiased, 2=estimate par for ln(Q)
#          3=ln(Q) + set of devs about ln(Q) for all years. 4=ln(Q) + set of devs about Q for indexyr-1
#A      B       C       D
0       0       0       0        # Fishery
0       0       1       0        # Survey

#LO     HI      INIT    PRIOR   PR_type SD      PHASE
0.05    1.2     0.0755  0.0755  -1      0.1     4 # additive value for acoustic survey

#_SELEX_&_RETENTION_PARAMETERS
# Size-based setup
# A=Selex option: 1-24
# B=Do_retention: 0=no, 1=yes
# C=Male offset to female: 0=no, 1=yes
# D=Extra input (#)
# A B C D
# Size selectivity
0       0       0       0  # Fishery
0       0       0       0  # Acoustic_Survey
# Age selectivity
12      0       0       0  # Fishery
12      0       0       0  # Acoustic_Survey

# Selectivity parameters
# Lo    Hi      Init    Prior   Prior   Prior   Param   Env     Use     Dev     Dev     Dev     Block   block
# bnd   bnd     value   mean    type    SD      phase   var     dev     minyr   maxyr   SD      design  switch
# Fishery age-based
  1     10       5      5       -1      0.01    2       0       0       0       0       0       0       0 # age at 50% selectivity 
  0     5        2      2       -1      0.01    2       0       0       0       0       0       0       0 # difference in age from 50% to 95% selectivity 

# Acoustic survey - nonparametric age-based selectivity
  1     10       5      5       -1      0.01    2       0       0       0       0       0       0       0 # age at 50% selectivity 
  0     5        2      2       -1      0.01    2       0       0       0       0       0       0       0 # difference in age from 50% to 95% selectivity 

0 # Tagging flag: 0=no tagging parameters,1=read tagging parameters

### Likelihood related quantities ###
1 # Do variance/sample size adjustments by fleet (1)
# # Component
 0    0   # Constant added to index CV
 0    0   # Constant added to discard SD
 0    0   # Constant added to body weight SD
 1    1   # multiplicative scalar for length comps
 1    1   # multiplicative scalar for agecomps
 1    1   # multiplicative scalar for length at age obs

1  # Lambda phasing: 1=none, 2+=change beginning in phase 1
1  # Growth offset likelihood constant for Log(s): 1=include, 2=not
0 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet/survey  phase  value  sizefreq_method
0  # Extra SD reporting switch

999 # End control file

