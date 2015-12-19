#### dushoff.github.io

### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: sir.plot.Rout 

##################################################################

# make files

Sources = Makefile .gitignore Gemfile

gitroot = ../
-include local.mk
ms = $(gitroot)/makestuff
-include $(gitroot)/local.mk

######################################################################

Sources += _layouts/*.html _config.yml

######################################################################

sir.Rout: sir.R

sir.plot.Rout: sir.Rout plot.R
	$(run-R)

### Jekyll

### Lots of linking to /usr/bin/local
### sudo apt-get install nodejs
### gem install jekyll

jekyll_install:
	bundle install

jekyll_update:
	bundle update github-pages

serve:
	bundle exec jekyll serve

######################################################################

# Speed and strength

Sources += phi_notes.tex commands.sty
phi_notes.pdf: phi_notes.tex

Sources += $(wildcard *.R)

EbolaFuns.Rout: EbolaFuns.R
HIVfuns.Rout: HIVfuns.R
kernel.Rout: kernel.R

## Speed and strength talk
hss.Rout: HIVfuns.Rout kernel.Rout hss.R
ess.Rout: EbolaFuns.Rout kernel.Rout ess.R

flat.Rout: hss.Rout flat.R
test.Rout: hss.Rout test.R

test.scen.Rout: HIVscen.R
flat.scen.Rout: HIVscen.R
%.scen.Rout: %.Rout HIVscen.R
	$(run-R)

##################################################################

-include $(ms)/git.mk

-include $(ms)/visual.mk
-include $(ms)/linux.mk

-include $(ms)/wrapR.mk
-include $(ms)/newlatex.mk

