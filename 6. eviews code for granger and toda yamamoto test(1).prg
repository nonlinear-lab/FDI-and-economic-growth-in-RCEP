'EViews code for Toda-Yamamoto causality test

'output matrix (mout)
matrix(5,4) mout1
matrix(5,4) mout2

For !k=1 to 5

If !k=1 then 
series y=@log(gdp1)
series x=fdip1
endif
If !k=2 then 
series y=@log(gdp2)
series x=fdip1
endif
If !k=3 then 
series y=@log(gdp3)
series x=fdip3
endif
If !k=4 then 
series y=@log(gdp4)
series x=fdip4
endif
If !k=5 then 
series y=@log(gdp5)
series x=fdip5
endif

'granger
var var!k.ls 1 2 y x @ c @trend
freeze(tab0!k) var!k.testexog(name=exog)
delete exog
mout1(!k,1)=tab0!k(11,2)
mout2(!k,1)=tab0!k(20,2)

'toda-yamamoto 
var var!k.ls 1 2 y x @ c @trend y(-3) x(-3)
freeze(tab!k) var!k.testexog(name=exog)
delete exog
mout1(!k,2)=tab!k(11,2)
mout2(!k,2)=tab!k(20,2)

equation eq1.ls y y(-1) y(-2) y(-3) c @trend x(-1) x(-2) x(-3)
freeze(tab1!k) eq1.wald c(6)=0, c(7)=0
mout1(!k,3)=tab1!k(7,2)
mout1(!k,4)=tab1!k(6,2)

equation eq2.ls x x(-1) x(-2) x(-3) c @trend y(-1) y(-2) y(-3)
freeze(tab2!k) eq2.wald c(6)=0, c(7)=0
mout2(!k,3)=tab2!k(7,2)
mout2(!k,4)=tab2!k(6,2)

next


