;; helm関連設定
(el-get-bundle helm)
(el-get-bundle helm-ls-git)
(el-get-bundle helm-ag)

(require 'helm-mode)

(custom-set-variables
 '(helm-mini-default-sources '(helm-source-buffers-list
                               helm-source-recentf
                               helm-source-files-in-current-dir
                               )))

(define-key global-map (kbd "C-x b") 'helm-mini)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "M-x") 'helm-M-x)
