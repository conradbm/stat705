 DATA tensile;
 INPUT Casting Bar Strength @@;
 DATALINES;
 1  1 88.0   1  2 88.0   1  3 94.8   1  4 90.0   1  5 93.0
 1  6 89.0   1  7 86.0   1  8 92.9   1  9 89.0   1 10 93.0
 2 11 85.9   2 12 88.6   2 13 90.0   2 14 87.1   2 15 85.6
 2 16 86.0   2 17 91.0   2 18 89.6   2 19 93.0   2 20 87.5
 3 21 94.2   3 22 91.5   3 23 92.0   3 24 96.5   3 25 95.6
 3 26 93.8   3 27 92.5   3 28 93.2   3 29 96.2   3 30 92.5
 ;
PROC GLM DATA=tensile;
 CLASS Casting;
 MODEL Strength = Casting / SS3;
 RUN;
PROC MIXED DATA=tensile;
 CLASS Casting;
 MODEL Strength = ;
 RANDOM CASTING;
 RUN;
 