model{
  #likelihood and mean model
  for(i in 1:N){ #across rats
    for(j in 1:T){ #across times
      Y[i,j] ~ dnorm(mu[i,j], tau)
      mu[i,j] <- alpha + beta*(x[j] - xbar)
    }
  }
  #prior distributions
  alpha ~ dnorm(0,0.00001)
  beta ~ dnorm(0,0.00001) 
  tau ~ dgamma(0.01, 0.01) 
  sigma <- 1/sqrt(tau)
}