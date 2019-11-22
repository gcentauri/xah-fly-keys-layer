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

;;; Code:

(defconst xah-fly-keys-packages
  '(
    xah-fly-keys
    helm
    ivy
    magit
    slime
    )
  )

(defun xah-fly-keys/init-xah-fly-keys ()
  (use-package xah-fly-keys
    ;; :defer t
    :diminish (xah-fly-keys . "∑")
    :init
    (setq xah-fly-use-control-key nil)
    (define-minor-mode xah-fly-keys-command-mode
      "Indicates when command mode is active so `bind-map' can give leader key precedence")

    :config
    (xah-fly-keys-set-layout xah-fly-keys-layout)
    (message "activating xah-fly-keys")
    (add-hook 'xah-fly-command-mode-activate-hook 'xah-fly-keys-command-mode-on)
    (add-hook 'xah-fly-insert-mode-activate-hook  'xah-fly-keys-insert-mode-on)
    (define-key xah-fly-key-map (kbd "M-SPC") 'xah-fly-command-mode-activate)
    (xah-fly-keys 1)
    (xah-fly-keys-command-mode 1)))

(defun xah-fly-keys/post-init-helm ()
  (setq-default
   xah-fly-keys-search-function 'helm-swoop
   xah-fly-keys-M-x-function 'helm-M-x))

(defun xah-fly-keys/post-init-ivy ()
  (setq-default
   xah-fly-keys-search-function 'swiper
   xah-fly-keys-M-x-function 'counsel-M-x))

(defun xah-fly-keys/pre-init-magit ()
  "Switch to insert mode in magit buffers and popups."
  (spacemacs|use-package-add-hook magit
    :post-init
    (progn
      (add-hook 'magit-mode-hook 'xah-fly-insert-mode-activate)
      (add-hook 'magit-popup-mode-hook 'xah-fly-insert-mode-activate)
      )))

(defun xah-fly-keys/post-init-slime ()
    ;; Used to ensure the SPC leader key takes precedence over certain other minor-mode
    ;; bindings (like several slime packages) when xah-fly-keys command mode is active
    ;; I'm not sure if i need to require `bind-map' explicitly, as its part of the Spacemacs
    ;; bootstrapping process?
    (with-eval-after-load 'slime
      (bind-map xah-fly-leader-key-map
        :keys ("SPC")
        :minor-modes (xah-fly-keys-command-mode)
        :override-minor-modes t
        :override-mode-name xah-fly-keys-override-mode)
      (xah-fly-keys-command-mode 1)))

;; packages.el ends here
