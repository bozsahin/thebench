wall | n :: N : \x.  wall x
company | n :: N : \x.  company x
CEO | n :: N : \x.  CEO x
mercier | n :: s/(s\np[agr=3s]):\p.p  mercier
camier | n :: s/(s\np[agr=3s]):\p.p  camier
who | wh :: (n\n)/(s\np) : \p\q\x. and (p x)(q x)
believes | v :: (s\np[agr=3s])/s : \s\x. believe s x
hopes | v :: (s\np[agr=3s])/s : \s\x. hope s x
might | aux :: (s\np)/vp: \p\x. might (p x)
save | v :: vp/np: \x\y. save x y
Balbus | np :: s/(s\np[agr=3s,case=nom]) : \p. p  balb
build | v :: vp[typ=inf]/np : \x\y. build x y
see | v :: VP[typ=inf]/np : \x\y. see x y
persuade | v :: (VP[typ=inf]/VP[type=to])/np : \x\q\y. persuade (q x) x y
sees  | v :: (S\NP[agr=3s])/NP : \x\y. see x y                     
saw | v :: (S\NP[agr=?a])/NP[type=full,agr=?a] : \x\y. saw x y                     
gwelodd | v :: (S/NP)/NP[agr=3s] : \y\x. saw x y                     
seen    | v :: (S[voi=pass]\np[agr=3s]) : \x. see x ( sk x  one)     
open  | v :: S\NP : \y. init( open y) 			         
open  | v :: (S\NP)/NP : \x\y. cause( init( open x))y              
break  | v :: S\NP : \x. init( broken x) 	         	         
open  | v :: (S\NP)/NP : \x\y. cause( init( broken x))y            
i | n :: S/(S\NP[agr=1s]): \p. p  i 				 
Harry | n :: (S\NP[agr=?x])\((S\NP[agr=?x])/NP) : \p. p  harry     
Harry | n :: NP :  harry     
Balb | n :: N :  balb                                             
us | aff :: (S/(S\NP[case=nom,agr=3s]))\*N : \x\p.p x              
mur | n :: N :  wall 						 
um | aff :: ((S\NP[case=nom,agr=?x])/((S\NP[case=nom,agr=?x]) \NP[case=acc]))\N : \x\p.p x 
um | aff :: (s/(s\np[case=acc]))\N : \x\p.p x                      
m | aff :: ((S\NP[case=nom,agr=?x])/((S\NP[case=nom,agr=?x]) \NP[case=acc]))\N : \x\p.p x 
aedificat | v :: (S[type=pres]\NP[case=nom,agr=3s])\NP[case=acc] : \x\y.  build x y 			                  
depart | v :: s[type=inf]\np : \y. depart y 				  
ed    | aff :: (s\np[agr=?a])\(s[type=inf]\np): \p\y. past (p y)        
dismiss | v :: (s[type=inf]\np)/np :\x\y. dismiss  x y			          
rocket | n :: n:  rocket 						  
scient | n :: n\n : \x. science x 					  
ist   | aff :: n\n : \p\x. practitioner p x				  
Harry | n :: S/(S\NP[agr=3s]) : \p. p  harry                      
sally | n :: S/(S\NP[agr=3s]) : \p. p  sally                      
sally | n :: NP[agr=3s] :  sally                      
missed | v :: s/np : \x. miss x  me
the saturday dance| n ::  s\(s/np) : \p. p  thesaturdaydance
saw | v :: (s\np[agr=?a])/np[type=ana,agr=?a] : \a\y. saw (a y) y 
mae | v :: (S/VP[typ=asp] )/NP[agr=3s]: \y\p. pres (p y)
rhiannon | n :: (S/VP[typ=asp])\((S/VP[type=asp])/NP[agr=3s]) : \p. p  rhiannon
yn  | asp :: vp[type=asp]/vp : \p\y. prog (p y)
cysgu  | v :: VP : \y. sleep y
himself | n :: (s\np[agr=3sm])\((s\np[agr=3sm])/np[type=ana,agr=3sm]) : \p. p  self                  
saw | v :: (s\np[agr=?a])/np[type=pro,agr=?a] : \a\y. saw ( something a) y 
him | n :: (s\np[agr=?a])\((s\np[agr=?a])/np[type=pro]) : \p. p  him                  
Tom | n :: s/(s\np[agr=3s]) : \p.p  tom 			  
wants | v :: (s\np[agr=3s])/vp[type=to_inf] : \p\y. want (p y) y 
Harry | n :: ((s\np[agr=?a])/vp[type=to_inf])\(((s\np[agr=?a])/vp[type=to_inf])/np) : \p.p  harry 					  
to | p :: vp[type=to_inf]/vp[type=inf]: \p. p 			  
go | v :: VP[type=inf] : \y. go y					  
aedificare | v :: (S[type=inf]\NP[case=nom])\NP[case=acc] : \x\y.  build x y 			                  
the | det :: (s/(s\np))/n: \x\p.p x
the | det :: (vp\(vp/np))/n: \x\p.p x
house  | n :: n:  house
built  | v :: (s\np)/np: \x\y. built x y
jack   | n :: s/(s\np): \p.p  jack
sold  | v :: (s\np)/np: \x\y. sold x y
you | n :: s/(s\np): \p.p  you
bought  | v :: (s\np)/np: \x\y. bought x y
the house that jack built  |  n :: s\(s/np) : \p.p  house_built_by_jack
give | v :: ((s\np)/np)/np: \x\y\z.  give y x z
mary | n :: ((s\np)/np)\(((s\np)/np)/np): \p.p  mary
records | n :: (s\np)\((s\np)/np): \p.p  records
alice | n :: ((s\np)/np)\(((s\np)/np)/np): \p.p  alice
books | n :: (s\np)\((s\np)/np): \p.p  books
there | xp :: ((s/xp[type=pred,class=pp,agr=?a])/np[agr=?a])/ ((s\np[agr=?a])/xp[type=pred,class=pp,agr=?a]) : \r\y\p.r p y 
to be | v :: vp[typ=to_inf,agr=?b]/xp[type=pred,class=pp,agr=?b] : \p\y.p y
fairies | n :: (s/xp[type=pred,class=pp,agr=pl])\^((s/xp[type=pred,class=pp,agr=pl])/np[agr=pl]) : \p.p  fairies
fairies | n :: s/(s\np[agr=pl]) : \p.p  fairies
at the bottom of my garden  |n 	 :: s\(s/xp[type=pred,class=pp,agr=?z]): \p. p  atbmg    
at the bottom of my garden  |n 	 :: vp[agr=?a]\(vp[agr=?a]/xp[type=pred,class=pp,agr=?a]): \p. p  atbmg    
at the bottom of my garden  |n 	 :: s\(s/xp[type=pred,class=pp,agr=?z]): \p. p  atbmg    
erzahlen | vg :: s[type=t]/(s/((vp\np[case=acc])\np[case=dat])) : \p. p  tell
wird | x :: (s/vp)/np[agr=3s] : \x\p.  will (p x) 
er | n :: (s/vp)\(s/vp/np[agr=3s,case=nom]) : \p.p  he 
seiner tochter  |n  :: vp/(vp\np[case=acc]): \p.p  daughter    
ein marchen | n ::  (vp\np[case=acc])/((vp\np[case=acc])\np[case=dat]) : \p. p  story  
konnen   | v :: vp\vp : \p.  able p 	                          

