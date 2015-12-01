
# g, b are data frames with time and density
# L is a data frame with time, strength and something about hazard

b0fun <- function(g, r){
	step <- with(g, time[[2]]-time[[1]])
	d0 <- with(g, density*exp(-r*time))
	return(with(g, data.frame(time
		, density=d0/sum(step*d0)
	)))
}

# How much does a given r _reduce_ R for distribution g?
r2R <- function(g, r){
	step <- with(g, time[[2]]-time[[1]])
	return(with(g, 1/(step*sum(density*exp(-r*time)))))
}

R2r <- function(g, R){
	step <- with(g, time[[2]]-time[[1]])
	return(uniroot(
		function(r, g){r2R(g, r)-R}
		, interval=c(0, 1/step)
		, g=g
	)$root)
}

# Calculate the arithmetic mean inside the implicit equation for phi
phiBar <- function(b, L, phi){
	step <- with(g, time[[2]]-time[[1]])
	return(with(cbind(b,L), {
		step*sum(density*exp(phi*time)/strength)
	}))
}

phiFun <- function(b, L){
	step <- with(g, time[[2]]-time[[1]])
	return(uniroot(
		function(phi, b, L){phiBar(b, L, phi)-1}
		, interval=c(0, 1/step)
		, b=b, L=L
	)$root)
}

theFun <- function(g, L){
	step <- with(g, time[[2]]-time[[1]])
	return(with(cbind(g, L), {
		1/(step*sum(density/strength))
	}))
}

densPlot <- function(time, k, scen, color="black"){
	with(c(scen), {
		plot(time, k
			, main = disease
			, xlab = paste0("time (", unit, ")")
			, ylab = "Density"
			, type = "l", col=color
		)
	})
}

Rplot <- function(g, R, scen){
	with(g, {
		densPlot(time, R*density, scen)
		densPlot(time, R*density, scen)
		lines(time, density)
	})
}
