DATA fabric;
INPUT Concentration Salt $ Temperature;
DATALINES;
1 CaCO3      733
1 CaCO3      728
1 CaCO3      720
1 CaCl2      725
1 CaCl2      727
1 CaCl2      719
1 Untreated  812
1 Untreated  827
1 Untreated  876
2 CaCO3      786
2 CaCO3      771
2 CaCO3      779
2 CaCl2      756
2 CaCl2      781
2 CaCl2      814
2 Untreated  945
2 Untreated  881
2 Untreated  919
;

PROC PRINT DATA=fabric; RUN;

PROC SORT DATA=fabric;
 BY Concentration Salt;
 RUN;

PROC MEANS DATA=fabric NOPRINT;
 BY Concentration Salt;
 VAR Temperature;
 OUTPUT OUT=means MEAN=mean;
 RUN;

PROC PRINT DATA=means; RUN;

PROC SGPLOT DATA=means;
 SERIES X=Salt Y=mean / GROUP=Concentration MARKERS;
 RUN;

TITLE 'Interaction Model: Fabric Data';
PROC GLM DATA=fabric;
 CLASS Concentration Salt;
 MODEL temperature = Concentration | Salt / SS3 SOLUTION;
 LSMEANS Concentration Salt Concentration*Salt / STDERR CL PDIFF;
 CONTRAST 'ContrastName' Concentration 2 -2 Concentration*salt 1 1 0 -1 -1 0; 
 RUN;

