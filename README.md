# Partisanship & Covid-19 Death Rates: What can we learn?

## Abstract
In this paper, I examine the impact of republican vote share in the US 2020 presidential election and full vaccination percentage on the number of Covid-19 Deaths per 100,000 post Jun 26th, 2021. Economic theory on vaccines as a public good predicts that vaccines will deliver an externality benefit, yielding decreasing returns. Examinations of the current political climate also suggest a bias in vaccine uptake with respect to partisanship. To test the predictions of this theory and public sentiment, I estimate the impact of republican vote share and vaccination rate on the Covid-19 death rate. Increases in republican vote share increase Covid-19 death rates. Increases in vaccination rates decrease Covid-19 death rates. These findings shed new light on the determining factors of individual vaccine decisions, and Covid-19 death prone populations. The paper suggests that partisan anti-vaccine sentiment will directly affect their supporting populations negatively.

## Introduction
The Covid-19 pandemic is struggling with misinformation, most notorious are some of the twitter tweets by the 45th President of the U.S, who falsely claims that Covid-19 is less deadly than the seasonal flu. (CNN, n.d.) At a first glance it seems that the lack of vaccine uptake and Covid-19 recognition is prominent in supporters of the GOP. In this report we will take a closer look at the last wave of the pandemic; between June 26th to September 27th, 2021, to investigate the relationship between Republican vote share by county and the rate of covid cases/deaths. We are specifically interested in the relationship between partisanship, the severity of the last wave, and the vaccine rate.

## The Context & Data
The dataset will include observations by country on COVID-19 death rate per 100,000 people, republican vote share in the US 2020 presidential election, full vaccination rate, and etc. A detailed description of the variables used in this report is listed in table 4 below. The cross-sectional dataset will consist of 3000 randomly sampled US counties.

Table 1.1 describes the summary statistics of all the variables used in this analysis. The mean Covid death rate between June 26th to September 27th, 2021, is 35.157 per 100,000 across counties. The death rate has a considerably large range from 0 to 171.254 deaths per 100,000. The standard deviation is 31.396 deaths per 100,000. Considering our summary statistics, we can see that death rate is dispersed over a wider range of values. The mean republican vote share across counties in 64.962%. The vote share has a wide range, between 3.676% and 96.182%. The standard deviation is 16.193%.

Let us now investigate what we can expect from our data. Table 1.2 gives us the mean summary statistics grouped by Republican share. For example, it gives us the average Covid death rate for counties with republican vote share of less than 50%. From the table, we see that the average death rate for vote share greater than 50% is 24.45 per 100,000, compared to the average death rate of 37.50 per 100,000 for vote share less than 50%. We can also see that average vaccination hesitancy is higher in counties with vote share greater than 50% compared to less than 50%. The vaccination rate is also much higher in counties with less than 50% vote share, by 11.703%, this difference is greater than the standard deviation, pointing to potential importance in the relationship between partisanship and vaccination rate. In general, Table 1.2 suggests that in our death rate to republican vote share regression, we can anticipate that republican vote share will be a statistically significant variable.

## Regression Analysis
### Simple Linear Regression
We will be executing a simple linear regression, with the aim to estimate the causal effect of a percentage change in republican vote share on Covid-19 death rates per 100,000 people. The response variable will be the Covid-19 Deaths per 100,000 people post Jun 26th, 2021, per county. The explanatory variable will be the percent of votes for GOP president in the U.S. 2020 election per county. We will test the hypothesis that the effect of Republican vote share on the Covid-19 death rate in the latest wave is zero, with a significance level of 5%. Also, from our summary statistics we observed that counties with over 50% republican vote share had higher mean Covid-19 deaths, thus we expect that a 1 percent increase in republican vote share, will result in a positive increase of Covid-19 death rates.

The SLR model is as follows, 𝑑𝑒𝑎𝑡ℎ 𝑟𝑎𝑡𝑒= 𝛽0+𝛽1(𝑣𝑜𝑡𝑒 𝑠ℎ𝑎𝑟𝑒)+𝑢 for 𝑢=𝑒𝑟𝑟𝑜𝑟 𝑡𝑒𝑟𝑚
Hence, let the null hypothesis 𝐻0:𝛽1=0 and 𝐻𝐴:𝛽1≠0. Using our dataset with 2998 observations, we obtain the following sample regression function. 𝑑𝑒𝑎𝑡ℎ 𝑟𝑎𝑡𝑒̂= 6.993163+0.4331098(𝑣𝑜𝑡𝑒 𝑠ℎ𝑎𝑟𝑒). With standard error of 𝛽1 = 0.0345156, adjusted R-squared value = 0.0496 and p-value of 𝛽1 = 0.000. Since our p-value of 𝛽1<0.05, we reject the null hypothesis. Thus, we conclude that the effect of Republican vote share on the Covid-19 death rate in the latest wave is not zero. Additionally, from the sample regression function, we can interpret that the Covid-19 death rate increases 0.4331098 deaths per 100,000 people, for a 1% percent increase in vote share.












