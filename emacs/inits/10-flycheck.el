(require 'flycheck)
(setq flycheck-check-syntax-automatically '(mode-enabled new-line))

(add-hook 'cperl-mode-hook 'flycheck-mode)
