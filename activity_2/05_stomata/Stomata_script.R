# Load potentially useful libraries and modules. 
library(rjags)
load.module('dic')
library(mcmcplots)

#setwd("Z:/user/xxx")

# Read in data file with observation-level WD data and associated species IDs:
data <- read.csv("Stomata_data.csv")

# Number of observations:
N = nrow(data)

# List of data:
dat <- list(N = N, Nparms = 10, gmax = data$gmax, W1= data$W1, W2=data$W2, T = data$T)

# Define stating values (initials)
inits = list(list(b = , tau = ), 
             list(b = , tau = ), 
             list(b = , tau = ))


# Initiate JAGS model:
jm <- jags.model("Stomata_model.R", n.chains=3, data=dat, inits = inits)

# Now update JAGS model with coda.samples and monitor quantities of interest
# Set number of iterations (per chain):
n.iter=5000
jm_coda<-coda.samples(jm, variable.names = c("b","tau","sig","Topt","deviance"), n.iter = n.iter)