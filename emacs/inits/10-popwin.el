(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-height 0.3)

(push '("helm" :regexp t :height 0.3) popwin:special-display-config)
