/* STAT 705, SLR Part 07, Example 2.
   Looking at many different transformations  */

DATA example;
INPUT x y @@;
DATALINES;
  13.37 22.76  10.61  4.27  11.76  5.17  11.20 10.56  12.21 21.02
  12.92 15.38  13.49 17.12  14.53 30.68  12.25 17.08  12.04 17.79
  13.24 30.31  12.34 18.60  12.93  6.93  10.52  9.82  12.66 27.71
  12.59 13.22  12.23  9.32  11.92 11.30  12.42 18.22  13.28 15.24
  10.85  3.64  13.71 16.37  12.79 13.36  13.33 29.30  10.37  5.84
  11.45  7.91  11.58 11.82  13.46 15.90  12.11 15.84  11.95  6.15
  12.05 17.64  12.17 11.36  14.91 46.51  12.38  7.60  11.13  5.74
  11.74 10.93  10.46  5.09  10.94  4.89  10.86  3.82  13.10 19.18
  12.06 10.20  11.61 20.09  11.33  5.79  12.64  9.05  11.60  6.78
  12.41 11.08  12.61 25.08  11.81 19.33  11.25 21.91  10.99 13.62
  11.18  8.91  12.75 21.67  14.48 58.09  10.75 5.33   12.14 13.21
  11.39 14.80
;
TITLE 'Scatterplot of Original Data';
PROC SGPLOT DATA=example;
 SCATTER X=x Y=y / markerattrs=(symbol=CircleFilled color=black size=2%);
 XAXIS LABEL = 'Original X';
 YAXIS LABEL = 'Original Y';
 RUN;
 
/***********************************************************************/
/* Based on the scatterplot of the original data, we could try
   using x^2 or x^3 or log(y) or 1/y.  We will also consider sqrt(y).
   Create one dataset that contains all the transformed values.
   */
data transform;
 set example;
 x2 = x**2;       * x squared.  In SAS, double star is exponent;
 x3 = x**3;       * x cubed;
 logY = log(y);   * natural log;
 overY = 1/y;     * reciprocal of Y;
 sqrtY = sqrt(y); * square root of Y;
 run; 

/* Fit all the models, but do not print any output.
   Instead, store the results from each model in a new SAS dataset.
   We will use these datasets to generate our own residual plots.
*/
PROC REG DATA=transform NOPRINT;
 'Original Data'  : MODEL y = x;
                    OUTPUT OUT=orig_results  PREDICTED=pred RESIDUAL=resid;
 'Using X squared': MODEL y = x2;
                    OUTPUT OUT=X2_results    PREDICTED=pred RESIDUAL=resid;
 'Using X cubed'  : MODEL y = x3;
                    OUTPUT OUT=X3_results    PREDICTED=pred RESIDUAL=resid;
 'Using 1/Y'      : MODEL overY = x;
                    OUTPUT OUT=overY_results PREDICTED=pred RESIDUAL=resid;
 'Using log(Y)'   : MODEL logY = x;
                    OUTPUT OUT=logy_results  PREDICTED=pred RESIDUAL=resid;
 'Using sqrt(Y)'  : MODEL sqrtY = x;
                    OUTPUT OUT=sqrtY_results PREDICTED=pred RESIDUAL=resid;
 RUN;
 
/* For each model, generate two graphs:
   (1) the scatterplot using the transformed values
   (2) the residual plot 
*/
PROC SGPLOT DATA=orig_results;  
 REG X=x Y=y / markerattrs=(symbol=CircleFilled color=black size=2%); 
 TITLE 'Scatterplot: Original Data'; 
 XAXIS LABEL='Value of X';
 YAXIS LABEL='Value of Y';
 RUN;
PROC SGPLOT DATA=orig_results;  
 SCATTER X=pred Y=resid / markerattrs=(symbol=CircleFilled color=black size=2%); 
 TITLE 'Residual Plot: Original Data';
 XAXIS LABEL='Predicted Value of Y';
 YAXIS LABEL='Residual';
 RUN;

PROC SGPLOT DATA=X2_results;    
 REG X=x2 Y=y / markerattrs=(symbol=CircleFilled color=black size=2%); 
 TITLE 'Scatterplot: Using X^2'; 
 XAXIS LABEL='Value of X^2';
 YAXIS LABEL='Value of Y';
 RUN;

PROC SGPLOT DATA=X2_results;    
 SCATTER X=pred Y=resid / markerattrs=(symbol=CircleFilled color=black size=2%); 
 TITLE 'Residual Plot: Using X^2';
 XAXIS LABEL='Predicted Value of Y';
 YAXIS LABEL='Residual';
 RUN;

