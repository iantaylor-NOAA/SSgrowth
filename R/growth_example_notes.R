### notes related to workshop on modeling growth in SS
###
### Ian Taylor
### 11/2/14

if(FALSE){ # don't run anything if file is accidentally sourced into R (as Ian often does)

  devtools::install_github("r4ss/r4ss", ref="TA1.8testing")
  library(r4ss)
  
  ###
  ## figures of simple growth curves
  #

  # read models
  setwd('c:/GitHub/SSgrowth/models/')
  s2 <- SS_output('growth_illustration_offset2',covar=FALSE,forecast=FALSE)
  s3 <- SS_output('growth_illustration_offset3',covar=FALSE,forecast=FALSE)

  # make some figures
  doPNG <- FALSE # change this to true when ready
  SSplotBiology(s2,subplot=101,print=doPNG,pheight=4,pwidth=6,plotdir='../figs')
  SSplotBiology(s2,subplot=102,print=doPNG,pheight=4,pwidth=6,plotdir='../figs')
  SSplotBiology(s2,subplot=103,print=doPNG,pheight=4,pwidth=6,plotdir='../figs')
  SSplotBiology(s2,subplot=104,print=doPNG,pheight=4,pwidth=6,plotdir='../figs')
  SSplotBiology(s3,subplot=105,print=doPNG,pheight=4,pwidth=6,plotdir='../figs')
  SSplotBiology(s3,subplot=106,print=doPNG,pheight=4,pwidth=6,plotdir='../figs')

  SSplotBiology(s2,subplot=1:3,print=doPNG,pheight=6,pwidth=7,plotdir='../figs')

  # small pelagic models
  spA1  <- SS_output('small_pelagic_A1')
  spA1a <- SS_output('small_pelagic_A1a')

  # rockfish simulation model
  rock.sim1 <- SS_output('rockfish_simulation', covar=FALSE, forecast=FALSE)
  rock0B    <- SS_output('rockfish_simulationB', covar=FALSE, forecast=FALSE)
  rock7 <- SS_output('rockfish_estimation_7')
  rock8 <- SS_output('rockfish_estimation_8')

  SSplotComparisons(SSsummarize(list(rock1,rock2)))
  SSplotComparisons(SSsummarize(list(rock.sim1,rock5,rock5devs)),subplot=1:12)
  SSplotComparisons(SSsummarize(list(rock.sim1,rock7,rock8)),subplot=1:12)

  SS_plots(rock0B, png=TRUE, datplot=TRUE, aalresids=TRUE, aalyear=2001,
           maxrows=1, maxcols=1, maxrows2=1, maxcols2=1, uncertainty=FALSE)
  SS_plots(rock1, png=TRUE, datplot=TRUE, aalresids=TRUE, aalyear=2001)
  SS_plots(rock2, png=TRUE, datplot=TRUE, aalresids=TRUE, aalyear=2001)
  SS_plots(rock3, png=TRUE, datplot=TRUE, aalresids=TRUE, aalyear=2010)
  SS_plots(rock4, png=TRUE, datplot=TRUE, aalresids=TRUE, aalyear=2010)
  SS_plots(rock5, png=TRUE, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           maxrows=1, maxcols=1, maxrows2=1, maxcols2=1)
  SS_plots(rock6, png=TRUE, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           maxrows=1, maxcols=1, maxrows2=1, maxcols2=1)

  lab1max <- 8
  lab2max <- 0.35
  SSplotBiology(rock.sim1,subplot=2)
  SSplotBiology(rock7,subplot=2)
  SSplotBiology(rock8,subplot=2)
  rm(lab1max)
  rm(lab2max)
  
  # run likelihood profile over CV parameter in new R GUI window
  library(r4ss)
  profilevec <- seq(0.05, 0.40, 0.05)
  Nprofile <- length(profilevec)
  setwd('c:/SS/R')
  SS_profile(dir="c:/GitHub/SSgrowth/models/rockfish_estimation_7_profile",
             masterctlfile="control_MLE.ss",
             string="CV_young_Fem_GP_1",
             profilevec=profilevec,
             model="ss3_safe_win64")
  # run likelihood profile over CV parameter in new R GUI window
  library(r4ss)
  profilevec <- seq(0.05, 0.40, 0.05)
  Nprofile <- length(profilevec)
  setwd('c:/SS/R')
  SS_profile(dir="c:/GitHub/SSgrowth/models/rockfish_estimation_8_profile",
             masterctlfile="control_MLE.ss",
             string="CV_young_Fem_GP_1",
             profilevec=profilevec,
             model="ss3_safe_win64")
  # read in output from profiling
  profilevec <- seq(0.05, 0.40, 0.05)
  Nprofile <- length(profilevec)
  profile7 <- SSgetoutput(dirvec="rockfish_estimation_7_profile",
                          keyvec=1:Nprofile)
  profile8 <- SSgetoutput(dirvec="rockfish_estimation_8_profile",
                          keyvec=1:Nprofile)
  profile7$MLE <- rock7
  profile7summary <- SSsummarize(profile7)
  profile8$MLE <- rock8
  profile8summary <- SSsummarize(profile8)
  # plot profile using summary created above
  SSplotProfile(profile7summary,           # summary object
                profile.string = "CV_young_Fem_GP_1", # substring of profile parameter
                profile.label="CV in length at age for young females") # axis label
  SSplotProfile(profile8summary,           # summary object
                profile.string = "CV_young_Fem_GP_1", # substring of profile parameter
                profile.label="CV in length at age for young females") # axis label



} # end don't do anything
