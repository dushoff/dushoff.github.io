par(cex=1.6)
earlyProp=1/3
r = 1/18
maxRate <- 1/6
epRange <- seq(0.1, 0.3, length.out=6)

g <- HIVgen(earlyProp=mean(epRange))
b0 <- b0fun(g, r)

print(Reff <- r2R(g, r))
print(R2r(g, Reff))

LH <- testingFun(maxRate)

dualPlot <- function(time, interv, intname, gen, stat, dtype){
	with(LH, {
		op <- par(mfrow=c(2, 1)
			, oma = c(0,0,0,0) + 0.1
			, mar = c(0,4,1,1) + 0.1
		)
		plot(time, interv, type="l"
			, axes=FALSE, xlab="", ylab=intname
		)
		axis(2)
		abline(h=stat, col="blue")
		par(mar = c(5,4,1,1) + 0.1)
		with(gen, plot(time, density, type="l", main=dtype))
		par(op)
	})
}

hivAlt <- as.data.frame(t(sapply(epRange, function(ep){
	g <- HIVgen(earlyProp=ep)
	b0 <- b0fun(g, r)
	R <- r2R(g, r)
	the <- theFun(g, LH)
	phi <- phiFun(b0, LH)

	if((ep==min(epRange)) | (ep==max(epRange))){
		with(LH, {
			dualPlot(time, interv=strength
				, intname="strength", gen=g
				, stat=the, dtype="Intrinsic"
			)
			dualPlot(time, interv=hazRate
				, intname="Hazard rate", gen=b0
				, stat=phi, dtype="Intrinsic"
			)
		})
	}
	return(c(ep, r, R, the, phi))
})))
names(hivAlt) <- c("ep", "r", "R", "the", "phi")

with(hivAlt, {
	plot(ep, the
		, xlab = "Early Proportion"
		, ylab = "Strength"
		, ylim = c(0, max(the))
		, type = "b", col="blue"
	)
	lines(ep, R, type="b")
})

with(hivAlt, {
	plot(ep, phi
		, xlab = "Early Proportion"
		, ylab = "Speed"
		, ylim = c(0, max(phi))
		, type = "l", col="blue"
	)
	lines(ep, r, type="b")
})

