;; テーマ
(load-theme 'tango-dark)

;; 行強調
(defface my-hl-line-face
  '((((class color) (background dark))
     (:background "NavyBlue" t))
    (((class color) (background light))
     (:background "LightGoldenrodYellow" t))
    (t (:bold t)))
    "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; paren-mode
(setq show-paren-delay 0);
(show-paren-mode t)
;; parenのスタイル
(setq show-paren-style 'expression)
;; paren-mode向け フェイス変更
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")
