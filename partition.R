build <- function(vl, last=1, big=0, enough=20){
	ilist <- 1+sort(unique(as.vector(with(vl, outer(v1, v2, FUN="+")))))
	if (length(ilist) < length(vl$v1) * length(vl$v2)) return(NULL)
	missing <- max(which(ilist==1:length(ilist)))
	if(missing>big){
		big <- missing
	}
	if(missing<enough){
		for (curr in (1:2)){
			nl <- vl
			nl[[curr]] <- c(nl[[curr]], missing)
			build(nl, last=3-last, big=big, enough=enough)
		}
	}
	else {
		if(min(max(vl$v1), max(vl$v2) > enough/4))
			print(vl)
	}
}

build(list(v1=c(0), v2=c(0, 1))
	, last=1, big=0, enough=80
)

