### notes related to workshop on modeling growth in SS
###
### Ian Taylor
### 11/2/14


if(FALSE){ # don't run anything if file is accidentally sourced into R (as Ian often does)

  devtools::install_github("r4ss/r4ss", ref="TA1.8testing")
  library(r4ss)
  
  ###################################################################################
  ###
  ##  figures of simple growth curves using "growth_illustration..." models
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

  ###################################################################################
  ###
  ##  illustration of conditional vs. marginal data using rockfish models
  #

  # note: data for conditional and marginal model was generated using code in
  #       growth_data_simulation_notes.R
  
  # read rockfish simulation model
  setwd('c:/GitHub/SSgrowth/models/')
  rock.sim1 <- SS_output('extra_stuff/rockfish_simulation',
                         covar=FALSE, forecast=FALSE)
  rock.sim2 <- SS_output('extra_stuff/rockfish_simulationB',
                         covar=FALSE, forecast=FALSE)
  rock.cond <- SS_output('rockfish_conditional_ages')
  rock.cond.highN <- SS_output('rockfish_conditional_ages_highN')
  rock.marg <- SS_output('rockfish_marginal_ages')
  rock.marg.highN <- SS_output('rockfish_marginal_ages_highN')

  rock.summary.old <- SSsummarize(list(rock.cond,rock.marg,rock.sim2))
  rock.summary <- SSsummarize(list(rock.cond,rock.marg400,rock.sim2))
  rock.summary.highN <- SSsummarize(list(rock.cond.highN,rock.marg400_nowt.highN,rock.sim2))
  rock.summary.big <- SSsummarize(list(rock.cond,rock.marg,rock.cond.highN,rock.marg.highN,rock.sim2))
  SSplotComparisons(rock.summary.highN,
                    png=doPNG, pheight=5,
                    legendlabels=c("Conditional age model","Marginal age model",
                        "Simulation model"),
                    indexUncertainty=TRUE,
                    densitynames = c("SPB_Virgin", "R0", "L_at","CV_"),
                    plotdir='../figs/rockfish_comparisons_highN/')
  SSplotComparisons(rock.summary.big,
                    png=doPNG, pheight=5,
                    legendlabels=c("Conditional age model","Marginal age model",
                        "Conditional age model Nx10","Marginal age model Nx10",
                        "Simulation model"),
                    indexUncertainty=TRUE,legendloc="bottomleft",
                    densitynames = c("SPB_Virgin", "R0", "L_at","CV_"),
                    plotdir='../figs/rockfish_comparisons_big/')

  # these values override default CV limits in SSplotBiology for better
  # comparison of growth fits
  lab1max <- 8    
  lab2max <- 0.35
  # make individual plots to show model results

  # first set of plots
  SS_plots(rock.sim2, png=doPNG, datplot=TRUE, aalresids=TRUE, aalyear=2001,
           pheight=6, maxrows=1, maxcols=1, maxrows2=1, maxcols2=1, uncertainty=FALSE)
  SS_plots(rock.cond, png=doPNG, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           pheight=6, maxrows=1, maxcols=1, maxrows2=1, maxcols2=1)
  SS_plots(rock.marg, png=doPNG, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           pheight=6, maxrows=1, maxcols=1, maxrows2=1, maxcols2=1)
  # plots with alternative dimensions for composition data
  SS_plots(rock.cond, png=doPNG, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           plot=13:20,pheight=7, maxrows=1, maxcols=1, maxrows2=2, maxcols2=1)
  SS_plots(rock.cond, png=doPNG, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           plot=13:14, pheight=5, maxrows=1, maxcols=1, maxrows2=1, maxcols2=1)
  SS_plots(rock.marg, png=doPNG, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           plot=13:20,pheight=7, maxrows=1, maxcols=1, maxrows2=2, maxcols2=1)
  SS_plots(rock.marg, png=doPNG, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           plot=13:20,pheight=5, maxrows=1, maxcols=1, maxrows2=1, maxcols2=1)
  # high sample size plots
  SS_plots(rock.cond.highN, png=doPNG, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           pheight=6, maxrows=1, maxcols=1, maxrows2=1, maxcols2=1)
  SS_plots(rock.marg.highN, png=doPNG, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           pheight=6, maxrows=1, maxcols=1, maxrows2=1, maxcols2=1)

  # commands in old r4ss package to get single-sex mean length at age
  SS_plots(rock.marg, png=doPNG, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           plot=20,pheight=7, maxrows=1, maxcols=1, maxrows2=1, maxcols2=1,
           printfolder="plots_old_r4ss")
  SS_plots(rock.marg, png=doPNG, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           plot=20,pheight=7, maxrows=1, maxcols=1, maxrows2=1, maxcols2=1,
           colvec=rep(NA,3),printfolder="plots_old_r4ssB")
  SSplotComps(rock.marg, kind="L@A",print=doPNG,
           plot=20,maxrows=1, maxcols=1, maxrows2=1, maxcols2=1,
           linescol=rgb(0,0,0,0))
  SS_plots(rock.marg.highN, png=doPNG, datplot=TRUE, aalresids=TRUE, aalyear=2010,
           plot=20,pheight=7, maxrows=1, maxcols=1, maxrows2=1, maxcols2=1,
           printfolder="plots_old_r4ss")
  SSplotComps(rock.cond, subplot=1, kind="LEN", datonly=TRUE,print=TRUE,
              pheight=6,maxrows=1,maxcols=1,showeffN=FALSE)
  SSplotComps(rock.cond, subplot=1, kind="LEN", datonly=FALSE,print=TRUE,
              pheight=6,maxrows=1,maxcols=1,showeffN=FALSE)

  ## rm(.SavedPlots)
  ## windows(record=TRUE)
  ## SSplotBiology(rock.sim2,subplot=2,plotdir="../figs/rockfish_comparisons",
  ##               pheight=6, print=FALSE)
  ## SSplotBiology(rock.cond.highN,subplot=2,plotdir="../figs/rockfish_comparisons",
  ##               pheight=6, print=FALSE)
  ## SSplotBiology(rock.marg400_nowt.highN,subplot=2,plotdir="../figs/rockfish_comparisons",
  ##               pheight=6, print=FALSE)
  ## rm(lab1max)
  ## rm(lab2max)


  ###################################################################################
  ###
  ##  illustration of empirical weight-at-age using hake
  #
  hake <- SS_output('C:/github/SSgrowth/models/hake2014_simplified')
  SS_plots(hake, png=TRUE, maxrows=7, maxcols=6, datplot=TRUE)
  SS_plots(hake, png=TRUE, pheight=5, plot=24)

  ###################################################################################
  ###
  ##  illustration of age-specific-k (model not shared on GitHub)
  #
  bet <- SS_output('C:/ss/Rishi/re3stanzagrowthcurve', covar=FALSE)
  SS_plots(bet, png=TRUE, uncertainty=FALSE)
} # end don't do anything

# this extra line is for testing GitHub
