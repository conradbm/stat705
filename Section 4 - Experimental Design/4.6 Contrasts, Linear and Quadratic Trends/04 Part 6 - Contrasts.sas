DATA beans;
INPUT Density Yield @@;
DATALINES;
10 11.9 10 11.1 10 13.9 
20 16.1 20 15.0 20 16.9 
30 20.3 30 18.6 30 17.5
;
PROC GLM DATA=beans;
 CLASS Density;
 MODEL Yield = Density;
 CONTRAST 'Linear' Density -1 0 1;
 CONTRAST 'Quadratic' Density 1 -2 1;
 RUN;
