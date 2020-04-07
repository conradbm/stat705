/*  STAT 705, Section 2.6 */
/*  Influence and outliers in the body fat data */
DATA fat;
  INPUT Obs triceps thigh midarm bodyfat;
  DATALINES;
  1 19.5  43.1  29.1  11.9
  2 24.7  49.8  28.2  22.8
  3 30.7  51.9  37.0  18.7
  4 29.8  54.3  31.1  20.1
  5 19.1  42.2  30.9  12.9
  6 25.6  53.9  23.7  21.7
  7 31.4  58.5  27.6  27.1
  8 27.9  52.1  30.6  25.4
  9 22.1  49.9  23.2  21.3
 10 25.5  53.5  24.8  19.3
 11 31.1  56.6  30.0  25.4
 12 30.4  56.7  28.3  27.2
 13 18.7  46.5  23.0  11.7
 14 19.7  44.2  28.6  17.8
 15 14.6  42.7  21.3  12.8
 16 29.5  54.4  30.1  23.9
 17 27.7  55.3  25.7  22.6
 18 30.2  58.6  24.6  25.4
 19 22.7  48.2  27.1  14.8
 20 25.2  51.0  27.5  21.1
;
RUN;
  
PROC REG DATA=fat;
 MODEL Bodyfat = Triceps Midarm / R INFLUENCE;
 RUN;
/* Two new options:
   R generates a graph summarizing
     studentized residuals and Cook's D.
   INFLUENCE generates a table of various 
     measures of fit and influence for each 
     observation.
*/
   
