install.packages("Rcpp")
library(car)
## Linear regression
fit <- lm(mpg~hp+wt+drat, data=mtcars)
summary(fit)

# Residual Plotting
residualPlots(fit)  # Pearson residual ((y_i-pred_i)/sqrt(var(pred))
marginalModelPlots(fit)

fit0 <- lm(mpg~hp+wt+drat+I(hp^2)+I(wt^2), data=mtcars)
summary(fit0)
residualPlots(fit0)

### Outliers: an outlier is defined as an observation that has a large residual. 
#In other words, the observed value for the point is very different from that 
#predicted by the regression model.
### Leverage points: A leverage point is defined as an observation that has a 
#value of x that is far away from the mean of x. 
### Influential observations: An influential observation is defined as an 
#observation that changes the slope of the line. 
#Thus, influential points have a large influence on the fit of the model.

# Outlier
outlierTest(fit) # Bonferonni p-value for most extreme obs
qqPlot(fit, main="QQ Plot", id.n=1) #qq plot for studentized resid 

# leverage
leveragePlots(fit) #A leverage plot is the plot of the residuals for the dependent variable
# against the residuals for a selected regressor, where the residuals 
# for the dependent variable are calculated with the selected regressor 
# omitted, and the residuals for the selected regressor are calculated 
# from a model where the selected regressor is regressed on the remaining regressors.
plot(hat(model.matrix(fit)))

# Influence
influenceIndexPlot(fit, id.n=3)
influencePlot(fit,col="red",id.n=3)

