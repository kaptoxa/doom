;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq gnutls-verify-error t)
(setq tls-program '("gnutls-cli --x509cafile /etc/ssl/certs/ca-certificates.crt -p %p %h"))

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(setq my/config-dir (concat (getenv "HOME") "/.config/doom"))

(defun my/make-config-filename (filename)
  (concat my/config-dir "/" filename))

(defun my/org-babel-load-file (base-filename-without-org)
  (let ((org-filename (concat (my/make-config-filename base-filename-without-org) ".org"))
        (el-filename (concat (my/make-config-filename base-filename-without-org) ".el")))
    (if (file-newer-than-file-p org-filename el-filename)
        (org-babel-load-file org-filename)
      (load-file el-filename))))

(my/org-babel-load-file "literate-config")
(my/org-babel-load-file "aragaers-tweaks")
(my/org-babel-load-file "rasendubi-slip-boxes")

;; После загрузки темы явно настройте лица заголовков
;;(add-hook! 'after-load-theme-hook
;;  (defun my/fix-header-faces ()
;;    "Исправляет фон заголовков после загрузки темы."
;; Пример для Org-mode
;;    (set-face-attribute 'org-level-1 nil :background nil :inherit 'bold)
;;    (set-face-attribute 'org-level-2 nil :background nil :inherit 'bold)
;;    (set-face-attribute 'org-level-3 nil :background nil :inherit 'bold)
;;    (set-face-attribute 'org-document-title nil :background nil :height 1.5)
;; Пример для Markdown-mode
;;    (when (facep 'markdown-header-face-1)
;;      (set-face-attribute 'markdown-header-face-1 nil :background nil))
;; Добавьте другие режимы по необходимости
;;    ))

;; Вызов функции сразу после настройки, если тема уже загружена
;;(when (and (boundp 'custom-enabled-themes) custom-enabled-themes)
;;  (my/fix-header-faces))
