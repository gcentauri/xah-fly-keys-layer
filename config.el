;;; config.el --- shell configuration File for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Grant Shangreaux <shshoshin@protonmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Variables

(defvar xah-fly-keys-layout "qwerty"
  "Set to your preferred layout. Possible values are `qwerty', `qwerty-abnt',
`qwertz', `dvorak', `programer-dvorak', `colemak', `colemak-mod-dh', `workman'")

(defvar xah-fly-keys-command-mode-cursor '("deep pink" . box)
  "Set to a '(`COLOR' . `CURSOR-TYPE') pair. Defaults to '(\"deep pink\" . box)")

(defvar xah-fly-keys-insert-mode-cursor '("Dark Turquoise" . bar)
  "Set to a '(`COLOR' . `CURSOR-TYPE') pair. Defaults to '(\"Dark Turquoise\" . bar)")

(defvar xah-fly-keys-search-function 'isearch-forward
  "Set to preferred incremental search command. Uses `helm-swoop' or Ivy's
`swiper' if available.")

(defvar xah-fly-keys-M-x-function 'execute-extended-command
  "Set to preferred M-x function. Uses `helm-M-x' or `counsel-M-x' if available.")
