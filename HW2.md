## Problem 1: visualization

![](HW2_files/figure-markdown_github/unnamed-chunk-1-1.png) \* Average
boardings on weekdays show similar patterns. Saturday and Sunday have
significantly less boarding. For Monday through Friday, peak average
boarding happens between 3pm to 5pm. This could be because many college
students left campus around that time. Average boardings on Mondays in
September is lower than Mondays in other months because 1st Monday of
September is Labor day which we can expect fewer people riding the buses
so this day pulls the average down. Average boardings on Weds/Thurs/Fri
in November look lower could be due to Thanksgiving holiday so there is
less people riding the buses to and from UT.

![](HW2_files/figure-markdown_github/unnamed-chunk-2-1.png) \* The plot
shows boarding by temperature faceted by hour of day and colored by
whether it is a weekday or a weekend. We see that ridership is high on
weekday during 1pm. to 5pm. This is because the temperature is
especially high during that period of time so more people might decide
to take buses instead of walking. When holding hour of day and weekend
status constant, temperature seem not to have a noticeable effect on
number of UT students riding the bus and the ridership remains low
compared to weekday.

## Problem 2: Saratoga house prices

    ## [1] 59672.64

    ## [1] 52804.29

    ## [1] 61775.84 52349.51 64620.32 58118.20 56069.33

    ## [1] 58586.64

    ## [1] 2145.163

    ## [1] 67153.18

    ## [1] 67153.18 67153.18 67153.18 67153.18 67153.18

    ## [1] 67153.18

    ## [1] 0

-   The linear model has rmse = 58667.24 while KNN has rmse = 66285.21.
    So linear model seems to do better at achieving lower out-of-sample
    mean-squared error. So the local taxing authority can use this model
    to predict market values. Another good thing for linear model is
    that we can see the t-statistics for each variables and see which
    variables are statistically significant.

## Problem 3: Classification and retrospective sampling

    ##         (Intercept)            duration              amount         installment 
    ##               -0.46                0.03                0.00                0.18 
    ##                 age         historypoor     historyterrible          purposeedu 
    ##               -0.02               -1.11               -1.85                0.74 
    ## purposegoods/repair       purposenewcar      purposeusedcar       foreigngerman 
    ##                0.05                0.87               -0.74               -1.34

    ##    yhat
    ## y     0   1
    ##   0 127  13
    ##   1  42  18

![](HW2_files/figure-markdown_github/unnamed-chunk-9-1.png) \* We find
that having terrible history has lower probability of default than
having good or poor history which is not intuitive. The issue with this
data set is that it is not a random sample, rather it oversamples
defaults. So there are “too many” defaults relative to the good ones.
Therefore, this data set is not appropriate for building a predictive
model of defaults. The bank should use random sample.

## Problem 4: Children and hotel reservations

|             |      rmse |
|:------------|----------:|
| small model | 3.1199363 |
| big model   | 0.2333702 |
| best model  | 0.2331322 |

-   rmse for big model and best model are almost identical. While rmse
    for small model is a lot larger.

<!-- -->

    ## # A tibble: 1 x 3
    ##   model      true_pos_rate false_pos_rate
    ##   <chr>              <dbl>          <dbl>
    ## 1 best hotel         0.915          0.466

![](HW2_files/figure-markdown_github/unnamed-chunk-14-1.png)

    ##        expected actual difference
    ## Fold01 21.68983 23     2         
    ## Fold02 18.36557 11     -7        
    ## Fold03 21.02109 18     -3        
    ## Fold04 20.72888 21     1         
    ## Fold05 20.75398 23     3         
    ## Fold06 24.50177 26     2         
    ## Fold07 21.83382 21     0         
    ## Fold08 22.79942 21     -1        
    ## Fold09 18.24368 20     2         
    ## Fold10 18.80703 22     4         
    ## Fold11 22.39199 17     -5        
    ## Fold12 24.66766 20     -4        
    ## Fold13 22.56924 23     1         
    ## Fold14 22.30824 26     4         
    ## Fold15 22.23326 17     -5        
    ## Fold16 22.1752  25     3         
    ## Fold17 18.73235 16     -2        
    ## Fold18 19.46863 17     -2        
    ## Fold19 18.86198 19     1         
    ## Fold20 20.34668 16     -4
