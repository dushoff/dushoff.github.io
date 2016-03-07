library(tidyr)
library(dplyr)
library(ggplot2)

first<- 0
last<- pi

x<-seq(first,last,by=(last-first)/100)
col.pal<-c('darkorchid1','forestgreen')
labs<-c("sin(x)","cos(x)")

df<-data.frame(x=x,sin=sin(x),cos=cos(x))
maxvals<-sapply(df[,c(2,3)],max)

df<- df %>% gather(key=Func,value=FuncVal,-x)
print(
	ggplot(df,aes(x=x,y=FuncVal))
	+ geom_line(aes(color=Func),size=1)
	+ scale_color_manual("Function", 
			labels=labs,
			values=col.pal
		)
	+ geom_hline(yintercept=maxvals,colour=col.pal,linetype='dashed')
)

