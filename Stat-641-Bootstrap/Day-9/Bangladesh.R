library(resampledata)
data("Bangladesh")
head(Bangladesh)
df <- with(Bangladesh, Chlorine[!is.na(Chlorine)])

# Student t
n <- length(df)
mdf <- mean(df)
sdf <- sd(df)/sqrt(n) # or you can use sqrt(n-1)*sd(df)/n
critc <- qt(0.975, df = n-1)
c(mdf - critc*sdf, mdf + critc*sdf)

library(boot)
set.seed(123) 

mean.sd <- function(d, ind) {
  mean_d <- mean(d[ind])
  var_d <- var(d[ind])
  c(mean_d, var_d)
}
boot.out <- boot(df, mean.sd, R = 5000)
hist(boot.out$t)
boot.ci(boot.out, type = c("perc", "bca", "stud"))
