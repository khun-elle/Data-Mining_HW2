library(readr)
library(dplyr)
library(ggplot2)

#QUESTION 1
capmetro_UT <- read_csv("/Users/jirapat/Desktop/R/Data Mining/capmetro_UT.csv")

# Recode the categorical variables in sensible, rather than alphabetical, order
capmetro_UT <- mutate(capmetro_UT, day_of_week = factor(day_of_week, levels=c("Mon", "Tue", "Wed","Thu", "Fri", "Sat", "Sun")), month = factor(month, levels=c("Sep", "Oct","Nov")))

ave_boardings <- capmetro_UT %>% group_by(hour_of_day, day_of_week, month) %>% summarise(average_boardings = mean(boarding))

#average boarding by hour of day faceted by day of week
ggplot(ave_boardings, aes(x = hour_of_day, y = average_boardings, color = month)) + geom_line() + facet_wrap(vars(day_of_week))

#boarding by temperature faceted by hour of day
ggplot(capmetro_UT, aes(x = temperature, y = boarding)) + geom_point(aes(color = weekend)) + facet_wrap(vars(hour_of_day))


#QUESTION 2
library(tidyverse)
library(modelr)
library(rsample)  # for creating train/test splits
library(mosaic)
library(broom)
library(ggplot2)
library(caret)
library(parallel)
library(foreach)
data(SaratogaHouses)

#split into training and testing sets
saratoga_split <- initial_split(SaratogaHouses, prop = 0.8)
saratoga_train <- training(saratoga_split)
saratoga_test <- testing(saratoga_split)

#medium model in class
lm2 <- lm(price ~ . - pctCollege - sewer - waterfront - landValue - newConstruction, data=saratoga_train)

rmse(lm2, saratoga_test)

#best linear model
lm_best <- lm(price ~ lotSize + landValue + livingArea + bedrooms + bathrooms + rooms + waterfront + newConstruction + centralAir, data = saratoga_train)

rmse(lm_best, saratoga_test)

#cross validation for best linear model
K_folds <- 5

SaratogaHouses <- SaratogaHouses %>% mutate(fold_id = rep(1:K_folds, length=nrow(SaratogaHouses)) %>% sample)

#now loop over folds
rmse_cv <- foreach(fold = 1:K_folds, .combine='c') %do% {
    lm_best = lm(price ~ lotSize + landValue + livingArea + bedrooms + bathrooms + rooms + waterfront + newConstruction + centralAir,
                 data = filter(SaratogaHouses, fold_id != fold))
    modelr::rmse(lm_best, data = filter(SaratogaHouses, fold_id == fold))
}

rmse_cv
mean(rmse_cv)  # mean CV error
sd(rmse_cv)/sqrt(K_folds)   # approximate standard error of CV error

#best KNN.
#construct the training and test-set feature matrices
Xtrain <- model.matrix(~ lotSize + landValue + livingArea + bedrooms + bathrooms + rooms + waterfront + newConstruction + centralAir + rooms:bathrooms -1, data = saratoga_train)
Xtest <- model.matrix(~ lotSize + landValue + livingArea + bedrooms + bathrooms + rooms + waterfront + newConstruction + centralAir + rooms:bathrooms -1, data = saratoga_test)

#training and testing set responses
ytrain <- saratoga_train$price
ytest <- saratoga_test$price

#now rescale
scale_train <- apply(Xtrain, 2, sd)
Xtilde_train <- scale(Xtrain, scale = scale_train)
Xtilde_test <- scale(Xtest, scale = scale_train)

#apply knn
knn_saratoga <- knnreg(ytrain ~ Xtilde_train, data = saratoga_train, k = 100)
rmse(knn_saratoga, saratoga_test)

#cross validation for knn_saratoga
K_folds <- 5
SaratogaHouses = SaratogaHouses %>%
    mutate(fold_id = rep(1:K_folds, length = nrow(SaratogaHouses)) %>% sample)

# now loop over folds
rmse_cv2 = foreach(fold = 1:K_folds, .combine='c') %do% {
    knn_saratoga = knnreg(ytrain ~ Xtilde_train,
                          data = filter(SaratogaHouses, fold_id != fold), k = 100)
    modelr::rmse(knn_saratoga, data = filter(SaratogaHouses, fold_id == fold))
}

rmse_cv2
mean(rmse_cv2)  # mean CV error
sd(rmse_cv2)/sqrt(K_folds)   # approximate standard error of CV error

