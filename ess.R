
r <- 1/24
bProp <- 0.25

g <- EbolaGen(bProp=bProp)
R <- r2R(g, r=r)
scen <- list(disease="Ebola", unit="days")

Rplot(g, R, scen)


