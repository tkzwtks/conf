(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.psgi$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("cpanfile$" . cperl-mode) auto-mode-alist))

;; perl-completion
(require 'perl-completion)
(add-hook 'cperl-mode-hook
          (lambda()
            (perl-completion-mode t)))

(add-hook 'cperl-mode-hook (lambda ()
   (when (require 'auto-complete nil t) ; no error whatever auto-complete.el is not installed.
     (auto-complete-mode t)
     (make-variable-buffer-local 'ac-sources)
     (setq ac-sources '(ac-source-perl-complatetion)))))

(setq cperl-indent-level 4)
(defvar cperl-continued-statement-offset 4)
(defvar cperl-close-paren-offset -4)
(defvar cperl-comment-column 40)
(defvar cperl-highlight-variables-indiscriminately t)
(defvar cperl-indent-parens-as-block t)
(defvar cperl-label-offset -4)
(defvar cperl-tab-always-indent nil)
(defvar cperl-font-lock t)

(add-hook 'cperl-mode-hook
          (lambda ()
            (progn
              (setq indent-tabs-mode nil)
              (setq tab-width nil))
            (set-face-bold 'cperl-array-face nil)
            (set-face-bold 'cperl-hash-face nil)
            (set-face-italic 'cperl-hash-face nil)))
