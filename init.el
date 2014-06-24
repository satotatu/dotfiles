;;; ロードパスの追加
(setq load-path (append
                 '("~/.emacs.d" "~/.emacs.d/elisp")
                 load-path))
;; (let ((default-directory (expand-file-name "~/.emacs.d/lisp")))
;;   (add-to-list 'load-path default-directory)
;;   (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;       (normal-top-level-add-subdirs-to-load-path)))

;;; Localeに合わせた環境の設定
(set-locale-environment nil)
;;; ツールバーを消す
(tool-bar-mode nil)
(blink-cursor-mode nil)

;;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

;;; 現在行を目立たせる
;(global-hl-line-mode)

;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;;; カーソルの場所を保存する
(require 'saveplace)
(setq-default save-place t)

;;; バックアップファイルを作らない
(setq backup-inhibited t)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; 部分一致の補完機能を使う
;;; p-bでprint-bufferとか
(partial-completion-mode t)

;; C++
; ヘッダファイル(.h)をc++モードで開く
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode))
	      auto-mode-alist))


(defun my-c-mode-common-init ()
  "C, C++ mode set up function"
  (c-set-style "stroustrup")
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  )

(add-hook 'c-mode-hook 'my-c-mode-common-init)
(add-hook 'c++-mode-hook 'my-c-mode-common-init)

;; Python
;; (add-hook 'python-mode-hook
;; 	  '(lambda()
;; 	     (setq indent-level 2)
;; 	     (setq python-indent 2)))

;(requre 'info)
;(add-to-list 'Info-additional-directory-list "~/.emacs.d/info")

;; C-j の機能を別のキーに割り当て
(global-set-key (kbd "C-m") 'newline-and-indent)

;; auto-install
(setq url-proxy-services '(("http" . "www-proxy.sra.co.jp:80")))
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/lisp/")
;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; anything
(require 'anything-startup)
;(global-set-key "\^c\^f" 'anything-for-files)
(global-set-key "\C-xb" 'anything-for-files)
(add-to-list 'descbinds-anything-source-template '(candidate-number-limit . 1000))

;; navi2ch
(setq navi2ch-display-splash-screen nil)

;; custom face
(custom-set-faces
 '(default ((t
             (:background "black" :foreground "#55FF55")
             )))
 '(cursor ((((class color)
             (background dark))
            (:background "#00AA00"))
           (((class color)
             (background light))
            (:background "#999999"))
           (t ())
           )))
