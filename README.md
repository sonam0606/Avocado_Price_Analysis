# Avocado_Price_Analysis

## Abstract
This report will investigate the price of avocados in the US market to determine whether there is a price difference between conventional and organic avocados. The data used in this report is an open data from kaggle.com. It is originally from Hass Avocado Board website in May of 2018 & compiled into a single CSV.
Summary statistics and boxplots of the price in each year will be produced by using RStudio functions to explore any price fluctuations throughout the years from 2015 to 2018.
Time Series Analysis to understand the variation in average price for organic and conventional avocado across Chicago from the year 2015 to 2018.

## Objectives: 
This Analysis Plan focuses on documenting the steps and the analyses techniques that will be used to answer our main research question:
“The extent to which is done the average price of avocados is affected by years, regions, types.”

 Interesting Findings after the Analyses:
1.	In 2017, the maximum average price for conventional avocados went higher than organic avocados.
2.	Variation in average prices was very high in 2016 and very low in 2018.
3.	Year 2017 has seen highest average prices for avocados and was the most volatile year. 
4.	Based on our AUTO ARIMA model, we expect a short downward trend  in case of conventional avocados and organic avocados looks stagnant for next few weeks.
In this report we have briefly discussed about Data Analysis Plan, Data Preprocessing and our different analyses on the data. We have included code snippets, graphs and plots of our Analyses.

## Introduction:

The data provides average price and total volume of two main Hass avocado types; conventional and organic avocados in 54 regions of the United States. The following time series report intends to analyze,
*	The extent to which the average price of avocados is affected by years.
*	Variation in the average price for organic and conventional avocado across Chicago.
*	Predict the next 10 weeks of data for both organic and conventional types with the best parsimonious models.

## Dataset Description:
The data on Hass avocado prices and sales volume in multiple US markets was downloaded from Kaggle, which was originally from Hass Avocado Board website dated March,2018. The below variables are weekly 2018 retail scan data for National retail volume (avocado units) and price. 
This study uses statistical methods on data acquired from multi-outlet retail sales details of Hass avocados. The data used in the analysis was extracted from Kaggle and corresponds to 18249 rows and 13 variables of interest. 
