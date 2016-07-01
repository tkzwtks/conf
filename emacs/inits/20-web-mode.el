(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defvar web-mode-engines-alist
            '(("template-toolkit" . "\\.html?\\'" )))
(setq web-mode-markup-indent-offset 2)
