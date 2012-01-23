all:
	[ -d bundle/vundle ] || \
		git clone https://github.com/gmarik/vundle.git bundle/vundle && \
		(cd bundle/vundle; git pull)
	vim -u bundles.vim +BundleInstall +q
