#### dushoff.github.io

### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: jekyll_install 

##################################################################

# make files

Sources = Makefile .gitignore Gemfile

######################################################################

### Jekyll

jekyll_install:
	bundle install

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

-include $(ms)/wrapR.mk
# -include oldlatex.mk
