;;; init.el
;;; update : 2015.01.01
;;; author : dulkappa

;;; add load-path
(setq load-path (append
                 '("~/.emacs.d")
                 load-path))

;;; package managements configure
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; auto-complete
(add-hook 'emacs-lisp-mode-hook '(lambda () 
				   (require 'auto-complete) 
				   (auto-complete-mode t)
				   ))
(require 'auto-complete-config)
(ac-config-default)

;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq markdown-command-needs-filename t)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; jade-mode
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\.jade$" . jade-mode))

;; php-mode
(load "php-mode")

;;; web-mode
(require 'web-mode)
;; 拡張子の設定
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
;; インデント関係
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   4)
  (setq web-mode-css-offset    4)
  (setq web-mode-script-offset 4)
  (setq web-mode-php-offset    4)
  (setq web-mode-java-offset   4)
  (setq web-mode-asp-offset    4)
  (setq indent-tabs-mode t)
  (setq tab-width 4))
(add-hook 'web-mode-hook 'web-mode-hook)

;; auto-complete setting
(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
(add-to-list 'ac-modes 'web-mode)

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

