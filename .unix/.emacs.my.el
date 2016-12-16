;;; .emacs.elが読み込むユーザ定義
;;; Time-stamp: "2009-11-06 08:31:50 hamada"

;;;画面の色(カーソル：暗い赤色)、サイズ(横：80桁、縦：40行)
(setq default-frame-alist (append (list '(width .  80)
                                        '(height . 40))
                                  default-frame-alist))


;;; 一行が 120 字以上になった時には自動改行する
(setq fill-column 120)
(setq text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)

;;; 自動改行 OFF
(setq text-mode-hook 'turn-off-auto-fill)
(setq default-major-mode 'text-mode)


;;; 自動改行ON/OFF
;(defun switch-autofillmode ()
;  (interactive)
;  (if turn-on-auto-fill
;      (setq text-mode-hook 'turn-off-auto-fill))
;  (recenter))
;(global-set-key "\C-c\C-l" 'switch-autofillmode)


;;; 行数表示
(custom-set-variables '(line-number-mode t))

;;; 最終更新日の自動挿入
;;;   ファイルの先頭から 8 行以内に Time-stamp: <> または
;;;   Time-stamp: " " と書いてあれば、セーブ時に自動的に日付が挿入されます
(if (not (memq 'time-stamp write-file-hooks))
    (setq write-file-hooks
          (cons 'time-stamp write-file-hooks)))

;;; スクロールを1行単位にする
(setq scroll-step 1)

;;; *.~ とかのバックアップファイルを作らない
;(setq make-backup-files nil)

;;; .#* とかのバックアップファイルを作らない
;(setq auto-save-default nil)

;;; 以前編集したファイルのカーソル位置を覚える設定
(require 'saveplace)
(setq-default save-place t)

;;;初期メッセージを消す(2003/10/13 by T.Hamada)
(setq inhibit-startup-message t)

;;; ステータスラインに時間とload-averageを表示
(display-time)

;;; --- lookup設定 ---
;;;    オートロードの設定
(autoload 'lookup "lookup" nil t)
(autoload 'lookup-region "lookup" nil t)
(autoload 'lookup-pattern "lookup" nil t)
;;;    キーバインドの設定
(define-key ctl-x-map "l" 'lookup)              ; C-x l - lookup
(define-key ctl-x-map "y" 'lookup-region)       ; C-x y - lookup-region
(define-key ctl-x-map "\C-y" 'lookup-pattern)   ; C-x C-y - lookup-pattern
;;;    検索エージェントの設定

(setq lookup-search-agents
      '(
        (ndeb "/home/dictionary/Sansyu/Waei" )
        (ndeb "/home/dictionary/eijiro-fpw" )
        (ndeb "/home/dictionary/Kenkyu/Eiwa")
        (ndeb "/home/dictionary/Kenkyu/Waei")
        (ndeb "/home/dictionary/Est")
        (ndeb "/home/dictionary/Sansyu/EEIdeo")
        (ndeb "/home/dictionary/Sansyu/KaGi")
        (ndeb "/home/dictionary/crownfj" )
        (ndeb "/home/dictionary/plus" )
        (ndeb "/home/dictionary/koujien" )
        (ndeb "/home/dictionary/kagiyogo" )
        (ndeb "/home/dictionary/jitenban" )
        (ndeb "/home/dictionary/otojiro-fpw" )
        (ndeb "/home/dictionary/dhk" )
        (ndeb "/home/dictionary/genius" )
        (ndeb "/home/dictionary/longman" )
        (ndeb "/home/dictionary/waeijiro-fpw" )
        (ndeb "/home/dictionary/oxford" )
        )
)
;;(setq lookup-default-dictionary-options
;;      '((:oxford .  oxford-english)))
;;(setq lookup-use-kakasi nil)



(defun memo ()
  (interactive)
    (add-change-log-entry 
     nil
     (expand-file-name "~/../etc/ChangeLog")))
(define-key ctl-x-map "M" 'memo)

;; for CUDA 
(setq auto-mode-alist
      (cons (cons "\\.cu$" 'c++-mode) auto-mode-alist))

;; -*- Emacs-Lisp -*-
;;; 英和辞書閲覧 sdic-mode の設定

;; Debian 用パッケージを使ってインストールした場合、(autoload 〜) は 
;; /etc/emacs/site-start.d/50sdic で行っていますので、キーバインドの設
;; 定 (global-set-key 〜) のみで十分です。

(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(global-set-key "\C-cw" 'sdic-describe-word)
(autoload 'sdic-describe-word-at-point "sdic" "カーソル位置の英単語の意味を調べる" t nil)
; (global-set-key "\C-cW" 'sdic-describe-word-at-point)

;; これは、動作と見掛けを調節するための設定です。
(setq sdic-window-height 10
      sdic-disable-select-window t)

;; Debian 用パッケージを利用するか、Makefile を利用して辞書を同時にイ
;; ンストールした場合は、辞書に関する設定も完了済ですから、特別な設定
;; は要りません。以下の設定では、個人的に検索する辞書を付け加えていま
;; す。研究室と自宅とで検索する辞書を変更しています。

(if (string-match "^\\(toba\\.\\|toba$\\)" (system-name))
    (setq sdic-eiwa-dictionary-list '((sdicf-client "~/usr/dict/gene.sdic"))
	  sdic-waei-dictionary-list '((sdicf-client "~/usr/dict/edict.sdic"
						    (add-keys-to-headword t))))
  (setq sdic-eiwa-dictionary-list '((sdicf-client "~/usr/dict/gene.sdic"))
	sdic-waei-dictionary-list '((sdicf-client "~/usr/dict/edict.sdic"
						  (add-keys-to-headword t))
				    (sdicf-client "~/usr/dict/compdic.sdic"
						  (add-keys-to-headword t))
				    (sdicf-client "~/usr/dict/geodic.sdic"
						  (add-keys-to-headword t))
				    (sdicf-client "~/usr/dict/lifscdic.sdic"
						  (add-keys-to-headword t)))))


;; xemacsの色の設定
;; http://homepage.mac.com/zenitani/elisp-j.html
(if window-system (progn

  ;; 文字の色を設定します。
  (add-to-list 'default-frame-alist '(foreground-color . "orange"))
  ;; 背景色を設定します。
  (add-to-list 'default-frame-alist '(background-color . "navy"))
  ;; カーソルの色を設定します。
  (add-to-list 'default-frame-alist '(cursor-color . "SlateBlue2"))
  ;; マウスポインタの色を設定します。
  (add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2"))
  ;; モードラインの文字の色を設定します。
  (set-face-foreground 'modeline "white")
  ;; モードラインの背景色を設定します。
  (set-face-background 'modeline "MediumPurple2")
  ;; 選択中のリージョンの色を設定します。
  (set-face-background 'region "LightSteelBlue1")
  ;; モードライン（アクティブでないバッファ）の文字色を設定します。
  (set-face-foreground 'mode-line-inactive "gray30")
  ;; モードライン（アクティブでないバッファ）の背景色を設定します。
  (set-face-background 'mode-line-inactive "gray85")

))

;; cpp-hilight-mode (うまくうごいてない)
(setq cpp-known-face 'invisible)
(setq cpp-unknown-face 'highlight)
(setq cpp-face-type 'light)
(setq cpp-known-writable 't)
(setq cpp-unknown-writable 't)
(setq cpp-edit-list 'nil)
(setq cpp-highlight-buffer t) 

(setq-default tab-width 2)
