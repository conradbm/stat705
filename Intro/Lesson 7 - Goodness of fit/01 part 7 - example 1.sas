options ls=78 ps=45 nodate nonumber;
ods graphics on / width=2.5in height=2.5in;
/* pH study -- X = time,  Y = pH  */
DATA orig_data;
 INPUT origx origy @@;  * '@@' tells SAS to keep reading data on this line;
 DATALINES;
 1 7.02 1 6.93 2 6.42 2 6.51 4 6.07 4 5.98 6 5.59 6 5.80 8 5.51 8 5.36
 ;

TITLE 'Scatterplot of Original (X, Y) Pairs';
PROC SGPLOT DATA=orig_data;
 SCATTER X=origx Y=origy / markerattrs=(symbol=CircleFilled color=black size=2%);
 XAXIS LABEL = 'Original X';
 YAXIS LABEL = 'Original Y';
 RUN;

TITLE 'No transformation';
PROC REG DATA=orig_data NOPRINT;  /* NOPRINT suppresses printing all results */
 MODEL origy = origx / P R;
 OUTPUT OUT=orig_results PREDICTED=pred RESIDUAL=resid;
 RUN;
 
TITLE2 'Residual Plot';
PROC SGPLOT DATA=orig_results;
 SCATTER X=pred Y=resid / markerattrs=(symbol=CircleFilled color=black size=2%);  
 XAXIS LABEL = 'Predicted Value for Y';
 YAXIS LABEL = 'Residual';
 run;

TITLE2 'Observed and Predicted Values';
PROC SGPLOT DATA=orig_results;
 SCATTER X=origx Y=origy / markerattrs=(symbol=CircleFilled color=black size=2%);    
 SCATTER X=origx Y=pred  / markerattrs=(symbol=Star color=red size=2%); 
 XAXIS label ='Original X';
 YAXIS label = ' ';
 RUN;
 


/*********************************************************/
/* Try two transformations: (1) replace X with log(X),   */
/* and (2) replace X with 1/X                            */
/*********************************************************/

/* create a new dataset to store the transformed values (plus original data)    */
DATA transformed;
 SET orig_data;     /* this reads in all the data from the original dataset          */
 logx = LOG(origx); /* log transform orig. X and save it as a new variable 'logtime' */ 
 recipx  = 1/origx; /* reciprocal of orig. X and save it as a new variable 'recipx'  */ 
 RUN;
 
TITLE 'Log Transformation';
PROC REG DATA=transformed NOPRINT;
  MODEL origy=logx / P R;
  OUTPUT OUT=log_results PREDICTED=pred RESIDUAL=resid;
  RUN;
  
TITLE2 'Residual Plot';
PROC SGPLOT DATA=log_results;
 SCATTER X=pred Y=resid / markerattrs=(symbol=CircleFilled color=black size=8px);  
 XAXIS LABEL = 'Predicted Value for Y';
 YAXIS LABEL = 'Residual';
 RUN;
 
TITLE2 'Observed and Predicted Values';
PROC SGPLOT DATA=log_results;
 SCATTER X=logx y=origy / markerattrs=(symbol=CircleFilled color=black size=8px);
 SCATTER X=logx y=pred  / markerattrs=(symbol=Star color=red size=8px);
 XAXIS LABEL = 'LOG(X)';
 YAXIS LABEL = ' '; 
 RUN;

/* This graph is same as previous, except that the x-axis has the 
   original values for X instead of using log(X))                 */
TITLE2 'Observed and Predicted Values';
PROC SGPLOT DATA=log_results;
 SCATTER X=origx Y=origy / markerattrs=(symbol=CircleFilled size=8px);
 SCATTER X=origx Y=pred  / markerattrs=(symbol=Star color=red size=8px);
 XAXIS LABEL = 'Original X';
 YAXIS LABEL = ' ';
 RUN;

 
  
/**********************************************************/
/* model that uses the transformation 1/x    */
TITLE 'Reciprocal Transformation';
PROC REG DATA=transformed NOPRINT;
 MODEL origy = recipx / P R;
 OUTPUT OUT=recip_results PREDICTED=pred RESIDUAL=resid;
 RUN;
  
TITLE2 'Residual Plot';
PROC SGPLOT DATA=recip_results;
 SCATTER X=pred y=resid / markerattrs=(symbol=CircleFilled color=black size=8px);
 XAXIS LABEL="Predicted Values for Y";
 YAXIS LABEL='Residual';
 RUN;
 
TITLE2 'Observed and Predicted Values';
PROC SGPLOT DATA=recip_results;
 SCATTER X=recipx Y=origy / markerattrs=(symbol=CircleFilled color=black size=8px);
 SCATTER X=recipx Y=pred  / markerattrs=(symbol=Star color=red size=8px);
 XAXIS LABEL = 'Reciprocal of X';
 YAXIS LABEL = ' ';
 RUN;

/* graph the results using time instead of overx */
TITLE2 'Observed and Predicted Values';
PROC SGPLOT DATA=recip_results;
 SCATTER X=origx Y=origy / markerattrs=(symbol=CircleFilled color=black size=8px);
 SCATTER X=origx Y=pred  / markerattrs=(symbol=Star color=red size=8px);
 XAXIS LABEL = 'Original X';
 YAXIS LABEL = ' ';
 RUN;
 
 ods graphics off;
/**********************************************************************/
/* get the numerical results from these models, without any graphs    */
/**********************************************************************/
* clear out the old titles;
TITLE ' ';
TITLE2 ' ';
PROC REG DATA=transformed PLOTS=NONE;
'ORIGINAL'     :  MODEL origy = origx;
'LOG TRANSFORM': MODEL origy = logx;
'RECIPROCAL'   : MODEL origy = recipx;
run;