' SUR_ADF test

matrix(3,5) mout1
matrix(3,5) mout2

For !s=1 to 3

if !s=1 then
series y1=fdip1
series y2=fdip2
series y3=fdip3
series y4=fdip4
series y5=fdip5
endif

if !s=2 then
series y1=fdiu1
series y2=fdiu2
series y3=fdiu3
series y4=fdiu4
series y5=fdiu5
endif

if !s=3 then
series y1=@log(gdp1)
series y2=@log(gdp2)
series y3=@log(gdp3)
series y4=@log(gdp4)
series y5=@log(gdp5)
endif

system ss1
ss1.append d(y1)=c(11)+c(12)*@trend+c(13)*y1(-1)+c(14)*d(y1(-1))  
ss1.append d(y2)=c(21)+c(22)*@trend+c(23)*y2(-1)+c(24)*d(y2(-1))  
ss1.append d(y3)=c(31)+c(32)*@trend+c(33)*y3(-1)+c(34)*d(y3(-1))  
ss1.append d(y4)=c(41)+c(42)*@trend+c(43)*y4(-1)+c(44)*d(y4(-1))  
ss1.append d(y5)=c(51)+c(52)*@trend+c(53)*y5(-1)+c(55)*d(y5(-1))  
ss1.ls
freeze(table1!s) ss1.results
mout1(!s,1)=table1!s(12,4)
mout1(!s,2)=table1!s(16,4)
mout1(!s,3)=table1!s(20,4)
mout1(!s,4)=table1!s(24,4)
mout1(!s,5)=table1!s(28,4)
delete table1!s

system ss2
ss2.append d(y1)=c(11)+c(12)*@trend+c(13)*y1(-1)+c(14)*d(y1(-1))  
ss2.append d(y2)=c(21)+c(22)*@trend+c(23)*y2(-1)+c(24)*d(y2(-1))  
ss2.append d(y3)=c(31)+c(32)*@trend+c(33)*y3(-1)+c(34)*d(y3(-1))  
ss2.append d(y4)=c(41)+c(42)*@trend+c(43)*y4(-1)+c(44)*d(y4(-1))  
ss2.append d(y5)=c(51)+c(52)*@trend+c(53)*y5(-1)+c(55)*d(y5(-1))  
ss2.sur
freeze(table2!s) ss2.results
mout2(!s,1)=table2!s(13,4)
mout2(!s,2)=table2!s(17,4)
mout2(!s,3)=table2!s(21,4)
mout2(!s,4)=table2!s(25,4)
mout2(!s,5)=table2!s(29,4)
delete table2!s

next


