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
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(c-basic-offset 2) '(comment-fill-column nil)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-error-regexp-alist
   '(google3-build-log-parser-info google3-build-log-parser-warning google3-build-log-parser-error google3-build-log-parser-python-traceback google-go-cgo google-blaze-error google-blaze-warning google-log-error google-log-warning google-log-info google-log-fatal-message google-forge-python gunit-stack-trace absoft ada aix ant bash borland python-tracebacks-and-caml cmake cmake-info comma cucumber msft edg-1 edg-2 epc ftnchek gradle-kotlin iar ibm irix java jikes-file maven jikes-line clang-include clang-include gcc-include ruby-Test::Unit gmake gnu lcc makepp mips-1 mips-2 omake oracle perl php rxp sparc-pascal-file sparc-pascal-line sparc-pascal-example sun sun-ada watcom 4bsd gcov-file gcov-header gcov-nomark gcov-called-line gcov-never-called perl--Pod::Checker perl--Test perl--Test2 perl--Test::Harness weblint guile-file guile-line))
 '(custom-enabled-themes '(subtle-hacker))
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "f5b6be56c9de9fd8bdd42e0c05fecb002dedb8f48a5f00e769370e4517dde0e8" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "c4cecd97a6b30d129971302fd8298c2ff56189db0a94570e7238bc95f9389cfb" "abd7719fd9255fcd64f631664390e2eb89768a290ee082a9f0520c5f12a660a8" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))
 '(erc-email-userid "wgrose@google.com")
 '(erc-networks-alist '((Google "corp.google.com")))
 '(erc-nick "wgrose")
 '(erc-port 6697)
 '(erc-prompt-for-password nil)
 '(erc-server "irc.corp.google.com")
 '(erc-server-alist '(("Google" Google "irc.corp.google.com" 6697)))
 '(erc-user-full-name "William Grose")
 '(fci-rule-color "#383838")
 '(fill-column 80)
 '(flycheck-disabled-checkers '(javascript-gjslint))
 '(js-indent-level 2)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(monky zop-to-char zenburn-theme which-key web-mode web-beautify volatile-highlights undo-tree tide solarized-theme smex smartrep smartparens smart-mode-line rainbow-mode rainbow-delimiters protobuf-mode ov operate-on-number move-text magit key-chord json-mode js2-mode imenu-anywhere ido-ubiquitous highlight-escape-sequences helm-projectile helm-descbinds helm-ag haskell-mode guru-mode grizzl gotest god-mode go-projectile gitignore-mode gitconfig-mode git-timemachine gist geiser flx-ido expand-region elisp-slime-nav easy-kill discover-my-major diminish diff-hl d-mode company-go company-anaconda cl-generic browse-kill-ring beacon anzu ag ace-window))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(typescript-indent-level 2)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
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
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )p

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
;;(add-hook 'shell-mode-hook
;;          '(lambda()
;;             (toggle-truncate-lines 1)
;;             (protect-process-buffer-from-kill-mode 1)
;;             (dirtrack-mode 1)
;;             (setq dirtrack-list '("wgrose@wgrose.[a-z]+:\\(.*\\)\\$" 1 t))
;;             ))

(defun shell-procfs-dirtrack (str)
  (prog1 str
    (when (string-match comint-prompt-regexp str)
      (let ((directory (file-symlink-p
                        (format "/proc/%s/cwd"
                                (process-id
                                 (get-buffer-process
                                  (current-buffer)))))))
        (when (file-directory-p directory)
          (cd directory))))))

(define-minor-mode shell-procfs-dirtrack-mode
  "Track shell directory by inspecting procfs."
  nil nil nil
  (cond (shell-procfs-dirtrack-mode
         (when (bound-and-true-p shell-dirtrack-mode)
           (shell-dirtrack-mode 0))
         (when (bound-and-true-p dirtrack-mode)
           (dirtrack-mode 0))
         (add-hook 'comint-preoutput-filter-functions
                   'shell-procfs-dirtrack nil t))
        (t
         (remove-hook 'comint-preoutput-filter-functions
                      'shell-procfs-dirtrack t))))

(provide 'custom)
;;; custom.el ends here
