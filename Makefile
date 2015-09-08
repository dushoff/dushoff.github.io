#### dushoff.github.io

### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: partition.Rout 

##################################################################

# make files

Sources = Makefile .gitignore

######################################################################

### Stuff ###

Sources += partition.R
partition.Rout: partition.R

ms = ../makestuff

-include $(ms)/local.mk
-include local.mk
-include $(ms)/git.mk

-include $(ms)/visual.mk
-include $(ms)/linux.mk

-include $(ms)/RR.mk
# -include oldlatex.mk
