# dotfiles

	cd ~/.emacs.d/elisp/
	wget http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
	wget http://www.emacswiki.org/emacs/download/auto-install.el

	M-x package-install auto-complete
	M-x package-install haml-mode
	M-x package-install sass-mode
        M-x package-install js2-mode
	M-x auto-install-batch anything-minimal
	M-x auto-install-from-emacswiki anything-grep.el
