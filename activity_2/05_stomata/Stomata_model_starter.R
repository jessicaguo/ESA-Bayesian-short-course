data{
  for(i in 1:N){
    # Compute log(gmax) data:
    log.gmax[i] <- log(XXX)
    # Compute covariate-centered covariates:
    W1c[i] <- W1[i] - mean(W1[])
    XXX
  }
}

model{
  for(i in 1:N){
    # Likelihood of log.gmax data
    log.gmax[i] ~ XXXX
    
    # Mean model (regression model) for predicted log-scale conductance:
    mu[i] <- b[1] + b[2]*W1c[i] + XXXX + b[10]*W2c[i]*pow(Tc[i],2)
  }
  
  # Priors for regression coefficients
  for(k in 1:Nparms){
    b[k] ~ XXX
  }
  
  # Prior for precision
  tau ~ XXX
  # Compute data standard deviation
  sig <- XXX
  
  # Compute optimum temperature
  Topt <- XXX
}