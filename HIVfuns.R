# Units are months
# Units of g are 1/month, so Sum{step*g) should be 1

testingFun <- function(maxRate
	, hMean=12, hShape=2, hheight=4
	, step = 0.25, window=150
){
	time <- seq(step, window, by=step)
	tHaz0 <- dgamma(time, shape=hShape, scale=hMean/hShape)
	tHaz <- hheight*tHaz0/max(tHaz0)
	hazRate <- maxRate*(1-exp(-tHaz))
	Haz <- step*cumsum(hazRate)
	return(data.frame(time
		, hazRate
		, strength = exp(Haz)
	))
}

flatFun <- function(L
	, step = 0.25, window=150
){
	time <- seq(step, window, by=step)
	hazRate <- 0*time
	return(data.frame(time
		, hazRate
		, strength = hazRate+L
	))
}

HIVgen <- function(earlyProp
	, earlyMean=2.5, earlyShape=3
	, lateMean=100, lateShape=2
	, step = 0.25, window=150
){
	time <- seq(step, window, by=step)
	d0 <- (
		earlyProp*dgamma(time, shape=earlyShape, scale=earlyMean/earlyShape)
		+ (1-earlyProp)*dgamma(time, shape=lateShape, scale=lateMean/lateShape)
	)
	return(data.frame(time
		, density=d0/sum(step*d0)
	))
}

