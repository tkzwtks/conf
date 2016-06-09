(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories (locate-user-emacs-file "dict"))
(setq ac-delay 0.1)
(setq ac-auto-show-menu 0.2)
(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t)          ;; 曖昧マッチ

