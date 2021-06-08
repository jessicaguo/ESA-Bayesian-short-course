data{
  for(i in 1:N){
    # Log-transform data (in JAGS, this should be done in a the "data" module, or in R)
    log.gmax[i] <- log(gmax[i])
    # Compute covariate-centered covariates:
    W1c[i] <- W1[i] - mean(W1[])
    W2c[i] <- W2[i] - mean(W2[])
    Tc[i] <- T[i] - mean(T[])
  }
}

model{
  for(i in 1:N){
    # Likelihood for log-scale conductance data:	
    log.gmax[i] ~ dnorm(mu[i], tau)
    # Replicated data:
    Yrep[i] ~ dnorm(mu[i], tau)
    # On original scale:
    grep[i] <- exp(Yrep[i])
    # Mean model (regression model) for predicted log-scale conductance:
    mu[i] <- b[1] + b[2]*W1c[i] + b[3]*W2c[i] + b[4]*Tc[i] + b[5]*pow(Tc[i],2) + b[6]*W1c[i]*W2c[i] +
      b[7]*W1c[i]*Tc[i] + b[8]*W2c[i]*Tc[i] + b[9]*W1c[i]*pow(Tc[i],2) + b[10]*W2c[i]*pow(Tc[i],2)
  }
  
  # Independent, relatively non-informative, conjugate priors for the regression coefficients
  # (root nodes)
  for(k in 1:Nparms){
    b[k] ~ dnorm(0,0.00001)
  }
  
  # Independent, relatively non-informative, conjugate prior for the data precision
  # (root node)
  tau ~ dgamma(0.1, 0.1)
  # Compute data standard deviation
  sig <- 1/sqrt(tau)
  
  # Compute optimal centered-temperature under average soil water conditions:
  Toptc <- -b[4]/(2*b[5])
  # Compute optimal nighttime temperature under average soil water conditions:
  Topt <- Toptc + mean(T[])
}