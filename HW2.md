-   1.  

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

-   1.  

<!-- -->

    ## [1] 61123.43

    ## [1] 53746.07

    ## [1] 50046.41 63922.73 59001.18 64722.18 55971.82

    ## [1] 58732.86

    ## [1] 2701.448

    ## [1] 65998.64

    ## [1] 65998.64 65998.64 65998.64 65998.64 65998.64

    ## [1] 65998.64

    ## [1] 0

-   The linear model has rmse = 58667.24 while KNN has rmse = 66285.21.
    So linear model seems to do better at achieving lower out-of-sample
    mean-squared error. So the local taxing authority can use this model
    to predict market values. Another good thing for linear model is
    that we can see the t-statistics for each variables and see which
    variables are statistically significant.

-   1.  

<!-- -->

    ##         (Intercept)            duration              amount         installment 
    ##               -0.58                0.02                0.00                0.20 
    ##                 age         historypoor     historyterrible          purposeedu 
    ##               -0.02               -1.06               -2.03                0.94 
    ## purposegoods/repair       purposenewcar      purposeusedcar       foreigngerman 
    ##                0.24                0.81               -0.49               -1.69

    ##    yhat
    ## y     0   1
    ##   0 130  13
    ##   1  36  21

![](HW2_files/figure-markdown_github/unnamed-chunk-9-1.png) \* We find
that having terrible history has lower probability of default than
having good or poor history which is not intuitive. The issue with this
data set is that it is not a random sample, rather it oversamples
defaults. So there are “too many” defaults relative to the good ones.
Therefore, this data set is not appropriate for building a predictive
model of defaults. The bank should use random sample.

-   1.  

|             |      rmse |
|:------------|----------:|
| small model | 3.1201358 |
| big model   | 0.2333589 |
| best model  | 0.2331168 |

-   rmse for big model and best model are almost identical. While rmse
    for small model is a lot larger.

<!-- -->

    ## # A tibble: 1 x 3
    ##   model      true_pos_rate false_pos_rate
    ##   <chr>              <dbl>          <dbl>
    ## 1 best hotel         0.920          0.472

![](HW2_files/figure-markdown_github/unnamed-chunk-14-1.png)

    ##        expected actual difference
    ## Fold01 22.54486 17     -5        
    ## Fold02 18.98165 22     4         
    ## Fold03 19.36531 19     0         
    ## Fold04 21.6433  26     5         
    ## Fold05 19.48472 22     3         
    ## Fold06 24.17079 24     0         
    ## Fold07 23.65501 26     3         
    ## Fold08 16.8548  12     -4        
    ## Fold09 19.57497 21     2         
    ## Fold10 20.06392 16     -4        
    ## Fold11 22.27097 17     -5        
    ## Fold12 23.81236 30     7         
    ## Fold13 21.25983 16     -5        
    ## Fold14 22.48995 22     0         
    ## Fold15 20.35356 18     -2        
    ## Fold16 20.67369 14     -6        
    ## Fold17 21.85174 16     -5        
    ## Fold18 24.25534 26     2         
    ## Fold19 20.04448 24     4         
    ## Fold20 19.08572 14     -5
