
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
  k<-exp(a/(1-b))
  
  
}