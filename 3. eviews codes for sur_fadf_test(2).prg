' SUR_FADF test

matrix(10,5) mout0
matrix(3,5) mout1
matrix(3,5) mout2
matrix(3,5) mout3

series y1=@log(gdp1)
series y2=@log(gdp2)
series y3=@log(gdp3)
series y4=@log(gdp4)
series y5=@log(gdp5)

For !k=1 to 5

if !k==1 then
series y=y1
endif

if !k==2 then
series y=y2
endif

if !k==3 then
series y=y3
endif

if !k==4 then
series y=y4
endif

if !k==5 then
series y=y5
endif
		series trendt=@trend
		equation eq!k.ls d(y) y(-1) d(y(-1)) c @trend
		scalar adf=eq!k.@tstat(1)
		
		For !kk=1 to 2
		series trendt=@trend
		scalar nn=@obs(y)
		series sint=@sin(2*3.141592*trendt*!kk/nn)
		series cost=@cos(2*3.141592*trendt*!kk/nn)
		equation eq!k!kk.ls d(y) y(-1) d(y(-1)) c @trend sint cost

		scalar fadf!kk=eq!k!kk.@tstat(1)
		scalar ssrt!kk=eq!k!kk.@ssr
		delete  eq!k!kk 
		next

		if ssrt1<ssrt2 then
		scalar fadf=fadf1
		scalar mkk=1
		endif 
		if ssrt1>ssrt2 then
		scalar fadf=fadf2
		scalar mkk=2
		endif

		mout3(1,!k)=mkk

series gdp=@log(gdp!k)
gdp.uroot(adf,exog=trend,lag=1,save=out) 
freeze(table!k) out
mout0(10,!k)=table!k(6,2)
delete table!k
next

!nn=@obs(y1)
scalar kk1=mout3(1,1)
series sinf1=@sin((2*3.141593*@trend*kk1)/!nn)
series cosf1=@cos((2*3.141593*@trend*kk1)/!nn)
scalar kk2=mout3(1,2)
series sinf2=@sin((2*3.141593*@trend*kk2)/!nn)
series cosf2=@cos((2*3.141593*@trend*kk2)/!nn)
scalar kk3=mout3(1,3)
series sinf3=@sin((2*3.141593*@trend*kk3)/!nn)
series cosf3=@cos((2*3.141593*@trend*kk3)/!nn)
scalar kk4=mout3(1,4)
series sinf4=@sin((2*3.141593*@trend*kk4)/!nn)
series cosf4=@cos((2*3.141593*@trend*kk4)/!nn)
scalar kk5=mout3(1,5)
series sinf5=@sin((2*3.141593*@trend*kk5)/!nn)
series cosf5=@cos((2*3.141593*@trend*kk5)/!nn)

system ss01
ss01.append d(y1)=c(11)+c(12)*@trend+c(13)*y1(-1)+c(14)*d(y1(-1))  
ss01.append d(y2)=c(21)+c(22)*@trend+c(23)*y2(-1)+c(24)*d(y2(-1))
ss01.append d(y3)=c(31)+c(32)*@trend+c(33)*y3(-1)+c(34)*d(y3(-1))  
ss01.append d(y4)=c(41)+c(42)*@trend+c(43)*y4(-1)+c(44)*d(y4(-1))  
ss01.append d(y5)=c(51)+c(52)*@trend+c(53)*y5(-1)+c(55)*d(y5(-1))  
ss01.ls
freeze(table11) ss01.results
mout0(1,1)=table11(12,4)
mout0(1,2)=table11(16,4)
mout0(1,3)=table11(20,4)
mout0(1,4)=table11(24,4)
mout0(1,5)=table11(28,4)
delete table11

mout0(2,1)=ss01.@tstats(3)
mout0(2,2)=ss01.@tstats(7)
mout0(2,3)=ss01.@tstats(11)
mout0(2,4)=ss01.@tstats(15)
mout0(2,5)=ss01.@tstats(19)

system ss02
ss02.append d(y1)=c(11)+c(12)*@trend+c(13)*y1(-1)+c(14)*d(y1(-1))  
ss02.append d(y2)=c(21)+c(22)*@trend+c(23)*y2(-1)+c(24)*d(y2(-1))
ss02.append d(y3)=c(31)+c(32)*@trend+c(33)*y3(-1)+c(34)*d(y3(-1))  
ss02.append d(y4)=c(41)+c(42)*@trend+c(43)*y4(-1)+c(44)*d(y4(-1))  
ss02.append d(y5)=c(51)+c(52)*@trend+c(53)*y5(-1)+c(55)*d(y5(-1))  
ss02.sur
freeze(table12) ss02.results
mout0(3,1)=table12(13,4)
mout0(3,2)=table12(17,4)
mout0(3,3)=table12(21,4)
mout0(3,4)=table12(25,4)
mout0(3,5)=table12(29,4)
delete table12

system ss1
ss1.append d(y1)=c(11)+c(12)*@trend+c(13)*y1(-1)+c(14)*d(y1(-1))+c(15)*sinf1+c(16)*cosf1  
ss1.append d(y2)=c(21)+c(22)*@trend+c(23)*y2(-1)+c(24)*d(y2(-1))+c(25)*sinf2+c(26)*cosf2
ss1.append d(y3)=c(31)+c(32)*@trend+c(33)*y3(-1)+c(34)*d(y3(-1))+c(35)*sinf3+c(36)*cosf3  
ss1.append d(y4)=c(41)+c(42)*@trend+c(43)*y4(-1)+c(44)*d(y4(-1))+c(45)*sinf4+c(46)*cosf4  
ss1.append d(y5)=c(51)+c(52)*@trend+c(53)*y5(-1)+c(55)*d(y5(-1))+c(55)*sinf5+c(56)*cosf5  
ss1.ls
freeze(table1) ss1.results
mout1(1,1)=table1(12,4)
mout1(1,2)=table1(16,4)
mout1(1,3)=table1(20,4)
mout1(1,4)=table1(24,4)
mout1(1,5)=table1(28,4)
delete table1

system ss2
ss2.append d(y1)=c(11)+c(12)*@trend+c(13)*y1(-1)+c(14)*d(y1(-1))+c(15)*sinf1+c(16)*cosf1  
ss2.append d(y2)=c(21)+c(22)*@trend+c(23)*y2(-1)+c(24)*d(y2(-1))+c(25)*sinf2+c(26)*cosf2
ss2.append d(y3)=c(31)+c(32)*@trend+c(33)*y3(-1)+c(34)*d(y3(-1))+c(35)*sinf3+c(36)*cosf3  
ss2.append d(y4)=c(41)+c(42)*@trend+c(43)*y4(-1)+c(44)*d(y4(-1))+c(45)*sinf4+c(46)*cosf4  
ss2.append d(y5)=c(51)+c(52)*@trend+c(53)*y5(-1)+c(55)*d(y5(-1))+c(55)*sinf5+c(56)*cosf5    
ss2.sur
freeze(table2) ss2.results
mout2(1,1)=table2(13,4)
mout2(1,2)=table2(19,4)
mout2(1,3)=table2(25,4)
mout2(1,4)=table2(31,4)
mout2(1,5)=table2(37,4)
delete table2


