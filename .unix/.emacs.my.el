;;; .emacs.el���ɤ߹���桼�����
;;; Time-stamp: "2009-11-06 08:31:50 hamada"

;;;���̤ο�(�������롧�Ť��ֿ�)��������(����80�塢�ġ�40��)
(setq default-frame-alist (append (list '(width .  80)
                                        '(height . 40))
                                  default-frame-alist))


;;; ��Ԥ� 120 ���ʾ�ˤʤä����ˤϼ�ư���Ԥ���
(setq fill-column 120)
(setq text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)

;;; ��ư���� OFF
(setq text-mode-hook 'turn-off-auto-fill)
(setq default-major-mode 'text-mode)


;;; ��ư����ON/OFF
;(defun switch-autofillmode ()
;  (interactive)
;  (if turn-on-auto-fill
;      (setq text-mode-hook 'turn-off-auto-fill))
;  (recenter))
;(global-set-key "\C-c\C-l" 'switch-autofillmode)


;;; �Կ�ɽ��
(custom-set-variables '(line-number-mode t))

;;; �ǽ��������μ�ư����
;;;   �ե��������Ƭ���� 8 �԰���� Time-stamp: <> �ޤ���
;;;   Time-stamp: " " �Ƚ񤤤Ƥ���С������ֻ��˼�ưŪ�����դ���������ޤ�
(if (not (memq 'time-stamp write-file-hooks))
    (setq write-file-hooks
          (cons 'time-stamp write-file-hooks)))

;;; ���������1��ñ�̤ˤ���
(setq scroll-step 1)

;;; *.~ �Ȥ��ΥХå����åץե��������ʤ�
;(setq make-backup-files nil)

;;; .#* �Ȥ��ΥХå����åץե��������ʤ�
;(setq auto-save-default nil)

;;; �����Խ������ե�����Υ���������֤�Ф�������
(require 'saveplace)
(setq-default save-place t)

;;;�����å�������ä�(2003/10/13 by T.Hamada)
(setq inhibit-startup-message t)

;;; ���ơ������饤��˻��֤�load-average��ɽ��
(display-time)

;;; --- lookup���� ---
;;;    �����ȥ��ɤ�����
(autoload 'lookup "lookup" nil t)
(autoload 'lookup-region "lookup" nil t)
(autoload 'lookup-pattern "lookup" nil t)
;;;    �����Х���ɤ�����
(define-key ctl-x-map "l" 'lookup)              ; C-x l - lookup
(define-key ctl-x-map "y" 'lookup-region)       ; C-x y - lookup-region
(define-key ctl-x-map "\C-y" 'lookup-pattern)   ; C-x C-y - lookup-pattern
;;;    ��������������Ȥ�����

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
;;; ���¼������ sdic-mode ������

;; Debian �ѥѥå�������Ȥäƥ��󥹥ȡ��뤷����硢(autoload ��) �� 
;; /etc/emacs/site-start.d/50sdic �ǹԤäƤ��ޤ��Τǡ������Х���ɤ���
;; �� (global-set-key ��) �Τߤǽ�ʬ�Ǥ���

(autoload 'sdic-describe-word "sdic" "��ñ��ΰ�̣��Ĵ�٤�" t nil)
(global-set-key "\C-cw" 'sdic-describe-word)
(autoload 'sdic-describe-word-at-point "sdic" "����������֤α�ñ��ΰ�̣��Ĵ�٤�" t nil)
; (global-set-key "\C-cW" 'sdic-describe-word-at-point)

;; ����ϡ�ư��ȸ��ݤ���Ĵ�᤹�뤿�������Ǥ���
(setq sdic-window-height 10
      sdic-disable-select-window t)

;; Debian �ѥѥå����������Ѥ��뤫��Makefile �����Ѥ��Ƽ����Ʊ���˥�
;; �󥹥ȡ��뤷�����ϡ�����˴ؤ�������ⴰλ�ѤǤ����顢���̤�����
;; ���פ�ޤ��󡣰ʲ�������Ǥϡ��Ŀ�Ū�˸������뼭����դ��ä��Ƥ���
;; �������漼�ȼ���ȤǸ������뼭����ѹ����Ƥ��ޤ���

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


;; xemacs�ο�������
;; http://homepage.mac.com/zenitani/elisp-j.html
(if window-system (progn

  ;; ʸ���ο������ꤷ�ޤ���
  (add-to-list 'default-frame-alist '(foreground-color . "orange"))
  ;; �طʿ������ꤷ�ޤ���
  (add-to-list 'default-frame-alist '(background-color . "navy"))
  ;; ��������ο������ꤷ�ޤ���
  (add-to-list 'default-frame-alist '(cursor-color . "SlateBlue2"))
  ;; �ޥ����ݥ��󥿤ο������ꤷ�ޤ���
  (add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2"))
  ;; �⡼�ɥ饤���ʸ���ο������ꤷ�ޤ���
  (set-face-foreground 'modeline "white")
  ;; �⡼�ɥ饤����طʿ������ꤷ�ޤ���
  (set-face-background 'modeline "MediumPurple2")
  ;; ������Υ꡼�����ο������ꤷ�ޤ���
  (set-face-background 'region "LightSteelBlue1")
  ;; �⡼�ɥ饤��ʥ����ƥ��֤Ǥʤ��Хåե��ˤ�ʸ���������ꤷ�ޤ���
  (set-face-foreground 'mode-line-inactive "gray30")
  ;; �⡼�ɥ饤��ʥ����ƥ��֤Ǥʤ��Хåե��ˤ��طʿ������ꤷ�ޤ���
  (set-face-background 'mode-line-inactive "gray85")

))

;; cpp-hilight-mode (���ޤ��������Ƥʤ�)
(setq cpp-known-face 'invisible)
(setq cpp-unknown-face 'highlight)
(setq cpp-face-type 'light)
(setq cpp-known-writable 't)
(setq cpp-unknown-writable 't)
(setq cpp-edit-list 'nil)
(setq cpp-highlight-buffer t) 

(setq-default tab-width 2)
