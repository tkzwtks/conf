;;; ロードパスの追加
(setq load-path (append
                 '("~/.emacs.d")
                 load-path));;; パッケージ管理

;; ime
(setq default-input-method "MacOSX")

;;; above 24.x
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/")t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (wheatgrass))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; フォントセットを作る
(let* ((fontset-name "myfonts") ; フォントセットの名前
       (size 14) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
       (asciifont "Ricty") ; ASCIIフォント
       (jpfont "Hiragino Maru Gothic ProN") ; 日本語フォント
       (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
       (fontspec (font-spec :family asciifont))
       (jp-fontspec (font-spec :family jpfont)) 
       (fsn (create-fontset-from-ascii-font font nil fontset-name)))
  (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
  (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; 半角カナ
  (set-fontset-font fsn '(#x0080 . #x024F) fontspec) ; 分音符付きラテン
  (set-fontset-font fsn '(#x0370 . #x03FF) fontspec) ; ギリシャ文字
  )

(add-to-list 'default-frame-alist '(font . "fontset-myfonts"))

;; フォントサイズの比を設定
(dolist (elt '(("^-apple-hiragino.*" . 1.2)
               (".*osaka-bold.*" . 1.2)
               (".*osaka-medium.*" . 1.2)
               (".*courier-bold-.*-mac-roman" . 1.0)
               (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
               (".*monaco-bold-.*-mac-roman" . 0.9)))
  (add-to-list 'face-font-rescale-alist elt))

;; デフォルトのフレームパラメータでフォントセットを指定
;; # これは起動時に default-frame-alist に従ったフレームが
;; # 作成されない現象への対処
(set-face-font 'default "fontset-myfonts")

;;; バックアップファイルを作らない
(setq backup-inhibited t)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; 半透明
(set-frame-parameter nil 'alpha 90)

;;; C-mにnewline-and-indentを割り当てる
(define-key global-map (kbd "C-m") 'newline-and-indent)

;;; C-tにother-windowを割り当てる
(define-key global-map (kbd "C-t") 'other-window)

;;; C-bにanythingを割り当てる
(define-key global-map (kbd "C-x b") 'anything)

;;; カラム番号も表示
(column-number-mode t)

;;; ファイルサイズを表示
(size-indication-mode t)

;;; 時計を表示
(setq display-time-day-and-date t)
(display-time-mode t)

;;; バッテリー残量を表示
(display-battery-mode t)

;; TAB表示幅指定
(setq-default tab-width 4)

;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)

;; anything
(when (require 'anything nil t)
  (setq
   ;; 候補表示までの時間
   anything-idle-delay 0.3
   ;; タイプして再描写するまでの時間
   anything-input-idle-delay 0.2
   ;; 候補の最大表示数。デフォルトは50
   anything-candidate-number-limit 100
   ;; 候補が多い時に体感速度を早くする
   anything-quick-update t
   ;; 候補選択ショートカットをアルファベットに
   anything-enable-shortcuts 'alphabet)

  (require 'anything-match-plugin nil t)
  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (require 'anything-migemo nil t))

  (require 'anything-complete nil t)

  (require 'anything-show-completion nil t)

  (when (require 'auto-install nil t)
    (require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
    ;; describe-bindingsをAnythingに置き換える
    (descbinds-anything-install)))

;; auto-complete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/var/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;; wgrep
(require 'wgerp nil t)

;; undo-tree
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; multi-term
(when (require 'multi-term nil t)
  (setq multi-term-program "/bin/bash"))
