# PairsFinder
This is an MQL4 indicator and Python script used to analyze the 28 major currency pairs and crosses to find pairs trading oppurtunities.

First use the MQL4 indcator to generate a .txt file containing all of the 28 currency pair prices for the sample size of your choice.

Next use the python script to analyze that file. The script will then print to the console the currency pairs that are cointegrated with a required correlation level specified. In the output you will find the pairs the make up the trade, the cointegration p-value, the correlation of the 2 pairs, and the current z-value so you know where the spread is in relation to it's mean.
