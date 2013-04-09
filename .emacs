(add-to-list 'load-path "~/.emacs-lisp/")
(add-to-list 'load-path "~/.emacs-lisp/ecb-2.40")

;;(add-to-list 'load-path "~/.emacs-lisp/yasnippet")

(load "my-base.el")
;;为了编程的配置
(load "my-cycode.el")

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))

;;http://gabrielelanaro.github.com/emacs-for-python/
(load-file "/home/revir/.emacs-lisp/gabrielelanaro-emacs-for-python-ac1b31e/epy-init.el")


;;self-defined command

;;允许使用C-z作为命令前缀  
(define-prefix-command 'ctl-z-map)  
(global-set-key (kbd "C-z") 'ctl-z-map) 
;;用C-z i快速打开~/.emacs文件。  
(defun open-init-file ( )  
  (interactive)  
  (find-file "~/.emacs"))  
  
(global-set-key "\C-zi" 'open-init-file)  

;;启用ibuffer支持，增强*buffer*  
(require 'ibuffer)  
(global-set-key (kbd "C-x C-b") 'ibuffer)  

;;默认进入text-mode，而不是没有什么功能的fundamental-mode  
(setq default-major-mode 'text-mode)  
(add-hook 'text-mode-hook 'turn-on-auto-fill) 

;;显示行号  
(global-linum-mode 1)  

;;设定语言环境为utf-8  
(setq current-language-environment "UTF-8")  
(setq default-input-method "chinese-py")  
(setq locale-coding-system 'utf-8)  
(set-terminal-coding-system 'utf-8)  
(set-keyboard-coding-system 'utf-8)  
(set-selection-coding-system 'utf-8)  
(prefer-coding-system 'utf-8)


(require 'info-look)
(info-lookup-add-help
 :mode 'python-mode
 :regexp "[[:alnum:]_]+"
 :doc-spec
 '(("(python)Index" nil "")))

(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el/color-theme.el/file")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-gnome2)))

;;使用了这个扩展之后，你上次离开 Emacs 时的全局变量 (kill-ring，命令记录……)，局部变量，寄存器，打开的文件，修 改过的文件和最后修改的位置，…… 全部都会被记录下来。加载了 session 之后菜单上会多两项：最近访问过的文件和最近 修改过的文件
(require 'session)
  (add-hook 'after-init-hook 'session-initialize)
;;如果你想保存上次打开的文件记录，那么可以使用 desktop。这是 Emacs 自 带的。你只需要加入以上设置，然后 M-x desktop-save。以后 Emacs 启动时就会打开你上次离开时的所有 buffer.M-x desktop-clear 可以删除记住的内容，你闲现在记住的 buffer 太多就可以采用这个办法。不过我还是建议用 ibuffer(见下) 来管理这些buffer，因为有时你会发现，如果删掉全部记住的buffer， 以后你需要一定的时间来打开你经常编辑的文件！
(load "desktop") 
(desktop-load-default) 
(desktop-read)

;; For Linux
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(session-use-package t nil (session))
 '(show-paren-mode t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:slant normal :weight normal :height 140)))))
