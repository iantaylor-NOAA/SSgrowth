#Forecast.SS_New
0 # Forecast: 0=none; 1=F(SPR); 2=F(MSY) 3=F(Btgt); 4=F(endyr); 5=Ave F (enter yrs); 6=read Fmult
# -4  # first year for recent ave F for option 5 (not yet implemented)
# -1  # last year for recent ave F for option 5 (not yet implemented)
# 0.74  # F multiplier for option 6 (not yet implemented
2001 # first year to use for averaging selex to use in forecast (e.g. 2004; or use -x to be rel endyr)
2001 # last year to use for averaging selex to use in forecast
0 # Benchmarks: 0=skip; 1=calc F_spr,F_btgt,F_msy
2 # MSY: 1= set to F(SPR); 2=calc F(MSY); 3=set to F(Btgt); 4=set to F(endyr)
0.4 # SPR target (e.g. 0.40)
0.4 # Biomass target (e.g. 0.40)
10 # N forecast years
0 # read 10 advanced options
# end of advanced options

1 # fleet allocation (in terms of F) (1=use endyr pattern, no read; 2=read below)
# rows are seasons, columns are fleets
#  2.90012
0 # Number of forecast catch levels to input (rest calc catch from forecast F
#1 # basis for input forecatch:  1=retained catch; 2=total dead catch
#Year Seas Fleet Catch
# 2003 1 1 2100

999 # verify end of input
