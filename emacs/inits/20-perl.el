(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
	  (lambda ()
	    (when (require 'auto-complete nil t) ; no error whatever auto-complete.el is not installed.
	      (auto-complete-mode t)
	      (make-variable-buffer-local 'ac-sources)
	      (setq ac-sources
		    '(ac-source-perl-completion)))))

;; インデント
(setq cperl-indent-level 4 ; インデント幅
      cperl-continued-statement-offset 4 ; 継続する文のオフセット
      cperl-brace-offset -4 ; ブレースのオフセット
      cperl-label-offset -4 ; labelのオフセット
      cperl-indent-parens-as-block t ; 括弧もブロックとしてインデント
      cperl-close-paren-offset -4 ; 閉じ括弧のオフセット
      cperl-tab-always-indent t ; TABをインデントにする
      cperl-highlight-variables-indiscriminately t) ; スカラを常にハイライト
