library(rjags)
load.module('dic')
library(mcmcplots)

# setwd("Z:/xxx")

indat<-read.csv("Moths_data.csv")
# Use attach to allow you to refer to variable names directly, as
# done below when creating the dat for JAGS.
attach(indat)

#define data
dat1<-list(y=Removed, n=Placed, X=Dist, m=Morph, N=nrow(indat))

#can use classical glm to find starting values
morph<-as.factor(Morph)#change morph into a categorical variable
mod1<-glm(cbind(Removed, Placed)~Dist*morph, family=binomial, data=indat)
summary(mod1)$coef
#recall that R uses additive model notation for summary output, so we need to correctly add

#functions to generate each Beta; pull-off point estimates from the glm output for the mean
#use the std. error estimated, inflated to allow for greater dispersion of initial values
#(i.e., here, we multiply the std.error by 5, but this is not an exact "solution")
b1.1<-function(n){rnorm(n, mean=summary(mod1)$coef[1,1], sd=5*summary(mod1)$coef[1,2])}
b1.2<-function(n){rnorm(n, mean=summary(mod1)$coef[2,1], sd=5*summary(mod1)$coef[2,2])}
b2.1<-function(n){rnorm(n, mean=summary(mod1)$coef[1,1]+summary(mod1)$coef[3,1], sd=5*summary(mod1)$coef[3,2])}
b2.2<-function(n){rnorm(n, mean=summary(mod1)$coef[2,1]+summary(mod1)$coef[4,1], sd=5*summary(mod1)$coef[4,2])}

#create list of lists for each chain.  Recall that Beta needs to be in matrix notation
initslist<-list(list(Beta=matrix(c(b1.1(1), b1.2(1), b2.1(1), b2.2(1)) , nrow=2)),
                list(Beta=matrix(c(b1.1(1), b1.2(1), b2.1(1), b2.2(1)) , nrow=2)),
                list(Beta=matrix(c(b1.1(1), b1.2(1), b2.1(1), b2.2(1)) , nrow=2)))

# or simply fill-in rought starting values "by hand" (note order of values based on above):
initslist<-list(list(Beta=matrix(c(x, x, x, x) , nrow=2)),
                list(Beta=matrix(c(x, x, x, x) , nrow=2)),
                list(Beta=matrix(c(x, x, x, x) , nrow=2)))


# Initialize JAGS model:
jm1<-jags.model("Moths_model.R", data=dat1, inits=initslist, n.chains = 3)

# update JAGS model:
jm_coda1<-coda.samples(jm1, variable.names = c("deviance", "Beta"), n.iter=5000)


# Does prob of predation vary with distance?  
caterplot(jm_coda1, parms=c("Beta[2,1]", "Beta[2,2]"))
#yes for dark morphs, 95% CI does not over lap for zero. But prob of predation does not vary with distance for light morphs