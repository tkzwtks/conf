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
;;(define-key global-map (kbd "C-x b") 'helm-M-x)

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

;; auto-complete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/var/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;; wgrep
(require 'wgerp nil t)

;; multi-term
(when (require 'multi-term nil t)
  (setq multi-term-program "/bin/bash"))

;; for helm
(require 'helm)
(require 'helm-config)
(helm-mode 1)

(defun my-helm ()
  (interactive)
  (helm :sources '(
                   helm-c-source-buffers-list
                   helm-c-source-recentf
                   helm-c-source-files-in-current-dir
                   helm-c-source-mac-spotlight
                   helm-c-source-buffer-not-found)
        :buffer "*my helm*"))

(global-set-key (kbd "C-x b") 'my-helm)
(global-set-key (kbd "M-x") 'helm-M-x)

(setq helm-samewindow nil)
(push '("*helm-M-x*") popwin:special-display-config)

;; emacsの終了時に、履歴を保存する
(remove-hook 'kill-emacs-hook 'helm-c-adaptive-save-history)

;; ディレイは0.2秒
(setq helm-input-idle-delay 0.02)

;; 候補のディレクトリが一つしかない場合に、自動的に展開しない
(setq helm-ff-auto-update-initial-value nil)
