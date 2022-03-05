##Summary.txt : for any changes in .xml files in data-shell/data/elements/ run complexscript.sh which will output a Summary.txt file.
Summary.txt : $(wildcard /home/data-shell/data/elements/*.xml)
	bash complexscript.sh

.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
