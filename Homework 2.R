#-------------------------------
# PART 1A:
#-------------------------------
# US GDP
us_economy <- global_economy |> 
  filter(Country == "United States")

autoplot(us_economy, GDP)

autoplot(us_economy, box_cox(GDP, 0))

#------------------------------------
# PART 1B: 
#------------------------------------

autoplot(aus_production, Gas)

autoplot(aus_production, box_cox(Gas, 0))

#------------------------------------
# PART 2
#------------------------------------

# Last 5 years of data
gas_last5 <- tail(aus_production, 5*4) |> 
  select(Gas)
# Plot last 5 years to examine recent trend and seasonality
autoplot(gas_last5)

# Classical Decomposition
gas_decomp <- gas_last5 |>
  model(classical_decomposition(Gas, type = "multiplicative"))

components(gas_decomp) |>
  autoplot()

# Seasonally adjusted data
gas_sa <- components(gas_decomp) |>
  mutate(seasonally_adjusted = Gas / seasonal)

autoplot(gas_sa, seasonally_adjusted)