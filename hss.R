earlyProp=1/3
r = 1/18

g <- HIVgen(earlyProp=1/3)
b0 <- b0fun(g, r)

print(Reff <- r2R(g, r))
print(R2r(g, Reff))

LH <- testingFun(1/6)
with(LH, {
	plot(time, strength, type="l")
	plot(time, hazRate, type="l")
})

epRange <- seq(0.1, 0.3, length.out=6)

sapply(epRange, function(ep){
	g <- HIVgen(earlyProp=ep)
	b0 <- b0fun(g, r)
	the <- theFun(g, LH)
	phi <- phiFun(b0, LH)
	return(c(the, phi))
})

# with(b0, plot(time, density, col="blue", type="l"))
# with(g, lines(time, density, col="black"))

