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
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0208
 '("Hiragino Maru Gothic Pro" . "iso10646-1"))
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0212
 '("Hiragino Maru Gothic Pro" . "iso10646-1"))
(set-fontset-font
 (frame-parameter nil 'font)
 'mule-unicode-0100-24ff
 '("monaco" . "iso10646-1"))
(setq face-font-rescale-alist
      '(("^-apple-hiragino.*" . 1.2)
        (".*osaka-bold.*" . 1.2)
        (".*osaka-medium.*" . 1.2)
        (".*courier-bold-.*-mac-roman" . 1.0)
        (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
        (".*monaco-bold-.*-mac-roman" . 0.9)
        ("-cdac$" . 1.3)))

(create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
(set-fontset-font "fontset-menlokakugo"
                  'unicode
                  (font-spec :family "Hiragino Kaku Gothic ProN" :size 16)
                  nil
                  'append)
(add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
