### notes related to simulating data to illustrated differences
### between conditional age-at-length data and mean length-at-age
### this may depend on things in the file growth_example_notes.R
###
### Ian Taylor
### 11/2/14


if(FALSE){

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

}
