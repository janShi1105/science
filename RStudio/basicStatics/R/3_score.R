set.seed(1)

train_flag <- sample(NROW(male_df), NROW(male_df)/2, replace= FALSE)

male_df_train <- male_df[train_flag,] %>%
  filter(treatment ==0 )
male_df_test <- male_df[-train_flag, ]

predict_model <- glm(
  data = male_df_train,
  formula = conversion ~ recency + history_segment + channel + zip_code,
  family = binomial
)

pred_cv <- predict(predict_model, newdata = male_df_test, type = 'response')
pred_cv_rank <- percent_rank(pred_cv)

mail_assign <- sapply(pred_cv_rank, rbinom, n=1, size=1)

ml_male_df <- male_df_test %>%
  mutate(mail_assign = mail_assign,
         ps = pred_cv_rank) %>%
  filter((treatment == 1 & mail_assign == 1) |
           (treatment == 0 & mail_assign == 0))

rct_male_lm <- lm(data = male_df_test, formula = spend ~ treatment) %>%
  tidy()

ml_male_lm <- lm(data = ml_male_df, formula = spend ~ treatment) %>%
  tidy()

PSM_result <- Match(Y = ml_male_df$spend, Tr = ml_male_df$treatment,
                    X=ml_male_df$ps, estimand = 'ATT')

W.out <- weightit(treatment ~ recency + history_segment + channel + zip_code,
                  data = ml_male_df,
                  ps = ml_male_df$ps,
                  method = 'ps',
                  estimand = 'ATE')

IPW_result <- ml_male_df %>%
  lm(data = .,
     spend ~ treatment,
     weights = W.out$weights) %>%
  tidy()
