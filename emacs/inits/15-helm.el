;; helm関連設定
(require 'helm-mode)
(require 'helm-ls-git)

(custom-set-variables
 '(helm-mini-default-sources '(helm-source-buffers-list
                               helm-source-recentf
                               helm-source-files-in-current-dir
                               )))

(setq helm-samewindow nil)
(define-key global-map (kbd "C-x b") 'helm-mini)

;; helm-find-files使う。TABで補完する。
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "M-x") 'helm-M-x)
