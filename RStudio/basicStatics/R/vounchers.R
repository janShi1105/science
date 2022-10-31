library(experimentdatar)
data("vouchers")

formula_x_base <- 'VOUCH0'
formula_x_covariate <- "SVY + HSVISIT + AGE + STRATA1 + STRATA2 + STRATA3 + STRATA4 + STRATA5 + STRATA6 + STRATAMS + D1993 + D1995 + D1997 + DMONTH1 +DMONTH2+DMONTH3+DMONTH4+DMONTH5+DMONTH6+DMONTH7+DMONTH8+DMONTH9+DMONTH10+DMONTH11 +DMONTH12 + SEX2"

formula_y <- c('TOTSCYRS', 'INSCHL', 'PRSCH_C', 'USNGSCH', "PRSCHA_1", 'FINISH6', 'FINISH7', "FINISH8", 'REPT6', 'REPT', 'NREPT', 'MARRIED', 'HASCHILD', 'HOURSUM', 'WORKING3')

base_reg_formula <- paste(formula_y, '~', formula_x_base)
names(base_reg_formula) <- paste(formula_y, 'base', sep='_')

covariate_reg_formula <- paste(
  formula_y, '~', formula_x_base, '+', formula_x_covariate)
names(covariate_reg_formula) <- paste(formula_y, 'covariate', sep='_')

table3_formula <- c(base_reg_formula, covariate_reg_formula)

models <- table3_formula %>%
  enframe(name = 'model_index', value = 'formula')

regression_data <- vouchers %>% filter(TAB3SMPL ==1, BOG95SMP == 1)

df_models <- models %>%
  mutate(model = map(.x = formula, .f = lm, data = regression_data)) %>%
  mutate(lm_result = map(.x = model, .f = tidy))

df_results <- df_models %>%
  mutate(formula = as.character(formula)) %>%
  select(formula, model_index, lm_result) %>%
  unnest(cols = c(lm_result))

using_voucher_results <- df_results %>%
  filter(term == 'VOUCH0', str_detect(model_index, 'PRSCHA_1|USNGSCH')) %>%
  select(model_index, term, estimate, std.error, p.value) %>%
  arrange(model_index)

data_tbl4_bog95 <- vouchers %>%
  filter(BOG95SMP == 1, TAB3SMPL == 1,
         !is.na(SCYFNSH), !is.na(FINISH6), !is.na(PRSCHA_1), !is.na(RERT6), !is.na(NREPT), !is.na(INSCHL),
         !is.na(FINISH7), !is.na(PRSCH_C), !is.na(FINISH8), !is.na(PRSCHA_2), !is.na(TOTSCYRS), !is.na(REPT)) %>%
  select(VOUCH0, SVY, HSVISIT, DJAMUNDI, PHONE, AGE, STRATA1:STRATA6, STRATAMS, DBOGOTA, D1993, D1995, D1997,
         DMONTH1:DMONTH12, SEX_MISS, FINISH6, FINISH7, FINISH8, REPT6, REPT, NREPT, SEX2, TOTSCYRS, MARRIED,
         HASCHILD, HOURSUM, WORKING3, INSCHL, PRSCH_C, USNGSCH, PRSCHA_1)


