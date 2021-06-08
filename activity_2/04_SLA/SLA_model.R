model
{
  for(i in 1:N){
    # Likelihood of sla data
    sla[i] ~ dnorm(mu[spp[i]], tau)
  }
  for(s in 1:Nsp){
    # Hierarchical parameter model for the species-specific sla's.
    mu[s] ~ dnorm(mu.hat, tau.hat)
  }
  
  # Vague prior for pop'n level sla (global sla = root node)
  mu.hat  ~ dnorm(0,0.00001)
  
  # Standard, relatively non-informative gamma prior for precision terms describing 
  # variability within a species (tau) and between species (tau.hat)
  tau.hat ~ dgamma(0.01, 0.01)
  tau ~ dgamma(0.01, 0.01)
  # Compute standard deviations:
  sig <- 1/sqrt(tau)
  sig.hat <- 1/sqrt(tau.hat)
  
  # Create a vector parms for "storing" parameters of interest for easy monitoring:
  parms[1] <- mu.hat
  parms[2] <- sig.hat
  parms[3] <- sig
}