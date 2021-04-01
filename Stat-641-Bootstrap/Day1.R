#install.packages("bootstrap")
# Software (bootstrap, cross-validation, jackknife) 
# and data for the book "An Introduction to the Bootstrap"
# by B. Efron and R. Tibshirani, 1993, Chapman and Hall.

library(bootstrap)
#?bootstrap

######### Examples #############
# 100 bootstraps of the sample mean 
# (this is for illustration;  since "mean" is  a 
# built in function, bootstrap(x,100,mean) would be simpler!)
x <- rnorm(20)                
theta <- function(x){mean(x)} 

results <- bootstrap(x,100,theta) 

######### Examples #############
# To bootstrap functions of more complex data structures, 
# write theta so that its argument x
#  is the set of observation numbers  
#  and simply  pass as data to bootstrap the vector 1,2,..n. 
# For example, to bootstrap
# the correlation coefficient from a set of 15 data pairs:
xdata <- matrix(rnorm(30),ncol=2)
n <- 15
theta <- function(x,xdata){ cor(xdata[x,1],xdata[x,2]) }
results <- bootstrap(1:n,20,theta,xdata)


######### Examples #############
data(law) # in bootstrap package
plot(x = law$LSAT, y = law$GPA)
cor(law)
theta <- function(obs) cor(law[obs,1], law[obs,2])
theta(1:15) # sample estimate
law.boot <- bootstrap(1:15, 2000, theta) 
sd(law.boot$thetastar) # bootstrap standard error 
hist(law.boot$thetastar)

theta <- function(x){ cor(law[x,1],law[x,2]) }
results <- bootstrap(1:15, 1000, theta)
sd(results$thetastar)
