;;; Keybindings to get tmux and emacs to play well with each other


(evil-define-key 'normal python-mode-map (kbd "C-k")
'(lambda () (interactive) (windmove-emacs-or-tmux "up"  "tmux select-pane -U")))
(evil-define-key 'normal python-mode-map (kbd "C-j")
'(lambda () (interactive) (windmove-emacs-or-tmux "down"  "tmux select-pane -D")))
(evil-define-key 'normal python-mode-map (kbd "C-l")
'(lambda () (interactive) (windmove-emacs-or-tmux "right"  "tmux select-pane -R")))
(evil-define-key 'normal python-mode-map (kbd "C-h")
'(lambda () (interactive) (windmove-emacs-or-tmux "left"  "tmux select-pane -L")))

(evil-define-key 'normal inferior-python-mode-map (kbd "C-k")
'(lambda () (interactive) (windmove-emacs-or-tmux "up"  "tmux select-pane -U")))
(evil-define-key 'normal inferior-python-mode-map (kbd "C-j")
'(lambda () (interactive) (windmove-emacs-or-tmux "down"  "tmux select-pane -D")))
(evil-define-key 'normal inferior-python-mode-map (kbd "C-l")
'(lambda () (interactive) (windmove-emacs-or-tmux "right"  "tmux select-pane -R")))
(evil-define-key 'normal inferior-python-mode-map (kbd "C-h")
'(lambda () (interactive) (windmove-emacs-or-tmux "left"  "tmux select-pane -L")))

;; Many thanks to the author of and contributors to the following posts:
;; https://gist.github.com/mislav/5189704
;; http://robots.thoughtbot.com/post/53022241323/seamlessly-navigate-vim-and-tmux-splits
;;
;; TODO: Make a script that generates tmux and emacs code without duplication
;;
;; NOTE: My keybindings are not the default emacs ones, using windmove

;; Try to move direction, which is supplied as arg
;; If cannot move that direction, send a tmux command to do appropriate move
(defun windmove-emacs-or-tmux(dir tmux-cmd)
(interactive)
(if (ignore-errors (funcall (intern (concat "windmove-" dir))))
nil                       ;; Moving within emacs
(shell-command tmux-cmd)) ;; At edges, send command to tmux
)

;Move between windows with custom keybindings
(global-set-key (kbd "C-k")
    '(lambda () (interactive) (windmove-emacs-or-tmux "up"  "tmux select-pane -U")))
(global-set-key (kbd "C-j")
    '(lambda () (interactive) (windmove-emacs-or-tmux "down"  "tmux select-pane -D")))
(global-set-key (kbd "C-l")
    '(lambda () (interactive) (windmove-emacs-or-tmux "right" "tmux select-pane -R")))
(global-set-key (kbd "C-h")
    '(lambda () (interactive) (windmove-emacs-or-tmux "left"  "tmux select-pane -L")))
