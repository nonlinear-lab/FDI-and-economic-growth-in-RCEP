'ARDL test

matrix(2,5) mout

series y1=@log(gdp1)
series y2=@log(gdp2)
series y3=@log(gdp3)
series y4=@log(gdp4)
series y5=@log(gdp5)

series x11=fdip1
series x12=fdip2
series x13=fdip3
series x14=fdip4
series x15=fdip5

system ss1
ss1.append d(y1)=c(11)*d(x11)+c(14)+c(15)*@trend+c(16)*y1(-1)+c(17)*x11(-1)  
ss1.append d(y2)=c(21)*d(x12)+c(24)+c(25)*@trend+c(26)*y2(-1)+c(27)*x12(-1)
ss1.append d(y3)=c(31)*d(x13)+c(34)+c(35)*@trend+c(36)*y3(-1)+c(37)*x13(-1)  
ss1.append d(y4)=c(41)*d(x14)+c(44)+c(45)*@trend+c(46)*y4(-1)+c(47)*x14(-1)  
ss1.append d(y5)=c(51)*d(x15)+c(54)+c(55)*@trend+c(56)*y5(-1)+c(57)*x15(-1)  
ss1.ls

system ss2
ss2.append d(y1)=c(11)*d(x11)+c(14)  
ss2.append d(y2)=c(21)*d(x12)+c(24)
ss2.append d(y3)=c(31)*d(x13)+c(34)  
ss2.append d(y4)=c(41)*d(x14)+c(44)  
ss2.append d(y5)=c(51)*d(x15)+c(54)  
ss2.ls

equation eq11.ls d(y1) d(x11) c @trend y1(-1) x11(-1)
scalar nvu=eq11.@ncoef
equation eq12.ls d(y1) d(x11) c
scalar nvr=eq12.@ncoef
scalar nob=@obs(y1)

scalar ssr11=ss1.@ssr(1)
scalar ssr12=ss2.@ssr(1)
scalar ff_num=(ssr12-ssr11)/(nvu-nvr)
scalar ff_den=ssr11/(nob-nvu-1)
scalar ff1=ff_num/ff_den
mout(1,1)=ff1
scalar ssr21=ss1.@ssr(2)
scalar ssr22=ss2.@ssr(2)
scalar ff_num=(ssr22-ssr21)/(nvu-nvr)
scalar ff_den=ssr21/(nob-nvu-1)
scalar ff2=ff_num/ff_den
mout(1,2)=ff2
scalar ssr31=ss1.@ssr(3)
scalar ssr32=ss2.@ssr(3)
scalar ff_num=(ssr32-ssr31)/(nvu-nvr)
scalar ff_den=ssr31/(nob-nvu-1)
scalar ff3=ff_num/ff_den
mout(1,3)=ff3
scalar ssr41=ss1.@ssr(4)
scalar ssr42=ss2.@ssr(4)
scalar ff_num=(ssr42-ssr41)/(nvu-nvr)
scalar ff_den=ssr41/(nob-nvu-1)
scalar ff4=ff_num/ff_den
mout(1,4)=ff4
scalar ssr51=ss1.@ssr(5)
scalar ssr52=ss2.@ssr(5)
scalar ff_num=(ssr52-ssr51)/(nvu-nvr)
scalar ff_den=ssr51/(nob-nvu-1)
scalar ff5=ff_num/ff_den
mout(1,5)=ff5

'calculation using "ardl
equation eq1.ardl(fixed, deplags=1, reglags=1,trend=linear) y1 x11
freeze(table21) eq1.boundstest
mout(2,1)=table21(38,2)
equation eq2.ardl(fixed, deplags=1, reglags=1,trend=linear) y2 x12
freeze(table22) eq2.boundstest
mout(2,2)=table22(38,2)
equation eq3.ardl(fixed, deplags=1, reglags=1,trend=linear) y3 x13
freeze(table23) eq3.boundstest
mout(2,3)=table23(38,2)
equation eq4.ardl(fixed, deplags=1, reglags=1,trend=linear) y4 x14
freeze(table24) eq4.boundstest
mout(2,4)=table24(38,2)
equation eq5.ardl(fixed, deplags=1, reglags=1,trend=linear) y5 x15
freeze(table25) eq5.boundstest
mout(2,5)=table25(38,2)

