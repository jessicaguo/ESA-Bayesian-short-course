
#########Jags model

model{
  for (i in 1 : N) {
    Nt[i] ~  ###Finish likelihood statement
    
  }
  # Add priors right here
  a ~ 
  b ~ 
  inv.sig ~ dgamma(1,1)
  
  sig <- sqrt(1/inv.sig)
  k<-exp(a/(1-b)) ###This is the carrying capacity based on a and b. Adding this will calculate a posterior for k. 
  
  
}