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

    ## [1] 62429.63

    ## [1] 56260.38

    ## [1] 54962.86 63113.85 56724.86 61696.41 56823.13

    ## [1] 58664.22

    ## [1] 1578.672

    ## [1] 66168.8

    ## [1] 66168.8 66168.8 66168.8 66168.8 66168.8

    ## [1] 66168.8

    ## [1] 0

-   The linear model has rmse = 58667.24 while KNN has rmse = 66285.21.
    So linear model seems to do better at achieving lower out-of-sample
    mean-squared error. So the local taxing authority can use this model
    to predict market values. Another good thing for linear model is
    that we can see the t-statistics for each variables and see which
    variables are statistically significant.

## Problem 3: Classification and retrospective sampling

    ##         (Intercept)            duration              amount         installment 
    ##               -0.47                0.02                0.00                0.18 
    ##                 age         historypoor     historyterrible          purposeedu 
    ##               -0.02               -1.12               -1.93                0.69 
    ## purposegoods/repair       purposenewcar      purposeusedcar       foreigngerman 
    ##               -0.05                0.90               -0.86               -1.07

    ##    yhat
    ## y     0   1
    ##   0 133  11
    ##   1  39  17

    ##    history default_prob_each_history
    ## 1 terrible                 0.1706485
    ## 2     poor                 0.3187702
    ## 3     good                 0.5955056

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
| small model | 3.1208586 |
| big model   | 0.2332731 |
| best model  | 0.2330139 |

-   rmse for big model and best model are almost identical. While rmse
    for small model is a lot larger.

<!-- -->

    ## # A tibble: 1 x 3
    ##   model      true_pos_rate false_pos_rate
    ##   <chr>              <dbl>          <dbl>
    ## 1 best hotel         0.913          0.459

![](HW2_files/figure-markdown_github/unnamed-chunk-14-1.png)

    ##        expected actual difference
    ## Fold01 24.83135 23     -1        
    ## Fold02 17.21128 22     5         
    ## Fold03 20.70848 20     0         
    ## Fold04 21.22225 23     2         
    ## Fold05 16.99855 15     -1        
    ## Fold06 24.85438 20     -4        
    ## Fold07 21.33337 18     -3        
    ## Fold08 22.71525 27     5         
    ## Fold09 20.99187 22     2         
    ## Fold10 16.89263 21     5         
    ## Fold11 22.38434 20     -2        
    ## Fold12 20.28594 21     1         
    ## Fold13 17.83574 16     -1        
    ## Fold14 23.07862 20     -3        
    ## Fold15 18.83313 14     -4        
    ## Fold16 25.52639 28     3         
    ## Fold17 22.89701 23     1         
    ## Fold18 20.90121 18     -2        
    ## Fold19 21.18726 14     -7        
    ## Fold20 21.73912 17     -4
