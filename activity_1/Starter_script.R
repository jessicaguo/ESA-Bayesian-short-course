#This is a starter script
# there are blanks to fill in.
# I describe these in the R markdown pdf and markdown file.

#setwd(...)

#load your data
Weights <- read.csv("GiantRats.csv",header=T)
head(Weights)
#create JAGS data object for the "jags.model()" function
data <- list(x = c(8.0, 15.0, 22.0, 29.0, 36.0), xbar = 22, N = 30, T = 5,
             Y = Weights)
#select initial values (Fill in the blanks!)
# and save into inits object for "jags.mode()" function
inits = list(
  list(mu.alpha = 1, mu.beta = 0, tau=1,tau.alpha=1,tau.beta=1),
  list(mu.alpha = xx, mu.beta = xx, tau=0.5,tau.alpha=2,tau.beta=0.5),
  list(mu.alpha = xx, mu.beta = xx, tau=2,tau.alpha=0.5,tau.beta=2))

#load rjags package to interface between R and JAGS
library(rjags)

#Initialize the model
Rats_model <- jags.model("RATS_Hmodel.R", data=data, inits=inits, n.chains = 3, n.adapt=500)

#Sample some parameters
full_coda <- coda.samples(Rats_model, variable.names = c("deviance", "mu.alpha", 
       "mu.beta","alpha","beta","sig","sig.alpha","sig.beta"), n.iter=1000)
plot(converged_samples) #base R method to plot output. Flexible but less user-friendly.
library(mcmcplots) #another way to plot output, more user-friendly, but inflexible. Annoying for large models.
mcmcplot(full_coda) 

#convergence diagnostic (<1.2 is converged)
gelman.diag(full_coda)

#Summarize output in terms of means, sd's, 95% CrI's
table1=summary(full_coda)$stat
table2=summary(full_coda)$quantiles
outstats<-cbind(table2[,1],table1[,2],table2[,1],table2[,5])
colnames(outstats)<-c("mean","sd","val2.5pc","val97.5pc")
outstats

# The End #