# This R script contains two main topics:
# 1. Simulation of proportion with graphs
# 2. Using the theoretical distribution to solve problems


# 1. Simulation of proportion with graphs

p <- .6 # .8, .3
n <- 30 # 256, 625

m <- 10000 #number of experiments

# Generate a sample
sample <- sample(c(0,1), size = n, replace = TRUE, prob=c(1-p,p)) 

# Looking at the sample (optional)
sample 

# Find the proportion of men
sum(sample)/n


# Now repeat the above process 1000 times and find the average of proportions

pro <- numeric(1000)

for (i in 1:1000){
  
  sample <- sample(c(0,1), size = n, replace = TRUE, prob=c(1-p,p)) 
  pro[i] <- sum(sample)/n 
}

mean(pro)
sd(pro)
hist(pro)

# End of simulation

###############################################################

# 2. Using the theoretical distribution to solve problems

p<- .07
n<-233

#Check assumptions!!!

meanp <-p
sdp<- sqrt(p*(1-p)/n)

sdp

#less than for a normal
#pnorm(value,mean,sd)

pnorm(.06,meanp,sdp)

#greater than for a normal
#1-pnorm(value,mean,sd)

1-pnorm(.09,meanp,sdp)
pnorm(.09,meanp,sdp,lower=F)

#between for a normal
#pnorm(bigvalue,mean,sd)-pnorm(smallerval,mean,sd)

pnorm(.12,meanp,sdp)-pnorm(.08,meanp,sdp)

#quantile
#qnorm(percentless,mean,sd)

qnorm(.9,meanp,sdp)



