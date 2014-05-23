
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

(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)


; Autocomplete
(add-to-list 'load-path "/Users/tleyden/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/tleyden/.emacs.d//ac-dict")
(ac-config-default)

; Gocode Autocomplete
(require 'go-autocomplete)
(require 'auto-complete-config)