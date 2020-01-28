DATA example;
INPUT traffic lead;
DATALINES;
 8.1  227
 8.3  312
12.1  362
13.2  521
16.5  640
17.5  539
19.2  728
24.8  945
24.1  738
26.1  759
33.6 1263
22     .
;

PROC PRINT DATA=example; 
RUN;

/* create a scatterplot of the (x,y) pairs  */
PROC SGPLOT DATA=example;
  SCATTER X=traffic Y=lead;
  RUN;

/* generate the fitted regression line  */
PROC REG DATA=example;
 MODEL lead=traffic / P CLM CLI;
 RUN;
 
 /* generate diagnostics */
 PROC REG DATA=example; 
 MODEL lead=traffic / P CLM CLI; 
 OUTPUT OUT=diagnostics 
 RESIDUAL = resid 
 PREDICTED = fitted; 
 RUN;

PROC SGPLOT DATA=diagnostics; 
SCATTER x=fitted y=resid; 
RUN;
PROC UNIVARIATE DATA=diagnostics NOPRINT; 
QQPLOT resid /  NORMAL(MU=EST SIGMA=EST COLOR=BLACK); 
RUN;
