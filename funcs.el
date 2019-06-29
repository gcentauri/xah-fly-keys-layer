(when (configuration-layer/package-usedp 'xah-fly-keys)
  (defun xah-fly-keys-command-mode-on ()
    (global-hl-line-mode 1)
    (set-cursor-color "deep pink")
    (setq cursor-type 'box)
    (define-key xah-fly-key-map (kbd "n") 'xah-fly-keys-search-function))

  (defun xah-fly-keys-insert-mode-on ()
    (global-hl-line-mode 0)
    (set-cursor-color "Dark Turquoise")
    (setq cursor-type 'bar))

  (defun xah-fly-keys-search-function ()
    (interactive)
    (cond
     ((configuration-layer/package-usedp 'helm) (helm-swoop))
     ((configuration-layer/package-usedp 'ivy) (swiper))
     (t (isearch-forward))))
  )
