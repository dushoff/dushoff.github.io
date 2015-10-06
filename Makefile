#### dushoff.github.io

### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: phi_notes.pdf 

##################################################################

# make files

Sources = Makefile .gitignore README.md

ms = ../makestuff
-include $(ms)/git.def

######################################################################

Sources += phi_notes.tex
phi_notes.pdf: phi_notes.tex

Ry.pdf: Ry.tex

### Stuff ###

Sources += partition.R
partition.Rout: partition.R

-include $(ms)/local.mk
-include local.mk
-include $(ms)/git.mk

-include $(ms)/visual.mk
-include $(ms)/linux.mk

-include $(ms)/wrapR.mk
-include $(ms)/oldlatex.mk
