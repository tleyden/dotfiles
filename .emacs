; Color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/color-themes")
(load-theme 'taming-mr-arneson t)

; Melpa package manager
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

; Go Mode
(add-to-list 'load-path "~/Misc/emacs/go-mode.el/")
(require 'go-mode-load)

; Apparently needed so that the EmacsForOsx can find godoc binary
(setenv "PATH" "/Users/tleyden/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/go/bin")

; Needed so that EmacsForOsx godoc can find gocode
(setenv "GOPATH" "/Users/tleyden/Development/gocode")

; Needed so that EmacsForOsx can find gofmt
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/Users/tleyden/Development/gocode/bin")

; Go Oracle
(load-file "$GOPATH/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
  ; Go Oracle
  (go-oracle-mode)
(add-hook 'go-mode-hook 'my-go-mode-hook)


; Autocomplete
(add-to-list 'load-path "/Users/tleyden/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/tleyden/.emacs.d//ac-dict")
(ac-config-default)

; Gocode Autocomplete
(require 'go-autocomplete)
(require 'auto-complete-config)

; Stop scroll beeping (http://bit.ly/1uxRki6)
(setq ring-bell-function #'ignore)

; Line numbers
; Commented because it seems to have issues w/ terminal emacs
; (global-linum-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("17a8fa9430ffd81f242ed3ee95e59629ccf9e1210657536013a0def9b16e68c9" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
