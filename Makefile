install:
	[ -d bundle/vundle ] || \
		git clone https://github.com/gmarik/vundle.git bundle/vundle && \
		(cd bundle/vundle; git pull)
	vim -u bundle.vim +BundleInstall +q -c ':q'

update:
	vim -u bundle.vim +BundleInstall! +q -c ':q'

clean:
	vim -u bundle.vim +BundleClean! +q -c ':q'

distclean:
	rm -rf bundle
