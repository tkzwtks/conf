(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; window構成維持する
;; see http://syohex.hatenablog.com/entry/20130904/1378310201
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun my/magit-quit-session ()
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'my/magit-quit-session)

(defadvice git-commit-commit (after move-to-magit-buffer activate)
  (delete-window))
