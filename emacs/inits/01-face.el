;; テーマ
(load-theme 'tango-dark)

;; フォント
;; ascii
(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 160)

;; 日本語
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Hiragino Kaku Gothic Pro"))

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

;; メニューバー非表示
(menu-bar-mode 0)

;; ツールバー非表示
(tool-bar-mode 0)

;; スクロールバー非表示
(scroll-bar-mode 0)
