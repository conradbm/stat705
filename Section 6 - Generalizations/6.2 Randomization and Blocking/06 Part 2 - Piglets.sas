options ls=76 nodate nonumber;

data piglets;
input Litter Diet ADG;
datalines;
 1        1     0.79
 1        2     0.75
 1        3     0.75
 1        4     0.83
 2        1     0.74
 2        2     0.75
 2        3     0.71
 2        4     0.80
 3        1     0.74
 3        2     0.73
 3        3     0.79
 3        4     0.82
 4        1     0.85
 4        2     0.81
 4        3     0.83
 4        4     0.87
 ;

 proc glm data=piglets;
 class Litter Diet;
 model ADG = Litter Diet / ss3;
 lsmeans Litter Diet / stderr pdiff;
 run;

 proc glm data=piglets;
 class Diet;
 model ADG = Diet / ss3;
 lsmeans Diet / stderr pdiff;
 run;

 