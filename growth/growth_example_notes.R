setwd('c:/GitHub/SS/growth/')
s2 <- SS_output('growth_illustration',covar=FALSE,forecast=FALSE)
s3 <- SS_output('growth_illustration_type3',covar=FALSE,forecast=FALSE)

SSplotBiology(s2,subplot=101)
SSplotBiology(s3,subplot=101)
