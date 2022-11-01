cps1_nsw_data <- nswdw_data %>%
  filter(treat == 1) %>%
  rbind(cps1_data)

cps3_nsw_data <- nswdw_data %>%
  filter(treat == 1) %>%
  rbind(cps3_data)

nsw_cov <- nswdw_data %>%
  lm(data = .,
     re78 ~ treat + re74 + re75 + age + education + black + hispanic + nodegree + married) %>%
  tidy() %>%
  filter(term == 'treat')

cps1_reg <- cps1_nsw_data %>%
  lm(data = .,
     re78 ~ treat + re74 + re75 + age + education + black + hispanic + nodegree + married) %>%
  tidy() %>%
  filter(term == 'treat')

cps3_reg <- cps3_nsw_data %>%
  lm(data = .,
     re78 ~ treat + re74 + re75 + age + education + black + hispanic + nodegree + married) %>%
  tidy() %>%
  filter(term == 'treat')

m_near <- matchit(treat ~ age + education + black + hispanic + nodegree + married + re74 + re75 + I(re74^2) + I(re75^2),
                  data = cps1_nsw_data,
                  method = 'nearest')

matched_data <- match.data(m_near)

PSM_result_cps1 <- matched_data %>%
  lm(re78 ~ treat, data = .) %>%
  tidy()

weighting <- weightit(treat ~ age + education + black + hispanic + nodegree + married + re74 + re75 + I(re74^2) + I(re75^2),
                      data = cps1_nsw_data,
                      method = 'ps',
                      estimand = 'ATE')

IPW_result <- cps1_nsw_data %>%
  lm(data = .,
     formula = re78 ~ treat,
     weights = weighting$weights) %>%
  tidy()
