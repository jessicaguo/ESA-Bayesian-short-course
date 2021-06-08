model{
  for(i in 1:N){
  #binomial likelihood
  y[i] ~ dbin(p[i], n[i])#in JAGS the p and n are reversed from common stats notation of n and p
  #regression equation
  logit(p[i])<- Beta[1,m[i]] + Beta[2,m[i]]*X[i]
  }
  for(i in 1:2){
    for(j in 1:2){ #loops through each value of m=1 (light morph) and m=2 (dark morph)
      # independent, relativley non-informative priors
      Beta[i,j] ~ dnorm(0, 0.00001)
    }
  }
}