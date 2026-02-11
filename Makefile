all: pan

pan:
	pandoc docs/slides.md \
	    --pdf-engine=xelatex \
        --template=styles/template.latex \
        -t beamer \
 		-o presentazione.pdf 
	pandoc docs/discorso/discorsi_slides.md -o discorsi_slides.pdf
	
sync:
	git add .
	git commit -m "."
	git pull --quiet
	git push

.PHONY: sync pan
