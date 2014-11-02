# CAPAM Growth Workshop (Nov 3-7, 2014) - SWFSC
# Small pelagic species stock assessment - Example
# Stock Synthesis 3 (v. 3.24s)
# Model A1a: number of fisheries = 1 / surveys = 2 / time-step = ANNUAL / biological distributions = age, length, and mean weight-at-age / selectivity = age-based
# A1a: Actual sample sizes for comps
# 
# STARTER FILE
#
A1a.dat # Data file
A1a.ctl # Control file
0 # Read initial values from 'par' file: 0 = no, 1 = yes
1 # DOS display detail: 0, 1, 2
2 # Report file detail: 0, 1, 2
1 # Detailed checkup.sso file: 0 = no, 1 = yes 
3 # Write parm values to ParmTrace.sso: 0=no, 1=good,active; 2=good,all; 3=every_iteration,all_parms; 4=every,active
2 # Write cumulative report: 0 = skip, 1 = short, 2 = full
0 # Include prior likelihood for non-estimated parameters 
1 # Use soft boundaries to aid convergence: 0 = no, 1 = yes (recommended)
1 # Number of datafiles to produce: 1st is input, 2nd is estimates, 3rd and higher are bootstrap
10 # Last phase for estimation
10 # MCMC burn-in interval
2 # MCMC thinning interval
0 # Jitter initial parameter values by this fraction
-1 # Minimum year for SSB sd_report: (-1 = styr-2, i.e., virgin population)
-2 # Maximum year for SSB sd_report: (-1 = endyr, -2 = endyr+N_forecastyrs)
0 # N individual SD years 
# Vector of year values 
0.0001 # Final convergence criteria (e.g., 1.0e-04) 
0 # Retrospective year relative to end year (e.g., -4)
1 # Minimum age for 'summary' biomass
1 # Depletion basis (denominator is: 0 = skip, 1 = relative X*B0, 2 = relative X*Bmsy, 3 = relative X*B_styr
0.6 # Fraction for depletion denominator (e.g., 0.4)
4 # (1-SPR)_report basis: 0 = skip, 1 = (1-SPR)/(1-SPR_tgt), 2 = (1-SPR)/(1-SPR_MSY), 3 = (1-SPR)/(1-SPR_Btarget), 4 = raw_SPR
1 # F_std report: 0=skip, 1=exploitation(Bio), 2=exploitation(Num), 3=sum(frates), 4=true F for range of ages
2 # F report basis: 0 = raw, 1 = F/Fspr, 2 = F/Fmsy, 3 = F/Fbtgt
999 # End of file
