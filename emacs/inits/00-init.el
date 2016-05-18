(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

(column-number-mode t)

(setq display-time-day-and-date t)
(display-time-mode t)
(display-battery-mode t)

;; バックアップファイルをtmp以下に置く
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
;; オートセーブファイルをtmp以下に置く
(setq auto-save-file-name-transforms
      `((".*", temporary-file-directory t)))

;; バッファ自動再読み込み
(global-auto-revert-mode 1)

