;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

;; optional. makes unpure packages archives unavailable
(setf package-archives nil)

(setf package-enable-at-startup nil)
(package-initialize)

(org-babel-load-file "~/.emacs.d/readme.org")
