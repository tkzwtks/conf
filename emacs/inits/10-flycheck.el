(require 'flycheck)
(setq flycheck-check-syntax-automatically '(mode-enabled new-line))

;; for perl
;; see http://m0t0k1ch1st0ry.com/blog/2014/07/07/flycheck/
(flycheck-define-checker perl-project-libs
  "A perl syntax checker."
  :command ("perl"
            "-MProject::Libs lib_dirs => [qw(local/lib/perl5), glob(qw(modules/*/lib)), glob(qw(lib)), glob(qw(t/*/lib))]"
            "-wc"
            source-inplace)
  :error-patterns ((error line-start
                          (minimal-match (message))
                          " at " (file-name) " line " line
                          (or "." (and ", " (zero-or-more not-newline)))
                          line-end))
  :modes (cperl-mode))

;;(add-hook 'cperl-mode-hook
;;          (lambda ()
;;            (flycheck-mode t)
;;            (setq flycheck-checker 'perl-project-libs)))
