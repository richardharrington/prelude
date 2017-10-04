;;; package --- Summary

;;; Commentary:


;;; Code:

(prelude-require-packages '(ido-vertical-mode))

(define-globalized-minor-mode my-global-ido-vertical-mode ido-vertical-mode
  (lambda () (ido-vertical-mode 1)))

(my-global-ido-vertical-mode 1)

(define-globalized-minor-mode my-global-linum-mode linum-mode
  (lambda () (linum-mode t)))

(my-global-linum-mode t)

(defun my-cider-send-last-sexp-to-repl-and-eval ()
  "inserts into repl, evals there, then returns to original window"
  (interactive)
  (save-selected-window
    (setq current-prefix-arg '(4)) ; C-u
    (call-interactively 'cider-insert-last-sexp-in-repl)))

(global-set-key (kbd "C-x C-.") 'my-cider-send-last-sexp-to-repl-and-eval)

(defun cider-figwheel-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/cljs-repl)")
    (cider-repl-return)))


(setq js-indent-level 2)
(setq-local js2-basic-offset 2)
(setq-local javascript-indent-level 2)

(provide 'my-stuff)

;;; my-stuff.el ends here
