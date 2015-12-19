day <- 1 # day is the base unit

beta <- 0.5/day
D <- 3*day

S <- 9999
I <- 1
R <- 0
N <- S+I+R

deltaT <- 0.8*day
time <- 0
st <- 1

numSteps <- 100

while(st<numSteps){

	transmission <- beta*S[st]*I[st]/N[st]
	recovery <- I[st]/D

	S[st+1] <- S[st] - transmission*deltaT
	I[st+1] <- I[st] + (transmission-recovery)*deltaT
	R[st+1] <- R[st] + recovery*deltaT

	time[st+1] <- time[st] + deltaT
	st <- st+1
	N[st] = S[st]+I[st]+R[st]
}

sim <- data.frame(time, S, I, R, N)

sim <- within(sim, {
	Reff = beta*D*S/N
})

# rdsave(sim)
