
setwd('c:/GitHub/SSgrowth/growth/')
s2 <- SS_output('growth_illustration',covar=FALSE,forecast=FALSE)
s3 <- SS_output('growth_illustration_type3',covar=FALSE,forecast=FALSE)

s2 <- SS_output('growth_illustration',covar=FALSE,forecast=FALSE,verbose=FALSE,printstats=FALSE)
s3 <- SS_output('growth_illustration_type3',covar=FALSE,forecast=FALSE,verbose=FALSE,printstats=FALSE)

SSplotBiology(s2,subplot=101,print=TRUE,pheight=4,pwidth=6,plotdir='../figs')
SSplotBiology(s2,subplot=102,print=TRUE,pheight=4,pwidth=6,plotdir='../figs')
SSplotBiology(s2,subplot=103,print=TRUE,pheight=4,pwidth=6,plotdir='../figs')
SSplotBiology(s2,subplot=104,print=TRUE,pheight=4,pwidth=6,plotdir='../figs')
SSplotBiology(s3,subplot=105,print=TRUE,pheight=4,pwidth=6,plotdir='../figs')
SSplotBiology(s3,subplot=106,print=TRUE,pheight=4,pwidth=6,plotdir='../figs')

# small pelagic models
spA1  <- SS_output('small_pelagic_A1')
spA1a <- SS_output('small_pelagic_A1a')

# rockfish simulation model
rock.sim1 <- SS_output('rockfish_simulation', covar=FALSE, forecast=FALSE)
rock0B    <- SS_output('rockfish_simulationB', covar=FALSE, forecast=FALSE)
rock1 <- SS_output('rockfish_estimation_1')
rock2 <- SS_output('rockfish_estimation_2')
rock3 <- SS_output('rockfish_estimation_3')
rock4 <- SS_output('rockfish_estimation_4')
rock5devs <- SS_output('rockfish_estimation_5devs')
rock5 <- SS_output('rockfish_estimation_5')
rock6 <- SS_output('rockfish_estimation_6')
rock7 <- SS_output('rockfish_estimation_7')
rock8 <- SS_output('rockfish_estimation_8')
rock9 <- SS_output('rockfish_estimation_9')

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

graphics.off()
rm(.SavePlots)
windows(record=TRUE)
lab1max <- 8
lab2max <- 0.35
SSplotBiology(rock.sim1,subplot=2)
SSplotBiology(rock7,subplot=2)
SSplotBiology(rock8,subplot=2)

# run likelihood profile over CV parameter in new R GUI window
library(r4ss)
profilevec <- seq(0.05, 0.40, 0.05)
Nprofile <- length(profilevec)
setwd('c:/SS/R')
SS_profile(dir="c:/GitHub/SSgrowth/growth/rockfish_estimation_7_profile",
           masterctlfile="control_MLE.ss",
           string="CV_young_Fem_GP_1",
           profilevec=profilevec,
           model="ss3_safe_win64")
