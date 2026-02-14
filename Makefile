all: pan

pan:
	pandoc docs/slides.md \
	    --pdf-engine=xelatex \
        --template=styles/template.latex \
        -t beamer \
 		-o presentazione.pdf 
	pandoc docs/discorso/discorsi_slides.md --pdf-engine=xelatex -o discorsi_slides.pdf

open:
	open *.pdf
sync:
	git add .
	git commit -m "."
	git pull --no-edit --quiet
	git push

.PHONY: sync pan
