;;; custom.el --- Summary

;;; Commentary:
;;; wgrose's personal configs.
;;; Code:

(disable-theme 'zenburn)
(setq prelude-theme 'solarized-dark)

(setq guru-warn-only nil)

(setq dired-dwim-target t)

;; Projectile slow since it's scanning files.
(setq projectile-mode-line
      '(:eval (format " Projectile[%s]"
                      (projectile-project-name))))

(prelude-require-package 'yasnippet)
(yas-global-mode +1)

(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes
                '("\\.zip\\'" ".zip" "unzip")))

(eval-after-load "dired"
  '(define-key dired-mode-map "z" 'dired-zip-files))
(defun dired-zip-files (zip-file)
  "Create an archive containing the marked files."
  (interactive "sEnter name of zip file: ")

  ;; create the zip file
  (let ((zip-file (if (string-match ".zip$" zip-file) zip-file
                    (concat zip-file ".zip"))))
    (shell-command
     (concat "zip "
             zip-file
             " "
             (concat-string-list
              (mapcar
               #'(lambda (filename)
                   (file-name-nondirectory filename))
               (dired-get-marked-files))))))

  (revert-buffer)

  ;; remove the mark on all the files  "*" to " "
  ;; (dired-change-marks 42 ?\040)
  ;; mark zip file
  ;; (dired-mark-files-regexp (filename-to-regexp zip-file))
  )

(defun concat-string-list (list)
  "Concatenates all list elements into a string separated by spaces"
  (mapconcat #'(lambda (obj) (format "%s" obj)) list " "))

(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\M-%" 'query-replace-regexp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(c-basic-offset 2)
 '(comment-fill-column nil)
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(erc-email-userid "wgrose@google.com")
 '(erc-networks-alist (quote ((Google "corp.google.com"))))
 '(erc-nick "wgrose")
 '(erc-port 6697)
 '(erc-prompt-for-password nil)
 '(erc-server "irc.corp.google.com")
 '(erc-server-alist (quote (("Google" Google "irc.corp.google.com" 6697))))
 '(erc-user-full-name "William Grose")
 '(fci-rule-color "#383838")
 '(fill-column 80)
 '(flycheck-disabled-checkers (quote (javascript-gjslint)))
 '(js-indent-level 2)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (zop-to-char zenburn-theme which-key web-mode web-beautify volatile-highlights undo-tree tide solarized-theme smex smartrep smartparens smart-mode-line rainbow-mode rainbow-delimiters protobuf-mode ov operate-on-number move-text magit key-chord json-mode js2-mode imenu-anywhere ido-ubiquitous highlight-escape-sequences helm-projectile helm-descbinds helm-ag haskell-mode guru-mode grizzl gotest god-mode go-projectile gitignore-mode gitconfig-mode git-timemachine gist geiser flx-ido expand-region elisp-slime-nav easy-kill discover-my-major diminish diff-hl d-mode company-go company-anaconda cl-generic browse-kill-ring beacon anzu ag ace-window)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(typescript-indent-level 2)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-file
 "/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs/google.el")

(require 'p4-google)                ;; g4-annotate, improves find-file-at-point
(require 'compilation-colorization) ;; colorizes output of (i)grep
;;(require 'rotate-clients)           ;; google-rotate-client
;;(require 'rotate-among-files)       ;; google-rotate-among-files
;;(require 'googlemenu)               ;; handy Google menu bar
(require 'p4-files)                 ;; transparent support for Perforce filesystem
(require 'google3)                  ;; magically set paths for compiling google3 code
(require 'google3-build)            ;; support for blaze builds
(require 'csearch)                  ;; Search the whole Google code base.
(require 'google-tricorder)                  ;; Search the whole Google code base.
;;(require 'google-jswat)
(require 'google-cc-extras)
(google-cc-extras/bind-default-keys)
(with-eval-after-load 'flycheck
  (flycheck-add-mode 'google-tricorder 'js2-mode))

;;/usr/share/emacs/site-lisp/emacs-google-config/devtools/editors/emacs/jswat/google-jswat.el

(add-hook 'protobuf-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-set-c-style)

;; Use dirtrack by prompt mode since shell-dirtrack can't follow citc.
(add-hook 'shell-mode-hook
          '(lambda()
             (toggle-truncate-lines 1)
             (protect-process-buffer-from-kill-mode 1)
             (dirtrack-mode 1)
             (setq dirtrack-list '("wgrose@wgrose.lax:\\(.*\\)\\$" 1 t))
             ))

(provide 'custom)
;;; custom.el ends here
