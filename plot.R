par(mfrow=c(2, 1))

print(sim)

with(sim, {
	plot(time, I
		, type="l"
	)
	plot(time, Reff, type="l")
	abline(h=1)
})
