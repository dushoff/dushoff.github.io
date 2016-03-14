#### dushoff.github.io

### Hooks for the editor to set the default target

tmp: serve

current: target

target pngtarget pdftarget vtarget acrtarget: ggplotExample.Rout 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
include $(ms)/os.mk
include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.md) updates.html

Sources += $(wildcard materials/*.*)

######################################################################

# Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl

%.post: %.md post.pl
	$(PUSH)
	$(shell_execute)

blog.post: blog.md

######################################################################

# Jekyll

Sources += _config.yml Gemfile
Sources += $(wildcard _includes/* _layouts/* css/* _sass/*)

ggplotExample.Rout: ggplotExample.R

sir.Rout: sir.R

sir.plot.Rout: sir.Rout plot.R
	$(run-R)

Sources += bio.txt

# Accounts

test.sheet = https://docs.google.com/spreadsheets/d/1uTYrqHizf0B8V_s6WWMlyi7de4P5ItTeeBtQmdhvnDU

test.sheet.tsv:

test.sheet.account.txt: test.sheet.tsv 

whiteoak.sheet = https://docs.google.com/spreadsheets/d/1fI9i4Gye_SFg0qbcxlExjCjR_gk3dLgdQaTGts51sNo

whiteoak.sheet.account.txt:

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

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
-include $(ms)/accounts.mk

### Jekyll

jekyll_install:
	bundle install

jekyll_update:
	bundle update github-pages
