

a<-2 ###Low density population growth rate
b<-.7 ###Density dependent parameter
sig<-0.2 ###Process uncertainty
lNt<-log(4) ####Starting population density 

Nt<-Nt_1<-numeric(50) ###Build vectors to store data

###Simulate population dynamics
for(t in 1:50){
lNt_1<-lNt
lNt<-rnorm(1,a+b*lNt_1,sig)
Nt[t]<-exp(lNt)
Nt_1[t]<-exp(lNt_1)

}

plot(Nt,type='l', xlab='Year') ##Plot dynamics


library(rjags)

data<-list(Nt=log(Nt), Nt_1=log(Nt_1), N=length(Nt))


jm1 <- jags.model("jackalope_JagsStarter.R", data=data, n.chains = 3, n.adapt=1000)

# Now update the JaGS model and save/monitor quantities of interest:
jm_coda1 <- coda.samples(jm1, variable.names = c("a", "b", "sig", 'k'), n.iter=5000)

