;; set up a database of examples 
(defparameter *db* '(
(4 (sally sees harry))
(14 (balb us mur um aedificat))
(15 (sally sees harry))
(16 (missed "THE SATURDAY DANCE"))
(20a (see en))
(20b (persuade en))
(21 (bural _na_ygu))
(26 (tom persuades harry to go))
(34a ("BAYI YARA" walngarra naba_ygu))
(34b ("BAYI YARA" walngarra bural _na_ygu "BAGUN YIBI_GU"))
(34c ("BAYI YARA" walngarra "BANGUN YIBI_NGU" bura_li))
(34d (yabu numa_NGU giga_n banaga_ygu))
(34e ("BAYI YARA" numa_NGU giga_n gubi_NGU mawa_li))
(43 (fairies seem "TO BE" "AT THE BOTTOM OF MY GARDEN"))
(50 (There seem "TO BE" fairies "AT THE BOTTOM OF MY GARDEN"))
(51 (There seem fairies "TO BE" "AT THE BOTTOM OF MY GARDEN"))
(52 (man that sally sees))
(53 (mur us quem balb us aedificare vult))
(54 (wall that balbus wants to build))
(56 (mur um balb us aedificat))
(59a (dynes welodd gath))
(59b (ddynes welodd cath))
(60 (dynes werthodd ieuan "Y CEFFYL" iddi))
(63a ("BAYI YARA" miyanda _nu yanu))
(63b ("BALAN YIBI" "BANGUL YARA_NGU" miyanda _nu_ru bura_n))
(63c ("BAYI YARA" jilwal_na _nu "BEGUN GUGA_GU" yanu))
(65 (man that walks and talks))
(66bad (man that walks and he talks))
(fig1a (the house that jack built))
(fig1b (i bought and you sold "THE HOUSE THAT JACK BUILT"))
(fig1c (give mary records and alice books))
(fig1d (balb us mur um et marc us villa m aedificare vult))
(fn40a (the CEO who Mercier believes and who Camier hopes might save the company))
(fn40bbad (the CEO who Mercier hopes and who believes might save the company))
(72 ("BAYI YARA" yanu "," "BANGUN YIBI_NGU" bura_n))
(94a (ubur a_tuuk))
(94b (ubur a_puot dhaag_e))
(94c (ubur dhaage a_yaan_e))
(3s (harry saw himself))
(23s (mae rhiannon yn cysgu))
(26s (gwelodd gwyn "EI HUN"))
(fig1as (maen nhw n perswadio grwpiau i fynd adref))
(fig1bs (roedd gwyn yn dymuno i grwpiau fynd adref))
(43s (nyurra nana_na bura_n "," banaga_nyu))
(50as (arnaup nutaraq titirautimik nani_si rqu_vaa))
(50bbads (arnaup nutaraq titirauti nani rqu_vaa))
(51as (nanuq piita_p tugu _ta_a))
(51bs (miiraq kamat _tu_q))
(52as (angut aallaam_mik tigu_si_sima _su_q))
(52bbads (angut aallaat tigu_sima _sa_a))
(59s (ang babae ng b_um_ili ng_baro))
(61b (iyon ang baro ng b_in_ili ng_babae))
(63s (sino ang kabibili lang "NG TELA"))
(65s (ano ang sinabi "NI PEDRO" na binili "NI LINDA"))
(69s (huhugasan ko at pupunasan mo ang_mga_pinggan))
;; below are experimental
;(l1 (persuade Harry to buy and Barry to sell))
;(l2 (persuade to go to London John))
;(l3 (want to go and promise to accompany to London)) ;; think of who didja ...
;(l4 (folded rug over)) ; and curtains under, the painting
;(d1 (what you can)) ;; and what you must not count on
;(d2 (what Terry asked)) ;; and what Mary promised Harry to read
;(s2 (gave without reading)) ;; the book I gave without reading and lent wout stamping to Harry
))

(defun  test-ders()
  (terpri)
  (dolist (p *db*)(progn (cky_analyze (second p))
			   (format t "~%=======~%~s~%========~%" (first p))
			   (cky_show_analysis))))

(defun  test-lfs()
  (dolist (p *db*)
    (progn (cky_analyze (second p))
	   (format t "~%=======~%~s~%========~%" (first p))
	   (cky-show-lf-eqv))))