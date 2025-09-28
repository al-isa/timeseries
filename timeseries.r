install.packages(c("forecast", "fpp2", "ggplot2", "tseries", "tidyverse"))
library(forecast)
library(fpp2)       #includes datasets
library(ggplot2)
library(tseries)

data("AirPassengers")
ts_data <- AirPassengers
plot(ts_data, main="Monthly Airline Passengers (1949–1960)", ylab="Passengers (1000s)", xlab="Year")

summary(ts_data)
frequency(ts_data)     # 12 (monthly data)
cycle(ts_data)         # Shows months

seasonplot(ts_data, col=rainbow(12), year.labels=TRUE, main="Seasonal Plot")

decomp <- decompose(ts_data, type="multiplicative")
plot(decomp)

adf.test(ts_data)  # Augmented Dickey-Fuller Test

diff_ts <- diff(ts_data)
plot(diff_ts)
adf.test(diff_ts)

fit_arima <- auto.arima(ts_data)
summary(fit_arima)
forecast_arima <- forecast(fit_arima, h=24)  # forecast next 2 years
plot(forecast_arima)

fit_ets <- ets(ts_data)
summary(fit_ets)
forecast_ets <- forecast(fit_ets, h=24)
plot(forecast_ets)

accuracy(forecast_arima)
accuracy(forecast_ets)
