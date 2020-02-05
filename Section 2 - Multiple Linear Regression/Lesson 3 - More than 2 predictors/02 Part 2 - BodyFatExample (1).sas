options ls=100 ps=61;

/*  This is the body fat data that was first used
    in STAT 705: Multiple Linear Regression, part 2    
*/
DATA fat;
 INPUT triceps thigh midarm bodyfat;
  DATALINES;
  19.5  43.1  29.1  11.9
  24.7  49.8  28.2  22.8
  30.7  51.9  37.0  18.7
  29.8  54.3  31.1  20.1
  19.1  42.2  30.9  12.9
  25.6  53.9  23.7  21.7
  31.4  58.5  27.6  27.1
  27.9  52.1  30.6  25.4
  22.1  49.9  23.2  21.3
  25.5  53.5  24.8  19.3
  31.1  56.6  30.0  25.4
  30.4  56.7  28.3  27.2
  18.7  46.5  23.0  11.7
  19.7  44.2  28.6  17.8
  14.6  42.7  21.3  12.8
  29.5  54.4  30.1  23.9
  27.7  55.3  25.7  22.6
  30.2  58.6  24.6  25.4
  22.7  48.2  27.1  14.8
  25.2  51.0  27.5  21.1
  20.0  50.0  20.0    .		
;
RUN;

TITLE 'Correlation Analysis';      
PROC CORR DATA=fat PLOTS=MATRIX;
 VAR triceps midarm bodyfat;
 RUN;

/******************************************/
TITLE 'Predictors are triceps and midarm';
PROC REG DATA=fat;
 MODEL bodyfat = triceps midarm / CLB COVB P CLM CLI;
 RUN;                         

/******************************************/
/*   This section of code is for Section 3   */
/******************************************/
TITLE 'Using all three predictors';

PROC CORR DATA=fat NOSIMPLE NOPROB PLOTS=MATRIX;
 VAR triceps midarm thigh bodyfat;
 RUN;
/* programming note: 
   The options NOSIMPLE and NOPROB stop 
   SAS from printing the table of summary 
   statistics and the probabilities that 
   are in each cell in the correlation matrix.
*/

PROC REG DATA=fat;
 MODEL bodyfat = triceps midarm thigh / CLB COVB VIF;
 RUN;

/*  5 candidate models    */
TITLE ' ';
PROC REG DATA=fat;
 MODEL bodyfat = midarm;               * model 1;           
 MODEL bodyfat = thigh;                * model 2; 
 MODEL bodyfat = triceps;              * model 3;
 MODEL bodyfat = midarm triceps / VIF; * model 4;
 MODEL bodyfat = midarm thigh / VIF;   * model 5;
 RUN;