#QUESTION 3
german_credit <- read_csv("/Users/jirapat/Desktop/R/Data Mining/german_credit.csv")

#logit
mdl_german_credit <- glm(Default ~ duration + amount + installment + age + history + purpose + foreign, data = german_credit, family = binomial)

coef(mdl_german_credit) %>% round(2)

#default probability by credit history

prob_default <- xtabs(~history + Default, data = german_credit) %>% prop.table %>% round(3)

history <- c("good","poor","terrible")

default_prob_each_history <- c(5.3, 19.7, 5.0) #good has default prob of 5.3%

table <- tibble(history = history, default_prob_each_history = default_prob_each_history)

#bar graph
ggplot(table, aes(x = history, y = default_prob_each_history, color = history)) + geom_col() + labs(x = "History", y = "Default Probability", fill = "History")

#QUESTION 4
hotel_dev <- read_csv("/Users/jirapat/Desktop/R/Data Mining/hotels_dev.csv")
hotel_val <- read_csv("/Users/jirapat/Desktop/R/Data Mining/hotels_val.csv")
colnames(hotel_dev)

#model building
hotel_dev_split <- initial_split(hotel_dev, prop = 0.8)
hotel_dev_train <- training(hotel_dev_split)
hotel_dev_test <- testing(hotel_dev_split)

#small model
hotel1 <- lm(children ~ market_segment + adults + customer_type + is_repeated_guest, data = hotel_dev_train)

#cross validation for small model
K_folds <- 5
hotel_dev = hotel_dev %>%
    mutate(fold_id = rep(1:K_folds, length = nrow(hotel_dev)) %>% sample)

# now loop over folds
rmse_cv3 = foreach(fold = 1:K_folds, .combine='c') %do% {
    hotel1 = glm(children ~ market_segment + adults + customer_type + is_repeated_guest, data = filter(hotel_dev, fold_id != fold))
    modelr::rmse(hotel1, data = filter(hotel_dev, fold_id == fold))
}

rmse_cv3
mean(rmse_cv3)  # mean CV error
sd(rmse_cv3)/sqrt(K_folds)   # approximate standard error of CV error

#big model
hotel2 <- lm(children ~ . - arrival_date, data = hotel_dev_train)

#cross validation for big model
K_folds <- 5
hotel_dev = hotel_dev %>%
    mutate(fold_id = rep(1:K_folds, length = nrow(hotel_dev)) %>% sample)

# now loop over folds
rmse_cv4 = foreach(fold = 1:K_folds, .combine='c') %do% {
    hotel2 = lm(children ~ . - arrival_date, data = filter(hotel_dev, fold_id != fold))
    modelr::rmse(hotel2, data = filter(hotel_dev, fold_id == fold))
}

rmse_cv4
mean(rmse_cv4)  # mean CV error
sd(rmse_cv4)/sqrt(K_folds)   # approximate standard error of CV error

#best linear model
best_hotel <- lm(children ~ . -arrival_date - days_in_waiting_list - required_car_parking_spaces + average_daily_rate:total_of_special_requests + is_repeated_guest:total_of_special_requests + is_repeated_guest:average_daily_rate, data = hotel_dev_train)

#cross validation for best model
K_folds <- 5
hotel_dev = hotel_dev %>%
    mutate(fold_id = rep(1:K_folds, length = nrow(hotel_dev)) %>% sample)

# now loop over folds
rmse_cv5 = foreach(fold = 1:K_folds, .combine='c') %do% {
    best_hotel = lm(children ~ . -arrival_date - days_in_waiting_list - required_car_parking_spaces + average_daily_rate:total_of_special_requests + is_repeated_guest:total_of_special_requests + is_repeated_guest:average_daily_rate, data = filter(hotel_dev, fold_id != fold))
    modelr::rmse(best_hotel, data = filter(hotel_dev, fold_id == fold))
}

rmse_cv5
mean(rmse_cv5)  # mean CV error
sd(rmse_cv5)/sqrt(K_folds) 

#model validation: step 2
library("purrr")
K_folds <- 20

cv_hotel <- crossv_kfold(hotel_val, k=K_folds)
hotel_part_1 <- map(cv_hotel$test, ~ predict(hotel2, data= ., type='response'))






#note 3: knn standardize
#note 4: logit, confusion matrix, knn(glass ex.)
#note 5: AIC, saratoga_step.R, Lasso (scale data first), AICc and the CV error