# Analysis of Factors Affecting Gas Guzzler Tax Prone Cars

This project investigates the factors that make a car more prone to being subject to the gas guzzler tax.

## Data

The analysis uses a dataset containing information about vehicle characteristics. The key variable of interest is the "guzzler" category, which indicates whether a vehicle is subject to the gas guzzler tax.

## Exploratory Data Analysis

The exploratory data analysis included the following visualizations:

* **Engine Displacement by Guzzler Category:** Boxplots were used to compare the distribution of engine displacement (`displ`) across different guzzler categories. [cite: 2]
* **Number of Cylinders by Guzzler Category:** Boxplots were used to compare the distribution of the number of cylinders (`cylinders`) across different guzzler categories. [cite: 4]
* **Jitter Plot of Transmission by Guzzler Category:** A jitter plot was used to visualize the relationship between transmission type (`trany`) and guzzler category, with different colors representing each category.

## Multinomial Logistic Regression

A multinomial logistic regression model was employed to predict the guzzler category based on vehicle characteristics. [cite: 4]

The general form of the multinomial logistic regression model is:

P(Y = j) = exp(β0j + β1jX1 + β2jX2 + ... + βnjXn) / Σ(k=1 to m) exp(β0k + β1kX1 + ... + βnkXn)


Where:

* Y is the categorical response variable (guzzler category)
* Xs are predictor variables
* βs are regression coefficients [cite: 5]

## Results

The multinomial logistic regression model had the following overview:

* **Dependent Variable:** Guzzler (Categories: Not taxed, S, T)
* **Independent Variables:** Cylinders, Displacement (displ)

Key results from the model include:

* **Intercepts:**
    * Not taxed: 13.29
    * S: -1.97
    * T: 2.79
* **Cylinders Coefficients:**
    * Not taxed: -1.52
    * S: -0.16
    * T: -0.18
* **Displacement (displ) Coefficients:**
    * Not taxed: 0.20
    * S: -0.28
    * T: -0.37
* **Standard Errors:**
    * Not taxed: 0.22 (for cylinders), 0.04 (for displ), 0.04 (for intercept)
    * S: 1.21, 0.20, 0.34
    * T: 0.21, 0.03, 0.06
* **Model Fit:**
    * Residual Deviance: 16137.06
    * AIC: 16155.06 [cite: 5]

## Conclusion

The analysis explores the relationship between vehicle characteristics (c
