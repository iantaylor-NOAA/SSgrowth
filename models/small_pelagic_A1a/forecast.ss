# CAPAM Growth Workshop (Nov 3-7, 2014) - SWFSC
# Small pelagic species stock assessment - Example
# Stock Synthesis 3 (v. 3.24s)
# Model A1a: number of fisheries = 1 / surveys = 2 / time-step = ANNUAL / biological distributions = age, length, and mean weight-at-age / selectivity = age-based
# A1a: Actual sample sizes for comps
#
# FORECAST FILE
# Note: for all year entries except rebuilder, enter either: actual year, -999 for styr, 0 for endyr, neg number for relative endyr
#
1 # Benchmarks: 0 = skip, 1 = calculate (F_SPR, F_btgt, F_MSY) ** Related to Benchmark relative_F basis, Forecast, and F and SPR report basis (in ctl file) options **
2 # MSY: 0 = none, 1 = set to F_SPR, 2 = calculate F_MSY, 3 = set to F_Btgt, 4 = set to F(endyr) 
0.5 # SPR target - relative to B0 (e.g., 0.3)
0.5 # Biomass target - relative to B0 (e.g., 0.5)
# Benchmark years: begin_bio, end_bio, begin_selex, end_selex, begin_relative F, end_relative F (enter actual year, -999 = start_yr, 0 = end_yr, <0 = relative end_yr)
0 0 0 0 0 0
1 # Benchmark relative_F basis: 1 = use year range, 2 = set relative_F same as Forecast below
#
1 # Forecast: 0 = none, 1 = F_SPR, 2 = F_MSY, 3 = F_Btgt, 4 = Avg_F (uses first-last relative_F years), 5 = input annual F scalar
1 # Number of forecast years 
0 # F scalar (only used for Forecast = 5)
# Forecast years: begin_selex, end_selex, begin_relative F, end_relative F (enter actual year, -999 = start_yr, 0 = end_yr, <0 = relative end_yr)
0 0 0 0
#
1 # Control rule method: 1 = catch = f(SSB) West Coast, 2 = F = f(SSB) 
0.5 # Control rule Biomass level (as fraction of B0, e.g. 0.40) above which F is constant
0.1 # Control rule Biomass level (as fraction of B0, e.g. 0.10) below which F is set to 0
0.75 # Control rule target as fraction of F_limit (e.g., 0.75) 
3 # Number of forecast loops (1-3: fixed at 3 for now)
3 # First forecast loop with stochastic recruitment
0 # Forecast loop control #3 (reserved for future bells&whistles)
0 # Forecast loop control #4 (reserved for future bells&whistles)
0 # Forecast loop control #5 (reserved for future bells&whistles)
2020 # First year for caps and allocations (should be after years with fixed inputs)
0 # SD of log(realized F/target F) in forecast (set value >0.0 to cause active implementation error)
0 # Do West Coast groundfish rebuilder output (0 = no, 1 = 0)
0 # Rebuilder: first year catch could have been set to zero (Ydecl)(-1 to set to 1999)
0 # Rebuilder: year for current age structure (Yinit) (-1 to set to endyear+1)
1 # Fleet relative F: 1 = use first-last allocation year, 2 = read season(row) x fleet(column) below
# Note: Fleet allocation is used directly as average F if Forecast = 4
2 # Basis for forecast catch tuning and for forecast catch caps and allocation: 2 = dead_bio, 3 = retain_bio, 5 = dead_num, 6 = retain_num
# Cond: if relative F = 2 (total of 4 lines)
# Cond: fishery relative F: rows = seasons and columns = Fishery
# Cond: fishery: F1
# Cond: 0.1
# Maximum total catch by fishery (-1 to have no max)
-1
# Maximum total catch by area (-1 to have no max)
-1
# Fleet assignment to allocation group (enter group ID# for each Fishery, 0 for not included in an allocation group)
0
# Conditional on >1 allocation groups (total of 3 lines) 
# Allocation fraction for each of: 0 allocation groups
# No allocation groups
1 # Number of forecast catch levels to input (otherwise calculate catch from forecast F)
3 # Basis for input forecast catch: 2 = dead catch, 3 = retained catch, 99 = input Hrate(F) with units that are from fishery units
# Input fixed catch values: year, season, Fishery, catch (or F)
2014 1 1 9562 
999 # End of file
