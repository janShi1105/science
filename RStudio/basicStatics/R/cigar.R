skip_state <- c(3,9,10,22,21,23,31,33,48)

Cigar <- Cigar %>%
  filter(!state %in% skip_state,
         year >= 70) %>%
  mutate(area = if_else(state ==5, 'CA', 'Rest of CA'))

Cigar_did_sum <- Cigar %>%
  mutate(post = if_else(year > 87, 1,0),
         ca = if_else(state == 5, 1, 0),
         state = factor(state),
         year_dummy = paste('D', year, sep='_')) %>%
  group_by(post, year, year_dummy, ca) %>%
  summarise(sales = sum(sales*pop16)/sum(pop16))

Cigar_did_sum_reg <- Cigar_did_sum %>%
  lm(data = ., sales ~ ca + post + ca:post + year_dummy) %>%
  tidy() %>%
  filter(!str_detect(term, 'state'),
         !str_detect(term, 'year'))

Cigar_did_sum_logreg <- Cigar_did_sum %>%
  lm(data = ., log(sales) ~ ca + post + ca:post + year_dummy) %>%
  tidy() %>%
  filter(!str_detect(term, 'state'),
         !str_detect(term, 'year'))

Y <- Cigar %>% filter(state == 5) %>% pull(sales)

X_sales <- Cigar %>%
  filter(state != 5) %>%
  select(state, sales, year) %>%
  spread(state, sales)

pre_period <- c(1:NROW(X_sales))[X_sales$year < 88]
post_period <- c(1:NROW(X_sales))[X_sales$year >= 88]

CI_data <- cbind(Y,X_sales) %>% select(-year)

impact <- CausalImpact::CausalImpact(CI_data,
                                     pre.period = c(min(pre_period), max(pre_period)),
                                     post.period =c(min(post_period), max(post_period)))
