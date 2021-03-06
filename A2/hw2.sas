/* HW 2*/

data example;
 input ID  FixAcid VolAcid CitricAcid Sugar Chloride FreeSulfur TotalSulfur  Density    pH Sulphate   Alcohol Quality @@;
 title 'Wine';
 datalines;
  1      6.8   0.785       0.00  2.40    0.104       14.0        30.0  0.99660  3.52     0.55  10.70000   6.735
  2      9.9   0.250       0.46  1.70    0.062       26.0        42.0  0.99590  3.18     0.83  10.60000   5.092
  3      7.7   0.750       0.27  3.80    0.110       34.0        89.0  0.99664  3.24     0.45   9.30000   5.859
  4      7.2   0.655       0.03  1.80    0.078        7.0        12.0  0.99587  3.34     0.39   9.50000   5.009
  5      7.2   0.570       0.05  2.30    0.081       16.0        36.0  0.99564  3.38     0.60  10.30000   5.494
  6      7.6   0.550       0.21  2.20    0.071        7.0        28.0  0.99640  3.28     0.55   9.70000   5.018 
  7      8.8   0.270       0.39  2.00    0.100       20.0        27.0  0.99546  3.15     0.69  11.20000   5.436
  8      7.3   0.740       0.08  1.70    0.094       10.0        45.0  0.99576  3.24     0.50   9.80000   4.864
  9      6.6   0.695       0.00  2.10    0.075       12.0        56.0  0.99680  3.49     0.67   9.20000   4.905
 10      9.4   0.590       0.14  2.00    0.084       25.0        48.0  0.99810  3.14     0.56   9.70000   5.822
 11      6.4   0.570       0.14  3.90    0.070       27.0        73.0  0.99669  3.32     0.48   9.20000   4.889
 12      7.1   0.460       0.14  2.80    0.076       15.0        37.0  0.99624  3.36     0.49  10.70000   4.533
 13      8.1   0.785       0.52  2.00    0.122       37.0       153.0  0.99690  3.21     0.69   9.30000   5.656
 14     11.3   0.370       0.50  1.80    0.090       20.0        47.0  0.99734  3.15     0.57  10.50000   5.691
 15      9.0   0.400       0.43  2.40    0.068       29.0        46.0  0.99430  3.20     0.60  12.20000   5.391
 16      7.3   0.670       0.02  2.20    0.072       31.0        92.0  0.99566  3.32     0.68  11.10000   5.727
 17      8.4   0.560       0.04  2.00    0.082       10.0        22.0  0.99760  3.22     0.44   9.60000   4.338
 18     12.5   0.380       0.60  2.60    0.081       31.0        72.0  0.99960  3.10     0.73  10.50000   5.386
 19      6.9   0.450       0.11  2.40    0.043        6.0        12.0  0.99354  3.30     0.65  11.40000   6.065
 20     11.4   0.260       0.44  3.60    0.071        6.0        19.0  0.99860  3.12     0.82   9.30000   5.862
 21     11.6   0.475       0.40  1.40    0.091        6.0        28.0  0.99704  3.07     0.65  10.03333   6.102
 22      6.9   0.580       0.01  1.90    0.080       40.0        54.0  0.99683  3.40     0.73   9.70000   5.378
 23      7.5   0.610       0.26  1.90    0.073       24.0        88.0  0.99612  3.30     0.53   9.80000   4.651
 24      8.8   0.600       0.29  2.20    0.098        5.0        15.0  0.99880  3.36     0.49   9.10000   4.187
 25      9.4   0.500       0.34  3.60    0.082        5.0        14.0  0.99870  3.29     0.52  10.70000   5.947
 26      8.0   0.180       0.37  0.90    0.049       36.0       109.0  0.99007  2.89     0.44  12.70000   6.112
 27     12.7   0.600       0.65  2.30    0.063        6.0        25.0  0.99970  3.03     0.57   9.90000   4.679
 28      7.8   0.820       0.29  4.30    0.083       21.0        64.0  0.99642  3.16     0.53   9.40000   4.754
 29      5.3   0.470       0.11  2.20    0.048       16.0        89.0  0.99182  3.54     0.88  13.60000   6.578
 30      7.8   0.500       0.12  1.80    0.178        6.0        21.0  0.99600  3.28     0.87   9.80000   5.217
 31      8.6   0.490       0.29  2.00    0.110       19.0       133.0  0.99720  2.93     1.98   9.80000   5.154
 32      7.4   0.640       0.17  5.40    0.168       52.0        98.0  0.99736  3.28     0.50   9.50000   5.555
 33     12.0   0.380       0.56  2.10    0.093        6.0        24.0  0.99925  3.14     0.71  10.90000   5.391
 34      7.6   0.310       0.34  2.50    0.082       26.0        35.0  0.99356  3.22     0.59  12.50000   6.430
 35      8.5   0.470       0.27  1.90    0.058       18.0        38.0  0.99518  3.16     0.85  11.10000   6.028
 36      7.5   0.630       0.27  2.00    0.083       17.0        91.0  0.99616  3.26     0.58   9.80000   6.162
 37      7.6   0.950       0.03  2.00    0.090        7.0        20.0  0.99590  3.20     0.56   9.60000   4.987
 38      7.5   0.380       0.57  2.30    0.106        5.0        12.0  0.99605  3.36     0.55  11.40000   6.375
 39      8.4   0.310       0.29  3.10    0.194       14.0        26.0  0.99536  3.22     0.78  12.00000   6.614
 40      6.1   0.560       0.00  2.20    0.079        6.0         9.0  0.99480  3.59     0.54  11.50000   6.853
 41      6.8   0.770       0.00  1.80    0.066       34.0        52.0  0.99760  3.62     0.68   9.90000   5.518
 42      7.3   0.450       0.36  5.90    0.074       12.0        87.0  0.99780  3.33     0.83  10.50000   5.042
 43      7.3   0.520       0.32  2.10    0.070       51.0        70.0  0.99418  3.34     0.82  12.90000   6.918
 44      7.5   0.520       0.11  1.50    0.079       11.0        39.0  0.99680  3.42     0.58   9.60000   5.283
 45      7.7   0.775       0.42  1.90    0.092        8.0        86.0  0.99590  3.23     0.59   9.50000   4.888
 46      7.3   0.390       0.31  2.40    0.074        9.0        46.0  0.99620  3.41     0.54   9.40000   5.423
 47      7.2   0.610       0.08  4.00    0.082       26.0       108.0  0.99641  3.25     0.51   9.40000   5.455
 48      5.9   0.610       0.08  2.10    0.071       16.0        24.0  0.99376  3.56     0.77  11.10000   5.953
 49      7.6   0.510       0.24  2.40    0.091        8.0        38.0  0.99800  3.47     0.66   9.60000   6.325
 50     10.4   0.610       0.49  2.10    0.200        5.0        16.0  0.99940  3.16     0.63   8.40000   3.010
 51      7.8   0.390       0.42  2.00    0.086        9.0        21.0  0.99526  3.39     0.66  11.60000   6.194
 52      7.6   0.430       0.29  2.10    0.075       19.0        66.0  0.99718  3.40     0.64   9.50000   4.851
 53     10.1   0.280       0.46  1.80    0.050        5.0        13.0  0.99740  3.04     0.79  10.20000   6.378
 54     11.1   0.310       0.53  2.20    0.060        3.0        10.0  0.99572  3.02     0.83  10.90000   6.889
 55      8.0   0.430       0.36  2.30    0.075       10.0        48.0  0.99760  3.34     0.46   9.40000   4.563
 56      7.9   0.690       0.21  2.10    0.080       33.0       141.0  0.99620  3.25     0.51   9.90000   4.204
 57      6.1   0.210       0.40  1.40    0.066       40.5       165.0  0.99120  3.25     0.59  11.90000   6.636
 58     10.0   0.320       0.59  2.20    0.077        3.0        15.0  0.99940  3.20     0.78   9.60000   4.365
 59      6.8   0.640       0.10  2.10    0.085       18.0       101.0  0.99560  3.34     0.52  10.20000   4.959
 60      8.9   0.565       0.34  3.00    0.093       16.0       112.0  0.99980  3.38     0.61   9.50000   4.302
 61     11.1   0.390       0.54  2.70    0.095       21.0       101.0  1.00010  3.13     0.51   9.50000   5.078
 62      8.9   0.400       0.32  5.60    0.087       10.0        47.0  0.99910  3.38     0.77  10.50000   6.473
 63     10.2   0.290       0.49  2.60    0.059        5.0        13.0  0.99760  3.05     0.74  10.50000   6.385
 64      5.1   0.585       0.00  1.70    0.044       14.0        86.0  0.99264  3.56     0.94  12.90000   7.550
 65      7.4   0.700       0.00  1.90    0.076       11.0        34.0  0.99780  3.51     0.56   9.40000   4.592
 66     12.0   0.370       0.76  4.20    0.066        7.0        38.0  1.00040  3.22     0.60  13.00000   7.451
 67      6.2   0.570       0.10  2.10    0.048        4.0        11.0  0.99448  3.44     0.76  10.80000   6.655
 68      7.4   0.470       0.46  2.20    0.114        7.0        20.0  0.99647  3.32     0.63  10.50000   4.923
 69      6.0   0.540       0.06  1.80    0.050       38.0        89.0  0.99236  3.30     0.50  10.55000   6.225
 70      6.8   0.610       0.20  1.80    0.077       11.0        65.0  0.99710  3.54     0.58   9.30000   5.001
 71      8.3   0.845       0.01  2.20    0.070        5.0        14.0  0.99670  3.32     0.58  11.00000   3.471
 72      8.0   0.180       0.37  0.90    0.049       36.0       109.0  0.99007  2.89     0.44  12.70000   6.275
 73      7.9   0.300       0.68  8.30    0.050       37.5       278.0  0.99316  3.01     0.51  12.30000   7.513
 74      6.6   0.735       0.02  7.90    0.122       68.0       124.0  0.99940  3.47     0.53   9.90000   5.510
 75      7.8   0.520       0.25  1.90    0.081       14.0        38.0  0.99840  3.43     0.65   9.00000   5.389
 76      9.9   0.500       0.50 13.80    0.205       48.0        82.0  1.00242  3.16     0.75   8.80000   5.490
 77     10.0   0.350       0.47  2.00    0.061        6.0        11.0  0.99585  3.23     0.52  12.00000   7.653
 78      9.3   0.270       0.41  2.00    0.091        6.0        16.0  0.99800  3.28     0.70   9.70000   5.386
 79      7.8   0.620       0.05  2.30    0.079        6.0        18.0  0.99735  3.29     0.63   9.30000   5.679
 80      7.7   0.180       0.34  2.70    0.066       15.0        58.0  0.99470  3.37     0.78  11.80000   6.688
 81     11.5   0.180       0.51  4.00    0.104        4.0        23.0  0.99960  3.28     0.97  10.10000   5.239
 82     11.6   0.530       0.66  3.65    0.121        6.0        14.0  0.99780  3.05     0.74  11.50000   6.835
 83      6.4   0.640       0.21  1.80    0.081       14.0        31.0  0.99689  3.59     0.66   9.80000   4.760
 84     11.9   0.390       0.69  2.80    0.095       17.0        35.0  0.99940  3.10     0.61  10.80000   5.708
 85      5.9   0.395       0.13  2.40    0.056       14.0        28.0  0.99362  3.62     0.67  12.40000   6.363
 86     11.2   0.400       0.50  2.00    0.099       19.0        50.0  0.99783  3.10     0.58  10.40000   5.510
 87      8.4   0.520       0.22  2.70    0.084        4.0        18.0  0.99682  3.26     0.57   9.90000   6.249
 88      7.3   0.835       0.03  2.10    0.092       10.0        19.0  0.99660  3.39     0.47   9.60000   4.884
 89     11.4   0.600       0.49  2.70    0.085       10.0        41.0  0.99940  3.15     0.63  10.50000   6.584
 90      7.5   0.580       0.20  2.00    0.073       34.0        44.0  0.99494  3.10     0.43   9.30000   4.933
 91     11.6   0.580       0.66  2.20    0.074       10.0        47.0  1.00080  3.25     0.57   9.00000   3.628
 92     12.5   0.560       0.49  2.40    0.064        5.0        27.0  0.99990  3.08     0.87  10.90000   5.402
 93      6.0   0.490       0.00  2.30    0.068       15.0        33.0  0.99292  3.58     0.59  12.50000   6.668
 94      8.3   0.660       0.15  1.90    0.079       17.0        42.0  0.99720  3.31     0.54   9.60000   6.143
 95     10.9   0.320       0.52  1.80    0.132       17.0        44.0  0.99734  3.28     0.77  11.50000   5.413
 96      6.6   0.630       0.00  4.30    0.093       51.0        77.5  0.99558  3.20     0.45   9.50000   5.038
 97     10.0   0.430       0.33  2.70    0.095       28.0        89.0  0.99840  3.22     0.68  10.00000   5.456
 98      9.3   0.430       0.44  1.90    0.085        9.0        22.0  0.99708  3.28     0.55   9.50000   5.292
 99      7.8   0.430       0.32  2.80    0.080       29.0        58.0  0.99740  3.31     0.64  10.30000   5.119
