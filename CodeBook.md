---
title: "CodeBook"
author: "CX"
date: "07/19/2014"
output: html_document
---

```r
setwd('/Users/xc/datasciencecoursera/GetClean_Assign1')
my_data <- read.table('./ave_data.txt')
head(my_data, 3)
```

```
##   subject             labels tBodyAcc.mean...X tBodyAcc.mean...Y
## 1       1            WALKING            0.2773         -0.017384
## 2       1   WALKING_UPSTAIRS            0.2555         -0.023953
## 3       1 WALKING_DOWNSTAIRS            0.2892         -0.009919
##   tBodyAcc.mean...Z tGravityAcc.mean...X tGravityAcc.mean...Y
## 1           -0.1111               0.9352              -0.2822
## 2           -0.0973               0.8934              -0.3622
## 3           -0.1076               0.9319              -0.2666
##   tGravityAcc.mean...Z tBodyAccJerk.mean...X tBodyAccJerk.mean...Y
## 1             -0.06810               0.07404               0.02827
## 2             -0.07540               0.10137               0.01949
## 3             -0.06212               0.05416               0.02965
##   tBodyAccJerk.mean...Z tBodyGyro.mean...X tBodyGyro.mean...Y
## 1             -0.004168           -0.04183           -0.06953
## 2             -0.045563            0.05055           -0.16617
## 3             -0.010972           -0.03508           -0.09094
##   tBodyGyro.mean...Z tBodyGyroJerk.mean...X tBodyGyroJerk.mean...Y
## 1            0.08494               -0.09000               -0.03984
## 2            0.05836               -0.12223               -0.04215
## 3            0.09009               -0.07396               -0.04399
##   tBodyGyroJerk.mean...Z tBodyAccMag.mean.. tGravityAccMag.mean..
## 1               -0.04613           -0.13697              -0.13697
## 2               -0.04071           -0.12993              -0.12993
## 3               -0.02705            0.02719               0.02719
##   tBodyAccJerkMag.mean.. tBodyGyroMag.mean.. tBodyGyroJerkMag.mean..
## 1               -0.14143            -0.16098                 -0.2987
## 2               -0.46650            -0.12674                 -0.5949
## 3               -0.08945            -0.07574                 -0.2955
##   fBodyAcc.mean...X fBodyAcc.mean...Y fBodyAcc.mean...Z
## 1          -0.20279           0.08971           -0.3316
## 2          -0.40432          -0.19098           -0.4333
## 3           0.03823           0.00155           -0.2256
##   fBodyAccJerk.mean...X fBodyAccJerk.mean...Y fBodyAccJerk.mean...Z
## 1              -0.17055              -0.03523               -0.4690
## 2              -0.47988              -0.41344               -0.6855
## 3              -0.02766              -0.12867               -0.2883
##   fBodyGyro.mean...X fBodyGyro.mean...Y fBodyGyro.mean...Z
## 1            -0.3390            -0.1031           -0.25594
## 2            -0.4926            -0.3195           -0.45360
## 3            -0.3524            -0.0557           -0.03187
##   fBodyAccMag.mean.. fBodyBodyAccJerkMag.mean.. fBodyBodyGyroMag.mean..
## 1           -0.12862                   -0.05712                 -0.1993
## 2           -0.35240                   -0.44265                 -0.3260
## 3            0.09658                    0.02622                 -0.1857
##   fBodyBodyGyroJerkMag.mean.. tBodyAcc.std...X tBodyAcc.std...Y
## 1                     -0.3193         -0.28374          0.11446
## 2                     -0.6347         -0.35471         -0.00232
## 3                     -0.2820          0.03004         -0.03194
##   tBodyAcc.std...Z tGravityAcc.std...X tGravityAcc.std...Y
## 1         -0.26003             -0.9766             -0.9713
## 2         -0.01948             -0.9564             -0.9528
## 3         -0.23043             -0.9506             -0.9370
##   tGravityAcc.std...Z tBodyAccJerk.std...X tBodyAccJerk.std...Y
## 1             -0.9477             -0.11362               0.0670
## 2             -0.9124             -0.44684              -0.3783
## 3             -0.8959             -0.01228              -0.1016
##   tBodyAccJerk.std...Z tBodyGyro.std...X tBodyGyro.std...Y
## 1              -0.5027           -0.4735         -0.054608
## 2              -0.7066           -0.5449          0.004105
## 3              -0.3457           -0.4580         -0.126349
##   tBodyGyro.std...Z tBodyGyroJerk.std...X tBodyGyroJerk.std...Y
## 1           -0.3443               -0.2074               -0.3045
## 2           -0.5072               -0.6148               -0.6017
## 3           -0.1247               -0.4870               -0.2388
##   tBodyGyroJerk.std...Z tBodyAccMag.std.. tGravityAccMag.std..
## 1               -0.4043          -0.21969             -0.21969
## 2               -0.6063          -0.32497             -0.32497
## 3               -0.2688           0.01988              0.01988
##   tBodyAccJerkMag.std.. tBodyGyroMag.std.. tBodyGyroJerkMag.std..
## 1              -0.07447            -0.1870                -0.3253
## 2              -0.47899            -0.1486                -0.6486
## 3              -0.02579            -0.2257                -0.3065
##   fBodyAcc.std...X fBodyAcc.std...Y fBodyAcc.std...Z fBodyAccJerk.std...X
## 1         -0.31913          0.05604         -0.27969             -0.13359
## 2         -0.33743          0.02177          0.08596             -0.46191
## 3          0.02433         -0.11296         -0.29793             -0.08633
##   fBodyAccJerk.std...Y fBodyAccJerk.std...Z fBodyGyro.std...X
## 1               0.1067              -0.5347           -0.5167
## 2              -0.3818              -0.7260           -0.5659
## 3              -0.1346              -0.4017           -0.4954
##   fBodyGyro.std...Y fBodyGyro.std...Z fBodyAccMag.std..
## 1          -0.03351           -0.4366           -0.3980
## 2           0.15154           -0.5717           -0.4163
## 3          -0.18141           -0.2384           -0.1865
##   fBodyBodyAccJerkMag.std.. fBodyBodyGyroMag.std..
## 1                   -0.1035                -0.3210
## 2                   -0.5331                -0.1830
## 3                   -0.1041                -0.3984
##   fBodyBodyGyroJerkMag.std..
## 1                    -0.3816
## 2                    -0.6939
## 3                    -0.3919
```

