#### dushoff.github.io

### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: jekyll_update 

##################################################################

# make files

Sources = Makefile .gitignore Gemfile
ms = ../makestuff
-include $(ms)/git.def

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

