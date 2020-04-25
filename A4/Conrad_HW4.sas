data bacteria;
input Obs Time $ Temp $ Conc $ Count;
datalines;
  1    24   27  0.6    9
  2    24   27  0.6    3
  3    24   27  0.6   10
  4    24   27  0.6   14
  5    24   27  0.6   33
  6    24   27  0.8   16
  7    24   27  0.8   12
  8    24   27  0.8   26
  9    24   27  0.8   20
 10    24   27  0.8   31
 11    24   27  1.0   22
 12    24   27  1.0   37
 13    24   27  1.0   50
 14    24   27  1.0   17
 15    24   27  1.0   28
 16    24   27  1.2   30
 17    24   27  1.2   45
 18    24   27  1.2   52
 19    24   27  1.2   29
 20    24   27  1.2   59
 21    24   27  1.4   27
 22    24   27  1.4   32
 23    24   27  1.4   47
 24    24   27  1.4   18
 25    24   27  1.4   43
 26    48   27  0.6   97
 27    48   27  0.6   84
 28    48   27  0.6  129
 29    48   27  0.6  102
 30    48   27  0.6   72
 31    48   27  0.8  123
 32    48   27  0.8  161
 33    48   27  0.8  145
 34    48   27  0.8  109
 35    48   27  0.8  131
 36    48   27  1.0  132
 37    48   27  1.0  153
 38    48   27  1.0  156
 39    48   27  1.0  129
 40    48   27  1.0  179
 41    48   27  1.2  263
 42    48   27  1.2  189
 43    48   27  1.2  243
 44    48   27  1.2  161
 45    48   27  1.2  221
 46    48   27  1.4  145
 47    48   27  1.4  191
 48    48   27  1.4  178
 49    48   27  1.4  158
 50    48   27  1.4  195
 51    24   35  0.6   66
 52    24   35  0.6   71
 53    24   35  0.6   93
 54    24   35  0.6  102
 55    24   35  0.6   62
 56    24   35  0.8   93
 57    24   35  0.8   76
 58    24   35  0.8   98
 59    24   35  0.8  110
 60    24   35  0.8   54
 61    24   35  1.0  147
 62    24   35  1.0   63
 63    24   35  1.0   89
 64    24   35  1.0  106
 65    24   35  1.0   98
 66    24   35  1.2  199
 67    24   35  1.2  162
 68    24   35  1.2  149
 69    24   35  1.2  178
 70    24   35  1.2  176
 71    24   35  1.4  168
 72    24   35  1.4  155
 73    24   35  1.4  113
 74    24   35  1.4  124
 75    24   35  1.4  119
 76    48   35  0.6  110
 77    48   35  0.6  123
 78    48   35  0.6  146
 79    48   35  0.6  136
 80    48   35  0.6  113
 81    48   35  0.8  149
 82    48   35  0.8  181
 83    48   35  0.8  217
 84    48   35  0.8  139
 85    48   35  0.8  151
 86    48   35  1.0  189
 87    48   35  1.0  202
 88    48   35  1.0  269
 89    48   35  1.0  156
 90    48   35  1.0  147
 91    48   35  1.2  263
 92    48   35  1.2  214
 93    48   35  1.2  284
 94    48   35  1.2  233
 95    48   35  1.2  211
 96    48   35  1.4  197
 97    48   35  1.4  233
 98    48   35  1.4  186
 99    48   35  1.4  213
100    48   35  1.4  162
101    24   43  0.6   98
102    24   43  0.6   67
103    24   43  0.6   42
104    24   43  0.6   31
105    24   43  0.6   77
106    24   43  0.8   82
107    24   43  0.8   79
108    24   43  0.8  108
109    24   43  0.8   62
110    24   43  0.8   81
111    24   43  1.0  120
112    24   43  1.0  113
113    24   43  1.0   96
114    24   43  1.0  119
115    24   43  1.0  117
116    24   43  1.2  148
117    24   43  1.2  127
118    24   43  1.2  131
119    24   43  1.2  132
120    24   43  1.2  146
121    24   43  1.4  132
122    24   43  1.4  118
123    24   43  1.4  121
124    24   43  1.4  142
125    24   43  1.4  101
126    48   43  0.6  123
127    48   43  0.6  107
128    48   43  0.6  118
129    48   43  0.6  111  
130    48   43  0.6   76
131    48   43  0.8  146
132    48   43  0.8   91
133    48   43  0.8   99
134    48   43  0.8  148
135    48   43  0.8  125
136    48   43  1.0  106
137    48   43  1.0  189
138    48   43  1.0  141
139    48   43  1.0   97
140    48   43  1.0  127
141    48   43  1.2  232
142    48   43  1.2  216
143    48   43  1.2  234
144    48   43  1.2  177
145    48   43  1.2  201
146    48   43  1.4  163
147    48   43  1.4  141
148    48   43  1.4  172
149    48   43  1.4  212
150    48   43  1.4  184
;

/*transform*/
data transform;
 set bacteria;
 SqrtCount = sqrt(Count);
 run;
 
/*3way anova*/
proc glm data=transform;
class Time Temp Conc ;
model SqrtCount = Time Temp Conc Time*Temp Time*Conc Temp*Conc Time*Temp*Conc / ss3 solution;
lsmeans Time Temp Conc Time*Temp Time*Conc Temp*Conc Time*Temp*Conc / stderr cl pdiff ;
run;