This data set is based on the data set created through steps 1-4, in the assignment. The data set is created by merging train and test data, then extracting all the mean and standard deviation columns, and then calculating the average of these variables across all subjects and activities.

The first two columns are 'subject' and 'labels', which shows on which subject and which activity the average of other variables are calculated. 

```r
head(my_data[, 1:2])
```

```
##   subject             labels
## 1       1            WALKING
## 2       1   WALKING_UPSTAIRS
## 3       1 WALKING_DOWNSTAIRS
## 4       1            SITTING
## 5       1           STANDING
## 6       1             LAYING
```

```r
tail(my_data[, 1:2])
```

```
##     subject             labels
## 175      30            WALKING
## 176      30   WALKING_UPSTAIRS
## 177      30 WALKING_DOWNSTAIRS
## 178      30            SITTING
## 179      30           STANDING
## 180      30             LAYING
```

The rest 66 variables are the average of the mean and std we previously extracted from the original data set, these average are calculated across different subject and activity combination. 

```r
names(my_data)[3:68]
```

```
##  [1] "tBodyAcc.mean...X"           "tBodyAcc.mean...Y"          
##  [3] "tBodyAcc.mean...Z"           "tGravityAcc.mean...X"       
##  [5] "tGravityAcc.mean...Y"        "tGravityAcc.mean...Z"       
##  [7] "tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"      
##  [9] "tBodyAccJerk.mean...Z"       "tBodyGyro.mean...X"         
## [11] "tBodyGyro.mean...Y"          "tBodyGyro.mean...Z"         
## [13] "tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"     
## [15] "tBodyGyroJerk.mean...Z"      "tBodyAccMag.mean.."         
## [17] "tGravityAccMag.mean.."       "tBodyAccJerkMag.mean.."     
## [19] "tBodyGyroMag.mean.."         "tBodyGyroJerkMag.mean.."    
## [21] "fBodyAcc.mean...X"           "fBodyAcc.mean...Y"          
## [23] "fBodyAcc.mean...Z"           "fBodyAccJerk.mean...X"      
## [25] "fBodyAccJerk.mean...Y"       "fBodyAccJerk.mean...Z"      
## [27] "fBodyGyro.mean...X"          "fBodyGyro.mean...Y"         
## [29] "fBodyGyro.mean...Z"          "fBodyAccMag.mean.."         
## [31] "fBodyBodyAccJerkMag.mean.."  "fBodyBodyGyroMag.mean.."    
## [33] "fBodyBodyGyroJerkMag.mean.." "tBodyAcc.std...X"           
## [35] "tBodyAcc.std...Y"            "tBodyAcc.std...Z"           
## [37] "tGravityAcc.std...X"         "tGravityAcc.std...Y"        
## [39] "tGravityAcc.std...Z"         "tBodyAccJerk.std...X"       
## [41] "tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"       
## [43] "tBodyGyro.std...X"           "tBodyGyro.std...Y"          
## [45] "tBodyGyro.std...Z"           "tBodyGyroJerk.std...X"      
## [47] "tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"      
## [49] "tBodyAccMag.std.."           "tGravityAccMag.std.."       
## [51] "tBodyAccJerkMag.std.."       "tBodyGyroMag.std.."         
## [53] "tBodyGyroJerkMag.std.."      "fBodyAcc.std...X"           
## [55] "fBodyAcc.std...Y"            "fBodyAcc.std...Z"           
## [57] "fBodyAccJerk.std...X"        "fBodyAccJerk.std...Y"       
## [59] "fBodyAccJerk.std...Z"        "fBodyGyro.std...X"          
## [61] "fBodyGyro.std...Y"           "fBodyGyro.std...Z"          
## [63] "fBodyAccMag.std.."           "fBodyBodyAccJerkMag.std.."  
## [65] "fBodyBodyGyroMag.std.."      "fBodyBodyGyroJerkMag.std.."
```

More detailed info on these features can be found in 'features_info.txt' in the original data set. Details on how the data set is produced out of the original data can be found in 'README.html'.
