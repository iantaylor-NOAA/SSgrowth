# CAPAM Growth Workshop (Nov 3-7, 2014) - SWFSC
# Small pelagic species stock assessment - Example
# Stock Synthesis 3 (v. 3.24s)
# Model A1a: number of fisheries = 1 / surveys = 2 / time-step = ANNUAL / biological distributions = age, length, and mean weight-at-age / selectivity = age-based
# A1a: Actual sample sizes for comps
#
# CONTROL FILE
#
# MODEL DIMENSION PARAMETERS =====================================================================================================================
#
# Morph parameterization
#
1 # Number of growth patterns (morphs)
1 # Number of sub-morhps within morphs
# Cond 1 # Morph between/within SD ratio (no read if N_morphs=1)
# Cond 1 # Vector Morphdist (-1 in first value gives normal approximation)
#
# Cond 1 # N_recruitment designs here if GP*season*area >1
# Cond 0 # Recruitment interaction requested
# Cond 1 2 1  # Example recruitment design for GP=1, season=2, area=1
#
# Cond 0 # N_movement_definitions here if N_areas >1
# Cond 1 # First age that moves (real age at begin of season, not integer), also conditioned on Do_migration >0
# Cond 1 1 1 2 4 10 # Example move definition for seas=1, morph=1, source=1, dest=2, age1=4, age2=10
#
# Time block parameterization (time-varying parameterization)
0 # Number of block designs: Selectivity/Catchability
# 1 # Conditional: No. blocks in design 1
# 1983 1989 1990 2013 # Conditional: Year blocks - design 1
#
# BIOLOGICAL PARAMETERS =============================================================================================
#
0.5 # Fraction = female (at birth)
# Natural mortality (M)
0 # Natural mortality type: 0 = 1 parameter, 1 = N_breakpoints, 2 = Lorenzen, 3 = age-specific, 4 = age-specific with season interpolation
# Placeholder for number of M breakpoints (if M type option >0)
# Placeholder for Age (real) at M breakpoints
# Growth
1 # Growth model: 1 = VB with L1 and L2, 2 = VB with A0 and Linf, 3 = Richards, 4 = readvector
0 # Growth_age at L1 (L_min): Age_min for growth
12 # Growth_age at L2 (L_max) - (to use L_inf = 999): Age_max for growth
0 # SD constant added to length-at-age (LAA)
0 # Variability of growth: 0 = CV_f(LAA), 1 = CV_f(A), 2 = SD_f(LAA), 3 = SD_f(A)
# Maturity
3 # Maturity option: 1 = logistic (length), 2 = logistic (age), 3 = fixed (vector of proportion-at-age), 4 = read age fecundity
# Maturity-at-age (if maturity option = 3)
0 0.07 0.25 0.47 0.73 1 1 1 1 1 1 1 1 # Maturity-at-age (proportion) for option = 3, i.e., 'Accumulator age' + 1;
1 # First mature age (no read if maturity option = 3)
1 # Fecundity option: 1 is eggs=Wt*(a+b*Wt), 2 is eggs=(a*L^b), 3 is eggs=(a*Wt^b)
0 # Hermaphroditism option: 0 = none, 1 = invoke female to male transition
1 # MG parameter offset option: 1 = none, 2 = M,G,CV_G as offset from GP1, 3 = like SS2
1 # MG parameter adjust method: 1 = do SS2 approach, 2 = use logistic transformation to keep between bounds of base parameter approach
#
# M, maturity, and growth parameterization
# Low High Initial Prior_mean Prior_type SD Phase Env_var Use_dev Dev_minyr Dev_maxyr Dev_stddev Block_def Block_type
# M parameterization
0.3 0.7 0.5 0 -1 0 -3 0 0 0 0 0 0 0 # M_p1 (M = 0.5, all ages)
# Growth parameterization
# Length-at-age
4 35 15 0 -1 0 3 0 0 0 0 0 0 0 # VB_L_Amin (length-at-age = 0)
30 70 45 0 -1 0 3 0 0 0 0 0 0 0 # VB_L_Amax  (length-at-age = 12)
0.1 0.7 0.35 0 -1 0 3 0 0 0 0 0 0 0 # VB_K
0.01 0.5 0.15 0 -1 0 -3 0 0 0 0 0 0 0 # CV_young
0.001 0.5 0.15 0 -1 0 -3 0 0 0 0 0 0 0 # CV_old
# Weight-length
-1 5 3.12e-006 0 -1 0 -3 0 0 0 0 0 0 0 # W-L_a
1 5 3.40352 0 -1 0 -3 0 0 0 0 0 0 0 # W-L_b
# Maturity parameterization ** fixed vector for maturity-at-age **
-3 3 3 0 -1 0 -3 0 0 0 0 0 0 0 # Maturity (inflection)
-3 3 3 0 -1 0 -3 0 0 0 0 0 0 0 # Maturity (slope)
-3 3 1 0 -1 0 -3 0 0 0 0 0 0 0 # Eggs/gm (intercept)
-3 3 0 0 -1 0 -3 0 0 0 0 0 0 0 # Eggs/gm (slope)
# Population recruitment apportionment (distribution) ** Placeholders **
-4 4 0 0 -1 0 -4 0 0 0 0 0 0 0 # Recruitment distribution (growth pattern)
-4 4 0 0 -1 0 -4 0 0 0 0 0 0 0 # Recruitment distribution (area)
-4 4 0 0 -1 0 -4 0 0 0 0 0 0 0 # Recruitment distribution (season)
# Cohort growth deviation
1 5 1 0 -1 0 -4 0 0 0 0 0 0 0 # Cohort growth deviation
#
# 1 # Custom environment (MG) parameterization
#
# 1 # Custom block (MG) parameterization ** No time block for growth parameterization **
# Low High Initial Prior_mean Prior_type SD Phase
# -5 5 0 0 -1 0 3 # VB_L_Amin: (1962-89)
# -5 5 0 0 -1 0 3 # VB_L_Amin: (1990-10)
# -5 5 0 0 -1 0 3 # VB_L_Amax: (1962-89)
# -5 5 0 0 -1 0 3 # VB_L_Amax: (1990-10)
# -5 5 0 0 -1 0 3 # VB_K: (1962-89)
# -5 5 0 0 -1 0 3 # VB_K: (1990-10)
#
# Seasonal effects on biology parameters
# Columns: femwtlt1, femwtlt2, mat1, mat2, fec1, fec2, malewtlt1, malewtlt2, L1, K
0 0 0 0 0 0 0 0 0 0
#
# Stock-recruit (S-R)
3 # S-R function: 1 = B-H w/flat top, 2 = Ricker, 3 = standard B-H, 4 = no steepness or bias adjustment
# Low High Initial Prior_mean Prior_type SD Phase
1 30 10 0 -1 0 1 # ln(R0)
0.1 1 0.9 0 1 0 5 # Steepness
0 2 0.75 0 -1 0 -3 # Sigma_R
-5 5 0 0 -1 0 -3 # Env link coefficient
-15 15 0 0 -1 0 1 # Initial eqilibrium recruitment offset
0 2 0 0 -1 0 -3 # Autocorrelation in recruitment devs
0 # SR_env link
0 # SR_env target: 0=none, 1=devs, 2=R0, 3=steepness
#
# Recruitment residual (recruitment devs) parameterization
1 # Recruitment dev type: 0 = none, 1 = dev_vector, 2 = simple
1983 # Start year for main recruitment devs ** Alternative: 1977 and turn off advanced options below **
2012 # Last year for main recruitment devs
2 # Phase for recruitment devs
#
1 # Read 13 advanced recruitment options: 0 = off, 1 = on
-6 # Start year for (early) recruitment devs (0 = none; negative value makes relative to start year above)
2 # Phase for (early) recruitment devs
0 # Phase for forecast recruitment devs: 0 = maxphase+1
1 # Lambda for forecast recruitment devs (before endyr+1)
1974 # Last_early_yr recruitment dev with no bias adjustment in MPD
1985 # First year full bias correction adjustment in MPD
2013 # Last year for full bias correction adjustment in MPD
2013 # First recent_year no bias adjustment in MPD
0.95 # Max bias adjustment in MPD (-1 to override ramp and set biasadj=1.0 for all estimated recruitment devs)
0 # Period of cycles in recruitment (N parms read below)
-5 # Min recruitment dev
5 # Max reccruitment dev
0 # Read recruitment devs
#
# FISHING MORTALITY PARAMETERS =============================================================================================
#
# Fishing mortality (F) parameterization
0.1 # F ballpark for tuning early phases
-2000 # F ballpark year (negative value = off)
3 # F method: 1 = Pope, 2 = instantaneous F, 3 = hybrid
4 # F or Harvest rate (depends on F method)
# No additional F input needed for F method = 1 - ** Placeholders **
# Read overall start F value, overall phase, N detailed inputs to read for F method = 2
10 # Read N iterations for tuning for F method = 3 (recommend 3 to 7)
#
# Initial F parameters ** non-equilibrium initial age distribution implemented **
# Low High Initial Prior_mean Prior_type SD Phase
0 3 0 0 -1 0 -1 # Initial F (F1)
#
# CATCHABILITY (q) PARAMETERS =============================================================================================
#
# Catchability (q) parameterization
# Columns: Do den_dep power: 0 = off and survey is proportional to abundance, 1 = add parameter for non-linearity
#          Do env_link: 0 = off, 1 = add parameter for env effect on q
#          Do extra SD: 0 = off, 1 = add parameter for additive constant to input SE in ln space
#          q_type: <0 = mirror other fishery/survey, 0 = no parameter q - median unbiased, 1 = no parameter q - mean unbiased, 2 = estimate parameter for ln(q),
#		           3 = ln(q)+set of devs about ln(q) for all years - parm_rand_dev, 4 = ln(q)+set of devs about q for index_yr-1 - parm_rand_walk
0 0 0 0 # F1 = FISHERY (USA commercial/recreational and Mexico commercial)
0 0 0 0 # S1 = CPFV
0 0 0 0 # S2 = AT
# q parameters (if any)
# Low High Initial Prior_mean Prior_type SD Phase
# -5 -5 0.75 0 -1 99 5 # q - S1
# -5 -5 0.75 0 -1 99 5 # q - S2
#
# SELECTIVITY (S) PARAMETERS =============================================================================================
#
# Selectivity/retention parameterization
# Size (length) parameterization
# A = selectivity option
# B = do retention: 0 = no, 1 = yes
# C = male offset to female: 0 = no, 1 = yes
# D = mirror selectivity (fishery/survey)
# A B C D
# Size selectivity (S) - ** No size-based S **
0 0 0 0 # F1
0 0 0 0 # S1
0 0 0 0 # S2
#
# Age selectivity (S) - ** Age-based S is implemented **
20 0 0 0 # F1 (double-normal dist., asymptotic curve)
15 0 0 1 # S1 (mirror F1)
15 0 0 1 # S2 (mirror F1)
#
# S (age) parameters
# Low High Initial Prior_mean Prior_type SD Phase Env_var Use_dev Dev_minyr Dev_maxyr Dev_stddev Block_def Block_type
# F1 (double-normal dist., asymptotic curve)
-20 15 1 0 -1 0 4 0 0 0 0 0 0 0 # P_1 (1983-13, peak size)
-20 15 -5 0 -1 0 -4 0 0 0 0 0 0 0 # P_2 (1983-13, top logistic)
-20 15 4 0 -1 0 4 0 0 0 0 0 0 0 # P_3 (1983-13, ascending limb width - exp)
-20 15 1.5 0 -1 0 -4 0 0 0 0 0 0 0 # P_4 (1983-13, descending limb width - exp)
-20 20 -1 0 -1 0 -4 0 0 0 0 0 0 0 # P_5 (1983-13, initial S - at first age bin)
-20 20 15 0 -1 0 -4 0 0 0 0 0 0 0 # P_6 (1983-13, final S - at last age bin)
#
# S1 (mirror F1) ** no additional parameter lines needed **
#
# S2 (mirror F1) ** no additional parameter lines needed **
#
# 1 # Conditional: custom Sel_env parameterization
# Low High Initial Prior_mean Prior_type SD Phase
#
# 1 # Conditional: custom Sel-block parameterization
# Low High Initial Prior_mean Prior_type SD Phase
#
# 1 # Conditional: selparm trends
# 1 # Conditional: selparm_dev phase
# 1 # Conditional: env/block/dev adjust method (1 = standard, 2 = logistic transition to keep in base parm bounds, 3 = standard with no bound check)
#
# Tag loss and reporting parameterization
0 # TG_custom: 0 = no read, 1 = read if tags exist
# Conditional if no tag parameters
# Low High Initial Prior_mean Prior_type SD Phase Env_var Use_dev Dev_minyr Dev_maxyr Dev_stddev Block_def Block_type
#
# LIKELIHOOD COMPONENT PARAMETERS =============================================================================================
#
1 # Variance and sample size/effective sample size adjustments (by fleet/survey): (0/1)
# F1 S1 S2
0 0 0 # constant (added) to survey CV
0 0 0 # constant (added) to discard CV
0 0 0 # constant (added) to body weight CV
1 1 1 # scalar (multiplied) to length distribution sample size (effective ss)
1 1 1 # scalar (multipled) to age distribution sample size (effective ss)
1 1 1 # scalar (multiplied) to size-at-age distribution sample size (effective ss)
#
1 # Maximum lambda phase: 1 = none
1 # SD offset: 1 = include
#
# Likelihood component (lambda) parameterization
# Likelihood component codes: 1 = survey, 2 = discard, 3 = mean body weight, 4 = length distribution, 5 = age distribution, 6 = weight distribution,
#                             7 = size-at-age distribution, 8 = catch, 9 = initial equilibrium catch, 10 = recruitment devs, 11 = parameter priors,
#                            12 = parameter devs, 13 = crash penalty, 14 = morph composition, 15 = tag composition, 16 = tag neg_bin
#
9 # Number of changes to likelihood components
# Columns: Likelihood_comp Fishery/Survey Phase Lambda_value Size_distribtuion_method
# Surveys
1 2 1 1 1 # Survey S1
1 3 1 1 1 # Survey S2
# Length distributions
4 1 1 0 1 # Length distribution F1 = off
# Age distributions
5 1 1 1 1 # Age distribution F1
# Mean size-at-age distributions
7 1 1 1 1 # Size-at-age distribution F1
# Equilibrium catch
9 1 1 0 1 # Equilibrium catch F1 = off
# Priors
11 1 1 0 1 # Priors F1 = off
11 2 1 0 1 # Priors S1 = off
11 3 1 0 1 # Priors S2 = off
#
0 # SD reporting option: (0/1)
999 # End of file
