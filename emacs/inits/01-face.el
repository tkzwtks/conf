;; テーマ
(load-theme 'tango-dark t)

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
     (:background "DarkOliveGreen" t))
    (((class color) (background light))
     (:background "NavyBlue" t))
    (t (:bold t)))
    "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; tabの扱い
(setq-default indent-tabs-mode nil)

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

;; タイトルバーにフルパスを表示
(setq frame-title-format "%f")

;; whitespace
;; http://qiita.com/itiut@github/items/4d74da2412a29ef59c3a
(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         ;tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; 保存前に自動でクリーンアップ
(setq whitespace-action '(auto-cleanup))

(global-whitespace-mode 1)

(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)

;; whitespace-modeを適用しない
(add-hook 'markdown-mode-hook
          '(lambda ()
             (set (make-local-variable 'whitespace-action) nil)))
;; golangではgofmt使うのでwhitespace-modeを適用しない
(add-hook 'go-mode-hook
          '(lambda ()
             (set (make-local-variable 'whitespace-action) nil)))

(setq-default tab-width 4
