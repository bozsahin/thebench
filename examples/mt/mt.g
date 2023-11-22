to        | inf   :: vp/^iv: \p.p
arrrived  | v     :: s\^np : \x.arrive x 
persuaded | v     :: ((s\^np)/^vp)/^np : \x\p\y.persuade (p x) x y
promised  | v     :: ((s\^np)/^vp)/^np : \x\p\y.promise (p y) x y
seemed    | v     :: (s\^np)/^vp : \p\y.seem (p y)
study     | v     :: iv:\x.study x
john      | n     :: np:john
mary      | n     :: np:mary
larry     | n     :: np:larry
and       | coord :: (@x\@x)/@x:\p\q\x.and (p x) (q x)
and       | coord :: (@x\@x)/@x:\p\q\x\y.and (p x y) (q x y)
