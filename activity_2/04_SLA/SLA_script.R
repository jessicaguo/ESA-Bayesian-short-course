# Starter script for SLA example

# Load potentially useful libraries and modules. 
library(rjags)
load.module('dic')
library(mcmcplots)

#setwd("Z:/user/xxx")

# Data
SLA_data = read.csv("SLA_data.csv")
Sides_data = read.csv("SLA_data_Sides.csv")
Sub_data = read.csv("SLA_data_subsec.csv")

# Create data for JAGS model:
data = list(spp = SLA_data$spp, sla = SLA_data$SLA, N = 396, Nsp = 25)

# Specify initials for root nodes, for 3 MCMC chains as a list of lists:
inits = list(
  list(mu.hat = , tau.hat = , tau = ),
  list(mu.hat = , tau.hat = , tau = ),
  list(mu.hat = , tau.hat = , tau = ))

# Initialize JAGS model with jags.model function. Be sure to specify correct name of 
# JAGS model file.
jm1 <- jags.model("SLA_model.R", data=data, inits=inits, n.chains = 3, n.adapt=1000)

# Now update the JaGS model and save/monitor quantities of interest:
jm_coda1 <- coda.samples(jm1, variable.names = c("deviance", "parms", "mu"), n.iter=5000)