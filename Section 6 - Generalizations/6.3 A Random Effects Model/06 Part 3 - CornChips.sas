options ls=72 nodate nonumber;
data cornchips;
input Batch Bag Quality @@;
datalines;
1  1 90  1  2 92  1  3 98
2  4 84  2  5 88  2  6 91
3  7 89  3  8 92  3  9 93
4 10 75  4 11 80  4 12 70
;
proc glm data=cornchips;
class Batch;
model Quality = Batch;
run;

proc mixed data=cornchips;
class Batch;
model Quality = ;
random Batch;
run;


