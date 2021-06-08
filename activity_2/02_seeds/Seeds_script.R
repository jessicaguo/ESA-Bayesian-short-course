# Starter script for Seeds example

# Load potentially useful libraries and modules. 
library(rjags)
load.module('dic')
library(mcmcplots)

#setwd("Z:/user/xxx")

data = list(r = c(10, 23, 23, 26, 17, 5, 53, 55, 32, 46, 10,   8, 10,   8, 23, 0,  3, 22, 15, 32, 3),
     n = c(39, 62, 81, 51, 39, 6, 74, 72, 51, 79, 13, 16, 30, 28, 45, 4, 12, 41, 30, 51, 7),
     x1 = c(0,   0,  0,   0,   0, 0,   0,   0,  0,   0,   0,  1,   1,   1,   1, 1,   1,  1,   1,   1, 1),
     x2 = c(0,   0,  0,   0,   0, 1,   1,   1,  1,   1,   1,  0,   0,   0,   0, 0,   1,  1,   1,   1, 1),
     N = 21)


# Specify initials for 3 MCMC chains as a list of lists; first first two list of
# initials are taken directly from the OpenBUGS example.
inits = list(
  list(alpha0 = 0, alpha1 = 0, alpha2 = 0, alpha12 = 0, tau = 10),
  list(alpha0 = 0, alpha1 = 0, alpha2 = 0, alpha12 = 0, tau = 1,
    b = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)),
  list(alpha0 = XXX, alpha1 = XXX, alpha2 = XXX, alpha12 = XXX, tau = XXX))

# Initialize JAGS model with jags.model function. Be sure to specify correct name of 
# JAGS model file.
jm1 <- jags.model("Seeds_model.R", data=data, inits=inits, n.chains = 2, n.adapt=1000)

# Now update the JaGS model and save/monitor quantities of interest:
jm_coda1 <- coda.samples(jm1, variable.names = c("deviance", "alpha0", "alpha1","alpha2","alpha12","sigma"), n.iter=5000)