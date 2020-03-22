install.packages("tidyverse")
install.packages("corrgram")
install.packages("tseries")
install.packages("readxl")
install.packages("urca")
install.packages("forecast")
install.packages("trend")
install.packages("zoo")
install.packages("reshape")

library(tidyverse)
library(readxl)
library(corrgram)
library(tseries)
library(urca)
library(forecast)
library(trend)
library(zoo)
library(reshape)


Hass_Avocado <- read_excel("/Users/sonam/Desktop/Regression_data/avocado.xlsx")
Hass_Avocado

Hass_Avocado <- Hass_Avocado[order(as.Date(Hass_Avocado$Date, format = "%Y-%m-%d")),]

str(Hass_Avocado)
View(Hass_Avocado)


Organic <- Hass_Avocado %>% select(Date, AveragePrice, type, 'Total Volume',region) %>% filter(type == "organic", region =="Chicago")
Conventional <- Hass_Avocado %>% select(Date, AveragePrice, type, 'Total Volume', region) %>% filter(type == "conventional",region == "Chicago")
summary(Organic)
summary(Conventional)

dim(Organic)
dim(Conventional)
str(Organic) 
str(Conventional)


sum(is.na(Organic))
sum(is.na(Conventional))
view(Organic)
view(Conventional)


  

Organic1<-ts(Organic$AveragePrice,frequency=52,start = c(2015,1), end = c(2018,3))
Conventional1<-ts(Conventional$AveragePrice,frequency=52, start = c(2015,1), end = c(2018,3))


autoplot(Organic1)
autoplot(Conventional1)


adf.test(Organic1)
adf.test(Conventional1)

kpss.test(Organic1, null = "Trend")
kpss.test(Conventional1, null = "Trend")


par(mfrow=c(1,2))
acf(Organic1)
pacf(Organic1)
acf(Conventional1)
pacf(Conventional1)



Organic2<-decompose(Organic1)
autoplot(Organic2)


Conventional2<-decompose(Conventional1)
autoplot(Conventional2)


OrganicArima<-auto.arima(Organic1, seasonal = TRUE)
OrganicArima

ConventionalArima<-auto.arima(Conventional1, seasonal = TRUE)
ConventionalArima




Forecast_Organic = forecast(OrganicArima,h=10)
Forecast_Organic
autoplot(Forecast_Organic)

Forecast_Conventional = forecast(ConventionalArima,h=10)
Forecast_Conventional
autoplot(Forecast_Conventional)

prediction=predict(OrganicArima,n.ahead=10)
prediction

prediction=predict(ConventionalArima,n.ahead=10)
prediction


acf(ts(OrganicArima$residuals), main='ACF Residual - Organic')
pacf(ts(OrganicArima$residuals), main='PACF Residual - Organic')
acf(ts(ConventionalArima$residuals), main='ACF Residual - Conventional')
pacf(ts(ConventionalArima$residuals), main='PACF Residual - Conventional')

gghistogram(OrganicArima$residuals) + ggtitle("Histogram of residuals")
gghistogram(ConventionalArima$residuals) + ggtitle("Histogram of residuals")
  



