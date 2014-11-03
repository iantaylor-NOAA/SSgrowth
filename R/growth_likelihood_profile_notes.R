### notes related to likelihood profiles for growth workshop
### this may depend on things in the file growth_example_notes.R
###
### Ian Taylor
### 11/2/14

if(FALSE){
  
  # run likelihood profile over CV parameter in new R GUI window
  library(r4ss)
  profilevec <- seq(0.05, 0.40, 0.05)
  Nprofile <- length(profilevec)
  setwd('c:/SS/R')
  SS_profile(dir="c:/GitHub/SSgrowth/models/rockfish_conditional_ages_profile",
             masterctlfile="control_MLE.ss",
             string="CV_young_Fem_GP_1",
             profilevec=profilevec,
             model="ss3_safe_win64")
  
  # run likelihood profile over CV parameter in new R GUI window
  library(r4ss)
  profilevec <- seq(0.05, 0.40, 0.05)
  Nprofile <- length(profilevec)
  setwd('c:/SS/R')
  SS_profile(dir="c:/GitHub/SSgrowth/models/extra_stuff/rockfish_marginal_ages_profile",
             masterctlfile="control_MLE.ss",
             string="CV_young_Fem_GP_1",
             profilevec=profilevec,
             model="ss3_safe_win64")
  
  # read in output from profiling
  profilevec <- seq(0.05, 0.40, 0.05)
  Nprofile <- length(profilevec)
  profile.cond <- SSgetoutput(dirvec="extra_stuff/rockfish_conditional_ages_profile",
                          keyvec=1:Nprofile)
  profile.marg <- SSgetoutput(dirvec="extra_stuff/rockfish_marginal_ages_profile",
                          keyvec=1:Nprofile)
  profile.cond$MLE <- rock.cond
  profile.cond.summary <- SSsummarize(profile.cond)
  profile.marg$MLE <- rock.marg
  profile.marg.summary <- SSsummarize(profile.marg)
  # plot profile using summary created above
  SSplotProfile(profile.cond.summary,           # summary object
                profile.string = "CV_young_Fem_GP_1", # substring of profile parameter
                profile.label="CV in length at age for young females") # axis label
  SSplotProfile(profile.marg.summary,           # summary object
                profile.string = "CV_young_Fem_GP_1", # substring of profile parameter
                profile.label="CV in length at age for young females") # axis label


  # run likelihood profile over richards growth coefficient in new R GUI window
  library(r4ss)
  profilevec <- seq(0,3,0.5)
  profilevec[1] <- 0.1
  Nprofile <- length(profilevec)
  setwd('c:/SS/R2')
  SS_profile(dir="C:/GitHub/SSgrowth/models/extra_stuff/rockfish_simulation_richards_profile",
             masterctlfile="control.ss_new",
             string="Richards_Fem_GP_1",
             profilevec=profilevec,
             model="ss3_safe_win64", extras = "-nox -nohess")
  setwd('C:/GitHub/SSgrowth/models/')
  profile.richards <- SSgetoutput(dirvec="extra_stuff/rockfish_simulation_richards_profile",
                          keyvec=1:Nprofile, getcovar=FALSE)

  # custom plot showing different richards values
  png('C:/GitHub/SSgrowth/figs/richards_growth_illustration.png',
      width=7,height=6,units='in',res=300)
  plot(0,xlim=c(0,80),ylim=c(0,70),xaxs='i',yaxs='i',type='n',las=1,
       xlab="Age (yr)", ylab="Length (cm, middle of the year)")
  N <- Nprofile
  legends <- paste(profilevec)
  legends[profilevec==1] <- "1 (von Bertalanffy)"
  ltyvec <- rep(1,N)
  ltyvec[profilevec==1] <- 2
  colvec <- rich.colors.short(N)
  for(i in 1:N){
    growdatF <- profile.richards[[i]]$endgrowth[profile.richards[[i]]$endgrowth$Gender==1,]
    lines(growdatF$Age_Mid, growdatF$Len_Mid, lwd=3, col=colvec[i],
          lty=ltyvec[i])
  }
  legend('bottomright',legend=rev(legends), col=rev(colvec),lwd=3,lty=rev(ltyvec),
         title="Richards growth coefficient", bty='n',seg.len=4)
  dev.off()
}
