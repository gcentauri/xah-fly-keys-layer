(when (configuration-layer/package-usedp 'xah-fly-keys)
  (defun xah-fly-keys-command-mode-on ()
    (global-hl-line-mode 1)
    (set-cursor-color (car xah-fly-keys-command-mode-cursor))
    (setq cursor-type (cdr xah-fly-keys-command-mode-cursor))
    (xah-fly--define-keys
     xah-fly-key-map
     '(
       ("a" . xah-fly-keys-M-x)
       ("b" . xah-fly-keys-isearch)
       )))

  (defun xah-fly-keys-insert-mode-on ()
    (global-hl-line-mode 0)
    (set-cursor-color (car xah-fly-keys-insert-mode-cursor))
    (setq cursor-type (cdr xah-fly-keys-insert-mode-cursor)))

  (defun xah-fly-keys-isearch ()
    (interactive) (command-execute xah-fly-keys-search-function))

  (defun xah-fly-keys-M-x ()
    (interactive) (command-execute xah-fly-keys-M-x-function)))
