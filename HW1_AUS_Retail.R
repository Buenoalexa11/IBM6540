library(fpp3)
aus_retail
set.seed(08312003)

myseries <- aus_retail |>
  filter(`Series ID` == sample(aus_retail$`Series ID`, 1))
myseries |>
  autoplot(Turnover) +
  labs(
    y = "Turnover (million AUD)",
    x = "Time (Years)",
    title = "Other retailing n.e.c.",
    subtitle = "South Australia"
  )
gg_season(myseries, Turnover) +
  labs(
    y = "Turnover (million AUD)",
    title = "Seasonal pattern by month"
  )
gg_subseries(myseries, Turnover)
gg_lag(myseries, Turnover)
myseries |> ACF(Turnover) |> autoplot()


