;;; packages.el --- xah-fly-keys layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Grant Shangreaux <shshoshin@protonmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `xah-fly-keys-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `xah-fly-keys/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `xah-fly-keys/pre-init-PACKAGE' and/or
;;   `xah-fly-keys/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst xah-fly-keys-packages
  '(
    xah-fly-keys
    magit
    )
  )


(defun xah-fly-keys/init-xah-fly-keys ()
  (use-package xah-fly-keys
    ;; :defer t
    :diminish (xah-fly-keys . "∑")
    :init
    (setq xah-fly-use-control-key nil)

    :config
    (xah-fly-keys-set-layout xah-fly-keys-layout)
    (message "activating xah-fly-keys")
    (add-hook 'xah-fly-command-mode-activate-hook 'xah-fly-keys-command-mode-on)
    (add-hook 'xah-fly-insert-mode-activate-hook  'xah-fly-keys-insert-mode-on)
    (define-key xah-fly-key-map (kbd "M-SPC") 'xah-fly-command-mode-activate)
    (xah-fly-keys 1)
    )
  )

(defun xah-fly-keys/pre-init-magit ()
  "Switch to insert mode in magit buffers and popups."
  (spacemacs|use-package-add-hook magit
    :post-init
    (progn
      (add-hook 'magit-mode-hook 'xah-fly-insert-mode-activate)
      (add-hook 'magit-popup-mode-hook 'xah-fly-insert-mode-activate)
      )
    ))

;; packages.el ends here
