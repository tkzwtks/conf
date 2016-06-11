(require 'git-gutter)

(global-git-gutter-mode +1)

;; live update
(custom-set-variables
 '(git-gutter:update-interval 2))
