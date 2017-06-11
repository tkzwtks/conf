(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.psgi$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("cpanfile$" . cperl-mode) auto-mode-alist))

(add-hook 'cperl-mode-hook
            (set-face-bold 'cperl-array-face nil)
            (set-face-bold 'cperl-hash-face nil)
            (set-face-italic 'cperl-hash-face nil))

(add-hook 'cperl-mode-hook
          '(lambda ()
             (progn
               (setq indent-tabs-mode nil)
               (setq tab-width nil))))

(setq cperl-indent-level 4               ; インデント幅を4にする
      cperl-continued-statement-offset 4 ; 継続する文のオフセット
      cperl-brace-offset -4              ; ブレースのオフセット
      cperl-label-offset -4              ; labelのオフセット
      cperl-indent-parens-as-block t     ; 括弧もブロックとしてオフセット
      cperl-close-paren-offset -4        ; 閉じ括弧のオフセット
      cperl-tab-always-indent t          ; TABをインデントにする
      cperl-highlight-variables-indiscriminately t ; scalarを常にハイライト
      cperl-indent-subs-specially nil
      cperl-font-lock t)
