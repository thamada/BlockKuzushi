;; Time-stamp: "2011-08-14 13:10:04 hamada"
;; $B8D?MMQ@_Dj$O(B~/.emacs.my.el $B$K=q$/$3$H!#(B($B_@ED(B)
;;  ~~ $B=$@5MzNr(B ~~
;;   - "2011-08-14 13:08:25 hamada": emacs23$B$GLdBj$,$"$C$?$N$GLdBj2U=j(B(emacs21$BMQ5-=R(B)$B$r:o=|(B  
;;
;;
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FSF Emacs 20/21 $BMQ(B $B%f!<%6@_Dj%U%!%$%k$N%5%s%W%k(B
;;            MATSUBAYASHI 'Shaolin' Kohji (shaolin@vinelinux.org)
;;                      modified by Jun Nishii <jun@vinelinux.org>
;;                      modified by Daisuke SUZUKI <daisuke@vinelinux.org>
;;            $Id: .emacs.el,v 1.36 2004/10/27 12:54:46 daisuke Exp $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  $B%7%9%F%`$N%"%C%W%0%l!<%I;~$K$3$N%U%!%$%k$r<+F0E*$K99?7$7$?$$>l9g$O(B
;;  $B$3$N%U%!%$%k$rJQ99$;$:$K(B .emacs.my.el $B$K5-=R$7$F$/$@$5$$!#(B


;;; $B=i4|@_Dj%U%!%$%k$N;XDj(B

(setq user-init-file "~/.emacs.el")

;;; $B%^%/%m%5!<%A%Q%9$NDI2C(B
;;; ~/lib/emacs $B0J2<$K%f!<%6MQ$N(B *.el, *.elc $B$rCV$/$3$H$,$G$-$^$9(B
(setq load-path (append '("~/lib/emacs") load-path))

;;; $B8@8l4D6-$N;XDj(B
(set-language-environment "Japanese")

;;; $B4A;z%3!<%I$N@_Dj(B

(set-default-coding-systems 'euc-jp)
(set-buffer-file-coding-system 'euc-jp-unix)
(set-terminal-coding-system 'euc-jp)
(set-keyboard-coding-system 'euc-jp)

;;;;; emacsclient $B%5!<%P$r5/F0(B
;;(server-start)

;; $B4D6-JQ?t(B EMACS_IME $B$rD4$Y$k!#(B
;; EMACS_IME $B$,$J$1$l$P(B canna $B$r;HMQ$9$k(B

(setq emacs-ime (getenv "EMACS_IME"))
(if (null emacs-ime)
    (setq emacs-ime "canna"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; X $BHG(B Emacs $B$N%U%)%s%H(B/$B%+%i!<@_Dj(B
;; .emacs-faces.el, .emacs-fontset.el $B;2>H(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs-faces.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Egg (Wnn $B%U%m%s%H%(%s%I(B) $B$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Wnn6/FreeWnn
(if (or (equal emacs-ime "wnn")
        (equal emacs-ime "Wnn")
        (equal emacs-ime "wnn6")
        (equal emacs-ime "Wnn6"))
    (progn
      (if (>= emacs-major-version 21)

      (progn

         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	 ;;emacs-dl-wnn$B$G$J$$$H$-$N@_Dj(B( emacs-21 + tamago v4)

	 (global-set-key "\C-\\" 'toggle-input-method)
	 (load "egg")
	 
	 ;; InputMethod $B$N@_Dj(B
	 ;; emacs $B5/F0;~(B ASCII
	 ;;(setq default-input-method "japanese-egg-wnn")
	 ;; emacs $B5/F0;~$+$iF|K\8lF~NO(B
	 (set-input-method "japanese-egg-wnn")
	 
	 ;; jserver$B$N;XDj(B
	 ;; jserver $B$N%j%9%H$r<!$NMM$K$7$F;XDj$G$-$^$9(B
	 ;;(setq jserver-list '("vanilla" "espresso"))
	 (setq jserver-list (list (getenv "JSERVER") "localhost"))


	 ;;--------------------------------------------------------
	 ;; tamago v4
	 ;;--------------------------------------------------------
	 ;; $BA4HL(B
	 
	 ;;(setq egg-default-startup-file "eggrc-wnn") ; 95.6.1 by S.Tomura
	 (garbage-collect)
	 
	 ;; "nn" $B$G!V$s!W$rF~NO(B
	 (setq enable-double-n-syntax t)
	 
	 ;; "." $B$G!V(B.$B!W!"(B"," $B$G!V(B,$B!W$rF~NO!#(B
	 (setq use-kuten-for-period nil)
	 (setq use-touten-for-comma nil)
	 
	 )
       
       ;; emacs-dl-wnn $B$N>l9g(B (emacs-20)
       (progn
	 (autoload 'egg "egg" "Initialize EGG." t)
	 (egg)
	 (global-set-key "\C-\\" 'toggle-egg-mode)
	 (define-key isearch-mode-map "\C-\\" 'isearch-fep-egg)
	 (autoload 'toggle-egg-mode "egg" "Initialize EGG." t)
	 (autoload 'isearch-fep-egg "isearch-ext"
	   "Read string for incremental search by using egg." t)
	 
	 (setq egg-default-startup-file "eggrc-wnn") ; 95.6.1 by S.Tomura
	 (garbage-collect)
	 
	 ;; jserver $B$N%j%9%H$r<!$NMM$K$7$F;XDj$G$-$^$9(B
	 ;;(setq jserver-list '("vanilla" "espresso"))
	 (setq jserver-list (list (getenv "JSERVER") "localhost"))
	 
	 ;; "nn" $B$G!V$s!W$rF~NO(B
	 (setq enable-double-n-syntax t)
	 
	 ;; "." $B$G!V(B.$B!W!"(B"," $B$G!V(B,$B!W$rF~NO!#(B
	 (setq use-kuten-for-period nil)
	 (setq use-touten-for-comma nil)
	 
	 ;; 1234567890%#%"' $B$r!VH>3Q!W$GF~NO(B"
	 (let ((its:*defrule-verbose* nil))
	   (its-define-mode "roma-kana")
	   (dolist (symbol '("1" "2" "3" "4" "5"
			     "6" "7" "8" "9" "0"
			     "#" "%" "\"" "'" ))
	     (its-defrule symbol symbol)))
	 
	 )
       )
      )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Wnn7Egg (Wnn7 $B%U%m%s%H%(%s%I(B) $B$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (or (equal emacs-ime "wnn7")
        (equal emacs-ime "Wnn7"))
    (progn
      (setq load-path (append '("/usr/share/wnn7/elisp/emacs20") load-path))
      (global-set-key "\C-\\" 'toggle-input-method)
      ;; canna like toggle keybind
      ;;(global-set-key "\C-o" 'toggle-input-method)
      (load "wnn7egg-leim")
      (set-input-method "japanese-egg-wnn7")
      (set-language-info "Japanese" 'input-method "japanese-egg-wnn7")

      ;; "nn" $B$G!V$s!W$rF~NO(B
      (setq enable-double-n-syntax t)
      ;; $B8uJdA*Br%b!<%I(B
      (egg-use-input-predict)
      (setq egg-predict-realtime nil)
      ;; $B%$%s%i%$%s8uJdA*Br%b!<%I(B
      (setq egg-predict-mode "inline")
      ;; $B%&%$%s%I%&8uJdA*Br%b!<%I(B
      ;(setq egg-predict-mode "window")

      ;; $B8uJd%j%9%HI=<((B
      (define-key wnn7-henkan-mode-map " " 'wnn7-henkan-select-kouho-dai)

      ;; 1234567890%#%"'/\| $B$r!VH>3Q!W$GF~NO(B
      (let ((its:*defrule-verbose* nil))
        (its-define-mode "roma-kana")
        (dolist (symbol '("1" "2" "3" "4" "5" 
                          "6" "7" "8" "9" "0"
                          "#" "%" "\"" "'" "/" "\\" "|"))
                (its-defrule symbol symbol)))
    )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B$+$s$J$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (or (equal emacs-ime "canna")
	(equal emacs-ime "Canna")
	(equal emacs-ime "canna-tamago"))

    (progn
    (if (and (or (and (boundp 'CANNA) CANNA)
		 (<= emacs-major-version 20))
	     (not (equal emacs-ime "canna-tamago")))
	(progn
	  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	  ;; emacs-dl-canna/emcws $B$N>l9g(B
	  
	  (load-library "canna")
	  
	  ;; color-mate $B$r;H$o$J$$$G!"4A;zJQ49$K?'$rIU$1$?$$;~$K(B
	  ;(setq canna-use-color t)
	  
	  ;; $B%U%'%s%9%b!<%I$G$J$/%"%s%@!<%i%$%s$r;H$&(B
	  ;;(setq canna-with-fences nil)
	  ;;(setq canna-underline t)
	  
	  ;; Canna $B%5!<%P$N;XDj(B
	  (if (null (getenv "CANNA_SERVER"))
	      (setq canna-server "unix")
	    (setq canna-server (getenv "CANNA_SERVER")))
	  (canna)
	  
	  ;; Canna $B$r(B Ctrl-\ $B$G5/F0$7$^$9!#%3%a%s%H%"%&%H$9$l$P!"(B
	  ;; Ctrl-\ $B$G(B skk $B$,N)$A>e$,$j$^$9!#(B
	  (global-set-key "\C-\\" 'canna-toggle-japanese-mode)
;;	  (global-set-key "\C-o" 'canna-toggle-japanese-mode)
	  
	  (global-set-key "\C-_" 'canna-undo)  ;$B%"%s%I%%$N@_Dj!#(B
	  (setq canna-save-undo-text-predicate ;$B%"%s%I%%%P%C%U%!$XF~$l$k>r7o(B
		'(lambda (s) (> (length (car s)) 2)) )
	  (setq canna-undo-hook ;$B%"%s%I%%!\&A!#(B
		'(lambda () (message "$B:FJQ49$7$^$9(B....")                          
		   (canna-do-function canna-func-henkan)) )
	  
	  ;;$B$+$s$J$NJQ49Cf$K(B BS & DEL $B$r;H$&(B
	  (define-key canna-mode-map [backspace] [?\C-h])
	  (define-key canna-mode-map [delete] [?\C-h])
	  
	  ;;$B$+$s$J$NJQ49Cf$K(B C-h $B$r;H$&(B (with term/keyswap)
	  (define-key canna-mode-map [?\177] [?\C-h])
	  ))
  
    (if (or (and (not (and (boundp 'CANNA) CANNA))
		 (>= emacs-major-version 21))
	    (equal emacs-ime "canna-tamago"))
	(progn
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	   ;; emacs-dl-canna/emcws $B$G$J$$$H$-(B (tamago4)
	   
	   ;; Canna $B%5!<%P$N;XDj(B
	   (if (null (getenv "CANNASERVER"))
	       (setq canna-server "localhost")
	     (setq canna-server (getenv "CANNASERVER")))
	   
	   ;; InputMethod $B$N@_Dj(B
	   (setq default-input-method "japanese-egg-canna")
	   
	   ;; tamago v4 $B6&DL@_Dj(B
	   
	   (setq
	    ;; $B2?2sJQ49$9$k$H!J<+F0E*$K!K<-=q$KH?1G$9$k$+(B
	    wnn-auto-save-dictionaries 1
	    ;; nil $B$K$9$k$H!"(Balphanumeric $B$,H>3QF~NO$K$J$k$i$7$$!#(B
	    its-enable-fullwidth-alphabet nil
	    ;; Backspace $B$G>C$9$H$-$K!"$+$J$rF~NO$7$?%m!<%^;z$KE83+$7$F(B
	    ;; $B%m!<%^;zC10L$G>C$9!)(B
	    its-delete-by-keystroke t
	    ;; $B30$9$HA`:nJ}K!$,JQ$o$k$_$?$$$G$9!#$h$/J,$+$j$^$;$s!#(B
	    egg-mode-preference t
	    ;; "nn" $B$G!V$s!W$rF~NO(B
	    enable-double-n-syntax t
	    ;; "." $B$G!V!%!W!"(B"," $B$G!V!$!W$rF~NO!#(B 
	    use-kuten-for-period nil
	    use-touten-for-comma nil
	    ;; $B8uJd$N:G8e$^$G9T$C$?$i@hF,$KLa$k(B
	    egg-conversion-wrap-select t
	    ;; $B8uJd0lMw$rI=<($9$k$^$G$NJQ492s?t!"(B0$B$GHsI=<((B
	    egg-conversion-auto-candidate-menu 2)
	   
	   ;; F7 $B$G(B toroku-region
	   (global-set-key [f7] 'egg-toroku-region)

	   ;; egg-canna.el
	   (add-hook 'canna-load-hook '(lambda () (load "egg-canna")))
	   
	   ;; Canna $BMQ@_Dj(B (Canna $BIw%-!<@_Dj(B)
;;	   (load "its")
;;	   (define-key global-map "\C-\\" 'toggle-input-method)
;;	   (define-key isearch-mode-map "\C-\\" 'isearch-toggle-input-method)
;;	   (define-key its-mode-map "\C-h" 'its-delete-backward-SYL)
;;	   (define-key its-mode-map "\C-p" 'its-hiragana)
;;	   (define-key its-mode-map "\C-y" 'its-hiragana)
;;	   (define-key its-mode-map "\C-n" 'its-katakana)
;;	   (define-key its-mode-map [up] 'its-hiragana)
;;	   (define-key its-mode-map [down] 'its-katakana)
;;	   (cond ((eq window-system 'x)
;;		  (define-key its-mode-map [henkan] 'its-kick-convert-region)
;;		  (define-key its-mode-map [hiragana-katakana] 'its-katakana)
;;		  (define-key its-mode-map [muhenkan] 'its-hiragana)
;;		  (define-key its-mode-map [f6] 'its-hiragana)
;;		  (define-key its-mode-map [f7] 'its-katakana)
;;		  (define-key its-mode-map [f8] 'its-half-width)
;;		  (define-key its-mode-map [backspace] 'its-delete-backward-SYL)
;;		  ;(define-key menudiag-mode-map [backspace] 'menudiag-exit-one-level)
;;		  (define-key its-mode-map [delete] 'its-delete-SYL))
;;		 ((null window-system)
;;		  (define-key its-mode-map "\e[17~" 'its-hiragana)
;;		  (define-key its-mode-map "\e[18~" 'its-katakana)
;;		  (define-key its-mode-map "\e[19~" 'its-half-width)
;;		  (define-key its-mode-map [8] 'its-delete-backward-SYL)
;;		  ;(define-key menudiag-mode-map [8] 'menudiag-exit-one-level)
;;		  (define-key its-mode-map "\e[3~" 'its-delete-SYL)))
	   )
      )
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Atok for X $B$N@_Dj(B
;;  IIIMP $B7PM3$G<B9T$7$^$9(B
;; ($BMW(B MULE-UCS, IIIMECF)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (equal emacs-ime "atokx")
    (progn

      (require 'un-define)      
      (setq coding-category-utf-8 'utf-8)

      (setq iiimcf-server-control-hostlist '("localhost"))
      (setq iiimcf-server-control-default-language "ja")
      (setq default-input-method 'iiim-server-control)
      (require 'iiimcf-sc)

      ;; $BJQ49%H%0%k$N@_Dj(B
      (define-key global-map "\C-\\" 'toggle-input-method)

      ;;$B%b!<%I%i%$%sI=<($r$9$C$-$j$H(B
      ;;(setcar default-mode-line-format "")

      )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Anthy $B$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (or (equal emacs-ime "anthy")
        (equal emacs-ime "Anthy"))
    (progn
      (require 'anthy)
      ;; $BJQ493+;O%-!<(B
      (define-key global-map "\C-\\" 'anthy-mode)
      (define-key global-map "\C-o" 'anthy-mode)
      (define-key global-map [kanji] 'anthy-mode)
      (define-key global-map [M-kanji] 'anthy-mode)
    )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SKK-9.6m 
;;   Mule $B>e$N2>L>4A;zJQ49%7%9%F%`(B SKK $B$N@_Dj(B
;;   C-x t $B$G%A%e!<%H%j%"%k$,5/F0$7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;; $B;HMQ$9$k<-=q$N@_Dj(B ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SKK-JISYO.L $B$r%a%b%j>e$KFI$_9~$s$GMxMQ$9$k>l9g(B
(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")

;;; SKK-JISYO.M $B$r%a%b%j>e$KFI$_9~$_!"(B
;;; $B8+IU$+$i$J$$>l9g$O(B skkserv $B$r5/F0$7$F(B SKK-JISYO.L $B$+$i8!:w$9$k>l9g(B
;;; (skkexdic $B%Q%C%1!<%8$,I,MW$G$9(B)
;;(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.M")
;;(setq skk-aux-large-jisyo "/usr/share/skk/SKK-JISYO.L")
;;(setq skk-server-portnum 1178)
;;(setq skk-server-host "localhost")
;;(setq skk-server-prog "/usr/libexec/skkserv")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)
(autoload 'skk-mode "skk" nil t)
(autoload 'skk-auto-fill-mode "skk" nil t)
(autoload 'skk-tutorial "skk-tut" nil t)
(autoload 'skk-isearch-mode-setup "skk-isearch" nil t)
(autoload 'skk-isearch-mode-cleanup "skk-isearch" nil t)
(add-hook 'isearch-mode-hook
	  (function (lambda ()
		      (and (boundp 'skk-mode) skk-mode
			   (skk-isearch-mode-setup) ))))
(add-hook 'isearch-mode-end-hook
	  (function (lambda ()
		      (and (boundp 'skk-mode) skk-mode
			   (skk-isearch-mode-cleanup)
			   (skk-set-cursor-color-properly) ))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; T-Gnus 6.13.3 ($B;29M(B)
;;   NetNews $B%j!<%@!<(B GNUS (SEMI $BBP1~HG(B)
;;   M-x gnus $B$G5/F0$7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; News Server $BL>$d%I%a%$%sL>$rE,@Z$K;XDj$7$F$/$@$5$$(B
;(setq gnus-nntp-server "news.hoge.hoge.or.jp")
;(setq gnus-local-domain "hoge.hoge.or.jp")
;(setq gnus-local-organization "HogeHoGe Org.")
;(setq gnus-use-generic-from t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mew 3.3  -  Messaging in the Emacs World
;;   $B%a!<%k%j!<%@!<(B Mew
;;   M-x mew $B$G5/F0$7$^$9(B
;;
;;   $B8D?MMQ$N@_Dj%U%!%$%k$O(B ~/.mew.el $B$rMxMQ$7$F$/$@$5$$!#(B
;;   $B:G?7$N(B .mew.el $B$O(B /usr/share/doc/mew-common-*/vine.dot.mew $B$K$"$j$^$9!#(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

(if (file-exists-p (expand-file-name "~/.mew.el"))
    (load (expand-file-name "~/.mew.el") nil t nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; X-Face-Mule
;;   Mew $B$d(B Wanderlust $B$J$I$G!"(BX-Face $B2hA|$D$-$N%a%C%;!<%8$rI=<($7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(if (and window-system (module-installed-p 'bitmap))
;;    (progn
;;      (require 'bitmap)
;;      (require 'x-face-mule)
;;      (mapcar (lambda (fontset)
;;                (set-fontset-font
;;                  fontset 'bitmap
;;                  "-etl-fixed-medium-r-*--16-*-100-100-m-*-bitmap.8x16-0"))
;;              (fontset-list))
;;
;;      ; for Wanderlust
;;      (setq wl-highlight-x-face-function
;;	    'x-face-decode-message-header)
;;
;;      ; for Mew
;;      (setq mew-use-highlight-x-face t)
;;      (setq mew-use-highlight-x-face-function
;;	    (function
;;	     (lambda (beg end)
;;	       (x-face-mule-x-face-decode-message-header beg end))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; irchat-pj-2.4.24.07
;;   IRC ($B%A%c%C%H(B) $B%/%i%$%"%s%H$N@_Dj(B
;;   M-x irchat $B$G5/F0$7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'irchat "irchat" nil t)

;;; IRC server $B$N;XDj(B
;;; ($B$$$:$l$+0l$D$r%3%a%s%H%"%&%H$7$^$9(B)
;;(setq irchat-server "irc.tohoku.ac.jp")
;;(setq irchat-server "irc.kyutech.ac.jp")
;;(setq irchat-server "irc.tokyo.wide.ad.jp")
;;(setq irchat-server "irc.kyoto.wide.ad.jp")
;;(setq irchat-server "irc.huie.hokudai.ac.jp")
;;(setq irchat-server "irc.cc.yamaguchi-u.ac.jp")
;;(setq irchat-server "irc.karrn.ad.jp")
;;(setq irchat-server "irc.kyoto.wide.ad.jp")

;;; $B%f!<%6!<L>$H%K%C%/%M!<%`(B
;;; (nick $B$OH>3Q1Q?t$*$h$S(B []{}_\^ $B$+$i$J$k:GBg(B 9 $BJ8;z$NJ8;zNs$G$9(B)
(setq irchat-name "IRC sample user")
(setq irchat-nickname "VineUser")

;;; $B%G%U%)%k%H$G;22C$9$k%A%c%s%M%k$N%j%9%H(B
;;;  $B!J$3$3$K=q$$$?%A%c%s%M%k$K$O(B irchat $B$N5/F0$HF1;~$K;22C$G$-$^$9!K(B
;;(setq irchat-startup-channel-list '("#linuxjp,#vinetest"))
(setq irchat-startup-channel-list '("#vinetest"))

;;; $B%*%W%7%g%s(B
;;;   $B>\:Y$O(B /usr/doc/irchat-pj-2.4.24.07/doc $B0J2<$N%U%!%$%k$r;2>H(B
(setq irchat-reconnect-automagic t)      ; $B@Z$l$?>l9g$K:F@\B3$r;n$_$k(B
;;(setq irchat-channel-buffer-mode t)    ; $B%A%c%M%kJ,3dI=<(%b!<%I(B
;;(setq irchat-display-channel-always t)
;;(setq irchat-default-freeze-local nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YaTeX 1.72
;;   [La]TeX $BF~NO%b!<%I(B
;;   M-x yatex $B$H$9$k$+!"(B.tex $B$G=*$o$k%U%!%$%k$rFI$_9~$`$H5/F0$7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; YaTeX-mode
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(setq dvi2-command "xdvi"
      tex-command "platex"
      dviprint-command-format "dvips %s | lpr"
      YaTeX-kanji-code 3)

;; YaHtml-mode
(setq auto-mode-alist
      (cons (cons "\\.html$" 'yahtml-mode) auto-mode-alist))
(autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
(setq yahtml-www-browser "mozilla")

;; TeX source special $B$N$?$a$N@_Dj(B
(if (load "xdvi-search" t) ; $BI,?\(B
    (progn
      (custom-set-variables
       '(server-switch-hook (quote (raise-frame)))) ; $BAk$r>e$K(B
      (custom-set-faces)
      (add-hook 'yatex-mode-hook
                '(lambda ()
                   (define-key YaTeX-mode-map "\C-c\C-j" 'xdvi-jump-to-line)))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dic (eldic.el)
;;   Mule $B>e$G(B dic $B$rMxMQ$9$k$?$a$N@_Dj$G$9(B
;;   ~/lib/emacs $B$K(B /usr/doc/dic/eldic.el $B$r%3%T!<$7$F(B
;;   dic-shell-file-name $B$NJU$j$rE,@Z$K@_Dj$7$F$/$@$5$$!#(B
;;   C-c C-c C-e $B$G1QOB!"(BC-c C-c C-j $B$GOB1Q$,0z$1$^$9!#(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(global-set-key "\C-c\C-c\C-e" 'lookup-edic)
;;(global-set-key "\C-c\C-c\C-j" 'lookup-jdic)
;;(autoload 'lookup-edic "eldic" nil t)
;;(autoload 'lookup-jdic "eldic" nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B%[%$!<%k%^%&%9BP1~(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)
                     
(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Liece
;;  IRC $B%/%i%$%"%s%H$G$9!#(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'liece "liece" nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rpm-mode
;;  RPM $B$N(B spec $B%U%!%$%k:n@.MQ%b!<%I(B
;;  ~/lib/emacs $B$K(B /usr/doc/rpm/rpm-mode.el $B$r%3%T!<$7$F0J2<$N@_Dj$r(B
;;  $B9T$C$F$/$@$5$$(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(setq auto-mode-alist (nconc '(("\\.spec" . rpm-mode)) auto-mode-alist))
;(autoload 'rpm-mode "rpm-mode" "Major mode for editing SPEC file of RPM." t) 
;(setq packager "Vine User <vine@hoge.fuga>");$B<+J,$NL>A0(B
;      (setq buildrootroot "/var/tmp");BuildRoot$B$N>l=j(B
;      (setq projectoname "Project Vine");$B%W%m%8%'%/%HL>(B 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B$=$NB>$N@_Dj(B
;;
;; $B$3$l$i$N@_Dj$rJQ99$9$k>l9g$O!"(B~/.emacs.my.el $B$K=q$/$3$H(B
;; $B$r$*A&$a$7$^$9!#(Betcskel $B%Q%C%1!<%8$N%"%C%W%G!<%H;~$K(B 
;; /etc/skel/.emacs.el $B$r$=$N$^$^>e=q$-$G$-$^$9!#(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; C-h $B$H(B Del $B$NF~$lBX$((B
;;; Help $B$,(B Shift + Ctrl + h $B$*$h$S(B Del $B$K3dEv$F$i$l!"(B
;;; $BA00lJ8;z:o=|$,(B Ctrl + h $B$K3dEv$F$i$l$^$9(B
;(load-library "term/keyswap")
;(if (eq window-system 'x)
;    (progn
;      (define-key function-key-map [delete] [8])
;      (put 'delete 'ascii-character 8)))

;;; Ctrl-H $B$rA0(B1$BJ8;z:o=|$KJQ99(B
(define-key global-map "" 'backward-delete-char)

;;; $B%9%/%m!<%k%P!<$r1&B&$KI=<($9$k(B
(set-scroll-bar-mode 'right)

;;; gz$B%U%!%$%k$bJT=8$G$-$k$h$&$K(B
(auto-compression-mode t)

;;; $B0l9T$,(B 80 $B;z0J>e$K$J$C$?;~$K$O<+F02~9T$9$k(B
(setq fill-column 80)
(setq text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)

;;; $B%9%F!<%?%9%i%$%s$K;~4V$rI=<($9$k(B
(if (>= emacs-major-version 20)
    (progn
      (setq dayname-j-alist
           '(("Sun" . "$BF|(B") ("Mon" . "$B7n(B") ("Tue" . "$B2P(B") ("Wed" . "$B?e(B")
             ("Thu" . "$BLZ(B") ("Fri" . "$B6b(B") ("Sat" . "$BEZ(B")))
      (setq display-time-string-forms
           '((format "%s$BG/(B%s$B7n(B%s$BF|(B(%s) %s:%s %s"
                     year month day
                     (cdr (assoc dayname dayname-j-alist))
                     24-hours minutes
		     load)))
      ))
(display-time)

;;; visible-bell
(setq visible-bell t)

;;; $B9THV9f$rI=<($9$k(B
(line-number-mode t)

;;; mule/emacs -nw $B$G5/F0$7$?;~$K%a%K%e!<%P!<$r>C$9(B
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;;; $B0u:~@_Dj(B
;(setq-default lpr-switches '("-Pepson"))
(setq-default lpr-switches '("-2P"))
(setq-default lpr-command "mpage")

;;; ps-print
(setq ps-multibyte-buffer 'non-latin-printer)
(if (>= emacs-major-version 21)
    (progn
      (require 'ps-mule)
      (defalias 'ps-mule-header-string-charsets 'ignore)))

;;; $B%P%C%U%!$N:G8e$G(Bnewline$B$G?75,9T$rDI2C$9$k$N$r6X;_$9$k(B
(setq next-line-add-newlines nil)

;;; $B2hLL:G2<9T$G(B[$B"-(B]$B$r2!$7$?$H$-$N%9%/%m!<%k?t(B
;(setq scroll-step 1)
 
;;; mark $BNN0h$K?'IU$1(B
(setq transient-mark-mode t)

;;; $B:G=*99?7F|$N<+F0A^F~(B
;;;   $B%U%!%$%k$N@hF,$+$i(B 8 $B9T0JFb$K(B Time-stamp: <> $B$^$?$O(B
;;;   Time-stamp: " " $B$H=q$$$F$"$l$P!"%;!<%V;~$K<+F0E*$KF|IU$,A^F~$5$l$^$9(B
(if (not (memq 'time-stamp write-file-hooks))
    (setq write-file-hooks
          (cons 'time-stamp write-file-hooks)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B%f!<%6MQ=i4|2=%U%!%$%k(B
;; ~/.emacs.my.el $B$K8D?MMQ@_Dj$r=q$1$^$9!#(B
;; $B$3$N%U%!%$%k$rD>@\$$$8$j$?$/$J$$>l9g$O!"8D?M@_Dj$rJ,N%$7$F$/$@$5$$(B

(if (file-exists-p (expand-file-name "~/.emacs.my.el"))
    (load (expand-file-name "~/.emacs.my.el") nil t nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B$3$N%U%!%$%k$K4V0c$$$,$"$C$?>l9g$KA4$F$rL58z$K$7$^$9(B
(put 'eval-expression 'disabled nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ---- language-env DON'T MODIFY THIS LINE!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $BF|K\8lI=<($N@_Dj(B.txt 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (not (boundp 'MULE))
    (if (featurep 'xemacs)
        ; xemacs21 $B$N>l9g(B
        (progn
          (set-language-environment "Japanese")
          (set-default-buffer-file-coding-system 'euc-jp-unix)
          (set-keyboard-coding-system 'euc-jp-unix)
          (if (not window-system) (set-terminal-coding-system 'euc-jp-unix))
        )
        ; emacs20 $B$N>l9g(B
        (progn
          (set-language-environment "Japanese")
          (set-default-coding-systems 'euc-japan-unix)
          (set-keyboard-coding-system 'euc-japan-unix)
          (if (not window-system) (set-terminal-coding-system 'euc-japan-unix))
        )
    )
)
; $BF|K\8l(B info $B$,J8;z2=$1$7$J$$$h$&$K(B
(auto-compression-mode t)
; xemacs $B$N(B shell-mode $B$G(B $BF|K\8l(B EUC $B$,;H$($k$h$&$K$9$k(B
(if (featurep 'xemacs)
    (add-hook 'shell-mode-hook (function
       (lambda () (set-buffer-process-coding-system 'euc-japan 'euc-japan))))
)
; $BF|K\8l(B grep
(if (file-exists-p "/usr/bin/jgrep")
    (setq grep-command "jgrep -n -e ")
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B4A;zJQ49(B (wnn) $B$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(set-input-method 'japanese-egg-wnn)
;;(toggle-input-method nil)
; ---- language-env end DON'T MODIFY THIS LINE!

;; Local Variables:
;; mode: emacs-lisp
;; buffer-file-coding-system: junet-unix
;; End:

