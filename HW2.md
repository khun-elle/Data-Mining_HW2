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

    ## [1] 69418.13

    ## [1] 60099.76

    ## [1] 60290.33 59130.68 64343.39 56095.10 53259.22

    ## [1] 58623.74

    ## [1] 1883.097

    ## [1] 65246.68

    ## [1] 65246.68 65246.68 65246.68 65246.68 65246.68

    ## [1] 65246.68

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
    ##               -0.54                0.02                0.00                0.21 
    ##                 age         historypoor     historyterrible          purposeedu 
    ##               -0.02               -1.09               -1.93                0.67 
    ## purposegoods/repair       purposenewcar      purposeusedcar       foreigngerman 
    ##                0.06                0.87               -0.80               -1.83

    ##    yhat
    ## y     0   1
    ##   0 129  11
    ##   1  45  15

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
| small model | 3.1194949 |
| big model   | 0.2333092 |
| best model  | 0.2330560 |

-   rmse for big model and best model are almost identical. While rmse
    for small model is a lot larger.

<!-- -->

    ## # A tibble: 1 x 3
    ##   model      true_pos_rate false_pos_rate
    ##   <chr>              <dbl>          <dbl>
    ## 1 best hotel         0.918          0.468

![](HW2_files/figure-markdown_github/unnamed-chunk-14-1.png)

    ##        expected actual difference
    ## Fold01 20.47608 19     -1        
    ## Fold02 16.58915 10     -6        
    ## Fold03 25.52985 21     -4        
    ## Fold04 21.82633 25     4         
    ## Fold05 18.27001 17     -1        
    ## Fold06 23.61842 21     -2        
    ## Fold07 22.57908 31     9         
    ## Fold08 23.52761 19     -4        
    ## Fold09 17.99617 16     -1        
    ## Fold10 22.84907 22     0         
    ## Fold11 22.39486 18     -4        
    ## Fold12 23.44966 27     4         
    ## Fold13 17.7227  18     1         
    ## Fold14 21.08908 20     -1        
    ## Fold15 24.27265 20     -4        
    ## Fold16 17.01753 15     -2        
    ## Fold17 22.22126 22     0         
    ## Fold18 20.99867 19     -1        
    ## Fold19 17.51489 18     1         
    ## Fold20 22.48377 24     2
