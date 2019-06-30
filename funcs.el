(when (configuration-layer/package-usedp 'xah-fly-keys)
  (defun xah-fly-keys-command-mode-on ()
    (global-hl-line-mode 1)
    (set-cursor-color (car xah-fly-keys-command-mode-cursor))
    (setq cursor-type (cdr xah-fly-keys-command-mode-cursor))
    (xah-fly--define-keys
     xah-fly-key-map
     '(
       ("b" . xah-fly-keys-search-function)
       )))

  (defun xah-fly-keys-insert-mode-on ()
    (global-hl-line-mode 0)
    (set-cursor-color (car xah-fly-keys-insert-mode-cursor))
    (setq cursor-type (cdr xah-fly-keys-insert-mode-cursor)))

  (defun xah-fly-keys-search-function ()
    (interactive)
    (cond
     ((configuration-layer/package-usedp 'helm) (helm-swoop))
     ((configuration-layer/package-usedp 'ivy) (swiper))
     (t (isearch-forward))))
  )