100      6.1   0.320       0.25  2.30    0.071       23.0        58.0  0.99633  3.42     0.97  10.60000   5.748
101     14.3   0.310       0.74  1.80    0.075        6.0        15.0  1.00080  2.86     0.79   8.40000   5.974
102      7.7   0.600       0.00  2.60    0.055        7.0        13.0  0.99639  3.38     0.56  10.80000   4.317
103      9.0   0.785       0.24  1.70    0.078       10.0        21.0  0.99692  3.29     0.67  10.00000   5.866
104      8.0   0.590       0.16  1.80    0.065        3.0        16.0  0.99620  3.42     0.92  10.50000   6.378
105      8.8   0.450       0.43  1.40    0.076       12.0        21.0  0.99551  3.21     0.75  10.20000   6.389
106      6.9   0.670       0.06  2.10    0.080        8.0        33.0  0.99845  3.68     0.71   9.60000   4.593
107      7.7   0.580       0.01  1.80    0.088       12.0        18.0  0.99568  3.32     0.56  10.50000   6.375
108      7.6   0.780       0.00  1.70    0.076       33.0        45.0  0.99612  3.31     0.62  10.70000   5.166
109      9.1   0.765       0.04  1.60    0.078        4.0        14.0  0.99800  3.29     0.54   9.70000   4.247
110      6.2   0.580       0.00  1.60    0.065        8.0        18.0  0.99660  3.56     0.84   9.40000   4.202
111      8.7   0.310       0.46  1.40    0.059       11.0        25.0  0.99660  3.36     0.76  10.10000   6.041
112      8.9   0.500       0.21  2.20    0.088       21.0        39.0  0.99692  3.33     0.83  11.10000   6.310
113     10.2   0.420       0.57  3.40    0.070        4.0        10.0  0.99710  3.04     0.63   9.60000   5.257
114      6.8   0.640       0.03  2.30    0.075       14.0        31.0  0.99545  3.36     0.58  10.40000   5.846
115      9.9   0.720       0.55  1.70    0.136       24.0        52.0  0.99752  3.35     0.94  10.00000   5.334
116     14.3   1.450       0.80  0.90    0.200       67.8       251.2  1.00010  3.68     1.99  13.60000   2.858  

 ;

