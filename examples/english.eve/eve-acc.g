more  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.more x
more  | det :: predp/predp : \x.more x
juice  | un :: np[type=uncount,agr=3] : juice
?  | pun :: s[type=q]\*np : \x.q x
?  | pun :: s[type=q]\*np_loc : \x.q x
?  | pun :: s[type=q]\*s[type=imp] : \x.q x
?  | pun :: s[type=q]\*s[type=ing] : \x.q x
?  | pun :: s[type=q]\*s[type=fin] : \x.q x
?  | pun :: s\*s[type=q] : \x.x
where  | q :: s[type=q]/(s/pp) : \x.q place x
is  | aux :: (s\np)/(s\np) : \x\y.prt (x y)
is  | aux :: s/(s\np)/np : \x\y.q prt (y x)
is  | aux :: (s/np)/(s/np) : \x.prt x
is  | copv> :: (s[type=?x]\np[agr=3,count=sg])/np : \x\y.simp prt x y
is  | copv> :: (s[type=q]/np)/np :\x\y.q simp prt y x
is  | copv> :: (s/np)/np :\x\y.simp prt y x
is  | copv> :: s/np :\x.simp prt x
is  | copv> :: (s/pp)/np :\x\y.simp prt y x
is  | copv> :: s[type=?x]\np[agr=3,count=sg] : \x.simp prt x
is  | copv> :: s[type=q]/np :\x.q simp prt x
is  | copv> :: (s[type=?x]\np[agr=3,count=sg])/predp : \x\y.simp prt x y
is  | copv> :: (s[type=q]/predp)/np[agr=3,count=sg]:\x\y.q simp prt y x
is  | copv> :: (s/np)/predp:\x\y.simp prt x y
your  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.your x
its  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.its x
cup  | np :: np[type=count,agr=3,count=sg] : cup
I  | pro :: np[agr=1,count=sg] : I
I  | raisedpro :: s/(s\np[agr=1,count=sg]) :\p.p I
took  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst take x y
it  | pro :: np[agr=3,count=sg] : it
it  | raisedpro :: s/(s\np[agr=3,count=sg]) :\p.p it
am  | aux :: (s\np)/(s\np) : \x\y.prt (x y)
am  | aux :: s/(s\np)/np : \x\y.q prt (y x)
am  | aux :: (s/np)/(s/np) : \x.prt x
am  | copv> :: (s[type=?x]\np[agr=1,count=sg])/np : \x\y.simp prt x y
am  | copv> :: s[type=?x]\np[agr=1,count=sg] : \x.simp prt x
am  | copv> :: (s[type=?x]\np[agr=1,count=sg])/predp : \x\y.simp prt x y
am  | copv> :: (s[type=q]/predp)/np[agr=1,count=sg] : \x\y.q simp prt y x
sure  | predp :: predp : sure
are  | aux :: (s\np)/(s\np) : \x\y.prt (x y)
are  | aux :: s/(s\np)/np : \x\y.q prt (y x)
are  | aux :: (s/np)/(s/np) : \x.prt x
are  | copv> :: (s[type=?x]\np)/np : \x\y.simp prt x y
are  | copv> :: (s[type=q]/np)/np : \x\y.q simp prt y x
are  | copv> :: (s/np)/np : \x\y.simp prt y x
are  | copv> :: s[type=?x]\np : \x.simp prt x
are  | copv> :: s[type=q]/np : \x.q simp prt x
are  | copv> :: (s[type=?x]\np)/predp : \x\y.simp prt x y
are  | copv> :: (s[type=q]/predp)/np : \x\y.q simp prt y x
you  | pro :: np[agr=2] : you
you  | raisedpro :: s/(s\np[agr=2]) :\p.p you
saying  | tving> :: (s[type=ing]\np)/np : \x\y.cont say x y
saying  | tving> :: (s[type=ing]\np)/s : \x\y.cont say x y
Fraser  | pn :: np[type=proper,agr=3] : Fraser
Fraser  | raisedpn :: s/(s\np[type=proper,agr=3]) :\p.p Fraser
what  | q :: s[type=q]/(s/np) : \x.q what x
that  | np :: np[agr=3] : that
that  | raisednp :: s/(s\np[agr=3]) :\p.p that
a  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.a x
fly  | np :: np[type=count,agr=3,count=sg] : fly
get  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt get x y
one  | np :: np[agr=3] : one
and  | conj :: (@x\@x)/@x : \p\q\x.and (p x)(q x)
telephone  | np :: np[type=count,agr=3,count=sg] : telephone
he  | pro :: np[agr=3,count=sg] : he
he  | raisedpro :: s/(s\np[agr=3,count=sg]) :\p.p he
gave  | dv2> :: (s[type=?x]\np)/np/np : \x\y\z.simp pst give x y z
who  | q :: s[type=q]/(s/np) : \x.q who x
calling  | tving> :: (s[type=ing]\np)/np : \x\y.cont call x y
do  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt do x y
do  | tv> :: (s[type=?x]\np)/np : \x\y.do x y
do  | tv> :: s[type=?x]/np : \x.simp prt do x I
do  | dv> :: (s[type=?x]\np)/np/np : \x\y.simp prt do x y
do  | iv> :: s[type=?x]\np : \x.simp prt do x
do  | iv> :: s[type=?x]\np : \x.do x
doing  | tving> :: (s[type=ing]\np)/np : \x\y.cont do x y
doing  | tving> :: s[type=ing]\np : \x.cont do x
doing  | tving> :: s[type=ing]/np : \x.cont do x you
do  | aux :: (s\np)/(s\np) : \x\y.simp prt (x y)
do  | aux :: s/(s\np)/np : \x\y.q simp prt (y x)
do  | aux :: (s/np)/(s/np) : \x.simp prt x
the  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.the x
the  | det :: s/(s\np)/np :\x\p.p (the x)
man  | np :: np[type=count,agr=3,count=sg] : man
want  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt want x y
cookie  | np :: np[type=count,agr=3,count=sg] : cookie
can  | mod :: (s\np)/(s\np) : \x\y.can (x y)
can  | mod :: s/(s\np)/np : \x\y.q can (y x)
can  | mod :: (s/np)/(s/np) : \x.can x
can  | mod :: s[type=?x]/np : \x.q can x
cannot  | mod :: (s\np)/(s\np) : \x\y.cannot (x y)
could  | mod :: (s\np)/(s\np) : \x\y.could (x y)
might  | mod :: (s\np)/(s\np) : \x\y.might (x y)
may  | mod :: (s\np)/(s\np) : \x\y.may (x y)
may  | mod :: s/(s\np)/np : \x\y.q may (y x)
should  | mod :: (s\np)/(s\np) : \x\y.should (x y)
should  | mod :: (s/np)/(s/np) : \x.should x
should  | mod :: s/(s\np)/np : \x\y.q should (y x)
d-better  | mod ::  (s\np)/(s\np) : \x\y.d-better (x y)
d-like  | mod ::  (s\np)/(s\np) : \x\y.d-like (x y)
must  | mod :: (s\np)/(s\np) : \x\y.must (x y)
shall  | mod :: (s/np)/(s/np) : \x.shall x
shall  | mod :: s/(s\np)/np : \x\y.q shall (y x)
there  | np :: np_loc : there
baby  | np :: np[type=count,agr=3,count=sg] : baby
Mommy  | pn :: np[type=proper,agr=3] : Mommy
Mommy  | raisedpn :: s/(s\np[type=proper,agr=3]) :\p.p Mommy
read  | iv> :: s[type=?x]\np : \x.simp prt read x
busy  | predp :: predp : busy
read  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt read x y
book  | np :: np[type=count,agr=3,count=sg] : book
stool  | np :: np[type=count,agr=3,count=sg] : stool
did  | aux :: (s\np)/(s\np) : \x\y.simp pst (x y)
did  | aux :: s/(s\np)/np : \x\y.q simp pst (y x)
did  | aux :: (s/np)/(s/np) : \x.simp pst x
did  | aux :: s[type=q]/np : \x.q simp pst x
did  | aux> :: (s[type=q]/s)/np : \x\y.q simp pst (y x)
did  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst do x y
did  | tv2> :: s[type=?x]\np : \x.simp pst do x
eat  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt eat x y
ate  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst eat x y
milk  | un :: np[type=uncount,agr=3] : milk
have  | aux :: (s\np)/(s\np) : \x\y.prt (x y)
have  | aux :: s/(s\np)/np : \x\y.q prt (y x)
have  | aux :: (s/np)/(s/np) : \x.prt x
have  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt have x y
have  | tv> :: (s[type=?x]\np)/np : \x\y.have x y
have  | tv> :: s[type=?x]/np : \x.simp prt have x I
having  | tving> :: (s[type=ing]\np)/np : \x\y.cont have x y
just  | adv :: (s\np)/(s\np) : \x\y.(x just) y
just  | adv :: @x/@x : \x.x
had  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst have x y
some  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.some x
juice  | un :: np[type=uncount,agr=3] : juice
water  | un :: np[type=uncount,agr=3] : water
coffee  | un :: np[type=uncount,agr=3] : coffee
drinking  | tving> :: (s[type=ing]\np)/np : \x\y.cont drink x y
his  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.his x
go  | iv> :: s[type=?x]\np : \x.simp prt go x
go  | iv> :: s[type=?x]\np : \x.go x
go  | tv> :: (s[type=?x]\np)/np_loc : \x\y.go x y
later  | adv :: s/s : \x.x later
later  | adv :: s\s : \x.x later
we  | pro :: np[agr=1,count=pl] : we
we  | raisedpro :: s/(s\np[agr=1,count=pl]) :\p.p we
will  | aux :: (s\np)/(s\np) : \x\y.simp ftr (x y)
will  | aux :: s/(s\np)/np : \x\y.q simp ftr (y x)
will  | aux :: (s/np)/(s/np) : \x.simp ftr x
hat  | np :: np[type=count,agr=3,count=sg] : hat
and  | conj :: s/s : \x.and x
with  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (with x) z
dolly  | np :: np[type=count,agr=3,count=sg] : dolly
her  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.her x
bottle  | np :: np[type=count,agr=3,count=sg] : bottle
does  | aux :: (s\np)/(s\np) : \x\y.simp prt (x y)
does  | aux :: s/(s\np)/np : \x\y.q simp prt (y x)
does  | aux :: (s/np)/(s/np) : \x.simp prt x
does  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt do x y
does  | tv> :: s[type=?x]/np : \x.simp prt do x
soldiers  | pln :: np[type=count,agr=3,count=pl] : pl soldier
here  | adv :: (s\np)/(s\np) : \x\y.(x here) y
here  | adv :: (s\np)\(s\np) : \x\y.(x here) y
and  | conj :: (np\np)/np : \x\y.and (x y)
Jack  | pn :: np[type=proper,agr=3] : Jack
Jill  | pn :: np[type=proper,agr=3] : Jill
Eve  | pn :: np[type=proper,agr=3] : Eve
Eve  | raisedpn :: s/(s\np[type=proper,agr=3]) :\p.p Eve
has  | aux :: (s\np)/(s\np) : \x\y.prt (x y)
has  | aux :: (s/np)/(s/np) : \x.prt x
has  | tv> :: (s[type=?x]\np[agr=3,count=sg])/np : \x\y.simp prt have x y
has  | tv> :: (s[type=?x]\np[agr=3,count=sg])/pp[prep=on]/np : \x\y\z.simp prt have x y z
gonna  | aux :: (s\np)/(s\np) : \x\y.gng (x y)
find  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt find x y
man  | np :: np[type=count,agr=3,count=sg] : man
that  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.that x
this  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.this x
that  | det :: s/(s\np)/np :\x\p.p (that x)
this  | det :: s/(s\np)/np :\x\p.p (this x)
write  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt write x y
letter  | np :: np[type=count,agr=3,count=sg] : letter
pencil  | np :: np[type=count,agr=3,count=sg] : pencil
in  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (in x) z
in  | pre :: ((s\np)\(s\np))/np_loc : \x\y\z.y (in x) z
corner  | np :: np[type=count,agr=3,count=sg] : corner
going-to  | aux :: (s\np)/(s\np) : \x\y.gng (x y)
shoe  | np :: np[type=count,agr=3,count=sg] : shoe
Racketyboom  | pn :: np[type=proper,agr=3] : Racketyboom
read | tv-about> :: (s[type=?x]\np)/pp[prep=about] : \x\y.simp prt read x y
choochoo  | np :: np[type=count,agr=3,count=sg] : choochoo
for  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (for x) z
for  | pre :: (s/s)/np : \x\y.y (for x)
lunch  | np :: np[type=count,agr=3,count=sg] : lunch
top  | np :: np[agr=3] : top
ducks  | pln :: np[type=count,agr=3,count=pl] : pl duck
say  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt say x y
what  | np :: np : what
what  | raisedpro :: s/(s\np[agr=1,count=sg]) :\p.p what
who  | np :: np : who
radio  | np :: np[type=count,agr=3,count=sg] : radio
want  | tv> :: (s[type=?x]\np)/(s\np)/np : \x\y\z.simp prt want (y x z) x z
want  | tv> :: (s[type=?x]\np)/(s\np)/np : \x\y\z.simp prt want (y x) x z
want  | tv> :: (s[type=?x]\np)/(s\np)/np : \x\y\z.want (y x) x z
me  | pro :: np: me
sit  | iv> :: s[type=?x]\np : \x.simp prt sit x
sit  | iv> :: s[type=?x]\np : \x.sit x
on  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (on x) z
on  | pre :: ((s\np)\(s\np))/np_loc : \x\y\z.y (on x) z
under  | pre :: ((s\np)\(s\np))/np_loc : \x\y\z.y (under x) z
who  | q :: s[type=q]/(s\np) : \x.q who x
sitting  | iving> :: s[type=ing]\np : \x.cont sit x
Neil  | pn :: np[type=proper,agr=3] : Neil
good  | adj :: np/np : \x.good x
job  | np :: np[type=count,agr=3,count=sg] : job
girl  | np :: np[type=count,agr=3,count=sg] : girl
was  | aux :: (s\np)/(s\np) : \x\y.pst (x y)
was  | aux :: s/(s\np)/np : \x\y.q pst (y x)
was  | aux :: (s/np)/(s/np) : \x.pst x
was  | copv2> :: (s[type=?x]\np[count=sg])/np : \x\y.simp pst x y
was  | copv2> :: (s[type=q]/np)/np[count=sg] :\x\y.q simp pst y x
was  | copv2> :: (s/np)/np[count=sg] :\x\y.simp pst y x
was  | copv2> :: (s[type=?x]\np[count=sg])/predp : \x\y.simp pst x y
was  | copv2> :: (s[type=q]/predp)/np[count=sg] :\x\y.q simp pst y x
was  | copv2> :: s[type=?x]\np[count=sg] : \x.simp pst x
seat  | np :: np[type=count,agr=3,count=sg] : seat
alright  | predp :: predp : alright
Sambo  | pn :: np[type=proper,agr=3] : Sambo
because  | conj :: s/s : \x.because x
because  | conj :: s/np : \x.because x
making  | tving> :: (s[type=ing]\np)/np : \x\y.cont make x y
lunch  | np :: np[type=count,agr=3,count=sg] : lunch
hit  | tv> :: (s[type=?x]\np)/np : \x\y.simp pst hit x y
head  | np :: np[type=count,agr=3,count=sg] : head
paper  | np :: np[type=count,agr=3,count=sg] : paper
my  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.my x
my  | x :: np : my thing
diaper  | np :: np[type=count,agr=3,count=sg] : diaper
going  | iving> :: s[type=ing]\np : \x.cont go x
upstairs  | adv :: (s\np)\(s\np) : \x\y.(x upstairs) y
chair  | np :: np[type=count,agr=3,count=sg] : chair
cheese  | un :: np[type=uncount,agr=3] : cheese
good  | np :: np[type=count,agr=3,count=sg] : good
taperecorder  | np :: np[type=count,agr=3,count=sg] : taperecorder
soup  | un :: np[type=uncount,agr=3] : soup
pudding  | un :: np[type=uncount,agr=3] : pudding
cracker  | np :: np[type=count,agr=3,count=sg] : cracker
down  | np :: np[type=acc] : down
up  | np :: np[type=acc] : up
apple  | np :: np[type=count,agr=3,count=sg] : apple
far  | adv :: (s\np)\(s\np) : \x\y.(x far) y
celery  | un :: np[type=uncount,agr=3] : celery
eats  | tvs> :: (s[type=?x]\np[agr=3,count=sg])/np : \x\y.simp prt eat x y
she  | pro :: np[agr=3,count=sg] : she
she  | raisedpro :: s/(s\np[agr=3,count=sg]) :\p.p she
name  | np :: np[type=count,agr=3,count=sg] : name
this  | np :: np[agr=3] : this
dolly  | pn :: np[type=proper,agr=3] : dolly
's  | x :: (np\np)/np : \x\y.x (of y)
spool  | np :: np[type=count,agr=3,count=sg] : spool
belongs  | tvs-to> :: (s[type=?x]\np[agr=3,count=sg])/pp[prep=to] : \x\y.simp prt belong x y
napkin  | np :: np[type=count,agr=3,count=sg] : napkin
bring  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt bring x y
bring  | tv> :: (s[type=?x]\np)/np : \x\y.bring x y
kitchen  | np :: np[type=place,agr=3,count=sg] : kitchen
mouth  | np :: np[type=count,agr=3,count=sg] : mouth
taste  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt taste x y
would  | aux :: (s\np)/(s\np) : \x\y.would (x y)
would  | aux :: s/(s\np)/np : \x\y.q would (y x)
would  | aux :: (s/np)/(s/np) : \x.would x
change  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt change x y
record  | np :: np[type=count,agr=3,count=sg] : record
fireplace  | p :: np[type=place,agr=3,count=sg] : fireplace
call  | tv> :: (s[type=?x]\np)/np : \x\y.call x y
Granma  | pn :: np[type=proper,agr=3] : Granma
called  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst call x y
look  | iv> :: s[type=?x]\np : \x.simp prt look x
look  | iv> :: s[type=?x]\np : \x.look x
them  | pro :: np[type=proper,agr=3] : them
too  | adv :: @x\@x : \x.x too
too  | adv :: (s\np)\(s\np) : \x\y.(x too) y
too  | adv :: (s\np)/(s\np) : \x\y.(x too) y
Cromer  | pn :: np[type=proper,agr=3] : Cromer
coffee  | un :: np[type=uncount,agr=3] : coffee
coming  | iving> :: s[type=ing]\np : \x.cont come x
nice  | adj :: np/np : \x.nice x
Becky  | pn :: np[type=proper,agr=3] : Becky
writing  | tving> :: (s[type=ing]\np)/np : \x\y.cont write x y
fall  | iv> :: s[type=?x]\np : \x.fall x
be  | copv> :: (s[type=?x]\np)/predp : \x\y.be x y
be  | copv> :: (s[type=?x]\np)/np : \x\y.be x y
be  | copv> :: s[type=?x]\np : \x.be x
better  | predp :: predp : better
cough  | np :: np[type=count,agr=3,count=sg] : cough
banjo  | np :: np[type=count,agr=3,count=sg] : banjo
floor  | np :: np[type=count,agr=3,count=sg] : floor
out  | pre :: ((s\np)\(s\np))/np_loc : \x\y\z.y (out x) z
out  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (out x) z
here  | np :: np_loc : here
keep  | tv-out> :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.simp prt keep x y z
your  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.your x
your  | det :: s/(s\np)/np :\x\p.p (your x)
finger  | np :: np[type=count,agr=3,count=sg] : finger
Mama  | pn :: np[type=proper,agr=3] : Mama
yours  | np :: np[agr=3] : yours
sit  | iv-down :: (s[type=?x]\np)/pp[prep=down] : \x\y.simp prt sit x y
sit  | iv-down :: (s[type=?x]\np)/pp[prep=down] : \x\y.sit x y
sit  | iv-on :: (s[type=?x]\np)/pp[prep=on] : \x\y.simp prt sit x y
sit  | iv-on :: (s[type=?x]\np)/pp[prep=on] : \x\y.sit x y
turn  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt turn x y
turn  | tv> :: (s[type=?x]\np)/np : \x\y.turn x y
turn  | iv> :: s[type=?x]\np : \x.turn x
play  | iv> :: s[type=?x]\np : \x.simp prt play x
play  | iv-with> :: (s[type=?x]\np)/pp[prep=with] : \x\y.play x y
play  | iv-with> :: (s[type=?x]\np)/pp[prep=with] : \x\y.simp prt play x y
play  | iv> :: s[type=?x]\np : \x.play x
playing  | iving> :: s[type=ing]\np : \x.cont play x
playing  | tving-with> :: (s[type=ing]\np)/pp[prep=with] : \x\y.cont play x y
pardon  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt pardon x y
see  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt see x y
letter  | np :: np[type=count,agr=3,count=sg] : letter
over  | pre :: ((s\np)\(s\np))/np_loc : \x\y\z.y (over x) z
Kathy  | pn :: np[type=proper,agr=3] : Kathy
sugar  | un :: np[type=uncount,agr=3] : sugar
goes  | ivs :: s[type=?x]\np[agr=3,count=sg] : \x.simp prt go x
king  | np :: np[type=count,agr=3,count=sg] : king
bear  | np :: np[type=count,agr=3,count=sg] : bear
cat  | np :: np[type=count,agr=3,count=sg] : cat
fox  | np :: np[type=count,agr=3,count=sg] : fox
dog  | np :: np[type=count,agr=3,count=sg] : dog
HumptyDumpty  | pn :: np[type=proper,agr=3] : HumptyDumpty
Dumpty  | pn :: np[type=proper,agr=3] : Dumpty
kitty  | np :: np[type=count,agr=3,count=sg] : kitty
right  | predp :: predp : right
fell  | tv-off> :: (s[type=?x]\np)/pp[prep=off]: \x\y.simp pst fall x y
well  | np :: np[type=count,agr=3,count=sg] : well
horsie  | np :: np[agr=3] : horsie
horsie  | raisednp :: s/(s\np[type=proper,agr=3]) :\p.p horsies
hurt  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt hurt x y
hurt  | tv> :: (s[type=?x]\np)/np : \x\y.simp pst hurt x y
hurt  | tv> :: (s[type=?x]\np)/np : \x\y.hurt x y
fish  | np :: np[type=count,agr=3,count=sg] : fish
fish  | pln :: np[type=count,agr=3,count=pl] : pl fish
they  | pro :: np[agr=3,count=pl] : they
they  | raisedpro :: s/(s\np[agr=3,count=pl]) :\p.p they
swimming  | iving> :: s[type=ing]\np : \x.cont swim x
briefcase  | np :: np[type=count,agr=3,count=sg] : briefcase
dance  | iv> :: s[type=?x]\np : \x.dance x
bird  | np :: np[type=count,agr=3,count=sg] : bird
hear  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt hear x y
light  | un :: np[type=uncount,agr=3] : light
horse  | np :: np[type=count,agr=3,count=sg] : horse
wait  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt wait x y
off  | np :: np: off
which  | adj :: np[type=qw]/np : \x.which x
rest  | un :: np[type=uncount,agr=3] : rest
crying  | tving> :: s[type=ing]\np : \x.cont cry x
table  | np :: np[type=count,agr=3,count=sg] : table
outside  | adv :: (s\np)\(s\np) : \x\y.(x outside) y
outside  | np :: np[type=acc] : outside
unhappy  | predp :: predp : unhappy
fix  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt fix x y
Sandy  | pn :: np[type=proper,agr=3] : Sandy
bibbie  | np :: np[type=count,agr=3,count=sg] : bibbie
tapioca  | un :: np[type=uncount,agr=3] : tapioca
forgot  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst forget x y
spoon  | np :: np[type=count,agr=3,count=sg] : spoon
breakfast  | un :: np[type=uncount,agr=3] : breakfast
bed  | np :: np[type=count,agr=3,count=sg] : bed
Papa  | pn :: np[type=proper,agr=3] : Papa
Papa  | raisedpn :: s/(s\np[type=proper,agr=3]) :\p.p Papa
tomato-soup  | un :: np[type=uncount,agr=3] : tomato-soup
tomato  | np :: np[type=count,agr=3,count=sg] : tomato
gone  | predp :: predp : gone
cook  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt cook x y
cook  | iv> :: s[type=?x]\np : \x.simp prt cook x
wiener  | np :: np[type=count,agr=3,count=sg] : wiener
dropped  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst drop x y
skunk  | np :: np[type=count,agr=3,count=sg] : skunk
pencils  | pln :: np[type=count,agr=3,count=pl] : pl pencil
Gordon  | pn :: np[type=proper,agr=3] : Gordon
send  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt send x y
box  | np :: np[type=count,agr=3,count=sg] : box
Sheila  | pn :: np[type=proper,agr=3] : Sheila
using  | tving> :: (s[type=ing]\np)/np : \x\y.cont use x y
eraser  | np :: np[type=count,agr=3,count=sg] : eraser
cut  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt cut x y
cut  | tv> :: (s[type=?x]\np)/np : \x\y.simp pst cut x y
finished  | tv2 :: (s[type=?x]\np)/np :\x\y.simp pst finish x y
cleaning  | un :: np[type=uncount,agr=3] : cleaning
cupboard  | np :: np[type=count,agr=3,count=sg] : cupboard
ready  | predp :: predp : ready
need  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt need x y
but  | conj :: s/s : \x.but x
an  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.an x
understand  | tv> :: (s[type=?x]\np)/np : \x\y.understand x y
understand  | tv> :: (s[type=?x]\np)/s : \x\y.understand x y
push  | s :: s : -push-
went  | tv2> :: s[type=?x]\np : \x.simp pst go x
bike  | np :: np[type=count,agr=3,count=sg] : bike
to  | x :: ((s\np)\(s\np))/(s\np) : \x\y\z.y (x z) z
to  | x :: (s\np)/(s\np) : \p\x.p x                
Cathy  | pn :: np[type=proper,agr=3] : Cathy
Cathy  | raisedpn :: s/(s\np[type=proper,agr=3]) :\p.p Cathy
candles  | pln :: np[type=count,agr=3,count=pl] : pl candle
sure  | adv :: @x/@x : \x.x sure
writing  | tving-on> :: (s[type=ing]\np)/pp[prep=on] : \x\y.cont write x y
crayons  | pln :: np[type=count,agr=3,count=pl] : pl crayon
give  | dv> :: (s[type=?x]\np)/np/np : \x\y\z.simp prt give x y z
fixing  | tving> :: (s[type=ing]\np)/np : \x\y.cont fix x y
lots-of  | adj :: np/np : \x.lots-of x
use  | tv> :: (s[type=?x]\np)/np : \x\y.use x y
pegs  | pln :: np[type=count,agr=3,count=pl] : pl peg
cheese-sandwich  | np :: np[type=count,agr=3,count=sg] : cheese-sandwich
hot  | predp :: predp : hot
not  | neg :: s\+s : \x. (not x)
not  | neg :: (s\np)\(s\np) : \p\x.not (p x)
not  | neg :: @x/@x : \x.not x
been  | aux :: (s\np)/(s\np) : \x\y.prft be (x y)
drawing  | iving> :: s[type=ing]\np : \x.cont draw x
grape-juice  | un :: np[type=uncount,agr=3] : grape-juice
welcome  | predp :: predp : welcome
another  | det :: np/np : \x.another x
nut  | np :: np[type=count,agr=3,count=sg] : nut
now  | adv :: s\s : \x.x now
then  | adv :: s\s : \x.x then
now  | np :: np : now
allgone  | predp :: predp : allgone
bicycle  | np :: np[type=count,agr=3,count=sg] : bicycle
there  | adv :: (s\np)\(s\np) : \x\y.(x there) y
there  | adv :: (s\np)/(s\np) : \x\y.(x there) y
there  | interj :: s/s : \x.x there
here  | interj :: s/s : \x.x here
Jim  | pn :: np[type=proper,agr=3] : Jim
funny  | adj :: np/np : \x.funny x
things  | pln :: np[type=count,agr=3,count=pl] : pl thing
again  | adv :: (s\np)\(s\np) : \x\y.(x again) y
chirps  | ivs :: s[type=?x]\np[agr=3,count=sg] : \x.simp prt chirp x
goes  | x :: (s[type=?x]\np[agr=3,count=sg])/s : \x\y.simp prt say x y
chirp  | iv> :: s[type=?x]\np : \x.simp prt chirp x
chirp  | iv> :: s[type=?x]\np : \x.chirp x
him  | pro :: np: him
something  | np :: np[agr=3] : something
duck  | np :: np[type=count,agr=3,count=sg] : duck
else  | x :: @x\@x : \x.x else
lunchtime  | np :: np : lunchtime
bread  | un :: np[type=uncount,agr=3] : bread
pick  | tv-up> :: (s[type=?x]\np)/pp[prep=up] : \x\y.simp prt pick x y
right  | adv :: @x/@x : \x.x
jumping  | iving> :: s[type=ing]\np : \x.cont jump x
piece  | np :: np[type=count,agr=3,count=sg] : piece
sleepy  | predp :: predp : sleepy
butter  | un :: np[type=uncount,agr=3] : butter
noise  | un :: np[type=uncount,agr=3] : noise
chirps  | pln :: np[type=count,agr=3,count=pl] : pl chirp
chirp  | np :: np[type=count,agr=3,count=sg] : chirp
snowman  | np :: np[type=count,agr=3,count=sg] : snowman
wearing  | tving> :: (s[type=ing]\np)/np : \x\y.cont wear x y
glasses  | pln :: np[type=count,agr=3,count=pl] : pl glass
gone  | iv3-away> :: (s[type=?x]\np)/pp[prep=away] : \x\y.prft go x y
bouillon  | un :: np[type=uncount,agr=3] : bouillon
sleeping  | iving> :: s[type=ing]\np : \x.cont sleep x
laying  | tving> :: s[type=ing]\np : \x.cont lay x
clean  | adj :: np/np : \x.clean x
new  | adj :: np/np : \x.new x
blanket  | np :: np[type=count,agr=3,count=sg] : blanket
green  | predp :: predp : green
green  | un :: np[type=uncount, agr=3] : green
lying  | iving-on> :: (s[type=ing]\np)/pp[prep=on] : \x\y.cont lie x y
couch  | np :: np[type=count,agr=3,count=sg] : couch
hold  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt hold x y
tie  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt tie x y
dooc  | np :: np[agr=3] : dooc
shoes  | pln :: np[type=count,agr=3,count=pl] : pl shoe
tie  | tv-up> :: (s[type=?x]\np)/pp[prep=up] : \x\y.simp prt tie x y
tie  | tv-up> :: (s[type=?x]\np)/pp[prep=up]/np : \x\y\z.simp prt tie x y z
dl-el-fl  | np :: np[agr=3] : dl-el-fl
fl  | np :: np[agr=3] : fl
sandwich  | np :: np[type=count,agr=3,count=sg] : sandwich
almost  | x :: @x/@x : \x.x almost
done  | predp :: predp : done
blow  | tv-on> :: (s[type=?x]\np)/pp[prep=on] : \x\y.simp prt blow x y
peanutbutter  | un :: np[type=uncount,agr=3] : peanutbutter
squirrels  | pln :: np[type=count,agr=3,count=pl] : pl squirrel
paddle  | np :: np[type=count,agr=3,count=sg] : paddle
bite  | tv> :: (s[type=?x]\np)/np : \x\y.bite x y
bit  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst bite x y
hole  | np :: np[type=count,agr=3,count=sg] : hole
sorry  | predp :: predp : sorry
melted  | iv2> :: s[type=?x]\np : \x.simp pst melt x
came  | iv2> :: s[type=?x]\np : \x.simp pst come x
comes  | ivs> :: s[type=?x]\np[agr=3,count=sg] : \x.simp prt come x
everyday  | adv :: (s\np)\(s\np) : \x\y.(x everyday) y
spit  | tv-out> :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.spit x y z
spit  | tv-up> :: (s[type=?x]\np)/pp[prep=up] : \x\y.simp prt spit x y
on  | adv :: (s\np)\(s\np) : \x\y.(x on) y
Mom  | pn :: np[type=proper,agr=3] : Mom
touch  | tv> :: (s[type=?x]\np)/np : \x\y.touch x y
touch  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt touch x y
clean  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt clean x y
napkins  | pln :: np[type=count,agr=3,count=pl] : pl napkin
fell  | iv-down> :: (s[type=?x]\np)/pp[prep=down]: \x\y.simp pst fall x y
sit  | iv-up> :: (s[type=?x]\np)/pp[prep=up]: \x\y.simp prt sit x y
managed  | iv2> :: s[type=?x]\np : \x.simp pst manage x
very  | adv :: @x/@x : \x.x
well  | adv :: (s\np)\(s\np) : \x\y.(x well) y
well  | interj :: s/s : \x.x
teeth  | pln :: np[type=count,agr=3,count=pl] : pl tooth
big  | adj :: np/np : \x.big x
Wednesday  | np :: np : Wednesday
get  | tv-out> :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.simp prt get x y z
going  | iving-away> :: (s[type=ing]\np)/pp[prep=away] : \x\y.cont go x y
then  | adv :: s/s : \x.x then
nap  | np :: np[type=count,agr=3,count=sg] : nap
bead  | np :: np[type=count,agr=3,count=sg] : bead
beads  | np :: np[type=count,agr=3,count=sg] : beads
beads  | pln :: np[type=count,agr=3,count=pl] : pl bead
easier  | predp :: predp : easier
cookbook  | np :: np[type=count,agr=3,count=sg] : cookbook
got  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst get x y
got  | tv2> :: (s[type=?x]\np)/np : \x\y.prft get x y
Granny  | pn :: np[type=proper,agr=3] : Granny
call  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt call x y
peek  | iv> :: s[type=?x]\np : \x.simp prt peek x
tell  | tv> :: (s[type=?x]\np)/(s\np)/np : \x\y\z.simp prt tell x (y x) z
come  | iv-in :: (s[type=?x]\np)/pp[prep=in] : \x\y.come x y
standing  | iving-out> :: (s[type=ing]\np)/pp[prep=out] : \x\y.cont stand x y
cold  | np :: np[type=count,agr=3,count=sg] : cold
Rick  | pn :: np[type=proper,agr=3] : Rick
Rick  | raisedpn :: s/(s\np[type=proper,agr=3]) :\p.p Rick
gas-man  | np :: np[type=count,agr=3,count=sg] : gas-man
dolls  | pln :: np[type=count,agr=3,count=pl] : pl doll
open  | tv> :: (s[type=?x]\np)/np : \x\y.open x y
bag  | np :: np[type=count,agr=3,count=sg] : bag
blow  | iv> :: s[type=?x]\np : \x.simp prt blow x
bringing  | tving> :: (s[type=ing]\np)/np : \x\y.cont bring x y
both  | x :: @x\@x : \x.x both
baby-doll  | np :: np[type=count,agr=3,count=sg] : baby-doll
clear  | tv-out :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.simp prt clear x y z
boy  | np :: np[type=count,agr=3,count=sg] : boy
stay  | iv> :: s[type=?x]\np : \x.simp prt stay x
stay  | iv> :: s[type=?x]\np : \x.stay x
help  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt help x y
up  | pre :: ((s\np)\(s\np))/np_loc : \x\y\z.y (up x) z
down  | pre :: ((s\np)\(s\np))/np_loc : \x\y\z.y (down x) z
pen  | np :: np[type=count,agr=3,count=sg] : pen
ring  | np :: np[type=count,agr=3,count=sg] : ring
watch  | np :: np[type=count,agr=3,count=sg] : watch
idea  | np :: np[type=count,agr=3,count=sg] : idea
early  | predp :: predp : early
stamps  | pln :: np[type=count,agr=3,count=pl] : pl stamp
giving  | dving> :: (s[type=ing]\np)/np/np : \x\y\z.cont give x y z
Sarah  | pn :: np[type=proper,agr=3] : Sarah
Sarah  | raisedpn :: s/(s\np[type=proper,agr=3]) :\p.p Sarah
party  | np :: np[type=count,agr=3,count=sg] : party
cake-plate  | np :: np[type=count,agr=3,count=sg] : cake-plate
HippityHop  | pn :: np[type=proper,agr=3] : HippityHop
train  | np :: np[type=count,agr=3,count=sg] : train
together  | adv :: (s\np)\(s\np) : \x\y.(x together) y
know  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt know x y
ones  | pln :: np[type=count,agr=3,count=pl] : pl one
envelope  | np :: np[type=count,agr=3,count=sg] : envelope
walk  | np :: np[type=count,agr=3,count=sg] : walk
smiling  | iving> :: s[type=ing]\np : \x.cont smile x
doily  | np :: np[type=count,agr=3,count=sg] : doily
wet  | iv2 :: s[type=?x]\np : \x.simp pst wet x
sent  | dv2 :: (s[type=?x]\np)/np/np : \x\y\z.simp pst send x y z
card  | np :: np[type=count,agr=3,count=sg] : card
Nanny  | pn :: np[type=proper,agr=3] : Nanny
these  | np :: np[agr=3] : these
lions  | pln :: np[type=count,agr=3,count=pl] : pl lion
spot  | np :: np[type=count,agr=3,count=sg] : spot
fell  | iv2> :: s[type=?x]\np : \x.simp pst fall x
tunnel  | np :: np[type=count,agr=3,count=sg] : tunnel
little  | adj :: np/np : \x.little x
friend  | np :: np[type=count,agr=3,count=sg] : friend
friends  | pln :: np[type=count,agr=3,count=pl] : pl friend
bubbles  | pln :: np[type=count,agr=3,count=pl] : pl bubble
yet  | adv :: (s\np)\(s\np) : \x\y.(x yet) y
yet  | adv :: @x\@x : \x.x yet
going  | tving-into> :: (s[type=ing]\np)/pp[prep=into] : \x\y.cont go x y
going  | tving-to> :: (s[type=ing]\np)/pp[prep=to] : \x\y.cont go x y
bank  | np :: np[type=count,agr=3,count=sg] : bank
now  | adv :: s/s : \x.x now
now  | adv :: @x/@x : \x.x now
chocolate  | un :: np[type=uncount,agr=3] : chocolate
certainly  | adv :: (s\np)/(s\np) : \x\y.(x certainly) y
eat  | tv-up> :: (s[type=?x]\np)/pp[prep=up]/np : \x\y\z.simp prt eat x y z
first  | adv :: (s\np)\(s\np) : \x\y.(x first) y
cracking  | tving> :: (s[type=ing]\np)/np : \x\y.cont crack x y
pear  | np :: np[type=count,agr=3,count=sg] : pear
mine  | np :: np[agr=3] : mine
birthday-sandwich  | np :: np[type=count,agr=3,count=sg] : birthday-sandwich
birthday-cake  | np :: np[type=count,agr=3,count=sg] : birthday-cake
icing  | np :: np[type=count,agr=3,count=sg] : icing
lick  | tv-off> :: (s[type=?x]\np)/pp[prep=off]/np : \x\y\z.simp prt lick x y z
hands  | pln :: np[type=count,agr=3,count=pl] : pl hand
closet  | np :: np[type=count,agr=3,count=sg] : closet
pour  | tv-in :: (s[type=?x]\np)/pp[prep=in]/np : \x\y\z.simp prt pour x y z
cream  | un :: np[type=uncount,agr=3] : cream
leave  | tv> :: (s[type=?x]\np)/np: \x\y.simp prt leave x y
leave  | tv> :: (s[type=?x]\np)/np : \x\y.leave x y
lovely  | adj :: np/np : \x.lovely x
whose  | pro :: np[type=qw]/np : \x.whose x
swell  | adj :: np/np : \x.swell x
snap  | tv> :: (s[type=?x]\np)/np : \x\y.snap x y
lose  | tv> :: (s[type=?x]\np)/np : \x\y.lose x y
snap  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt snap x y
sees  | tvs> :: (s[type=?x]\np[agr=3,count=sg])/np : \x\y.simp prt see x y
ear  | np :: np[type=count,agr=3,count=sg] : ear
al  | np :: np[type=count,agr=3,count=sg] : al
pull  | tv-down> :: (s[type=?x]\np)/pp[prep=down]/np : \x\y\z.simp prt pull x y z
pull  | tv-out> :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.simp prt pull x y z
pull  | tv-out> :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.pull x y z
pulled  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst pull x y
hair  | un :: np[type=uncount,agr=3] : hair
drum  | np :: np[type=count,agr=3,count=sg] : drum
stick  | np :: np[type=count,agr=3,count=sg] : stick
kiss  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt kiss x y
quite  | adv :: @x/@x : \x.x
sideways  | adv :: (s\np)\(s\np) : \x\y.(x sideways) y
no  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.no x
fun  | np :: np[type=count,agr=3,count=sg] : fun
threw  | tv-away> :: (s[type=?x]\np)/pp[prep=away]/np : \x\y\z.simp pst throw x y z
trash  | un :: np[type=uncount,agr=3] : trash
peepee  | iv> :: s[type=?x]\np : \x.peepee x
belong  | tv-on> :: (s[type=?x]\np)/pp[prep=on] : \x\y.simp prt belong x y
belong  | tv-to> :: (s[type=?x]\np)/pp[prep=to] : \x\y.belong x y
board  | np :: np[type=count,agr=3,count=sg] : board
make  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt make x y
words  | pln :: np[type=count,agr=3,count=pl] : pl word
were  | aux :: (s\np)/(s\np) : \x\y.pst (x y)
were  | aux :: s/(s\np)/np : \x\y.q pst (y x)
were  | aux :: (s/np)/(s/np) : \x.pst x
were  | copv> :: s[type=?x]\np : \x.simp pst x
watching  | tving> :: (s[type=ing]\np)/np : \x\y.cont watch x y
men  | pln :: np[type=count,agr=3,count=pl] : pl man
building  | tving> :: (s[type=ing]\np)/np : \x\y.cont build x y
building  | np :: np[type=count,agr=3,count=sg] : building
Boston  | pn :: np[type=proper,agr=3] : Boston
Saturday  | np :: np : Saturday
any  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.any x
chew  | tv-up> :: (s[type=?x]\np)/pp[prep=up]/np : \x\y\z.simp prt chew x y z
going  | tving-round> :: (s[type=ing]\np)/pp[prep=round] : \x\y.cont go x y
okay  | predp :: predp : okay
squeaky  | adj :: np/np : \x.squeaky x
boat  | np :: np[type=count,agr=3,count=sg] : boat
cool  | predp :: predp : cool
lives  | ivs :: s[type=?x]\np[agr=3,count=sg] : \x.simp prt live x
those  | np :: np[agr=3] : those
mittens  | pln :: np[type=count,agr=3,count=pl] : pl mitten
Frosty  | pn :: np[type=proper,agr=3] : Frosty
melt  | iv> :: s[type=?x]\np : \x.melt x
fell  | iv-off> :: (s[type=?x]\np)/pp[prep=off]: \x\y.simp pst fall x y
bigger  | predp :: predp : bigger
flipflop  | adv :: (s\np)\(s\np) : \x\y.(x flipflop) y
Emerson  | pn :: np[type=proper,agr=3] : Emerson
blue  | predp :: predp : blue
bit  | np :: np[type=count,agr=3,count=sg] : bit
Sneezer  | pn :: np[type=proper,agr=3] : Sneezer
read  | dv> :: (s[type=?x]\np)/np/np : \x\y\z.simp prt read x y z
stories  | pln :: np[type=count,agr=3,count=pl] : pl story
draw  | iv> :: s[type=?x]\np : \x.simp prt draw x
draw  | iv> :: s[type=?x]\np : \x.draw x
abcs  | pln :: np[type=count,agr=3,count=pl] : pl abc
flower  | np :: np[type=count,agr=3,count=sg] : flower
cl  | np :: np[agr=3] : cl
really  | adv :: (s\np)/(s\np) : \x\y.(x really) y
really  | adv :: (s\np)\(s\np) : \x\y.(x really) y
bl  | np :: np[agr=3] : bl
spell  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt spell x y
spell  | tv> :: (s[type=?x]\np)/np : \x\y.spell x y
side  | np :: np[type=count,agr=3,count=sg] : side
dl  | np :: np[agr=3] : dl
spells  | tvs> :: (s[type=?x]\np[agr=3,count=sg])/np : \x\y.simp prt spell x y
word  | np :: np[type=count,agr=3,count=sg] : word
spelling  | tving> :: (s[type=ing]\np)/np : \x\y.cont spell x y
Joanne  | pn :: np[type=proper,agr=3] : Joanne
noodle-soup  | un :: np[type=uncount,agr=3] : noodle-soup
jelly  | adj :: np/np : \x.jelly x
beans  | pln :: np[type=count,agr=3,count=pl] : pl bean
noise  | np :: np[type=count,agr=3,count=sg] : noise
stare  | tv-at> :: (s[type=?x]\np)/pp[prep=at] : \x\y.simp prt stare x y
coat  | np :: np[type=count,agr=3,count=sg] : coat
vitamin-time  | un :: np[type=uncount,agr=3] : vitamin-time
vitamin  | un :: np[type=uncount,agr=3] : vitamin
burned  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst burn x y
everybody  | np :: np[agr=3] : everybody
eating  | iving> :: s[type=ing]\np : \x.cont eat x
but  | pre :: (s\s)/np : \x\y.y but x
peas  | pln :: np[type=count,agr=3,count=pl] : pl pea
worry  | tv-about> :: (s[type=?x]\np)/pp[prep=about] : \x\y.worry x y
outof  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (outof x) z
care  | tv> :: s[type=?x]\np : \x.simp prt care x
nobody  | np :: np[agr=3] : nobody
empty  | adj :: np/np : \x.empty x
tummy  | np :: np[type=count,agr=3,count=sg] : tummy
drop  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt drop x y
drop  | tv> :: (s[type=?x]\np)/np : \x\y.drop x y
letters  | pln :: np[type=count,agr=3,count=pl] : pl letter
pick  | tv-up> :: (s[type=?x]\np)/pp[prep=up]/np : \x\y\z.simp prt pick x y z
pick  | tv-up> :: (s[type=?x]\np)/pp[prep=up]/np : \x\y\z.pick x y z
stop  | iv> :: s[type=?x]\np : \x.simp prt stop x
standing  | iving> :: s[type=ing]\np : \x.cont stand x
going  | iving-along> :: (s[type=ing]\np)/pp[prep=along] : \x\y.cont go x y
kiss  | np :: np[type=count,agr=3,count=sg] : kiss
leave  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt leave x y
three-o-clock  | np :: np : three-o-clock
tablet  | np :: np[type=count,agr=3,count=sg] : tablet
draw  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt draw x y
lady  | np :: np[type=count,agr=3,count=sg] : lady
mustache  | np :: np[type=count,agr=3,count=sg] : mustache
absolutely  | x :: @x/@x : \x.x absolutely
jacket  | np :: np[type=count,agr=3,count=sg] : jacket
long  | adj :: np/np : \x.long x
fine  | predp :: predp : fine
abc  | np :: np[type=count,agr=3,count=sg] : abc
maybe  | conj :: s/s : \x.x maybe
yesterday  | np :: np : yesterday
Pop  | pn :: np[type=proper,agr=3] : Pop
belongs  | tvs-on> :: (s[type=?x]\np[agr=3,count=sg])/pp[prep=on] : \x\y.simp prt belong x y
nothing  | np :: np[agr=3] : nothing
happened  | tv2-to> :: (s[type=?x]\np)/pp[prep=to] : \x\y.simp pst happen x y
brown  | adj :: np/np : \x.brown x
brown  | predp :: predp : brown
red  | predp :: predp : red
glass  | np :: np[type=count,agr=3,count=sg] : glass
first  | conj :: s/s : \x.x first
time  | un :: np[type=uncount,agr=3] : time
Timothy  | pn :: np[type=proper,agr=3] : Timothy
Timmy  | pn :: np[type=proper,agr=3] : Timmy
Josh  | pn :: np[type=proper,agr=3] : Josh
dirty  | predp :: predp : dirty
throw  | tv-away> :: (s[type=?x]\np)/pp[prep=away]/np : \x\y\z.throw x y z
pies  | pln :: np[type=count,agr=3,count=pl] : pl pie
after  | adv :: s/s : \x.x after
take  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt take x y
taking  | tving-off> :: (s[type=ing]\np)/pp[prep=off]/np : \x\y\z.cont take x y z
saw  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst see x y
squirrel  | np :: np[type=count,agr=3,count=sg] : squirrel
laughing  | tving> :: s[type=ing]\np : \x.cont laugh x
funny  | predp :: predp : funny
red  | adj :: np/np : \x.red x
instead-of  | conj :: @x/@x : \x.instead-of x
going  | tving-for> :: (s[type=ing]\np)/pp[prep=for] : \x\y.cont go x y
patting  | tving> :: (s[type=?x]\np)/np : \x\y.cont pat x y
cake  | np :: np[type=count,agr=3,count=sg] : cake
hurt  | iv> :: s[type=?x]\np : \x.hurt x
happiness  | un :: np[type=uncount,agr=3] : happiness
getting  | tving-out> :: (s[type=ing]\np)/pp[prep=out]/np : \x\y\z.cont get x y z
sliver  | np :: np[type=count,agr=3,count=sg] : sliver
folding  | tving> :: (s[type=ing]\np)/np : \x\y.cont fold x y
tears  | pln :: np[type=count,agr=3,count=pl] : pl tear
wipe  | tv> :: (s[type=?x]\np)/np : \x\y.wipe x y
round  | adj :: np/np : \x.round x
cook  | np :: np[type=count,agr=3,count=sg] : cook
turning  | tving> :: (s[type=ing]\np)/np : \x\y.cont turn x y
itself  | pro :: np[agr=3] : itself
made  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst make x y
mistake  | np :: np[type=count,agr=3,count=sg] : mistake
clock  | np :: np[type=count,agr=3,count=sg] : clock
lock  | np :: np[type=count,agr=3,count=sg] : lock
key  | np :: np[type=count,agr=3,count=sg] : key
color  | iv> :: s[type=?x]\np : \x.simp prt color x
color  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt color x y
color  | tv> :: (s[type=?x]\np)/np : \x\y.color x y
cow  | np :: np[type=count,agr=3,count=sg] : cow
thing  | np :: np[type=count,agr=3,count=sg] : thing
turtle  | np :: np[type=count,agr=3,count=sg] : turtle
grahamcracker  | np :: np[type=count,agr=3,count=sg] : grahamcracker
eaten  | tv3> :: (s[type=?x]\np)/np :\x\y.prft eat x y
properly  | adv :: (s\np)\(s\np) : \x\y.(x properly) y
leaves  | pln :: np[type=count,agr=3,count=pl] : pl leaf
growing  | tving> :: s[type=ing]\np : \x.cont grow x
color  | tv-in> :: (s[type=?x]\np)/pp[prep=in]/np : \x\y\z.color x y z
door  | np :: np[type=count,agr=3,count=sg] : door
doorway  | np :: np[type=count,agr=3,count=sg] : doorway
house  | np :: np[type=count,agr=3,count=sg] : house
window  | np :: np[type=count,agr=3,count=sg] : window
probably  | adv :: @x/@x : \x.x probably
true  | predp :: predp : true
suitcase  | np :: np[type=count,agr=3,count=sg] : suitcase
house-building  | np :: np[type=count,agr=3,count=sg] : house-building
tore  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst tear x y
John  | pn :: np[type=proper,agr=3] : John
Murray  | pn :: np[type=proper,agr=3] : Murray
Noel  | pn :: np[type=proper,agr=3] : Noel
bite  | np :: np[type=count,agr=3,count=sg] : bite
chin  | np :: np[type=count,agr=3,count=sg] : chin
blow  | iv-out> :: (s[type=?x]\np)/pp[prep=out] : \x\y.simp prt blow x y
blowing  | iv-out> :: (s[type=ing]\np)/pp[prep=out] : \x\y.cont blow x y
wrong  | predp :: predp : wrong
eye  | np :: np[type=count,agr=3,count=sg] : eye
trying  | tving> :: (s[type=ing]\np)/np : \x\y.cont try x y
knot  | np :: np[type=count,agr=3,count=sg] : knot
hard  | adv :: (s\np)\(s\np) : \x\y.(x hard) y
lick  | tv> :: (s[type=?x]\np)/np : \x\y.lick x y
leave  | tv-on> :: (s[type=?x]\np)/pp[prep=on]/np : \x\y\z.simp prt leave x y z
leave  | tv-down> :: (s[type=?x]\np)/pp[prep=down]/np : \x\y\z.simp prt leave x y z
rubber-bands  | pln :: np[type=count,agr=3,count=pl] : pl rubber-band
taking  | tv> :: (s[type=ing]\np)/np : \x\y.cont take x y
year  | t :: np[type=time,agr=3,count=sg] : year
climb  | tv-in> :: (s[type=?x]\np)/pp[prep=in] : \x\y.simp prt climb x y 
track  | np :: np[type=count,agr=3,count=sg] : track
work  | iv> :: s[type=?x]\np : \x.simp prt work x
fast  | adv :: (s\np)\(s\np) : \x\y.(x fast) y
falling  | iv-off> :: (s[type=ing]\np)/pp[prep=off]: \x\y.cont fall x y
railroad  | np :: np[type=count,agr=3,count=sg] : railroad
tripped  | iv2-over :: (s[type=?x]\np)/pp[prep=over] : \x\y.simp pst trip x y
sandbox  | np :: np[type=count,agr=3,count=sg] : sandbox
count  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt count x y
staying  | iving> :: s[type=ing]\np : \x.cont stay x
Ohio  | np :: np[agr=3] : Ohio
broke  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst break x y
bend  | iv> :: s[type=?x]\np : \x.bend x
break  | tv> :: (s[type=?x]\np)/np : \x\y.break x y
exactly  | adv :: @x/@x : \x.x exactly
look  | tv-like> :: (s[type=?x]\np)/pp[prep=like] : \x\y.simp prt look x y
cups  | pln :: np[type=count,agr=3,count=pl] : pl cup
moves  | tvs> :: (s[type=?x]\np[agr=3,count=sg])/np : \x\y.simp prt move x y
blue  | adj :: np/np : \x.blue x
stops  | ivs> :: s[type=?x]\np[agr=3,count=sg] : \x.simp prt stop x
turn  | tv-around> :: (s[type=?x]\np)/pp[prep=around]/np : \x\y\z.simp prt turn x y z
way  | np :: np[type=count,agr=3,count=sg] : way
Monday  | np :: np : Monday
pizzeronic  | np :: np[type=count,agr=3,count=sg] : pizzeronic
share  | tv> :: (s[type=?x]\np)/np : \x\y.share x y
Pops  | pn :: np[type=proper,agr=3] : Pops
pink  | adj :: np/np : \x.pink x
needs  | tvs> :: (s[type=?x]\np[agr=3,count=sg])/np : \x\y.simp prt need x y
pizzc  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt pizzc x y
yourself  | pro :: np[agr=3] : yourself
blankie  | np :: np[type=count,agr=3,count=sg] : blankie
blanket  | np :: np[type=count,agr=3,count=sg] : blanket
sharing  | tving> :: (s[type=ing]\np)/np : \x\y.cont share x y
empty  | predp :: predp : empty
raisins  | pln :: np[type=count,agr=3,count=pl] : pl raisin
pouring  | tving> :: (s[type=ing]\np)/np : \x\y.cont pour x y
clean  | tv> :: (s[type=?x]\np)/np : \x\y.clean x y
catch  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt catch x y
still  | adv :: (s\np)/(s\np) : \x\y.(x still) y
still  | adv :: (s\np)\(s\np) : \x\y.(x still) y
fizzing  | tving> :: s[type=ing]\np : \x.cont fizz x
balloon  | np :: np[type=count,agr=3,count=sg] : balloon
folding  | tving> :: (s[type=ing]\np)/np : \x\y.cont fold x y
Kleenex  | pn :: np[type=proper,agr=3] : Kleenex
fold  | tv> :: (s[type=?x]\np)/np : \x\y.fold x y
dirt  | np :: np[type=count,agr=3,count=sg] : dirt
mud-pies  | pln :: np[type=count,agr=3,count=pl] : pl mud-pie
gate  | np :: np[type=count,agr=3,count=sg] : gate
help  | np :: np[type=count,agr=3,count=sg] : help
yellow  | adj :: np/np : \x.yellow x
pedalpushers  | np :: np[type=count,agr=3,count=sg] : pedalpushers
spill  | tv> :: (s[type=?x]\np)/np : \x\y.spill x y
towels  | pln :: np[type=count,agr=3,count=pl] : pl towel
bath-mat  | np :: np[type=count,agr=3,count=sg] : bath-mat
counter  | np :: np[type=count,agr=3,count=sg] : counter
big  | predp :: predp : big
drawer  | np :: np[type=count,agr=3,count=sg] : drawer
go  | iv-up> :: (s[type=?x]\np)/pp[prep=up] : \x\y.go x y
go  | iv-down> :: (s[type=?x]\np)/pp[prep=down] : \x\y.go x y
go  | iv-in> :: (s[type=?x]\np)/pp[prep=in] : \x\y.simp prt go x y
goes  | iv-in> :: (s[type=?x]\np)/pp[prep=in] : \x\y.simp prt go x y
make  | tv> :: (s[type=?x]\np)/(s\np) : \x\y.simp prt make (x y)
whistle  | iv> :: s[type=?x]\np : \x.whistle x
whistle  | s :: s : -whistle-
peek  | iv-in> :: (s[type=?x]\np)/pp[prep=in] : \x\y.simp prt peek x y
pipe  | np :: np[type=count,agr=3,count=sg] : pipe
numbers  | pln :: np[type=count,agr=3,count=pl] : pl number
going  | iving-around> :: (s[type=ing]\np)/pp[prep=around] : \x\y.cont go x y
zero  | np :: np[type=count,agr=3,count=sg] : zero
six  | np :: np[type=count,agr=3,count=sg] : six
that  | relativeclause :: (np\np)/(s\np) : \x\y.y (x y)
dish  | un :: np[type=uncount,agr=3] : dish
want  | tv> :: (s[type=?x]\np)/np : \x\y.want x y
fruit  | np :: np[type=count,agr=3,count=sg] : fruit
green  | adj :: np/np : \x.green x
fold | tv-over>:: (s[type=?x]\np)/pp[prep=over]/np : \x\y\z.fold x y z
wears  | tvs> :: (s[type=?x]\np[agr=3,count=sg])/np : \x\y.simp prt wear x y
told  | dv2 :: (s[type=?x]\np)/np/np : \x\y\z.simp pst tell x y z
yes  | np :: np[type=count,agr=3,count=sg] : yes
come  | iv> :: s[type=?x]\np : \x.come x
see  | tv> :: (s[type=?x]\np)/np : \x\y.see x y
like  | tv> :: (s[type=?x]\np)/np : \x\y.like x y
white  | predp :: predp : white
bumps  | pln :: np[type=count,agr=3,count=pl] : pl bump
fixed  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst fix x y
wear  | tv> :: (s[type=?x]\np)/np : \x\y.wear x y
rubbing  | tving> :: (s[type=ing]\np)/np : \x\y.cont rub x y
eyes  | pln :: np[type=count,agr=3,count=pl] : pl eye
hear  | tv> :: (s[type=?x]\np)/np : \x\y.hear x y
day  | np :: np[type=count,agr=3,count=sg] : day
said  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst say x y
good-day-Eve  | s :: s : -good-day-Eve-
pictures  | pln :: np[type=count,agr=3,count=pl] : pl picture
rice  | un :: np[type=uncount,agr=3] : rice
say  | tv> :: (s[type=?x]\np)/np : \x\y.say x y
morning  | np :: np[type=count,agr=3,count=sg] : morning
go  | iv-away> :: (s[type=?x]\np)/pp[prep=away] : \x\y.go x y
rice-soup  | un :: np[type=uncount,agr=3] : rice-soup
spilled  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst spill x y
bone  | np :: np[type=count,agr=3,count=sg] : bone
chicken-bone  | np :: np[type=count,agr=3,count=sg] : chicken-bone
took  | tv2-out> :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.simp pst take x y z
chew  | tv-up> :: (s[type=?x]\np)/pp[prep=up]/np : \x\y\z.chew x y z
eat  | tv> :: (s[type=?x]\np)/np : \x\y.eat x y
crackers  | pln :: np[type=count,agr=3,count=pl] : pl cracker
chew  | tv-off> :: (s[type=?x]\np)/pp[prep=off]/np : \x\y\z.simp prt chew x y z
meat  | un :: np[type=uncount,agr=3] : meat
bite  | tv-off> :: (s[type=?x]\np)/pp[prep=off]/np : \x\y\z.simp prt bite x y z
getting  | tving> :: (s[type=ing]\np)/np : \x\y.cont get x y
going  | iving-down> :: (s[type=ing]\np)/pp[prep=down] : \x\y.cont go x y
careful  | predp :: predp : careful
anything  | np :: np[agr=3] : anything
care  | tv> :: s[type=?x]\np : \x.care x
fine  | adv :: (s\np)\(s\np) : \x\y.(x fine) y
sing  | iv> :: s[type=?x]\np : \x.sing x
ironed  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst iron x y
trade  | tv> :: (s[type=?x]\np)/np : \x\y.trade x y
tonight  | adv :: s/s : \x.x tonight
jammies  | pln :: np[type=count,agr=3,count=pl] : pl jammie
somersault  | np :: np[type=count,agr=3,count=sg] : somersault
good  | predp :: predp : good
cut  | tv> :: (s[type=?x]\np)/np : \x\y.cut x y
afterwards  | adv :: s\s : \x.x afterwards
some  | pro :: np[agr=3] : some
Nancy  | pn :: np[type=proper,agr=3] : Nancy
haircut  | np :: np[type=count,agr=3,count=sg] : haircut
only  | adj :: np/np : \x.only x
candle  | np :: np[type=count,agr=3,count=sg] : candle
belong  | tv-in> :: (s[type=?x]\np)/pp[prep=in] : \x\y.belong x y
couches  | pln :: np[type=count,agr=3,count=pl] : pl couch
make  | tv> :: (s[type=?x]\np)/np : \x\y.make x y
bite  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt bite x y
singing  | tving> :: (s[type=ing]\np)/np : \x\y.cont sing x y
us  | pro :: np : us
sing  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt sing x y
start  | iv> :: s[type=?x]\np : \x.simp prt start x
awfully  | adv :: @x/@x : \x.x awfully
glad  | predp :: predp : glad
inside  | np :: np[type=acc] : inside
highchair  | np :: np[type=count,agr=3,count=sg] : highchair
wipe  | tv-off> :: (s[type=?x]\np)/pp[prep=off]/np : \x\y\z.wipe x y z
wipe  | tv-off> :: (s[type=?x]\np)/pp[prep=off]/np : \x\y\z.simp prt wipe x y z
scratch  | np :: np[type=count,agr=3,count=sg] : scratch
elbow  | np :: np[type=count,agr=3,count=sg] : elbow
seeds  | pln :: np[type=count,agr=3,count=pl] : pl seed
vegetable-soup  | un :: np[type=uncount,agr=3] : vegetable-soup
vaccine  | np :: np[type=count,agr=3,count=sg] : vaccine
Taffy  | pn :: np[type=proper,agr=3] : Taffy
too  | adv :: @x/@x : \x.x
tongue  | np :: np[type=count,agr=3,count=sg] : tongue
gruyere-cheese  | un :: np[type=uncount,agr=3] : gruyere-cheese
peel  | tv> :: (s[type=?x]\np)/np : \x\y.peel x y
pepper  | un :: np[type=uncount,agr=3] : pepper
clay  | un :: np[type=uncount,agr=3] : clay
dinosaur  | np :: np[type=count,agr=3,count=sg] : dinosaur
take  | tv-up> :: (s[type=?x]\np)/pp[prep=up]/np : \x\y\z.take x y z
either  | adv :: (s\np)\(s\np) : \x\y.(x either) y
fan  | np :: np[type=count,agr=3,count=sg] : fan
fans  | pln :: np[type=count,agr=3,count=pl] : pl fan
particularly  | adv :: (s\np)/(s\np) : \x\y.(x particularly) y
these  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.these x
these  | det :: s/(s\np)/np :\x\p.p (these x)
people  | pln :: np[type=count,agr=3,count=pl] : pl person
all  | adj :: np/np : \x.all x
all  | adj :: np\np : \x.all x
grownups  | pln :: np[type=count,agr=3,count=pl] : pl grownup
daughter  | np :: np[type=count,agr=3,count=sg] : daughter
daughters  | pln :: np[type=count,agr=3,count=pl] : pl daughter
family  | np :: np[type=count,agr=3,count=sg] : family
called  | tv2 :: (s[type=?x]\np)/np : \x\y.called x y
old  | adj :: np/np : \x.old x
meeting  | iving> :: s[type=ing]\np : \x.cont meet x
once  | adv :: (s\np)\(s\np) : \x\y.(x once) y
take  | tv> :: (s[type=?x]\np)/np : \x\y.take x y
nap  | un :: np[type=uncount,agr=3] : nap
taking  | tving> :: (s[type=ing]\np)/np : \x\y.cont take x y
tomorrow  | adv :: s\s : \x.x tomorrow
dripping  | iving> :: s[type=ing]\np : \x.cont drip x
spigot  | np :: np[type=count,agr=3,count=sg] : spigot
finish  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt finish x y
only  | adv :: (s\np)/(s\np) : \x\y.(x only) y
hurry  | iv-up> :: (s[type=?x]\np)/pp[prep=up] : \x\y.simp prt hurry x y
tomorrow  | adv :: s/s : \x.x tomorrow
coming  | iving-back> :: (s[type=ing]\np)/pp[prep=back] : \x\y.cont come x y
sleeves  | pln :: np[type=count,agr=3,count=pl] : pl sleeve
short  | predp :: predp : short
woke  | iv2-up> :: (s[type=?x]\np)/pp[prep=up] : \x\y.simp pst wake x y
from  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (from x) z
dirty  | adj :: np/np : \x.dirty x
feet  | np :: np[type=count,agr=3,count=sg] : feet
bandaid  | np :: np[type=count,agr=3,count=sg] : bandaid
leave  | iv-on> :: (s[type=?x]\np)/pp[prep=on]/np : \x\y\z.leave x y z
want  | tv-off> :: (s[type=?x]\np)/pp[prep=off]/np : \x\y\z.simp prt want x y z
take  | tv-off> :: (s[type=?x]\np)/pp[prep=off]/np : \x\y\z.take x y z
silly  | predp :: predp : silly
front  | np :: np[type=count,agr=3,count=sg] : front
pillow  | np :: np[type=count,agr=3,count=sg] : pillow
pad  | np :: np[type=count,agr=3,count=sg] : pad
brand-new  | adj :: np/np : \x.brand-new x
forget  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt forget x y
though  | adv :: (s\np)\(s\np) : \x\y.(x though) y
d  | aux :: (s\np)/(s\np) : \x\y.d (x y)
d  | aux :: (s/np)/(s/np) : \x.d x
boot  | np :: np[type=count,agr=3,count=sg] : boot
write  | tv> :: (s[type=?x]\np)/np : \x\y.write x y
wash  | tv-off :: (s[type=?x]\np)/pp[prep=off]/np : \x\y\z.simp prt wash x y z
hungry  | predp :: predp : hungry
lying  | iving> :: s[type=ing]\np : \x.cont lie x
maam  | np :: np[type=count,agr=3,count=sg] : maam
EveCummings  | pn :: np[type=proper,agr=3] : EveCummings
talking  | iving> :: s[type=ing]\np : \x.cont talk x
nice  | predp :: predp : nice
her  | pro :: np: her
laying  | iving-down> :: (s[type=ing]\np)/pp[prep=down] : \x\y.cont lay x y
rattles  | pln :: np[type=count,agr=3,count=pl] : pl rattle
getting  | diving> :: (s[type=ing]\np)/np/np : \x\y\z.cont get x y z
keep  | tv-off> :: (s[type=?x]\np)/pp[prep=off]/np : \x\y\z.keep x y z
sometimes  | adv :: s/s : \x.x sometimes
anymore  | adv :: (s\np)\(s\np) : \x\y.(x anymore) y
listens  | ivs> :: s[type=?x]\np[agr=3,count=sg] : \x.simp prt listen x
somebody  | np :: np[agr=3] : somebody
tell  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt tell x y
chocolate-cookie  | np :: np[type=count,agr=3,count=sg] : chocolate-cookie
Gloria  | pn :: np[type=proper,agr=3] : Gloria
at  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (at x) z
peek  | tv-at> :: (s[type=?x]\np)/pp[prep=at] : \x\y.simp prt peek x y
peeking  | tving-at> :: (s[type=ing]\np)/pp[prep=at] : \x\y.cont peek x y
peeking  | tving-out> :: (s[type=ing]\np)/pp[prep=out] : \x\y.cont peek x y
peek  | iv-around> :: (s[type=?x]\np)/pp[prep=around] : \x\y.simp prt peek x y
drink  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt drink x y
need  | tv> :: (s[type=?x]\np)/np : \x\y.need x y
airplane  | np :: np[type=count,agr=3,count=sg] : airplane
work  | iv> :: s[type=?x]\np : \x.work x
plane  | np :: np[type=count,agr=3,count=sg] : plane
camera-spool  | np :: np[type=count,agr=3,count=sg] : camera-spool
jar  | np :: np[type=count,agr=3,count=sg] : jar
kind  | np :: np[type=count,agr=3,count=sg] : kind
their  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.their x
hats  | pln :: np[type=count,agr=3,count=pl] : pl hat
story  | np :: np[type=count,agr=3,count=sg] : story
burro  | np :: np[type=count,agr=3,count=sg] : burro
working  | iving> :: s[type=ing]\np : \x.cont work x
newspaper  | np :: np[type=count,agr=3,count=sg] : newspaper
Humm  | pn :: np[type=proper,agr=3] : Humm
Humm  | raisedpn :: s/(s\np[type=proper,agr=3]) :\p.p Humm
song  | np :: np[type=count,agr=3,count=sg] : song
sing  | tv> :: (s[type=?x]\np)/np : \x\y.sing x y
eating  | tving> :: (s[type=ing]\np)/np : \x\y.cont eat x y
parsley  | un :: np[type=uncount,agr=3] : parsley
looking  | tving-at> :: (s[type=ing]\np)/pp[prep=at] : \x\y.cont look x y
bacon  | un :: np[type=uncount,agr=3] : bacon
children  | pln :: np[type=count,agr=3,count=pl] : pl child
find  | tv> :: (s[type=?x]\np)/np : \x\y.find x y
trying  | tv> :: (s[type=ing]\np)/(s\np) : \x\y.cont try (x y) y
those  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.those x
tell  | dv> :: (s[type=?x]\np)/np/np : \x\y\z.tell x y z
ball  | np :: np[type=count,agr=3,count=sg] : ball
indeed  | predp :: predp : indeed
baby-sister  | np :: np[type=count,agr=3,count=sg] : baby-sister
cry  | iv> :: s[type=?x]\np : \x.cry x
laugh  | iv> :: s[type=?x]\np : \x.laugh x
dingdong-bell  | np :: np[type=count,agr=3,count=sg] : dingdong-bell
dingdong-dell  | np :: np[type=count,agr=3,count=sg] : dingdong-dell
cart  | np :: np[type=count,agr=3,count=sg] : cart
flying  | iving> :: s[type=ing]\np : \x.cont fly x
Colin  | pn :: np[type=proper,agr=3] : Colin
Colin  | raisedpn :: s/(s\np[type=proper,agr=3]) :\p.p Colin
fingers  | pln :: np[type=count,agr=3,count=pl] : pl finger
lollipop  | np :: np[type=count,agr=3,count=sg] : lollipop
listening  | tving-to> :: (s[type=ing]\np)/pp[prep=to] : \x\y.cont listen x y
reading  | tving> :: (s[type=ing]\np)/np : \x\y.cont read x y
reading  | tving> :: s[type=ing]\np : \x.cont read x
doggies  | pln :: np[type=count,agr=3,count=pl] : pl doggy
buses  | pln :: np[type=count,agr=3,count=pl] : pl bus
lot  | np :: np[type=count,agr=3,count=sg] : lot
down  | adv :: (s\np)\(s\np) : \x\y.(x down) y
wait  | tv-for> :: (s[type=?x]\np)/pp[prep=for] : \x\y.wait x y
get  | tv> :: (s[type=?x]\np)/np : \x\y.get x y
already  | adv :: (s\np)/(s\np) : \x\y.(x already) y
already  | adv :: (s\np)\(s\np) : \x\y.(x already) y
zwieback  | np :: np[type=count,agr=3,count=sg] : zwieback
bumped  | tv2-into> :: (s[type=?x]\np)/pp[prep=into] : \x\y.simp pst bump x y
move  | iv-into> :: (s[type=?x]\np)/pp[prep=into] : \x\y.move x y
God  | pn :: np[type=proper,agr=3] : God
Helga  | pn :: np[type=proper,agr=3] : Helga
after  | pre :: (s\s)/np : \x\y.y (after x)
lobster-salad  | un :: np[type=uncount,agr=3] : lobster-salad
tell  | tv> :: (s[type=?x]\np)/np : \x\y.tell x y
wash  | tv> :: (s[type=?x]\np)/np : \x\y.wash x y
wedding  | np :: np[type=count,agr=3,count=sg] : wedding
forget  | tv> :: (s[type=?x]\np)/np : \x\y.forget x y
nursery-rhyme  | np :: np[type=count,agr=3,count=sg] : nursery-rhyme
talking  | tving-to> :: (s[type=ing]\np)/pp[prep=to] : \x\y.cont talk x y
pulling  | tving-down> :: (s[type=ing]\np)/pp[prep=down]/np : \x\y\z.cont pull x y z
falling  | iving> :: s[type=ing]\np : \x.cont fall x
foot  | np :: np[type=count,agr=3,count=sg] : foot
picture  | np :: np[type=count,agr=3,count=sg] : picture
statue  | np :: np[type=count,agr=3,count=sg] : statue
come  | iv-back-in> :: (s[type=?x]\np)/pp[prep=in]/pp[prep=back] : \x\y\z.simp prt come x y z
come  | iv-back-down> :: (s[type=?x]\np)/pp[prep=down]/pp[prep=back] : \x\y\z.come x y z
pushing  | iving> :: (s[type=ing]\np)/np : \x\y.cont push x y
pushing  | tving-around> :: s[type=ing]/pp[prep=around]/np : \x\y.cont push x y
push  | tv-around> :: (s[type=?x]\np)/pp[prep=around]/np : \x\y\z.simp prt push x y z
Eve-Cummings  | pn :: np[type=proper,agr=3] : Eve-Cummings
around  | adv :: (s\np)\(s\np) : \x\y.(x around) y
round  | adv :: (s\np)\(s\np) : \x\y.(x round) y
rain  | un :: np[type=uncount,agr=3] : rain
hurts  | ivs> :: s[type=?x]\np[agr=3,count=sg] : \x.simp prt hurt x
Colingc  | pn :: np[type=proper,agr=3] : Colingc
fingernail  | np :: np[type=count,agr=3,count=sg] : fingernail
hangnail  | np :: np[type=count,agr=3,count=sg] : hangnail
caught  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst catch x y
probably  | adv :: (s\np)/(s\np) : \x\y.(x probably) y
read  | tv> :: (s[type=?x]\np)/np : \x\y.read x y
like  | tv> :: (s[type=?x]\np)/(s\np)/np : \x\y\z.like (y x) x z
flowers  | pln :: np[type=count,agr=3,count=pl] : pl flower
drawing  | tving> :: (s[type=ing]\np)/np : \x\y.cont draw x y
draw  | tv> :: (s[type=?x]\np)/np : \x\y.draw x y
bouncy  | adj :: np/np : \x.bouncy x
bus  | np :: np[type=count,agr=3,count=sg] : bus
sailingboat  | np :: np[type=count,agr=3,count=sg] : sailingboat
looks  | tv-like> :: (s[type=?x]\np[agr=3,count=sg])/pp[prep=like] : \x\y.simp prt look x y
both  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.both x
funnels  | pln :: np[type=count,agr=3,count=pl] : pl funnel
bus-stop  | np :: np[type=count,agr=3,count=sg] : bus-stop
probably  | adv :: (s\np)\(s\np) : \x\y.(x probably) y
Baabaablacksheep  | pn :: np[type=proper,agr=3] : Baabaablacksheep
market  | un :: np[type=uncount,agr=3] : market
Exeter  | pn :: np[type=proper,agr=3] : Exeter
or  | conj :: s/s : \x.or x
washed  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst wash x y
right  | adv :: (s\np)\(s\np) : \x\y.(x right) y
moment  | np :: np[type=count,agr=3,count=sg] : moment
mayonnaise  | un :: np[type=uncount,agr=3] : mayonnaise
tree  | np :: np[type=count,agr=3,count=sg] : tree
end  | np :: np[type=count,agr=3,count=sg] : end
refrigerator  | np :: np[type=count,agr=3,count=sg] : refrigerator
clean  | tv-off> :: (s[type=?x]\np)/pp[prep=off]/np : \x\y\z.simp prt clean x y z
wonderful  | predp :: predp : wonderful
finished  | predp :: predp : finished
finished  | predp :: predp/np : \x.finished x
cookie-press  | np :: np[type=count,agr=3,count=sg] : cookie-press
cookies  | pln :: np[type=count,agr=3,count=pl] : pl cookie
climb  | iv-in> :: (s[type=?x]\np)/pp[prep=in] : \x\y.simp prt climb x y 
like  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt like x y
tomatoes  | pln :: np[type=count,agr=3,count=pl] : pl tomato
so  | conj :: s/s : \x.so x
long  | predp :: predp : long
bent  | predp-over> :: predp/pp[prep=over] : \x.bent x
found  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst find x y
noodles  | pln :: np[type=count,agr=3,count=pl] : pl noodle
minute  | np :: np[type=count,agr=3,count=sg] : minute
warm  | predp :: predp : warm
mug  | np :: np[type=count,agr=3,count=sg] : mug
clown  | np :: np[type=count,agr=3,count=sg] : clown
works  | ivs :: s[type=?x]\np[agr=3,count=sg] : \x.simp prt work x
nose  | np :: np[type=count,agr=3,count=sg] : nose
finish  | iv> :: s[type=?x]\np : \x.simp prt finish x
quickly  | adv :: (s\np)\(s\np) : \x\y.(x quickly) y
hit  | tv> :: (s[type=?x]\np)/np : \x\y.hit x y
which  | q :: s[type=q]/(s/np)/np : \x\y.q which x y
best  | adv :: (s\np)\(s\np) : \x\y.(x best) y
own  | adj :: np/np : \x.own x
garage  | np :: np[type=count,agr=3,count=sg] : garage
went  | iv2-to :: (s[type=?x]\np)/pp[prep=to] : \x\y.simp pst go x y
went  | iv2-to :: (s[type=?x]\np)/pp[prep=by] : \x\y.pst go x y
went  | iv2-for :: (s[type=?x]\np)/pp[prep=for] : \x\y.simp pst go x y
went  | iv2-inside :: (s[type=?x]\np)/pp[prep=inside] : \x\y.simp pst go x y
subway  | np :: np[type=count,agr=3,count=sg] : subway
subways  | pln :: np[type=count,agr=3,count=pl] : pl subway
looking  | iving-around> :: (s[type=ing]\np)/pp[prep=around] : \x\y.cont look x y
tomato-sandwich  | np :: np[type=count,agr=3,count=sg] : tomato-sandwich
peeping  | iving-out> :: (s[type=ing]\np)/pp[prep=out] : \x\y.cont peep x y
noises  | pln :: np[type=count,agr=3,count=pl] : pl noise
hurt  | iv> :: s[type=?x]\np : \x.simp pst hurt x
whose  | q :: s[type=q]/(s/np) : \x.q whose x
pulling  | tving> :: (s[type=ing]\np)/np : \x\y.cont pull x y
said  | x :: (s\np)/s : \x\y.simp pst say x y
short  | adj :: np/np : \x.short x
hair  | un :: np[type=uncount,agr=3] : hair
part  | np :: np[type=count,agr=3,count=sg] : part
write  | dv> :: (s[type=?x]\np)/np/np : \x\y.write x y
write  | dv> :: (s[type=?x]\np)/np/np : \x\y\z.simp prt write x y z
ears  | pln :: np[type=count,agr=3,count=pl] : pl ear
oh  | interj :: s/s : \x.x
look  | tv-through> :: (s[type=?x]\np)/pp[prep=through] : \x\y.look x y
to  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (to x) z
Ruko  | pn :: np[type=proper,agr=3] : Ruko
slips  | ivs-off :: (s[type=?x]\np[agr=3,count=sg])/pp[prep=off] : \x\y.simp prt slip x y
after-all  | conj :: s/s : \x.after-all x
throw  | tv> :: (s[type=?x]\np)/np : \x\y.throw x y
pears  | pln :: np[type=count,agr=3,count=pl] : pl pear
pineapple-dessert  | np :: np[type=count,agr=3,count=sg] : pineapple-dessert
cereal  | un :: np[type=uncount,agr=3] : cereal
while  | x :: s/s : \x.while x
Fizzie  | pn :: np[type=proper,agr=3] : Fizzie
iced  | adj :: np/np : \x.iced x
tea  | un :: np[type=uncount,agr=3] : tea
rabbit  | np :: np[type=count,agr=3,count=sg] : rabbit
Colorado  | np :: np[agr=3] : Colorado
Cambridge  | np :: np[agr=3] : Cambridge
NewBrunswick  | pn :: np[type=proper,agr=3] : NewBrunswick
England  | np :: np[agr=3] : England
Benny  | pn :: np[type=proper,agr=3] : Benny
bandaid  | np :: np[type=count,agr=3,count=sg] : bandaid
beach  | np :: np[type=count,agr=3,count=sg] : beach
eggnog  | np :: np[type=count,agr=3,count=sg] : eggnog
medicine  | un :: np[type=uncount,agr=3] : medicine
sick  | predp :: predp : sick
moving  | tving> :: (s[type=ing]\np)/np : \x\y.cont move x y
rug  | np :: np[type=count,agr=3,count=sg] : rug
heavy  | predp :: predp : heavy
today  | np :: np : today
peanutbutter-sandwich  | np :: np[type=count,agr=3,count=sg] : peanutbutter-sandwich
shoot  | tv> :: (s[type=?x]\np)/np : \x\y.shoot x y
shooting  | tving> :: (s[type=ing]\np)/np : \x\y.cont shoot x y
thumb  | np :: np[type=count,agr=3,count=sg] : thumb
bang  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt bang x y
dessert  | un :: np[type=uncount,agr=3] : dessert
lemon  | np :: np[type=count,agr=3,count=sg] : lemon
run  | iv> :: s[type=?x]\np : \x.simp prt run x
David  | pn :: np[type=proper,agr=3] : David
wise  | adj :: np/np : \x.wise x
stay  | iv-up> :: (s[type=?x]\np)/pp[prep=up] : \x\y.simp prt stay x y
accident  | np :: np[type=count,agr=3,count=sg] : accident
open  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt open x y
candy  | np :: np[type=count,agr=3,count=sg] : candy
wastebasket  | np :: np[type=count,agr=3,count=sg] : wastebasket
look  | tv-at :: (s[type=?x]\np)/pp[prep=at] : \x\y.simp prt look x y
look  | tv-at :: (s[type=?x]\np)/pp[prep=at] : \x\y.look x y
look  | tv-for :: (s[type=?x]\np)/pp[prep=for] : \x\y.simp prt look x y
straight  | adv :: (s\np)\(s\np) : \x\y.(x straight) y
paint  | iv> :: s[type=?x]\np : \x.paint x
paint  | tv> :: (s[type=?x]\np)/np : \x\y.paint x y
next  | adj :: np/np : \x.next x
belongs  | tvs-in> :: (s[type=?x]\np[agr=3,count=sg])/pp[prep=in] : \x\y.simp prt belong x y
blouse  | np :: np[type=count,agr=3,count=sg] : blouse
goose  | np :: np[type=count,agr=3,count=sg] : goose
snap  | un :: np[type=uncount,agr=3] : snap
buttons  | pln :: np[type=count,agr=3,count=pl] : pl button
back  | np :: np[type=count,agr=3,count=sg] : back
fire  | np :: np[type=count,agr=3,count=sg] : fire
move  | tv> :: (s[type=?x]\np)/np : \x\y.move x y
hand  | np :: np[type=count,agr=3,count=sg] : hand
left  | adj :: np/np : \x.left x
fork  | np :: np[type=count,agr=3,count=sg] : fork
penny  | np :: np[type=count,agr=3,count=sg] : penny
pockets  | pln :: np[type=count,agr=3,count=pl] : pl pocket
come  | iv> :: s[type=?x]\np : \x.simp prt come x
toes  | pln :: np[type=count,agr=3,count=pl] : pl toe
better  | adv :: (s\np)/(s\np) : \x\y.(x better) y
take  | tv-along> :: (s[type=?x]\np)/pp[prep=along]/np : \x\y\z.simp prt take x y z
downstairs  | np :: np[type=acc] : downstairs
straight  | predp :: predp : straight
get  | tv-out> :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.get x y z
got  | tv2-out> :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.simp pst get x y z
enough  | predp :: predp : enough
cry  | iv> :: s[type=?x]\np : \x.simp prt cry x
silly  | adj :: np/np : \x.silly x
great  | predp :: predp : great
better  | adv :: (s\np)\(s\np) : \x\y.(x better) y
helps  | tv> :: (s[type=?x]\np[agr=3,count=sg])/(s\np)/np : \x\y\z.simp prt help (y x) x z
try  | iv> :: s[type=?x]\np : \x.simp prt try x
holes  | pln :: np[type=count,agr=3,count=pl] : pl hole
fix  | tv> :: (s[type=?x]\np)/np : \x\y.fix x y
remember  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt remember x y
walk  | iv> :: s[type=?x]\np : \x.walk x
talking  | tving-to> :: (s[type=ing]\np)/pp[prep=to] : \x\y.cont talk x y
supper  | un :: np[type=uncount,agr=3] : supper
awake  | predp :: predp : awake
our  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.our x
Grandpa  | pn :: np[type=proper,agr=3] : Grandpa
Peter  | pn :: np[type=proper,agr=3] : Peter
wants  | tvs> :: (s[type=?x]\np[agr=3,count=sg])/np : \x\y.simp prt want x y
egg  | np :: np[type=count,agr=3,count=sg] : egg
salt  | un :: np[type=uncount,agr=3] : salt
buy  | tv> :: (s[type=?x]\np)/np : \x\y.buy x y
Schroeder  | pn :: np[type=proper,agr=3] : Schroeder
Dinah  | pn :: np[type=proper,agr=3] : Dinah
basement  | np :: np[type=count,agr=3,count=sg] : basement
coolpop  | np :: np[type=count,agr=3,count=sg] : coolpop
trying  | iving> :: s[type=ing]\np : \x.cont try x
mailman  | np :: np[type=count,agr=3,count=sg] : mailman
Julie  | pn :: np[type=proper,agr=3] : Julie
sent  | tv2 :: (s[type=?x]\np)/np : \x\y.simp pst send x y
eat  | iv> :: s[type=?x]\np : \x.simp prt eat x
cooking  | tving> :: (s[type=ing]\np)/np : \x\y.cont cook x y
icecube  | np :: np[type=count,agr=3,count=sg] : icecube
icecubes  | pln :: np[type=count,agr=3,count=pl] : pl icecube
icecube-trays  | pln :: np[type=count,agr=3,count=pl] : pl icecube-tray
terribly  | adv :: @x/@x : \x.x terribly
wait  | iv> :: s[type=?x]\np : \x.simp prt wait x
wait  | iv> :: s[type=?x]\np : \x.wait x
guess  | iv> :: s[type=?x]\np : \x.simp prt guess x
bubble  | np :: np[type=count,agr=3,count=sg] : bubble
carrots  | pln :: np[type=count,agr=3,count=pl] : pl carrot
sorely  | adv :: @x/@x : \x.x sorely
disappointed  | predp :: predp : disappointed
working  | tv-at :: (s[type=?x]\np)/pp[prep=at] : \x\y.cont work x y
awhile  | adv :: (s\np)\(s\np) : \x\y.(x awhile) y
snap  | iv> :: s[type=?x]\np : \x.simp prt snap x
ashtray  | np :: np[type=count,agr=3,count=sg] : ashtray
so-long  | adv :: (s\np)\(s\np) : \x\y.(x so-long) y
climb  | iv-over> :: (s[type=?x]\np)/pp[prep=over] : \x\y.simp prt climb x y
complicated  | adj :: np/np : \x.complicated x
Jackie  | pn :: np[type=proper,agr=3] : Jackie
barefoot  | adv :: (s\np)\(s\np) : \x\y.(x barefoot) y
can  | np :: np[type=count,agr=3,count=sg] : can
come  | iv-off :: (s[type=?x]\np)/pp[prep=off] : \x\y.come x y
think  | tv-of> :: (s[type=?x]\np)/np/pp[prep=of] : \x\y\z.think x y z
had  | tv3> :: (s[type=?x]\np)/np : \x\y.prft have x y
tell  | dv-about :: (s[type=?x]\np)/pp[prep=about]/np : \x\y\z.simp prt tell x y z
okkay  | predp :: predp : okkay
mean  | tv> :: (s[type=?x]\np)/np : \x\y.mean x y
shut  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt shut x y
shut  | tv> :: (s[type=?x]\np)/np : \x\y.shut x y
bring  | dv> :: (s[type=?x]\np)/np/np : \x\y\z.simp prt bring y x z
bring  | dv> :: (s[type=?x]\np)/np/np : \x\y\z.bring y x z
pretty  | adj :: np/np : \x.pretty x
cans  | pln :: np[type=count,agr=3,count=pl] : pl can
hold  | tv> :: (s[type=?x]\np)/np : \x\y.hold x y
garbage  | np :: np[type=count,agr=3,count=sg] : garbage
drink  | tv> :: (s[type=?x]\np)/np : \x\y.drink x y
lay  | iv-down :: (s[type=?x]\np)/pp[prep=down] : \x\y.simp prt lay x y
pottie  | np :: np[type=count,agr=3,count=sg] : pottie
excuse  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt excuse x y
page  | np :: np[type=count,agr=3,count=sg] : page
backwards  | adv :: (s\np)\(s\np) : \x\y.(x backwards) y
turn  | iv-around> :: (s[type=?x]\np)/pp[prep=around] : \x\y.simp prt turn x y
pillows  | pln :: np[type=count,agr=3,count=pl] : pl pillow
come  | iv-over :: (s[type=?x]\np)/pp[prep=over] : \x\y.simp prt come x y
move  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt move x y
move  | tv> :: (s[type=?x]\np)/np_loc : \x\y.simp prt move x y
custard  | np :: np[type=count,agr=3,count=sg] : custard
drink  | np :: np[type=count,agr=3,count=sg] : drink
touch  | iv> :: s[type=?x]\np : \x.simp prt touch x
noodle  | np :: np[type=count,agr=3,count=sg] : noodle
tired  | predp :: predp : tired
bumped  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst bump x y
cutting  | tving> :: (s[type=ing]\np)/np : \x\y.cont cut x y
pumpkin  | np :: np[type=count,agr=3,count=sg] : pumpkin
cook  | tv> :: (s[type=?x]\np)/np : \x\y.cook x y
wrote  | dv2> :: (s[type=?x]\np)/np/np : \x\y\z.simp pst write x y z
help  | tv> :: (s[type=?x]\np)/np : \x\y.help x y
happening  | iving> :: s[type=ing]\np : \x.cont happen x
machine  | np :: np[type=count,agr=3,count=sg] : machine
watch  | tv> :: (s[type=?x]\np)/np : \x\y.watch x y
washingmachine  | np :: np[type=count,agr=3,count=sg] : washingmachine
tinkertoy-can  | np :: np[type=count,agr=3,count=sg] : tinkertoy-can
tinkertoy  | np :: np[type=count,agr=3,count=sg] : tinkertoy
tinkertoys  | pln :: np[type=count,agr=3,count=pl] : pl tinkertoy
gun  | np :: np[type=count,agr=3,count=sg] : gun
clean  | predp :: predp : clean
eat  | iv> :: s[type=?x]\np : \x.eat x
read  | iv> :: s[type=?x]\np : \x.read x
butterfly  | np :: np[type=count,agr=3,count=sg] : butterfly
teddybear  | np :: np[type=count,agr=3,count=sg] : teddybear
dear  | np :: np[type=count,agr=3,count=sg] : dear
stir  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt stir x y
stir  | tv> :: (s[type=?x]\np)/np : \x\y.stir x y
muffin  | np :: np[type=count,agr=3,count=sg] : muffin
spoons  | pln :: np[type=count,agr=3,count=pl] : pl spoon
lay  | iv> :: s[type=?x]\np : \x.simp prt lay x
get  | tv-out> :: (s[type=?x]\np)/pp[prep=out] : \x\y.simp prt get x y
watch  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt watch x y
hold  | tv-off> :: (s[type=?x]\np)/pp[prep=off] : \x\y.hold x y
take  | tv-apart> :: (s[type=?x]\np)/pp[prep=apart]/np : \x\y\z.simp prt take x y z
dancing  | iving> :: s[type=ing]\np : \x.cont dance x
turn  | iv-around> :: (s[type=?x]\np)/pp[prep=around] : \x\y.turn x y
LadyBump  | pn :: np[type=proper,agr=3] : LadyBump
so-much  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.so-much x
wipe  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt wipe x y
look  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt look x y
look  | tv> :: (s[type=?x]\np)/np_loc : \x\y.simp prt look x y
tore  | iv2 :: s[type=?x]\np : \x.simp pst tear x
umbrella  | np :: np[type=count,agr=3,count=sg] : umbrella
step  | iv-back :: (s[type=?x]\np)/pp[prep=back] : \x\y.step x y
off  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (off x) z
come  | iv-on :: (s[type=?x]\np)/pp[prep=on] : \x\y.simp prt come x y
come  | iv-out :: (s[type=?x]\np)/pp[prep=out] : \x\y.simp prt come x y
happy  | predp :: predp : happy
emptying  | tving> :: (s[type=ing]\np)/np : \x\y.cont empty x y
grape  | np :: np[type=count,agr=3,count=sg] : grape
truck  | np :: np[type=count,agr=3,count=sg] : truck
dear  | x :: @x\@x : \x.x dear
peek  | tv-with> :: (s[type=?x]\np)/pp[prep=with] : \x\y.peek x y
crayon  | np :: np[type=count,agr=3,count=sg] : crayon
fat  | adj :: np/np : \x.fat x
magic  | un :: np[type=uncount,agr=3] : magic
awful  | predp :: predp : awful
drew  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst draw x y
Fizzie  | pn :: np[type=proper,agr=3] : Fizzie
matter  | np :: np[type=count,agr=3,count=sg] : matter
toy  | np :: np[type=count,agr=3,count=sg] : toy
rattle  | np :: np[type=count,agr=3,count=sg] : rattle
twist  | tv> :: (s[type=?x]\np)/np : \x\y.twist x y
thank  | tv> :: (s[type=?x]\np)/np : \x\y.thank x y
jello  | un :: np[type=uncount,agr=3] : jello
eyebrows  | pln :: np[type=count,agr=3,count=pl] : pl eyebrow
face  | np :: np[type=count,agr=3,count=sg] : face
beautiful  | adj :: np/np : \x.beautiful x
looking  | tving-out> :: (s[type=ing]\np)/pp[prep=out] : \x\y.cont look x y
dresses  | pln :: np[type=count,agr=3,count=pl] : pl dress
dress  | np :: np[type=count,agr=3,count=sg] : dress
popsicle  | np :: np[type=count,agr=3,count=sg] : popsicle
Momma  | pn :: np[type=proper,agr=3] : Momma
waving  | tving-to> :: (s[type=?x]\np)/pp[prep=to] : \x\y.cont wave x y
leg  | np :: np[type=count,agr=3,count=sg] : leg
give  | dv> :: (s[type=?x]\np)/np/np : \x\y\z.give x y z
indigestion  | un :: np[type=uncount,agr=3] : indigestion
falling  | tv-off> :: (s[type=ing]\np)/pp[prep=off]: \x\y.cont fall x y
near  | adj :: np/np : \x.near x
silly  | np :: np[type=count,agr=3,count=sg] : silly
teething  | iving> :: s[type=ing]\np : \x.cont teeth x
jump  | np :: np[type=count,agr=3,count=sg] : jump
close  | tv> :: (s[type=?x]\np)/np : \x\y.close x y
many  | det :: np[type=?x,agr=?y,count=?z]/np[type=?x,agr=?y,count=?z] : \x.many x
kinds  | pln :: np[type=count,agr=3,count=pl] : pl kind
go  | iv-back> :: (s[type=?x]\np)/pp[prep=back] : \x\y.simp prt go x y
soon  | adv :: (s\np)\(s\np) : \x\y.(x soon) y
exercise  | np :: np[type=count,agr=3,count=sg] : exercise
kiss  | tv> :: (s[type=?x]\np)/np : \x\y.kiss x y
coming  | iving-down> :: (s[type=ing]\np)/pp[prep=down] : \x\y.cont come x y
pitcher  | np :: np[type=count,agr=3,count=sg] : pitcher
slip  | tv-on> :: (s[type=?x]\np)/pp[prep=on] : \x\y.simp prt slip x y
orange  | adj :: np/np : \x.orange x
finish  | tv> :: (s[type=?x]\np)/np : \x\y.finish x y
Sara  | pn :: np[type=proper,agr=3] : Sara
Sara  | raisedpn :: s/(s\np[type=proper,agr=3]) :\p.p Sara
top  | tv> :: (s[type=?x]\np)/np : \x\y.top x y
baby-noise  | np :: np[type=count,agr=3,count=sg] : baby-noise
sock-slippers  | pln :: np[type=count,agr=3,count=pl] : pl sock-slipper
sign  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt sign x y
slippers  | pln :: np[type=count,agr=3,count=pl] : pl slipper
like  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (like x) z
toe  | np :: np[type=count,agr=3,count=sg] : toe
toes  | pln :: np[type=count,agr=3,count=pl] : pl toe
stand  | iv> :: s[type=?x]\np : \x.simp prt stand x
bigger  | adj :: np/np : \x.bigger x
arm  | np :: np[type=count,agr=3,count=sg] : arm
used  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst use x y
holding  | tving> :: (s[type=ing]\np)/np : \x\y.cont hold x y
catch  | tv> :: (s[type=?x]\np)/np : \x\y.catch x y
Lassie  | pn :: np[type=proper,agr=3] : Lassie
Lassie  | raisedpn :: s/(s\np[type=proper,agr=3]) :\p.p Lassie
never  | adv :: (s\np)/(s\np) : \x\y.(x never) y
heard  | tv3> :: (s[type=?x]\np)/np : \x\y.prft hear x y
read | tv-to>:: (s[type=?x]\np)/pp[prep=to] : \x\y.simp prt read x y
Rangy  | pn :: np[type=proper,agr=3] : Rangy
lap  | np :: np[type=count,agr=3,count=sg] : lap
gopher  | np :: np[type=count,agr=3,count=sg] : gopher
pages  | pln :: np[type=count,agr=3,count=pl] : pl page
necessary  | predp :: predp : necessary
stove  | np :: np[type=count,agr=3,count=sg] : stove
furniture  | np :: np[type=count,agr=3,count=sg] : furniture
shelf  | np :: np[type=count,agr=3,count=sg] : shelf
carrot  | np :: np[type=count,agr=3,count=sg] : carrot
bowl  | np :: np[type=count,agr=3,count=sg] : bowl
throwing  | tving> :: (s[type=ing]\np)/np : \x\y.cont throw x y
toys  | pln :: np[type=count,agr=3,count=pl] : pl toy
by  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (by x) z
tower  | np :: np[type=count,agr=3,count=sg] : tower
build  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt build x y
running  | iving> :: s[type=ing]\np : \x.cont run x
today  | adv :: s\s : \x.x today
yesterday  | adv :: s\s : \x.x yesterday
improves  | tvs> :: (s[type=?x]\np[agr=3,count=sg])/np : \x\y.simp prt improve x y
greatly  | adv :: (s\np)\(s\np) : \x\y.(x greatly) y
block  | np :: np[type=count,agr=3,count=sg] : block
pin  | tv> :: (s[type=?x]\np)/np : \x\y.pin x y
coming  | iving-outof> :: (s[type=ing]\np)/pp[prep=outof] : \x\y.cont come x y
coming  | iving-back-to> :: (s[type=ing]\np)/pp[prep=to]/pp[prep=back] : \x\y\z.cont come x y z
climb  | iv> :: s[type=?x]\np : \x.climb x
climb  | iv> :: s[type=?x]\np : \x.simp prt climb x
climb  | tv-up> :: (s[type=?x]\np)/pp[prep=up] : \x\y.simp prt climb x y
answer  | tv> :: (s[type=?x]\np)/np : \x\y.answer x y
Natalie  | pn :: np[type=proper,agr=3] : Natalie
sock  | np :: np[type=count,agr=3,count=sg] : sock
move  | iv> :: s[type=?x]\np : \x.move x
into  | pre :: ((s\np)\(s\np))/np : \x\y\z.y (into x) z
room  | np :: np[type=count,agr=3,count=sg] : room
go  | iv-on> :: (s[type=?x]\np)/pp[prep=on] : \x\y.simp prt go x y
move  | iv> :: s[type=?x]\np : \x.simp prt move x
take  | tv-out> :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.simp prt take x y z
take  | tv-outof> :: (s[type=?x]\np)/pp[prep=outof]/np : \x\y\z.simp prt take x y z
took  | tv-outof> :: (s[type=?x]\np)/pp[prep=outof]/np : \x\y\z.simp pst take x y z
came  | iv-outof> :: (s[type=?x]\np)/pp[prep=outof] : \x\y.simp pst take x y
bringing  | dving> :: (s[type=ing]\np)/np/np : \x\y\z.cont bring x y z
bring  | tv-to> :: (s[type=?x]\np)/pp[prep=to]/np : \x\y\z.simp prt bring x y z
find  | tv> :: (s[type=?x]\np)/np/np : \x\y\z.find x y z
banana  | np :: np[type=count,agr=3,count=sg] : banana
nuts  | pln :: np[type=count,agr=3,count=pl] : pl nut
crack  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt crack x y
crack  | tv> :: (s[type=?x]\np)/np : \x\y.crack x y
hammer  | np :: np[type=count,agr=3,count=sg] : hammer
use  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt use x y
cracked  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst crack x y
lying  | iving-down> :: (s[type=ing]\np)/pp[prep=down] : \x\y.cont lie x y
sweater  | np :: np[type=count,agr=3,count=sg] : sweater
difference  | np :: np[type=count,agr=3,count=sg] : difference
swing  | iv> :: s[type=?x]\np : \x.swing x
gimme  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt gimme x y
all-the-same  | predp :: predp : all-the-same
game  | np :: np[type=count,agr=3,count=sg] : game
coffee-pot  | np :: np[type=count,agr=3,count=sg] : coffee-pot
jump  | iv> :: s[type=?x]\np : \x.simp prt jump x
jump  | iv> :: s[type=?x]\np : \x.jump x
looking  | iving> :: s[type=ing]\np : \x.cont look x
dance  | np :: np[type=count,agr=3,count=sg] : dance
bowel-movement  | np :: np[type=count,agr=3,count=sg] : bowel-movement
change  | tv> :: (s[type=?x]\np)/np : \x\y.change x y
haha  | interj :: s/s : \x.x
pennies  | pln :: np[type=count,agr=3,count=pl] : pl penny
swing  | iv> :: s[type=?x]\np : \x.simp prt swing x
climb  | iv-down> :: (s[type=?x]\np)/pp[prep=down] : \x\y.simp prt climb x y 
sleep  | iv> :: s[type=?x]\np : \x.simp prt sleep x
take  | tv-away> :: (s[type=?x]\np)/pp[prep=away]/np : \x\y\z.take x y z
count  | tv> :: (s[type=?x]\np)/np : \x\y.count x y
off  | adv :: (s\np)\(s\np) : \x\y.(x off) y
music  | un :: np[type=uncount,agr=3] : music
livingroom  | np :: np[type=count,agr=3,count=sg] : livingroom
vanilla  | np :: np[type=count,agr=3,count=sg] : vanilla
rockingchair  | np :: np[type=count,agr=3,count=sg] : rockingchair
lost  | predp :: predp : lost
orange-peel  | un :: np[type=uncount,agr=3] : orange-peel
peel  | iv> :: s[type=?x]\np : \x.simp prt peel x
bouillon-cubes  | pln :: np[type=count,agr=3,count=pl] : pl bouillon-cube
came  | iv2-back> :: (s[type=?x]\np)/pp[prep=back] : \x\y.simp pst come x y
came  | iv2-through> :: (s[type=?x]\np)/pp[prep=through] : \x\y.simp pst come x y
bottom  | np :: np[type=count,agr=3,count=sg] : bottom
puzzle  | np :: np[type=count,agr=3,count=sg] : puzzle
Clipclop  | pn :: np[type=proper,agr=3] : Clipclop
clip  | np :: np[type=count,agr=3,count=sg] : clip
coin  | np :: np[type=count,agr=3,count=sg] : coin
baseball-coin  | np :: np[type=count,agr=3,count=sg] : baseball-coin
pocket  | np :: np[type=count,agr=3,count=sg] : pocket
baseball  | np :: np[type=count,agr=3,count=sg] : baseball
what  | interj :: s/np[type=?x,agr=?x,count=?x] : \x.q what x
sweetie  | np :: np[type=count,agr=3,count=sg] : sweetie
come  | iv-back> :: (s[type=?x]\np)/pp[prep=back] : \x\y.come x y
icing  | un :: np[type=uncount,agr=3] : icing
decorating  | tving> :: (s[type=ing]\np)/np : \x\y.cont decorate x y
ham  | np :: np[type=count,agr=3,count=sg] : ham
Hummthehamster  | pn :: np[type=proper,agr=3] : Hummthehamster
goldfish  | np :: np[type=count,agr=3,count=sg] : goldfish
hiding  | iving> :: s[type=ing]\np : \x.cont hide x
blocks  | pln :: np[type=count,agr=3,count=pl] : pl block
hamburger  | np :: np[type=count,agr=3,count=sg] : hamburger
go  | x :: (s[type=?x]\np)/s : \x\y.simp prt say x y
OldMacdonald  | pn :: np[type=proper,agr=3] : OldMacdonald
OldMacdonald  | raisedpn :: s/(s\np[type=proper,agr=3]) :\p.p OldMacdonald
sheep  | np :: np[type=count,agr=3,count=sg] : sheep
dropped  | iv2> :: s[type=?x]\np : \x.simp pst drop x
Frostythesnowman  | pn :: np[type=proper,agr=3] : Frostythesnowman
snowballs  | pln :: np[type=count,agr=3,count=pl] : pl snowball
scarf  | np :: np[type=count,agr=3,count=sg] : scarf
mittens  | pln :: np[type=count,agr=3,count=pl] : pl mitten
skating  | iving> :: s[type=ing]\np : \x.cont skate x
came  | iv2-off> :: (s[type=?x]\np)/pp[prep=off] : \x\y.simp pst come x y
policeman  | np :: np[type=count,agr=3,count=sg] : policeman
chicks  | pln :: np[type=count,agr=3,count=pl] : pl chick
donkey  | np :: np[type=count,agr=3,count=sg] : donkey
donkeys  | pln :: np[type=count,agr=3,count=pl] : pl donkey
apple  | np :: np[type=count,agr=3,count=sg] : apple
apples  | pln :: np[type=count,agr=3,count=pl] : pl apple
apple-trees  | pln :: np[type=count,agr=3,count=pl] : pl apple-tree
elephant  | np :: np[type=count,agr=3,count=sg] : elephant
bunny  | np :: np[type=count,agr=3,count=sg] : bunny
doggie  | np :: np[type=count,agr=3,count=sg] : doggy
rooster  | np :: np[type=count,agr=3,count=sg] : rooster
roosters  | pln :: np[type=count,agr=3,count=pl] : pl rooster
cow  | np :: np[type=count,agr=3,count=sg] : cow
cows  | pln :: np[type=count,agr=3,count=pl] : pl cow
sways  | ivs :: s[type=?x]\np[agr=3,count=sg] : \x.simp prt sway x
dustpan  | np :: np[type=count,agr=3,count=sg] : dustpan
jump  | tv-off> :: (s[type=?x]\np)/pp[prep=off] : \x\y.simp prt jump x y
icing  | tving> :: (s[type=ing]\np)/np : \x\y.cont ice x y
giraffe  | np :: np[type=count,agr=3,count=sg] : giraffe
car  | np :: np[type=count,agr=3,count=sg] : car
sailboat  | np :: np[type=count,agr=3,count=sg] : sailboat
cats  | pln :: np[type=count,agr=3,count=pl] : pl cat
splashing  | iving> :: s[type=ing]\np : \x.cont splash x
digging  | tving> :: (s[type=ing]\np)/np : \x\y.cont dig x y
bug  | np :: np[type=count,agr=3,count=sg] : bug
popcorn  | un :: np[type=uncount,agr=3] : popcorn
smell  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt smell x y
smelling  | tving> :: (s[type=ing]\np)/np : \x\y.cont smell x y
heat  | un :: np[type=uncount,agr=3] : heat
stylus  | np :: np[type=count,agr=3,count=sg] : stylus
carry  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt carry x y
carry  | tv> :: (s[type=?x]\np)/np : \x\y.carry x y
bowels  | pln :: np[type=count,agr=3,count=pl] : pl bowel
away  | adv :: (s\np)\(s\np) : \x\y.(x away) y
feed  | tv> :: (s[type=?x]\np)/np : \x\y.feed x y
Froggy  | pn :: np[type=proper,agr=3] : Froggy
whole  | adj :: np/np : \x.whole x
week  | np :: np[type=count,agr=3,count=sg] : week
cold  | predp :: predp : cold
wake  | iv-up> :: (s[type=?x]\np)/pp[prep=up] : \x\y.wake x y
olive  | np :: np[type=count,agr=3,count=sg] : olive
missed  | tv2> :: (s[type=?x]\np)/np : \x\y.simp pst miss x y
first  | adj :: np/np : \x.first x
string  | np :: np[type=count,agr=3,count=sg] : string
waking  | iv-up> :: (s[type=ing]\np)/pp[prep=up] : \x\y.cont wake x y
sound  | iv-like> :: (s[type=?x]\np)/pp[prep=like] : \x\y.simp prt sound x y
sounds  | iv-like> :: (s[type=?x]\np)/pp[prep=like] : \x\y.simp prt sound x y
firetruck  | np :: np[type=count,agr=3,count=sg] : firetruck
comfortable  | predp :: predp : comfortable
bath  | np :: np[type=count,agr=3,count=sg] : bath
bathrobe  | np :: np[type=count,agr=3,count=sg] : bathrobe
bathtub  | np :: np[type=count,agr=3,count=sg] : bathtub
swim  | iv> :: s[type=?x]\np : \x.simp prt swim x
knee  | np :: np[type=count,agr=3,count=sg] : knee
paper-bag  | np :: np[type=count,agr=3,count=sg] : paper-bag
paper-clip  | np :: np[type=count,agr=3,count=sg] : paper-clip
go  | iv-to :: (s[type=?x]\np)/pp[prep=to] : \x\y.go x y
sneezes  | pln :: np[type=count,agr=3,count=pl] : pl sneeze
sneeze  | un :: np[type=uncount,agr=3] : sneeze
sitting  | iving-down> :: (s[type=ing]\np)/pp[prep=down] : \x\y.cont sit x y
sitting  | iv-on :: (s[type=ing]\np)/pp[prep=on] : \x\y.cont sit x y
ride  | tv> :: (s[type=?x]\np)/np : \x\y.ride x y
fun  | predp :: predp : fun
Judy  | pn :: np[type=proper,agr=3] : Judy
squashing  | tving> :: (s[type=ing]\np)/np : \x\y.cont squash x y
noisy  | predp :: predp : noisy
reel  | np :: np[type=count,agr=3,count=sg] : reel
can  | np :: np[type=count,agr=3,count=sg] : can
shoving  | tving> :: (s[type=ing]\np)/np : \x\y.cont shove x y
pans  | pln :: np[type=count,agr=3,count=pl] : pl pan
mouthful  | np :: np[type=count,agr=3,count=sg] : mouthful
mess  | np :: np[type=count,agr=3,count=sg] : mess
messy  | adj :: np/np : \x.messy x
pickle  | np :: np[type=count,agr=3,count=sg] : pickle
blow  | iv> :: s[type=?x]\np : \x.blow x
tomorrow  | np :: np : tomorrow
moving  | tving> :: s[type=ing]\np : \x.cont move x
rockabye-baby  | np :: np[agr=3] : rockabye-baby
pick  | tv-out> :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.simp prt pick x y z
tiger  | np :: np[type=count,agr=3,count=sg] : tiger
zebra  | np :: np[type=count,agr=3,count=sg] : zebra
read  | dv> :: (s[type=?x]\np)/np/np : \x\y\z.read x y z
tape  | un :: np[type=uncount,agr=3] : tape
changing  | tving> :: (s[type=ing]\np)/np : \x\y.cont change x y
burp  | iv> :: s[type=?x]\np : \x.burp x
burped  | iv2> :: s[type=?x]\np : \x.simp pst burp x
nipple  | np :: np[type=count,agr=3,count=sg] : nipple
thirsty  | predp :: predp : thirsty
turn  | np :: np[type=count,agr=3,count=sg] : turn
slipped  | iv2> :: s[type=?x]\np : \x.simp pst slip x
button  | np :: np[type=count,agr=3,count=sg] : button
drinks  | tvs> :: (s[type=?x]\np[agr=3,count=sg])/np : \x\y.simp prt drink x y
mixing  | tving> :: (s[type=ing]\np)/np : \x\y.cont mix x y
Danny  | pn :: np[type=proper,agr=3] : Danny
ringing  | tving> :: s[type=ing]\np : \x.cont ring x
Marcia  | pn :: np[type=proper,agr=3] : Marcia
Goldrush  | pn :: np[type=proper,agr=3] : Goldrush
Tequita  | pn :: np[type=proper,agr=3] : Tequita
alone  | adv :: (s\np)\(s\np) : \x\y.(x alone) y
take  | tv-off :: (s[type=?x]\np)/pp[prep=off]/np : \x\y\z.simp prt take x y z
Linda  | pn :: np[type=proper,agr=3] : Linda
animals  | pln :: np[type=count,agr=3,count=pl] : pl animal
feed  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt feed x y
raccoons  | pln :: np[type=count,agr=3,count=pl] : pl raccoon
hay  | un :: np[type=uncount,agr=3] : hay
barking  | iving> :: s[type=ing]\np : \x.cont bark x
hump  | iv> :: s[type=?x]\np : \x.simp prt hump x
icecream-cone  | np :: np[type=count,agr=3,count=sg] : icecream-cone
icecream  | un :: np[type=uncount,agr=3] : icecream
besides  | x :: ((s\np)\(s\np))/np : \x\y.y (besides x)
trouble  | np :: np[type=count,agr=3,count=sg] : trouble
loose  | predp :: predp : loose
Chicago  | np :: np[type=count,agr=3,count=sg] : Chicago
ruining  | tving> :: (s[type=ing]\np)/np : \x\y.cont ruin x y
straighten  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt straighten x y
socks  | pln :: np[type=count,agr=3,count=pl] : pl sock
Snoopy  | pn :: np[type=proper,agr=3] : Snoopy
broom  | np :: np[type=count,agr=3,count=sg] : broom
shovel  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt shovel x y
snow  | un :: np[type=uncount,agr=3] : snow
boots  | pln :: np[type=count,agr=3,count=pl] : pl boot
panties  | pln :: np[type=count,agr=3,count=pl] : pl panty
bedroom  | np :: np[type=place,agr=3,count=sg] : bedroom
turn | iv-over>:: (s[type=?x]\np)/pp[prep=over] : \x\y.turn x y
al-bl-cl  | np :: np[agr=3] : al-bl-cl
eh  | interj :: s/s : \x.x
knob  | np :: np[type=count,agr=3,count=sg] : knob
crash  | iv> :: s[type=?x]\np : \x.simp prt crash x
smile  | tv-at :: (s[type=?x]\np)/pp[prep=at] : \x\y.simp prt smile x y
jammies  | pln :: np[type=count,agr=3,count=pl] : pl jammie
radiator  | np :: np[type=count,agr=3,count=sg] : radiator
rocking  | tving> :: (s[type=ing]\np)/np : \x\y.cont rock x y
pull  | tv> :: (s[type=?x]\np)/np : \x\y.pull x y
Valentine  | pn :: np[type=proper,agr=3] : Valentine
used  | tv3> :: (s[type=?x]\np)/np :\x\y.prft use x y
shovel  | np :: np[type=count,agr=3,count=sg] : shovel
sugar-top  | np :: np[type=count,agr=3,count=sg] : sugar-top
box-top  | np :: np[type=count,agr=3,count=sg] : box-top
teapot  | np :: np[type=count,agr=3,count=sg] : teapot
goat  | np :: np[type=count,agr=3,count=sg] : goat
before  | adv :: (s\np)\(s\np) : \x\y.(x before) y
tonight  | np :: np : tonight
cover  | np :: np[type=count,agr=3,count=sg] : cover
kangaroo  | np :: np[type=count,agr=3,count=sg] : kangaroo
ribbon  | np :: np[type=count,agr=3,count=sg] : ribbon
walking  | iving> :: s[type=ing]\np : \x.cont walk x
bell  | np :: np[type=count,agr=3,count=sg] : bell
wagon  | np :: np[type=count,agr=3,count=sg] : wagon
blasting  | iving> :: s[type=ing]\np : \x.cont blast x
loud  | adj :: np/np : \x.loud x
boom  | np :: np[type=count,agr=3,count=sg] : boom
Kix  | pn :: np[type=proper,agr=3] : Kix
chocolate-icecream  | un :: np[type=uncount,agr=3] : chocolate-icecream
get  | tv-in> :: (s[type=?x]\np)/pp[prep=in]/np : \x\y\z.get x y z
messy  | predp :: predp : messy
tail  | np :: np[type=count,agr=3,count=sg] : tail
curly  | adj :: np/np : \x.curly x
bit  | np :: np[type=count,agr=3,count=sg] : bit
open  | predp :: predp : open
looked  | tv2> :: (s[type=?x]\np)/np_loc : \x\y.simp pst look x y
shaking  | tving> :: (s[type=ing]\np)/np : \x\y.cont shake x y
sponge  | np :: np[type=count,agr=3,count=sg] : sponge
step  | iv-outof :: (s[type=?x]\np)/pp[prep=outof] : \x\y.simp prt step x y
step  | iv-out :: (s[type=?x]\np)/pp[prep=out] : \x\y.simp prt step x y
cried  | iv2> :: s[type=?x]\np : \x.simp pst cry x
check  | np :: np[type=count,agr=3,count=sg] : check
say  | tv> :: (s[type=?x]\np)/s : \x\y.simp prt say x y
everything  | np :: np[agr=3] : everything
take  | tv-back> :: (s[type=?x]\np)/pp[prep=back]/np : \x\y\z.simp prt take x y z
move  | tv-out> :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.move x y z
move  | tv-away-from> :: (s[type=?x]\np)/pp[prep=from]/pp[prep=away]/np : \x\y\z\w.simp prt move x y z w
pinch  | tv> :: (s[type=?x]\np)/np : \x\y.pinch x y
moved  | iv2> :: s[type=?x]\np : \x.simp pst move x
cool  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt cool x y
dry  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt dry x y
before  | pre :: ((s\np)\(s\np))/np : \x\y.y (before x)
food  | np :: np[type=count,agr=3,count=sg] : food
chocolate-icecream  | un :: np[type=uncount,agr=3] : chocolate-icecream
eats  | tvs> :: s[type=?x]\np[agr=3,count=sg] : \x.simp prt eat x
upstairs  | np :: np[type=acc] : upstairs
pick  | tv> :: (s[type=?x]\np)/np : \x\y.pick x y
other  | adj :: np/np : \x.other x
got  | tv-on> :: (s[type=?x]\np)/pp[prep=on]/np : \x\y\z.simp pst get x y z
Margaret  | pn :: np[type=proper,agr=3] : Margaret
because  | x :: s/s : \x.because x
what  | qw :: s : -what-
who  | qw :: s : -who-
stick | tv-in>:: (s[type=?x]\np)/pp[prep=in]/np : \x\y\z.simp prt stick x y z
gravy  | un :: np[type=uncount,agr=3] : gravy
ask  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt ask x y
run  | iv-back> :: (s[type=?x]\np)/pp[prep=back] : \x\y.simp prt run x y
out  | adv :: (s\np)\(s\np) : \x\y.(x out) y
x  | np :: np[agr=3] : x
hello  | expr :: s : -hello-
perhaps  | expr :: s : -perhaps-
maybe  | expr :: s : -maybe-
quick  | expr :: s : -quick-
hard  | expr :: s : -hard-
almost  | expr :: s : -almost-
quite  | expr :: s : -quite-
yet  | expr :: s : -yet-
again  | expr :: s : -again-
later  | expr :: s : -later-
already  | expr :: s : -already-
sortof  | expr :: s : -sortof-
el-vl-el  | interj :: s : -el-vl-el-
mmo  | interj :: s : -mmo-
mm  | interj :: s : -mm-
mooo  | interj :: s : -mooo-
cockadoodledooo  | interj :: s : -cockadoodledooo-
No  | expr :: s : -No-
see  | tv> :: (s[type=?x]\np)/s : \x\y.simp prt see x y
started  | tv2> :: (s[type=?x]\np)/(s\np) : \x\y.simp pst start (x y) y
roll  | tv> :: (s[type=?x]\np)/np : \x\y.roll x y
go  | tv> :: (s[type=?x]\np)/(s\np) : \x\y.simp prt go (x y) y
sleep  | iv> :: s[type=?x]\np : \x.sleep x
ever  | adv :: s\s : \x.x ever
to  | x :: (s/s)/(s\np) : \x\y.aim x y
tell  | dv> :: (s[type=?x]\np)/(s\np)/np/np : \x\y\z\w.simp prt tell (z y x) x y w
put  | tv> :: (s[type=?x]\np)/np : \x\y.simp prt put x y
put  | tv> :: (s[type=?x]\np)/np : \x\y.simp pst put x y
put  | tv> :: (s[type=?x]\np)/np : \x\y.put x y
put  | dv> :: (s[type=?x]\np)/np_loc/np : \x\y\z.put x y z
put  | tv3> :: (s[type=?x]\np)/np :\x\y.prft put x y
put  | tv-down> :: (s[type=?x]\np)/pp[prep=down]/np : \x\y\z.simp prt put x y z
put  | iv-in> :: (s[type=?x]\np)/pp[prep=in] : \x\y.simp prt put x y
putting  | tv-in> :: (s[type=?x]\np)/pp[prep=in] : \x\y.cont put x y
putting  | tv-on> :: (s[type=ing]\np)/pp[prep=on]/np : \x\y\z.cont put x y z
putting  | tv-in> :: (s[type=ing]\np)/pp[prep=in]/np : \x\y\z.cont put x y z
put  | tv-over> :: (s[type=?x]\np)/pp[prep=over]/np : \x\y\z.simp prt put x y z
put  | tv-over> :: (s[type=?x]\np)/pp[prep=over]/np : \x\y\z.put x y z
put  | tv-away> :: (s[type=?x]\np)/pp[prep=away]/np : \x\y\z.put x y z
put  | tv-away> :: (s[type=?x]\np)/pp[prep=away]/np : \x\y\z.simp prt put x y z
put  | tv-out> :: (s[type=?x]\np)/pp[prep=out]/np : \x\y\z.put x y z
put  | tv-back> :: (s[type=?x]\np)/pp[prep=back]/np : \x\y\z.put x y z
put  | tv-back> :: (s[type=?x]\np)/pp[prep=back]/np : \x\y\z.simp prt put x y z
put  | tv-back-on> :: (s[type=?x]\np)/pp[prep=on]/pp[prep=back]/np : \x\y\z\w.simp prt put x y z w
put  | dv-on> :: (s[type=?x]\np)/pp[prep=on]/np : \x\y\z.put x y z
put  | dv-on> :: (s[type=?x]\np)/pp[prep=on]/np : \x\y\z.simp prt put x y z
put  | tv-on> :: (s[type=?x]\np)/pp[prep=on]/np : \x\y\z.put x y z
put  | tv-in> :: (s[type=?x]\np)/pp[prep=in]/np : \x\y\z.simp prt put x y z
put  | tv-in> :: (s[type=?x]\np)/pp[prep=in] : \x\y.simp prt put x y
put  | tv-in> :: (s[type=?x]\np)/pp[prep=in]/np : \x\y\z.put x y z
back  | adv :: (s\np)\(s\np) : \x\y.(x back) y
up  | adv :: (s\np)\(s\np) : \x\y.(x up) y
about  | pre :: pp[prep=about]/np : \x.about x
ahead  | adv :: (s\np)\(s\np) : \x\y.(x ahead) y
along  | pre :: pp[prep=along] : along
apart  | pre :: pp[prep=apart] : apart
around  | pre :: pp[prep=around] : around
at  | pre :: pp[prep=at]/np : \x.at x
away  | pre :: pp[prep=away] : away
back  | pre :: pp[prep=back] : back
by  | pre :: pp[prep=by]/np : \x.by x
by  | pre :: pp[prep=by] : by
down  | pre :: pp[prep=down]/np : \x.down x
down  | pre :: pp[prep=down]/np_loc : \x.down x
down  | pre :: pp[prep=down] : down
for  | pre :: pp[prep=for]/np : \x.for x
from  | pre :: pp[prep=from]/np : \x.from x
in  | pre :: pp[prep=in]/np : \x.in x
in  | pre :: pp[prep=in]/np_loc : \x.in x
in  | pre :: pp[prep=in] : in
inside  | pre :: pp[prep=inside]/np : \x.inside x
into  | pre :: pp[prep=into]/np : \x.into x
like  | pre :: pp[prep=like]/np : \x.like x
of  | pre :: pp[prep=of]/np : \x.of x
of  | pre :: pp[prep=of] : of
off  | pre :: pp[prep=off]/np : \x.off x
off  | pre :: pp[prep=off] : off
on  | pre :: pp[prep=on]/np : \x.on x
on  | pre :: pp[prep=on] : on
out  | pre :: pp[prep=out]/np : \x.out x
out  | pre :: pp[prep=out] : out
outof  | pre :: pp[prep=outof]/np : \x.outof x
outof  | pre :: pp[prep=outof] : outof
over  | pre :: pp[prep=over]/np : \x.over x
over  | pre :: pp[prep=over] : over
through  | pre :: pp[prep=through]/np : \x.through x
through  | pre :: pp[prep=through]/np_loc : \x.through x
to  | pre :: pp[prep=to]/np : \x.to x
under  | pre :: pp[prep=under]/np : \x.under x
up  | pre :: pp[prep=up]/np : \x.up x
up  | pre :: pp[prep=up]/np_loc : \x.up x
up  | pre :: pp[prep=up] : up
with  | pre :: pp[prep=with]/np : \x.with x
#L1 s[type=imp]\np : lf --> s : imp (lf you)
#L2 s[type=ing]\np : lf --> s : lf you