PROC SGPLOT DATA=X3_results;    
 REG X=x3 Y=y / markerattrs=(symbol=CircleFilled color=black size=2%); 
 TITLE 'Scatterplot: Using X^3';
 XAXIS LABEL='Predicted Value of Y';
 RUN;
PROC SGPLOT DATA=X3_results;    
 SCATTER X=pred Y=resid / markerattrs=(symbol=CircleFilled color=black size=2%); 
 TITLE 'Residual Plot: Using X^3'; 
 XAXIS LABEL='Predicted Value of Y';
 YAXIS LABEL='Residual';
 RUN;

PROC SGPLOT DATA=overY_results; 
 REG X=x Y=overY / markerattrs=(symbol=CircleFilled color=black size=2%); 
 TITLE 'Scatterplot: Using 1/Y';
 XAXIS LABEL='Value of X';
 YAXIS LABEL='Value of 1/Y';
 RUN;
PROC SGPLOT DATA=overY_results; 
 SCATTER X=pred Y=resid / markerattrs=(symbol=CircleFilled color=black size=2%); 
 TITLE 'Residual Plot: Using 1/Y'; 
 XAXIS LABEL='Predicted Value of 1/Y';
 RUN;

PROC SGPLOT DATA=logY_results;  
 REG X=x Y=logY / markerattrs=(symbol=CircleFilled color=black size=2%); 
 TITLE 'Scatterplot: Using log(Y)'; 
 XAXIS LABEL='Value of X';
 YAXIS LABEL='Value of LOG(Y)';
 RUN;
PROC SGPLOT DATA=logY_results;  
 SCATTER X=pred Y=resid / markerattrs=(symbol=CircleFilled color=black size=2%); 
 TITLE 'Residual Plot: Using log(Y)'; 
 XAXIS LABEL='Predicted Value of LOG(Y)';
 YAXIS LABEL='Residual';
 RUN;

PROC SGPLOT DATA=sqrtY_results; 
 REG X=x Y=sqrtY / markerattrs=(symbol=CircleFilled color=black size=2%); 
 TITLE 'Scatterplot: Using sqrt(Y)'; 
 XAXIS LABEL='Value of X';
 YAXIS LABEL='Value of SQRT(Y)';
 RUN;
PROC SGPLOT DATA=sqrtY_results; 
 SCATTER X=pred Y=resid / markerattrs=(symbol=CircleFilled color=black size=2%); 
 TITLE 'Residual Plot: Using sqrt(Y)'; 
 XAXIS LABEL='Predicted Value of SQRT(Y)';
 YAXIS LABEL='Residual';
 RUN;


/***********************************************************************/
/* get goodness-of-fit measures for these models                       */
ods select FitStatistics;
title ' ';
title2 ' ';
*ods trace on;
PROC REG DATA=transform PLOTS=none;
 'Original Data'  : MODEL y = x;
 'Using X squared': MODEL y = x2;
 'Using X cubed'  : MODEL y = x3;
 'Using 1/Y'      : MODEL overY = x;
 'Using log(Y)'   : MODEL logY = x;
 'Using sqrt(Y)'  : MODEL sqrtY = x;
 RUN;
* ods trace off;
ods show;

/*********************************************************************/
/* Take a closer look at the model that uses log(Y) and the one
   that uses sqrt(Y).  The predicted values that are generated by 
   these models are for the transformed Y values.  We will need to
   back-transform them.
   */
DATA back_log;        /* The log(Y) model generated predicted values */
 set logY_results;    /* for log(Y).  The back transformation is the */
 pred_Y = exp(pred);  /* exp function.                               */
 run;
 
DATA back_sqrt;       /* The sqrt(Y) model generated predicted values */
 set sqrtY_results;   /* for the square root of Y.  The back          */
 pred_Y = pred**2;    /* transformation is the squaring function.     */
 run;

/* For each of these two models, generate a scatter plot of the 
   original X and Y, and plot a red star for the predicted Y 
   that has been back-transformed  */
title 'Back-transformed values for log(Y) model';
PROC SGPLOT DATA=back_log;
 SCATTER X=x Y=y  / markerattrs=(symbol=CircleFilled color=black size=2%);
 SCATTER X=x Y=pred_Y  / markerattrs=(symbol=Star color=red size=2%); 
 XAXIS LABEL = 'X';
 YAXIS LABEL = 'Y';
 RUN;
 
TITLE 'back-transformed values for sqrt(Y) model';
PROC SGPLOT DATA=back_sqrt;
 SCATTER X=x Y=y / markerattrs=(symbol=CircleFilled color=black size=2%);
 SCATTER X=x Y=pred_Y / markerattrs=(symbol=Star color=red size=2%);
 XAXIS LABEL = 'X';
 YAXIS LABEL = 'Y';
 RUN;

 