and | x :: (@X\*@X)/*@X : \p\q\x.  and (p x) (q x)                         
man | n :: n :  man
that | a :: (n\n)/(s\np) : \p\q\x.  and (p x)(q x)
that | a :: (n\n)/(s/np) : \p\q\x.  and (p x)(q x)
walks | v :: s\np[agr=3s] : \x.  walk x 
talks | v :: s\np[agr=3s] : \x.  talk x
he | n ::  s/(s\np) : \p. p  he 					          
et | x :: (@X\*@X)/*@X : \p\q\x.  and (p x) (q x)               
Marc | n :: N :  mark                                             
villa | n :: N :  house 						 
vult | vl :: (S\NP[case=nom,agr=3s])\(S[type=inf]\NP): \p\x. want (p x)x  
ubur | n :: s/(s\np) : \p.p  ubur 		                 
a-tuuk | v :: s\np : \x. play x
a-puot | v :: (s\np)/np[agr=3s] : \y\x. beat x y
dhaag-e | n :: (s\np)\((s\np)/np[agr=3s]) : \p. p  woman 
dhaage | n :: s/(s\np) : \p.p  woman 
ubur | n :: s[type=top]/(s/np[agr=3s]) : \p p  ubur
a-yaan-e | v :: (s\np)/np[agr=3s]: \y\x.  insult x y
teim | n :: s/(s\np[case=dat,agr=3s]) : \p.p  them		 
likar | v :: (s\np[case=dat,agr=3s])/np[case=nom] : \x\y. likes x y
maturinn | n :: (s\np[case=dat,agr=3s])\((s\np[case=dat,agr=3s])/np[case=nom]) : \p. p  food 
og | x :: (@X\*@X)/*@X : \p\q\x.  and (p x) (q x) 
borda | v :: s/np[case=acc,num=plu] : \x.  eat  x  they            
mikid | n :: s\(s/np[case=acc]) : \p. p  much 
Jon  | n :: s/(s\np[case=nom]) : \p. p  jon                       
lysti | v :: (s\np[case=nom])/np[case=dat] : \x\y.  describe x y
bordadi | v :: (s\np[case=nom])/np[case=acc] : \x\y.  ate x y
matinn  | n :: s\(s/np[case=acc]) : \p. p  food 
gwelodd | v :: (s/np[type=ana,agr=3])/np[agr=3]: \y\a.  saw (a y) y 
gwyn | n :: (s/np)\((s/np)/np[agr=3,gen=m]) : \p. p  gwyn  
ei hun | ref :: s\(s/np[type=ana,agr=3,gen=m]) : \p.p  self
maen | v :: (s/vp[type=ing])/np[agr=3,num=plu] : \y\p. p y        
nhw  | pro :: (s/vp[type=ing])\((S/vp[type=ing])/np[agr=3,num=plu]) : \p. p  them 
n    | ger :: VP[type=ing]/vp[type=inf] : \p. p
grwpiau   | n :: (vp[type=inf]/vp[type=to_inf])\((vp[type=inf]/vp[type=to_inf])/np) : \p. p  groups 
i  | p :: vp[type=to_inf]/vp[type=inf] : \p. p 
fynd | v :: vp[type=inf]/pp : \x\y. goto x y
adref | p :: vp[type=inf]\(vp[type=inf]/pp) : \p. p  home
roedd | v :: (s/vp[type=ing])/np[agr=3] : \y\p.p y
gwyn | n :: (s/vp[type=ing])\(s/vp[type=ing]/np[agr=3,num=s]) : \p.p  gwyn
yn    | ger :: vp[type=ing]/vp[type=inf] : \p. p
dymuno | v :: vp[type=inf]/s[type=inf]: \s\y.  want s y
i | c :: (s[type=inf]/vp[type=inf])/np : \y\p.p y
grwpiau   | n :: (s[type=inf]/vp[type=inf])\((s[type=inf]/vp[type=inf])/np) : \p. p  groups 
dynes     | n :: n[agr=3fs] :  woman					
ddynes     | n :: n[agr=3fs] :  woman					
welodd     | a :: (n[agr=?a]\n[agr=?a])/np : \x\q\y.  and ( saw x y)(q y)
welodd     | a :: (n[agr=?a]\n[agr=?a])/np : \y\q\x.  and ( saw x y)(q x)
gath      | n :: (n[agr=?x]\n[agr=?x])\((n[agr=?x]\n[agr=?x])/NP) : \p.p  cat
cath      | n :: (n[agr=?x]\n[agr=?x])\((n[agr=?x]\n[agr=?x])/NP) : \p.p  cat
ieuan | n :: ((n[agr=?x]\n[agr=?x])/np)\(((n[agr=?x]\n[agr=?x])/np)/np) : \p. p  ewan
y ceffyl | n :: (n[agr=?x]\n[agr=?x])\((n[agr=?x]\n[agr=?x])/np) : \p. p  horse
iddi | p :: (n[agr=3fs]\n[agr=3fs])\(n[agr=3fs]\n[agr=3fs]) : \p. p 
bayi yara| n :: s/(s\np[case=abs]): \p. p  man 			
walngarra | v :: (s\np[case=abs])/vp[case=abs]: \p\x.  want (p x)x
naba-ygu  | v :: VP[case=abs] : \x. bathe x
bural     | v :: vp[typ=inf]\np[case=erg]: \y\x.  see x y
bagun yibi-gu | n  :: vp[case=abs]\(vp[case=abs]/np[case=dat]): \p.p  woman
bangun yibi-ngu | n :: vp[case=abs]/(vp[case=abs]\np[case=erg]): \p.p  woman
bura-li  | v :: vp[case=abs]\np[case=erg]: \x\y. see y x
yabu     | n :: s/(s\np[case=abs]) : \p.p  mother
numa-ngu | n :: (s\np[case=abs])/(s\np[case=abs]\np[case=erg]): \p. p  father
banaga-ygu | v :: vp[case=abs]: \x.  return x
gubi-ngu   | n :: (vp[case=abs])/(vp[case=abs]\np[case=erg]): \p. p  gubi
mawa-li | v :: vp[case=abs]\np[case=erg]: \x\y. examine y x 
miyanda | v :: s\np[case=abs] : \x. laugh x 		        
yanu    | v :: s\np[case=abs]: \x. go x
balan yibi | n :: s/(s\np[case=abs]) : \p.p  woman
bangul yara-ngu  | n  :: (s\np[case=abs])/(s\np[case=abs]\np[case=erg]) : \p. p  man
bura-n | v :: (s\np[case=abs])\np[case=erg]: \x\y.  see y x
jilwal-na   | v :: (s\np[case=abs])/np[case=dat]: \x\y.  kick x y
begun guda-gu  | n  :: ((s/(s\np[case=abs]))\(s/(s\np[case=abs]))) \(((s/(s\np[case=abs]))\(s/(s\np[case=abs])))/np[case=dat]) : \p. p  dog
bangun yibi-ngu | n :: s/(s\np[case=erg]) : \p.p  woman 		
bura-n | v :: s\np[case=erg]: \y. saw  topic y
nyurra | n :: s/(s\np[type=pro,case=nom]) : \p.p  you		
banaga-nyu | v :: S :  return  topic
,| x :: (@X\*@X)/*@X : \p\q.  and p q 
miqqat  | n :: s/(s\np[case=abs,agr=3pl]): \p.p  children 		
juuna   | n :: vp[case=erg]/(vp[case=erg]\np[case=abs]): \p.p  juuna
ikiu-ssa-llu-gu  | v :: vp[case=erg]\np[case=abs]: \x\y.  help x y
niriursui-pp-u-t  | v :: (s\np[case=abs,agr=3pl])\vp : \p\y. promise (p y)y
qiti-ssa-llu-tik  | v  :: vp[case=abs] : \x. dance x
arnaup | n :: s/(s\np[case=erg,agr=3sg]):\p.p  woman		
nutaraq | n :: (s\np[case=erg,agr=3sg])/((s\np[case=erg,agr=3sg])\np[case=abs,agr=3sg]) : \p.p  child
titirautimik | n :: vp[case=abs]/(vp[case=abs]\np[case=obl]): \p.p  pencil
nani-si | v :: vp[case=abs]\np[case=obl]: \x\y.  antip ( find x y) 
titirauti | n :: vp[case=erg]/(vp[case=erg]\np[case=abs]): \p.p  pencil
nani      | v :: vp[case=erg]\np[case=abs]: \x\y.  find x y
nanuq | n :: s/(s\np[case=abs]) : \p.p  polarbear			
piita-p | n :: ((s/(s\np[case=abs,agr=?a]))\(s/(s\np[case=abs,agr=?a])))/ (((s/(s\np[case=abs,agr=?a]))\(s/(s\np[case=abs,agr=?a])))\np[case=erg]) :\p.p  piita
tugu | v :: (s\np[case=erg])\np[case=abs]: \x\y.  kill x y 
miiraq | n :: s/(s\np[case=abs]): \p. p  child
kamat  | v :: s\np[case=abs]: \x. angry x
angut | n :: s/(s\np[case=abs]) : \p.p  man			
aallaat | n :: s/(s\np[case=abs]) : \p.p  man			
aallaam-mik | n :: ((s/(s\np[case=abs,agr=?a]))\(s/(s\np[case=abs,agr=?a])))/ (((s/(s\np[case=abs,agr=?a]))\(s/(s\np[case=abs,agr=?a])))\np[case=inst]) :\p.p  gun
tigu-si-sima | v :: s\np[case=abs]\np[case=inst]: \x\y. take x y
tigu-sima | v :: s\np[case=erg]\np[case=abs]: \x\y. take x y
ang  | det :: (s\(s/np[case=ang]))/n : \p\q\x. and (p x)(q x)     
babae | n :: n:  woman
ng | lnk :: (n\n)/(s[voi=?v]/np[case=ang]): \p\n\x. and (p x)(n x)
b-um-ili   | v :: (s[voi=av]/np[case=ang])/np[case=ng]: \x\y. buy x y
ng-baro    | n :: (s[voi=av]/np[case=ang])\((s[voi=av]/np[case=ang])/np[case=ng]) : \p.p  dress
iyon | wh :: s/np[case=ang]: \x. that x                          
baro | n :: n:  dress
b-in-ili | v :: (s[voi=ov]/np[case=ang])/np[case=ng]: \x\y. buy y x
ng-babae | n :: (s[voi=ov]/np[case=ang])\((s[voi=ov]/np[case=ang])/np[case=ng]) : \p.p  woman
sino | wh :: s[type=whq]/np[case=ang]: \x. who x                
ang | det :: (s\(s/np[case=ang]))/(s[voi=none]/np[case=ng]) : \p\x.p x
kabibili | v :: (s[voi=none]/np[case=ng])/np[case=ng]: \x\y.  buy x y
lang | a :: s\s : \p. just p
ng tela | n :: (s[voi=none]/np[case=ng])\((s[voi=none]/np[case=ng])/np[case=ng]) : \p.p  cloth
ano  | wh :: s[type=whq]/np[case=ang]: \x. what x                
ang | det :: (s\(s[type=whq]/np[case=ang]))/(s/np[case=ang]) : \p\x.p x
sinabi | v :: (s[voi=ov]/s)/np[case=ng]: \x\p.  say p x
ni pedro | n :: (s[voi=ov]/s)\((s[voi=ov]/s)/np[case=ng]) :\p. p  pedro
na | c :: s/s: \p.p
binili | v :: (s[voi=ov]/np[case=ang])/np[case=ng]: \x\y.  buy y x
ni linda | n :: (s[voi=ov]/np[case=ang])\(s[voi=ov]/np[case=ang]/np[case=ng]) :\p. p  linda
huhugasan | v :: (s[voi=dv]/np[case=ang])/np[case=ng]: \x\y. wash y x  
ko | pro :: (s[voi=dv]/np[case=ang])\(s[voi=dv]/np[case=ang]/np[case=ng]) : \p. p  i
at | x :: (@X\*@X)/*@X: \p\q\x. and (p x)(q x)
pupunasan | v :: (s[voi=dv]/np[case=ang])/np[case=ng]: \x\y. dry y x  
mo | pro :: (s[voi=dv]/np[case=ang])\(s[voi=dv]/np[case=ang]/np[case=ng]) : \p. p  you
ang-mga-pinggan  |  n :: s[voi=dv]\(s[voi=dv]/np[case=ang]): \p.p  dishes

% putting all multiline problematics at the end manually

-nu    | aff :: ((s/(s\np[case=abs]))\((s/(s\np[case=abs]))))\(s\np[case=abs]) :\p\q\r\x.  and(r x)( and (p x)(q (\x.x) x))
werthodd | v :: ((n[agr=?x]\n[agr=?x])/np)/np : \y\x\q\w.  and ( sold w x y)(q w)                
quem | a :: ((s/(s\np[gen=m]))\(s/(s\np[gen=m])))/(s\np[case=acc]) : \p\q\x.  and (p x)(q (\x.x) x)                            
persuaded  | v :: (S[voi=pass]\NP[agr=3s])/VP[type=to_inf] : \p\x. persuade (p x) x ( sk x  one)     
en  | aff :: vp[type=pss]\(VP[typ=inf]/np):\p\y. p y ( something y)
persuades | v :: ((s\np[agr=3s])/VP[type=to_inf])/np : \x\q\y. persuade (q x) x y
seem | v :: (s\np[agr=pl])/vp[typ=to_inf,class=vp,agr=pl] : \p\y. seem (p y) 
perswadio | v :: (vp[type=inf]/vp[type=to_inf])/np : \x\p\y.  persuade (p x)x y
-na-ygu | aff :: vp[typ=antipss]\(vp[typ=inf]\np[case=erg]) : \p\x. p ( something x) x
-na-ygu | aff :: (vp[typ=antipss]/np[case=dat])\(vp[typ=inf]\np[case=erg]) : \p\x\y.  antip (p y x)
giga-n | v :: ((s\np[case=abs])\np[case=erg])/vp[case=abs] : \p\x\y. tell (p y)y x
-nu-ru  | aff :: (((s\np[case=abs])/(s\np[case=abs]\np[case=erg]))\ ((s\np[case=abs])/(s\np[case=abs] \np[case=erg])))\(s\np[case=abs]) :\p\q\r\y\x.  and(r x y)( and (p x)(q (\x.x) x))
nana-na | n :: (s\np[case=nom,type=pro])/((s\np[type=pro,case=nom])\np[type=pro,case=acc]) : \p. p ( and  us ( topic  us))
bura-n | v :: (s\np[case=nom,type=pro])\np[case=acc,type=pro] : \x\y. and( saw ( sk x)( sk y))( noteq ( sk x)( sk y))
rqu-vaa | v :: ((s\np[case=erg,agr=3sg])\np[case=abs,agr=3sg])\vp[case=abs] : \p\x\y. tell(p x)x y
-ta-a | aff :: (((s/(s\np[case=abs,agr=?a]))\(s/(s\np[case=abs,agr=?a])))\np[case=erg])\ ((s\np[case=erg])\np[case=abs]) : \p\q\r1\r.  and (p (r1 (\ x.x)) q)(r (r1 (\ x.x)))
-tu-q | aff :: ((s/(s\np[case=abs,agr=?a]))\(s/(s\np[case=abs,agr=?a])))\ (s\np[case=abs]): \p\q\r\x. and (p x)( and (q (\ x.x) x)(r x))
-su-q | aff :: ((s/(s\np[case=abs,agr=?a]))\(s/(s\np[case=abs,agr=?a])))\ (s\np[case=abs]): \p\q\r\x. and (p x)( and (q (\ x.x) x)(r x))
-sa-a | aff :: (((s/(s\np[case=abs,agr=?a]))\(s/(s\np[case=abs,agr=?a])))\np[case=erg])\ ((s\np[case=erg])\np[case=abs]) : \p\q\x. and (p x)(q x)
en  | aff :: (vp[type=pss]/vp[type=to])\((VP[typ=inf]/vp[typ=to])/np):\p\q\y.p y q ( something y)

% manually adding auto generated rules
%

#_p2_380  s : a --> (s\np[agr=3s])\((s\np[agr=3s])/s) : \a\p.p a
#_p2_378  np : a --> vp[typ=inf]\(vp[typ=inf]/np) : \a\p.p a
#_g2_193  np : a --> (vp[typ=inf]/vp[type=to])\((vp[typ=inf]/vp[type=to])/np) : \a\p.p a
#_p2_337  np[case=acc] : a --> (s\np[case=nom])/((s\np[case=nom])\np[case=acc]) : \a\p.p a
#_p2_373  np : a --> (s\np[case=abs])\((s\np[case=abs])/np[case=dat]) : \a\p.p a
#_p2_371  np : a --> s/(s\np[case=abs]) : \a\p.p a
#_p2_266  np : a --> (s[voi=dv]/np[case=ang])\((s[voi=dv]/np[case=ang])/np[case=ng]) : \a\p.p a
#_p2_268  np : a --> s\(s/np[case=acc]) : \a\p.p a
#_g2_179  np[agr=3s] : a --> (s/vp[typ=asp])\((s/vp[typ=asp])/np[agr=3s]) : \a\p.p a
#_p2_204  vp[type=to_inf] : a --> (s[voi=pass]\np[agr=3s])\((s[voi=pass]\np[agr=3s])/vp[type=to_inf]) : \a\p.p a
#_g2_172  np : a --> ((s\np)/np)\(((s\np)/np)/np) : \a\p.p a
#_g2_171  xp[type=pred] : a --> vp[typ=to_inf]\(vp[typ=to_inf]/xp[type=pred]) : \a\p.p a
#_g2_170  vp : a --> vp/(vp\vp) : \a\p.p a
#_g2_164  np[case=nom] : a --> (s\np[case=dat])\((s\np[case=dat])/np[case=nom]) : \a\p.p a
#_g2_162  np[case=dat] : a --> (s\np[case=nom])\((s\np[case=nom])/np[case=dat]) : \a\p.p a
#_g2_161  np[case=acc] : a --> (s\np[case=nom])\((s\np[case=nom])/np[case=acc]) : \a\p.p a
#_p2_264  np[agr=3] : a --> (s/vp[type=ing])\((s/vp[type=ing])/np[agr=3]) : \a\p.p a
#_g2_158  pp : a --> vp[type=inf]\(vp[type=inf]/pp) : \a\p.p a
#_g2_156  s[type=inf] : a --> vp[type=inf]\(vp[type=inf]/s[type=inf]) : \a\p.p a
#_p2_202  vp : a --> (s\np[agr=pl])\((s\np[agr=pl])/vp[typ=to_inf]) : \a\p.p a
#_p2_262  np[case=erg] : a --> vp[case=abs]/(vp[case=abs]\np[case=erg]) : \a\p.p a
#_g2_149  np[case=erg] : a --> (s\np[case=abs])/((s\np[case=abs])\np[case=erg]) : \a\p.p a
#_g2_147  np[case=erg] : a --> s/(s\np[case=erg]) : \a\p.p a
#_p2_227  np[case=abs] : a --> vp[case=erg]/(vp[case=erg]\np[case=abs]) : \a\p.p a
#_g2_145  vp : a --> (s\np[case=abs])/((s\np[case=abs])\vp) : \a\p.p a
#_g2_144  np[case=obl] : a --> vp[case=abs]/(vp[case=abs]\np[case=obl]) : \a\p.p a
#_p2_215  np[case=abs] : a --> (s\np[case=erg])/((s\np[case=erg])\np[case=abs]) : \a\p.p a
#_g2_140  np[case=inst] : a --> (s\np[case=abs])/((s\np[case=abs])\np[case=inst]) : \a\p.p a
#_g2_138  np[case=ng] : a --> (s[voi=av]/np[case=ang])\((s[voi=av]/np[case=ang])/np[case=ng]) : \a\p.p a
#_p2_213  np[case=ng] : a --> (s[voi=ov]/np[case=ang])\((s[voi=ov]/np[case=ang])/np[case=ng]) : \a\p.p a
#_g2_136  np[case=ng] : a --> (s[voi=none]/np[case=ng])\((s[voi=none]/np[case=ng])/np[case=ng]) : \a\p.p a
#_g2_135  np[case=ng] : a --> (s[voi=ov]/s)\((s[voi=ov]/s)/np[case=ng]) : \a\p.p a
#_g2_131  np : a --> ((n[agr=?x]\n[agr=?x])/np)\(((n[agr=?x]\n[agr=?x])/np)/np) : \a\p.p a
#_g2_129  np : a --> ((s\np[agr=3s])/vp[type=to_inf])\(((s\np[agr=3s])/vp[type=to_inf])/np) : \a\p.p a
#_g2_127  np : a --> (vp[type=inf]/vp[type=to_inf])\((vp[type=inf]/vp[type=to_inf])/np) : \a\p.p a
#_g2_126  vp[case=abs] : a --> ((s\np[case=abs])\np[case=erg])\(((s\np[case=abs])\np[case=erg])/vp[case=abs]) : \a\p.p a
#_g2_124  vp[case=abs] : a --> ((s\np[case=erg])\np[case=abs])/(((s\np[case=erg])\np[case=abs])\vp[case=abs]) : \a\p.p a
