# Starter JAGS code for simple, non-hierarchical rat model.

model{
  # Specify likelihood of each data component by looping through all
  # elements of the data (weights, Y), which is read-in as a matrix,
  # so need to loop through each row (rat) and each column (day):
  for(i in 1:N){
    for(j in 1:T){
      # Likelihood of each observed weight (parameterize normal
      # in terms of precision, tau), with rat-specific intercept
      # and slope (growth rate)
      Y[i,j] ~ dnorm(mu[i,j], tau)
      mu[i,j] <- alpha[i] + beta[i]*(x[j] - xbar)
    }
  }
  # Hierarchical priors for rat-level parameters:
  for(i in 1:N){
    alpha[i] ~ dnorm(mu.alpha, tau.alpha)
    beta[i] ~ dnorm(mu.beta, tau.beta)
  }
  # Conjugate, relatively non-informative priors for root 
  # nodes (population parameters)
  mu.alpha ~ dnorm(0,0.001)
  mu.beta ~ dnorm(0,0.001)
  tau ~ dgamma(0.01,0.01)
  tau.alpha ~ dgamma(0.01,0.01)
  tau.beta ~ dgamma(0.01,0.01)
  # Calculate standard deviations associated with each
  # precition:
  sig <- 1/sqrt(tau)
  sig.alpha <- 1/sqrt(tau.alpha)
  sig.beta <- 1/sqrt(tau.beta)
  
}