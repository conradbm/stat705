/* A First SAS Program */ 
DATA example1; 
INPUT Student$ Exam1 Exam2; 
DATALINES; 
JHK 80 83 
CJD 55 63
 BAO 57 .
 RAL 62 71 
 WXY 75 87 
 AMT 91 92 
 RCG 83 91
 MRR 59 63
 CLE 93 99
 MON 81 84 ;

* Print the data to make sure it was read correctly;
PROC PRINT DATA = example1;  
VAR Student Exam1 Exam2;  
RUN;

* Generate summary information about the data;
PROC MEANS N MEAN STD STDERR LCLM UCLM;  
VAR Exam1 Exam2;  
RUN;