# run likelihood profile over CV parameter in new R GUI window
library(r4ss)
profilevec <- seq(0.05, 0.40, 0.05)
Nprofile <- length(profilevec)
setwd('c:/SS/R')
SS_profile(dir="c:/GitHub/SSgrowth/growth/rockfish_estimation_8_profile",
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


# read simulated data
rockdat0 <- SS_readdat('rockfish_simulation/data.ss_new',section=3)
# length comps for 2010
marginal.lens.2010 <- rockdat0$lencomp[rockdat0$lencomp$FltSvy==2 &
                                       rockdat0$lencomp$Yr==2010, ]
# make copy of data
rockdat0new <- rockdat0

# subset to only 2010 data
rockdat0new$lencomp   <- rockdat0new$lencomp[rockdat0new$lencomp$Yr==2010,]
rockdat0new$N_lencomp <- nrow(rockdat0new$lencomp)
rockdat0new$agecomp   <- rockdat0new$agecomp[rockdat0new$agecomp$Yr==2010,]
rockdat0new$MeanSize_at_Age_obs <- rockdat0new$MeanSize_at_Age_obs[rockdat0new$MeanSize_at_Age_obs$Yr==2010,]

# change sample sizes of conditional age-at-length data to reflect length comps
rockdat0new$agecomp$Nsamp[rockdat0new$agecomp$Lbin_lo>0] <-
  as.numeric(marginal.lens.2010[,-(1:6)])
rockdat0new$agecomp <- rockdat0new$agecomp[rockdat0new$agecomp$Nsamp > 0,]
rockdat0new$N_agecomp <- nrow(rockdat0new$agecomp)

## # calculate marginal age comps
conditional.ages <- rockdat0new$agecomp[rockdat0new$agecomp$Lbin_lo>0,-(1:9)]
marginal.ages.new <- apply(conditional.ages, 2, sum)
# change sample sizes of mean length- and weight-at-length data to marginal age comp
for(irow in 1:2){
  rockdat0new$MeanSize_at_Age_obs[irow,
                                  grep("N_",names(rockdat0new$MeanSize_at_Age_obs))] <-
                                    marginal.ages.new
}

# remove fleet 3
rockdat0new$MeanSize_at_Age_obs <- rockdat0new$MeanSize_at_Age_obs[rockdat0new$MeanSize_at_Age_obs$Fleet==2,]
rockdat0new$N_MeanSize_at_Age_obs <- nrow(rockdat0new$MeanSize_at_Age_obs)
rockdat0new$Nsurveys     <- 1
rockdat0new$fleetinfo1   <- rockdat0new$fleetinfo1[,c(1,2,4)]
rockdat0new$fleetnames   <- rockdat0new$fleetnames[1:2]
rockdat0new$surveytiming <- rockdat0new$surveytiming[1:2]
rockdat0new$areas        <- rockdat0new$areas[1:2]
rockdat0new$CPUEinfo     <- rockdat0new$CPUEinfo[1:2,]
SS_writedat(datlist=rockdat0new, overwrite=TRUE,
            outfile="rockfish_simulationB/rockfish_simulation_dataB.ss")

##
### now run model in rockfish_simulationB
##

### read 2nd set of simulated data
rockdat0B <- SS_readdat("rockfish_simulationB/data.ss_new", section=3)
# recalculated marginal ages to match conditonals 
conditional.ages <- rockdat0B$agecomp[rockdat0B$agecomp$Lbin_lo>0,-(1:9)]
marginal.ages.new <- apply(conditional.ages, 2, sum)
marginal.ages.new.f <- marginal.ages.new.m <- marginal.ages.new
marginal.ages.new.f[71:140] <- 0
marginal.ages.new.m[ 1:70] <- 0
rockdat0B$agecomp[rockdat0B$agecomp$Gender==1 &
                  rockdat0B$agecomp$Lbin_lo<0,-(1:9)] <- marginal.ages.new.f
rockdat0B$agecomp[rockdat0B$agecomp$Gender==2 &
                  rockdat0B$agecomp$Lbin_lo<0,-(1:9)] <- marginal.ages.new.m
# change sample sizes of mean length- and weight-at-length data to marginal age comp
for(irow in 1:2){
  rockdat0B$MeanSize_at_Age_obs[irow,
                                grep("N_",names(rockdat0B$MeanSize_at_Age_obs))] <-
                                  marginal.ages.new
}

#### new marginal data file
# turn on influence of marginal data and
# turn off influence of conditional data
rockdat0C <- rockdat0B
rockdat0C$agecomp$FltSvy[rockdat0C$agecomp$Lbin_hi<0] <- 2
rockdat0C$agecomp$FltSvy[rockdat0C$agecomp$Lbin_hi>0] <- -2


SS_writedat(datlist=rockdat0B, overwrite=TRUE,
            outfile="rockfish_estimation_5/rockfish_simulated_data_conditional_ages_2010.ss")
SS_writedat(datlist=rockdat0C, overwrite=TRUE,
            outfile="rockfish_estimation_6/rockfish_simulated_data_marginal_ages_2010.ss")







#### older stuff


# read rockfish data file with simulated data
rock1dat <- SS_readdat('rockfish_estimation_1/rockfish_simulated_data.ss')
rock.sim.dat <- SS_readdat('rockfish_simulation/rockfish_simulation_data.ss')
rock.sim.dat2 <- SS_readdat('rockfish_simulation/dat_isim.ss')
# subset conditional and marginal age compositions
rock.cond.comps <- rock1dat$agecomp[rock1dat$agecomp$Lbin_lo>0,]
rock.marg.comps <- rock1dat$agecomp[rock1dat$agecomp$Lbin_hi<0,]
# fill in marginal age comps with sums of conditional values
for(irow in 1:nrow(rock.marg.comps)){
  # meta-data for each row of marginal data
  yr <- rock.marg.comps$Yr[irow]
  flt <- rock.marg.comps$FltSvy[irow]
  sex <- rock.marg.comps$Gender[irow]
  # which rows of conditional data match the meta-data 
  cond.rows <- rock.cond.comps$Yr==yr & abs(rock.cond.comps$FltSvy)==abs(flt) &
    rock.cond.comps$Gender==sex
  # sum values
  newvals <- apply(rock.cond.comps[cond.rows, -(1:9)],
                   MARGIN=2, FUN=sum)
  # fill in new values and sample sizes
  rock.marg.comps[irow, -(1:9)] <- newvals
  rock.marg.comps$Nsamp[irow] <- sum(newvals)
}
# data file with conditional data turned on and marginal data off
rock2dat <- rock1dat
rock.cond.comps$FltSvy <- 2
rock.marg.comps$FltSvy <- -2
rock2dat$agecomp <- rbind(rock.cond.comps, rock.marg.comps)
SS_writedat(datlist=rock2dat, overwrite=TRUE,
            outfile="rockfish_estimation_1/rockfish_simulated_data_conditional_ages.ss")
# data file with marginal data turned on and conditional data off
rock3dat <- rock1dat
rock.cond.comps$FltSvy <- -2
rock.marg.comps$FltSvy <- 2
rock3dat$agecomp <- rbind(rock.cond.comps, rock.marg.comps)
SS_writedat(datlist=rock3dat, overwrite=TRUE,
            outfile="rockfish_estimation_2/rockfish_simulated_data_marginal_ages.ss")


# shrink to a single year of data
rockdat.cond <- SS_readdat(file="rockfish_estimation_1/rockfish_simulated_data_conditional_ages.ss")
#rockdat.marg <- SS_readdat(file="rockfish_estimation_2/rockfish_simulated_data_marginal_ages.ss")

rockdat.cond$styr <- 2009
rockdat.cond$catch <- NULL
rockdat.cond$N_catch <- 0
rockdat.cond$lencomp   <- rockdat.cond$lencomp[rockdat.cond$lencomp$Yr==2010,]
rockdat.cond$N_lencomp <- nrow(rockdat.cond$lencomp)
rockdat.cond$agecomp   <- rockdat.cond$agecomp[rockdat.cond$agecomp$Yr==2010,]
rockdat.cond$N_agecomp <- nrow(rockdat.cond$agecomp)
rockdat.cond$MeanSize_at_Age_obs <- rockdat.cond$MeanSize_at_Age_obs[rockdat.cond$MeanSize_at_Age_obs$Yr==2010,]
rockdat.cond$N_MeanSize_at_Age_obs <- nrow(rockdat.cond$MeanSize_at_Age_obs)

# turn on influence of marginal data and
# turn off influence of conditional data
rockdat.marg <- rockdat.cond
rockdat.marg$agecomp$FltSvy[rockdat.marg$agecomp$Lbin_hi<0] <- 2
rockdat.marg$agecomp$FltSvy[rockdat.marg$agecomp$Lbin_hi>0] <- -2



SS_writedat(datlist=rockdat.cond, overwrite=TRUE,
            outfile="rockfish_estimation_3/rockfish_simulated_data_conditional_ages_2010.ss")
SS_writedat(datlist=rockdat.cond, overwrite=TRUE,
            outfile="rockfish_estimation_4/rockfish_simulated_data_marginal_ages_2010.ss")