proc corr data=example;
run;
title 'Spearman Correlation';
proc corr data=example spearman;
run;
 


 generate diagnostics
 PROC REG DATA=example; 
 MODEL Quality=FixAcid VolAcid CitricAcid Sugar Chloride FreeSulfur TotalSulfur  Density    pH Sulphate   Alcohol / P CLM CLI; 
 OUTPUT OUT=diagnostics 
 RESIDUAL = resid 
 PREDICTED = fitted; 
 RUN;


 PROC REG DATA=example;
  fullmodel: MODEL Quality=FixAcid VolAcid CitricAcid Sugar Chloride FreeSulfur TotalSulfur  Density    pH Sulphate   Alcohol  / VIF;
  forward:   MODEL Quality=FixAcid VolAcid CitricAcid Sugar Chloride FreeSulfur TotalSulfur  Density    pH Sulphate   Alcohol / R INFLUENCE VIF SELECTION=FORWARD  DETAILS=SUMMARY;
  backward:  MODEL Quality=FixAcid VolAcid CitricAcid Sugar Chloride FreeSulfur TotalSulfur  Density    pH Sulphate   Alcohol / R INFLUENCE VIF SELECTION=BACKWARD DETAILS=SUMMARY;
/*   stepwise:  MODEL Quality=FixAcid VolAcid CitricAcid Sugar Chloride FreeSulfur TotalSulfur  Density    pH Sulphate   Alcohol / VIF SELECTION=STEPWISE DETAILS=SUMMARY; */
/*   AdjR2:    MODEL Quality=FixAcid VolAcid CitricAcid Sugar Chloride FreeSulfur TotalSulfur  Density    pH Sulphate   Alcohol  / VIF SELECTION=ADJRSQ   DETAILS=SUMMARY BEST=6 AIC SBC ADJRSQ; */
/*   MallowsCp: MODEL Quality=FixAcid VolAcid CitricAcid Sugar Chloride FreeSulfur TotalSulfur  Density    pH Sulphate   Alcohol  / VIF SELECTION=CP       DETAILS=SUMMARY BEST=6 AIC SBC ADJRSQ; */
 RUN;