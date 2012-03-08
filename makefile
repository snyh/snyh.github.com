build:
	jekyll --no-server

commit: build
	rsync -q -acvrz --exclude .git --delete _site/ _compiled/
	cd _compiled && git add . && git commit -am `date +%F_%H-%M_%s`; 

