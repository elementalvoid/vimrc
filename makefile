install:
	[ -d bundle/vundle ] || \
		git clone https://github.com/gmarik/vundle.git bundle/vundle && \
	vim -u bundle.vim +BundleInstall +q -c ':q'
	[ -e ~/.vimrc ] || (cd ../; ln -s .vim/personal.vim .vimrc)

update:
	(cd bundle/vundle; git pull)
	vim -u bundle.vim +BundleInstall! +q -c ':q'

clean:
	vim -u bundle.vim +BundleClean! +q -c ':q'

distclean:
	rm -rf bundle
