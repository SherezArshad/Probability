#Name:Daniyal Arshad



download.file("http://www.openintro.org/stat/data/bdims.RData", destfile = "bdims.RData")
load("bdims.RData")



#1
fdims <- subset(bdims,bdims$sex == 0)
hist(fdims$hgt, probability = TRUE)
# Data seems to be normally distributed, the histomgram has a single node.


#2
x.vals = seq(min(fdims$hgt), max(fdims$hgt), 0.1)


#3
y.vals = dnorm(x.vals, mean(fdims$hgt), sd(fdims$hgt))

#4
hist(fdims$hgt, probability = TRUE, ylim = c(0, 0.7), breaks = 20)
lines(x.vals, y.vals)

#5
qqnorm(fdims$hgt)
qqline(fdims$hgt)
#The data is in fact normally distributed bvecause it follows the diagonal line and points on a q-q plot should follow a striaght line of the data. 
# The female height is normally distributed. 
#The data at the end is not enough to conclude this da  ... is not normally distributed. 

#6
fdim.height.sample <- rnorm(nrow(fdims), mean(fdims$hgt), sd(fdims$hgt))
qqnorm(fdim.height.sample)
qqline(fdim.height.sample)
#Randomly generated data lies roughly on the straight diagnol of this Q-Q plot.
#Noise at bottom of example is due to nature of random sampling. 




#7
qqnormsim(fdims$hgt)
#The simulated Q-Q plots show us the varaince there is from a straight line from the process of randomly sampling data.
# Height of female is normally distributed. 


#8
qqnormsim(fdims$age)
#age is not normally distributed and weight is


#9
pnorm(182, mean(fdims$hgt), sd(fdims$hgt), lower.tail = FALSE)
#a proporation is a part of the whole

nrow(subset(fdims, hgt > 182)) / nrow(fdims)
#The prediction is close to he observed, the difference may be due to 
#randomness inheret in sampling, or if female height distribution is not normal.


#10
assumption <- qnorm(0.9, mean(fdims$hgt), sd(fdims$hgt))
assumption

nrow(subset(fdims, fdims$hgt > assumption)) / nrow(fdims)




