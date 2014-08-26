;;; init.el
;;; update : 2014.08.26
;;; author : dulkappa

;;; add load-path
(setq load-path (append
                 '("~/.emacs.d")
                 load-path))

;;; japanese setting
(set-locale-environment nil)

;;; auto-image-file-mode
(auto-image-file-mode t)

;;; hide menu-bar and tool-bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;;; output all result of eval
(setq eval-expression-print-length nil)

;;; paren configure
(show-paren-mode 1)
(setq show-paren-style 'mixed)

;;; line configure
(line-number-mode t)

;;; no make backup file
(setq backup-inhibited t)

;;; auto-complete
(icomplete-mode 1)

;;; show function name
(which-function-mode 1)
