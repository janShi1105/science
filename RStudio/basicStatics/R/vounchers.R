library(experimentdatar)
data("vouchers")

formula_x_base <- 'VOUCH0'
formula_x_covariate <- "SVY + HSVISIT + AGE + STRATA1 + STRATA2 + STRATA3 + STRATA4 + STRATA5 + STRATA6 + STRATAMS + D1993 + D1995 + D1997 + DMONTH1 +DMONTH2+DMONTH3+DMONTH4+DMONTH5+DMONTH6+DMONTH7+DMONTH8+DMONTH9+DMONTH10+DMONTH11 +DMONTH12 + SEX2"

formula_y <- c('TOTSCYRS', 'INSCHL', 'PRSCH_C', 'USNGSCH', "PESCHA_1", 'FINISH6', 'FINISH7', "FINISH8", 'REPT6', 'REPT', 'NREPT', 'MARRIED', 'HASCHILD', 'HOURSUM', 'WORKING3')

base_reg_formula <- paste(formula_y, '~', formula_x_base)
names(base_reg_formula) <- paste(formula_y, 'base', sep='_')

covariate_reg_formula <- paste(
  formula_y, '~', formula_x_base, '+', formula_x_covariate)
names(covariate_reg_formula) <- paste(formula_y, 'covariate', sep='_')

table3_formula <- c(base_reg_formula, covariate_reg_formula)

models <- table3_formula %>%
  enframe(name = 'model_index', value = 'formula')

regression_data <- vouchers %>% filter(TAB3SMPL ==1, BOG95SMP == 1)

f_models <- models %>%
  mutate(model = map(.x = formula, .f = lm, data = regression_data)) %>%
  mutate(lm_result = map(.x = model, .f = tidy))

df_results <- df_models %>%
  mutate(formula = as.character(formula)) %>%
  select(formula, model_index, lm_result) %>%
  unnest(cols = c(lm_result))
