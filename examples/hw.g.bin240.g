%%%
%This file is autogenerated by the processor at: 14:30:50 of Sunday, 25.12.2022 (GMT+3)
%%%

#subj  ( np : (lt)  ) --> ( s/(s\np) : (\ lt . \ p . p lt) )<367561, 1.0>;

#lewis-rule  ( np/np : (lt)  ) --> ( np : (\ lt . lt nompred) )<409311, 1.0>;

|it| n :: xp[lex=no,per=s3] : (it) <714696, 1.0>;

|john| n :: np[per=3s,lex=yes] : (john) <142030, 1.0>;

|mary| n :: np : (mary) <466906, 1.0>;

|and| c :: @x/(@x\@x) : (\ p . \ q . \ x . and (p x) (q x)) <804243, 1.0>;

|study| inf :: iv : (\ x . study x) <603022, 1.0>;

|persuaded| v :: ((s\np)/vp)/+np : (\ x . \ p . \ y . persuade (p x) x y) <959788, 1.0>;

|promised| v :: ((s\\np)/vp)//np : (\ x . \ p . \ y . promise (p y) x y) <703171, 1.0>;

|wanted| v :: ((s\*np)/^vp)/np : (\ x . \ p . \ y . want (p x) y) <615699, 1.0>;

|expected| v :: ((s\np)/vp)/np : (\ x . \ p . \ y . expect (p x) y) <395168, 1.0>;

|considered| v :: ((s\np)/propp)/np : (\ x . \ p . \ y . consider (p x) y) <589364, 1.0>;

|seemed| v :: (s\xp)/s : (\ p . \ x . seem p) <551325, 1.0>;

|seemed| v :: (s\np)/vp : (\ p . \ x . seem (p x)) <850492, 1.0>;

|to| p :: vp/iv : (\ p . p) <256745, 1.0>;

|have| aux :: iv/iv : (\ p . p) <258185, 1.0>;

|bought| v :: iv/np : (\ x . \ y . buy x y) <634181, 1.0>;

|the| det :: np/*n : (def) <981806, 1.0>;

|car| n :: n : (car) <591844, 1.0>;

|handsome| p :: propp : (\ x . handsome x) <823794, 1.0>;

|kicked the bucked| idio :: s\np : (\ x . die_euphemistic x) <59317, 1.0>;

|kicked| v :: ((s\np)/(the bucket))/predp : (\ p . \ x . \ y . die_
                                             (euphemistic p x) y) <599270, 1.0>;

|pick up| pv :: iv/np : (\ x . \ y . pick_culminate x y) <751291, 1.0>;

|pick| pv2 :: (iv/(up))/np : (\ x . \ y . \ z . hold (culminate y) x z) <277255, 1.0>;

|run a mile| past :: iv : (\ x . run x) <426742, 1.0>;

|km| past :: s\np : (\ x . past run x) <336469, 1.0>;

|buy| past :: iv/np : (\ x . \ y . buy x y) <995498, 1.0>;

|bought something| past :: (s\np)/np : (\ x . \ y . past buy x y) <843084, 1.0>;

