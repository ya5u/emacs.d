(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-evil monitor evil-magit neotree magit smex ido-vertical-mode evil-escape zenburn-theme evil-leader evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'zenburn t)

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
            (define-key evil-normal-state-local-map (kbd "n") 'neotree-next-line)
            (define-key evil-normal-state-local-map (kbd "p") 'neotree-previous-line)
            (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
            (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
            (define-key evil-normal-state-local-map (kbd "h") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "r") 'neotree-rename-node)
            (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
            (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)))

(require 'neotree)
(setq neo-window-position 'right
      neo-smart-open t
      projectile-switch-project-action 'neotree-projectile-action)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(ido-everywhere 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only
      ido-enable-flex-matching t
      )

;;(setq evil-insert-state-cursor '((bar . 5) "yellow")
(setq evil-want-C-u-scroll t
      evil-search-module 'evil-search
      evil-ex-search-vim-style-regexp t)
(show-paren-mode t)

(global-evil-leader-mode)
(require 'evil-leader)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "<SPC>" 'smex
  "bb" 'ido-switch-buffer
  "bd" 'evil-delete-buffer
  "ff" 'ido-find-file
  "fs" 'save-buffer
  "ft" 'neotree-toggle
  "gs" 'magit-status
  "qq" 'save-buffers-kill-terminal
  "ww" 'evil-window-next
  "wh" 'evil-window-left
  "wj" 'evil-window-down
  "wk" 'evil-window-up
  "wl" 'evil-window-right
  )

(evil-escape-mode t)

(require 'evil)
(evil-mode 1)

(setq evil-magit-state 'normal
      evil-magit-use-y-for-yank nil
      )
(require 'evil-magit)
(require 'org-evil)
