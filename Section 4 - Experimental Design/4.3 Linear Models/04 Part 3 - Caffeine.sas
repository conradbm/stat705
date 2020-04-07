/*  We will use @@ on the input statement to tell 
    SAS to continue reading data on the same line  */
DATA caffeine;
INPUT Dose Taps @@;  
DATALINES;
  0 242   0 245   0 244   0 248   0 247
  0 248   0 242   0 244   0 246   0 242
100 248 100 246 100 245 100 247 100 248 
100 250 100 247 100 246 100 243 100 244
200 246 200 248 200 250 200 252 200 248 
200 250 200 246 200 248 200 245 200 250
;
/* print statement is commented out
PROC PRINT DATA=caffeine;
RUN;
*/
PROC GLM DATA=caffeine;
  CLASS Dose (ref='0');  
  MODEL Taps = Dose / SOLUTION ;
  LSMEANS Dose / STDERR CL;
  MEANS Dose / HOVTEST=BF; /* Brown-Forsythe test */
  OUTPUT OUT=myresults RESIDUAL=resids;
  run;
 
PROC UNIVARIATE DATA=myresults NORMAL;
VAR resids;
run;

quit;


