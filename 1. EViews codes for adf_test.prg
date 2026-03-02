' ADF test

matrix(6,5) mout1
For !s=1 to 5

'series fdiu!s=@log(fdiu!s)
series gdp!s=@log(gdp!s)

fdip!s.uroot(adf,exog=trend,lag=1,save=out) 
freeze(table!s) out
mout1(1,!s)=table!s(6,2)
delete table!s

fdiu!s.uroot(adf,exog=trend,lag=1,save=out) 
freeze(table!s) out
mout1(2,!s)=table!s(6,2)
delete table!s

gdp!s.uroot(adf,exog=trend,lag=1,save=out) 
freeze(table!s) out
mout1(3,!s)=table!s(6,2)
delete table!s

equation eq1.ls d(fdip!s) fdip!s(-1) d(fdip!s(-1)) c @trend
scalar adf1=eq1.@tstats(1)   
mout1(4,!s)=adf1

equation eq2.ls d(fdiu!s) fdiu!s(-1) d(fdiu!s(-1)) c @trend
scalar adf2=eq2.@tstats(1)   
mout1(5,!s)=adf2

equation eq3.ls d(gdp!s) gdp!s(-1) d(gdp!s(-1)) c @trend
scalar adf3=eq3.@tstats(1)   
mout1(6,!s)=adf3

next


