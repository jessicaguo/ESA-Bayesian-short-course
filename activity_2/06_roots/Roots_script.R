# Starter code for the Roots problem.

# Load potentially useful libraries and modules. 
library(rjags)
load.module('dic')
library(mcmcplots)

#setwd("Z:/user/xxx")

# Data :
Root.data <- read.csv("Roots_data.csv")
data <- list(D = Root.data$D, S = Root.data$S, Y = Root.data$Y, N = 1548)

# Specify initials for root nodes, for 3 MCMC chains as a list of lists;
# Think about how you would come-up with reasonable values; "bad" initials
# may result in error messages when trying to initialize the JAGS model.
inits = list(
  list(alpha = , beta = , a = , b = , tau = ),
  list(alpha = , beta = , a = , b = , tau = ),
  list(alpha = , beta = , a = , b = , tau = ))

# Initialize JAGS model with jags.model function. Be sure to specify correct name of 
# JAGS model file.
jm1 <- jags.model("Roots_model.R", data=data, inits=inits, n.chains = 3, n.adapt=1000)

# Now update the JaGS model and save/monitor quantities of interest:
jm_coda1 <- coda.samples(jm1, variable.names = c("deviance", "alpha", "beta","a","b","sig","RD0 "), n.iter=5000)