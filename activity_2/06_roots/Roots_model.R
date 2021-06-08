model{
  for(i in 1:N){
    Y[i] ~ dnorm(mu[i], tau)
    mu[i] <- alpha + beta*(D[i]-20)
    
    S[i] ~ dbern(p[i])
    logit(p[i]) <- a + b*(mu[i]+5)
  }
  
  alpha ~ dnorm(0,0.001)
  beta ~ dnorm(0,0.001)
  a ~ dnorm(0,0.001)
  b ~ dnorm(0,0.001)
  tau ~ dgamma(0.01, 0.01)
  sig <- 1/sqrt(tau)
  
  RD0 <- exp(alpha)
}