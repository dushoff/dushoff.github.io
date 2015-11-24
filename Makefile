#### dushoff.github.io

### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: phi_notes.pdf 

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

Sources += phi_notes.tex commands.sty
phi_notes.pdf: phi_notes.tex

### Stuff ###

Sources += partition.R
partition.Rout: partition.R

-include $(ms)/git.mk

-include $(ms)/visual.mk
-include $(ms)/linux.mk

-include $(ms)/wrapR.mk
-include $(ms)/newlatex.mk

