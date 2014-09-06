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

;;; tab size
(setq-default tab.width 4) 

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

;;; font settings
;;; -*- mode: emacs-lisp; coding: utf-8-emacs; -*-

(if (and (locate-library "fontset")
         (fboundp 'add-to-list)
         (fboundp 'display-graphic-p))
    (progn
      (cond
       ((and (string-match "linux-gnu" system-configuration)
             (display-graphic-p))
        (add-to-list 'default-frame-alist '(font . "TakaoGothic-12"))
        (add-to-list 'initial-frame-alist '(font . "TakaoGothic-12"))
        (add-hook 'after-init-hook
                  (lambda () (set-frame-font "TakaoGothic-12"))))
       ((and (string-match "mingw-nt" system-configuration)
             (display-graphic-p))
        (add-to-list 'default-frame-alist '(font . "MS Gothic-12"))
        (add-to-list 'initial-frame-alist '(font . "MS Gothic-12"))
        (add-hook 'after-init-hook
                  (lambda () (set-frame-font "MS Gothic-12"))))
       ((and (string-match "apple-darwin" system-configuration)
             (display-graphic-p))
        (create-fontset-from-ascii-font
         "Menlo-12:weight=normal:slant=normal"
         nil
         "menlokakugo")
        (set-fontset-font
         "fontset-menlokakugo"
         'unicode
         (font-spec :family "Hiragino Kaku Gothic ProN" :size 12)
         nil
         'append)
        (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
        (add-to-list 'initial-frame-alist '(font . "fontset-menlokakugo"))
        (add-to-list 'face-font-rescale-alist 
                     '(".*Hiragino Kaku Gothic ProN.*" . 1.2))
        (add-hook 'after-init-hook
                  (lambda () (set-frame-font "fontset-menlokakugo")))))))

