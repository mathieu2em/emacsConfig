(require 'package)
(let* ((proto "https"))
    (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;;(defvar myPackages
;;  '(better-defaults
;;    elpy
;;    flycheck
;;    py-autopep8))

;;(mapc #'(lambda (package)
;;    (unless (package-installed-p package)
;;      (package-install package)))
;;      myPackages)

;;(elpy-enable)

;;(require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;;(when (require 'flycheck nil t)
;;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;  (add-hook 'elpy-mode-hook 'flycheck-mode))


;; auto save parameters------
(require 'auto-save-buffers-enhanced)
(auto-save-buffers-enhanced t)

;;(setq auto-save-buffers-enhanced-include-regexps '(".+"))
(setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.el$"))
;; ---------------------------

(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

(global-set-key (kbd "C-x g") 'magit-status)

(setq make-backup-files nil)

(defun autocompile nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (let ((dotemacs (file-truename user-init-file)))
    (if (string= (buffer-file-name) (file-chase-links dotemacs))
      (byte-compile-file dotemacs))))

(add-hook 'after-save-hook 'autocompile)

(let ((my-auto-save-dir (locate-user-emacs-file "auto-save")))
  (setq auto-save-file-name-transforms
        `((".*" ,(expand-file-name "\\2" my-auto-save-dir) t)))
  (unless (file-exists-p my-auto-save-dir)
    (make-directory my-auto-save-dir)))
(setq auto-save-default t
      auto-save-timeout 10
      auto-save-interval 200)

(show-paren-mode)

(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'nlinum-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'rainbow-identifiers-mode)

(add-hook 'python-mode-hook 'nlinum-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'company-mode)
(add-hook 'python-mode-hook 'rainbow-identifiers-mode)

;; C-M = et C-M - pour grossir ou rapetisser le text
(default-text-scale-mode)

;; go to last change without undoeing
(require 'goto-last-change)
(autoload 'goto-last-change "goto-last-change"
       "Set point to the position of the last change." t)
(global-set-key "\C-x\C-\\" 'goto-last-change)

(require 'buffer-move)

(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; no tabs plz JESUS
(setq-default indent-tabs-mode nil)
(setq tabify nil)

;; Highlight trailing whitespace.
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "yellow")

;; Also show tabs.
(defface extra-whitespace-face
  '((t (:background "pale green")))
  "Color for tabs and such.")

(defvar bad-whitespace
  '(("\t" . 'extra-whitespace-face)))
;; PS: if you want to know why something is displayed in a particular color, put
;; the cursor on it and type C-u C-x =


(require 'doom-modeline)
(doom-modeline-mode 1)

;;(load-file "~/univ/recherche/geiser/elisp/geiser.el")

;;(require 'tramp-term)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-term-color-vector
   [unspecified "#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "#78dce8" "#ab9df2" "#ff6188" "#fcfcfa"] t)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("7f74a3b9a1f5e3d31358b48b8f8a1154aab2534fae82c9e918fb389fca776788" "f30aded97e67a487d30f38a1ac48eddb49fdb06ac01ebeaff39439997cbdd869" "a2286409934b11f2f3b7d89b1eaebb965fd63bc1e0be1c159c02e396afb893c8" "0713580a6845e8075113a70275b3421333cfe7079e48228c52300606fa5ce73b" "0fe9f7a04e7a00ad99ecacc875c8ccb4153204e29d3e57e9669691e6ed8340ce" "66d53738cc824d0bc5b703276975581b8de2b903d6ce366cd62207b5dd6d3d13" "c8f959fb1ea32ddfc0f50db85fea2e7d86b72bb4d106803018be1c3566fd6c72" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "fe76f3d5094967034192f6a505085db8db6deb0e135749d9a54dc488d6d3ee2f" "001c2ff8afde9c3e707a2eb3e810a0a36fb2b466e96377ac95968e7f8930a7c5" "2d392972cbe692ee4ac61dc79907af65051450caf690a8c4d36eb40c1857ba7d" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "728eda145ad16686d4bbb8e50d540563573592013b10c3e2defc493f390f7d83" "018c8326bced5102b4c1b84e1739ba3c7602019c645875459f5e6dfc6b9d9437" "423435c7b0e6c0942f16519fa9e17793da940184a50201a4d932eafe4c94c92d" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "930f7841c24772dda4f22291e510dac1d58813b59dcb9f54ad4f1943ea89cdcd" "37ba833442e0c5155a46df21446cadbe623440ccb6bbd61382eb869a2b9e9bf9" "f951343d4bbe5a90dba0f058de8317ca58a6822faa65d8463b0e751a07ec887c" default)))
 '(geiser-active-implementations (quote (gambit guile racket chicken chez mit chibi)))
 '(geiser-autodoc-delay 0.1)
 '(geiser-debug-jump-to-debug-p t)
 '(geiser-default-implementation (quote gambit))
 '(geiser-log-autoscroll-buffer-p t)
 '(geiser-mode-auto-p t)
 '(geiser-mode-smart-tab-p t)
 '(geiser-mode-start-repl-p t)
 '(geiser-repl-default-port 44555)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-sexp-background-color "#efebe9")
 '(horizontal-scroll-bar-mode t)
 '(inhibit-startup-screen t)
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#fd971f"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#b6e63e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#525254"))
 '(magit-diff-use-overlays nil)
 '(objed-cursor-color "#e74c3c")
 '(package-selected-packages
   (quote
    (goto-last-change evil rainbow-identifiers default-text-scale web-mode buffer-move web php-mode nlinum-hl nlinum auto-complete-clang-async ac-clang flycheck-clang-tidy flycheck-clang-analyzer flycheck auto-complete-clang auto-save-buffers-enhanced company-c-headers markdown-preview-eww markdown-mode+ markdown-mode love-minor-mode company-lua lua-mode flymake-lua magit ac-geiser ssh geiser c-eldoc monokai-theme doom-modeline)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(safe-local-variable-values (quote ((TeX-master . "geiser"))))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
