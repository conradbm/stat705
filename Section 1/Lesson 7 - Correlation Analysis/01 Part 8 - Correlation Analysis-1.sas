options ls=78 nodate nonumber;

data example;
 input one two @@;
 title 'Two Judges';
 datalines;
 2 3   6 5   3 4   4 8   8 10
 ;

proc corr data=example;
run;
title 'Spearman Correlation';
proc corr data=example spearman;
run;

/********************************************************/
title 'Five Judges';
data pairwise;
input project judge1 judge2 judge3 judge4 judge5;
datalines;
1 5.0 3.2 4.0 5.4 3.8
2 4.0 3.6 5.6 5.4 5.8
3 4.4 4.2 5.8 5.8 6.4
4 5.0 6.0 6.2 6.2 6.0
5 5.2 6.4 6.8 7.0 7.2
6 6.2 8.0 7.4 7.4 7.6
;

proc corr data=pairwise pearson spearman;
 var judge1 -- judge5;
 run;
 
* generate the graph (spaghetti plot);
data panels;
set pairwise;
Judge = 1; Rating = judge1; project_jittered = project + (judge -3)/10; output;
Judge = 2; Rating = judge2; project_jittered = project + (judge -3)/10; output;
Judge = 3; Rating = judge3; project_jittered = project + (judge -3)/10; output;
Judge = 4; Rating = judge4; project_jittered = project + (judge -3)/10; output;
Judge = 5; Rating = judge5; project_jittered = project + (judge -3)/10; output;
run;
* define the attribute map (for different plotting symbols);
data mymap;
retain id "mytest";
input value markersymbol $ 14.;
datalines;
1 CircleFilled
2 DiamondFilled
3 StarFilled
4 TriangleFilled
5 SquareFilled
;
run;
ods graphics on / width=4.5in height=3.5in;
proc sgplot data=panels dattrmap=mymap;
 series x=project_jittered y=Rating /group=judge markers markerattrs=(size=8pt) groupms=judge msattrid=mytest;
 xaxis label='Project';
 yaxis label='Rating';
 run;
ods graphics off;
quit;

/*****************************************************************
 *   PLEASE NOTE:
 *  This program contains a lot of code that I DO NOT expect you
 *  to follow.  Much of the 'extra' code is simply to produce
 *  the graphs.  
 *  
 *  Here is the essence of what you need to do:
 *  1) read in the data (via the DATA step)
 *  2) run PROC CORR to get 
 *      a) the correlation matrix
 *      b) the scatterplot matrix
 *     c) both Pearson's and Spearman's correlations
 *  (and that's it!)
 */