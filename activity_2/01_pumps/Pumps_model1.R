# Problem 1: Model 1: Hierarchical pumps model
model{
  for (i in 1 : N) {
    y[i] ~ dpois(lambda[i])	
    lambda[i] <- theta[i]*t[i]
    # conjugate prior for parameter theta
    theta[i] ~ dgamma(alpha, beta)		
  }
  # priors for root nodes, alpha and beta 
  alpha ~ dexp(1)
  beta ~ dgamma(0.1, 1.0)
  
  Etheta <- alpha/beta
  theta.ave <- mean(theta[]) #the blank square brackets indicate all of the thetas
}