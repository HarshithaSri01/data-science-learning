
# Linear Regression

## 1. What Is Linear Regression?

Linear Regression is a supervised Machine Learning algorithm
used to predict a continuous numerical value.

Examples:
- Predicting house prices
- Predicting sales revenue
- Predicting electricity consumption
- Predicting salaries

## 2. Types

### Simple Linear Regression
Uses one independent variable to predict one dependent variable.

Example: Predicting salary using years of experience.

### Multiple Linear Regression
Uses two or more independent variables.

Example: Predicting house prices using area, bedrooms, and age.

## 3. Equation

Simple Linear Regression:

y = mx + b

- y: predicted output
- x: input feature
- m: slope or coefficient
- b: intercept

Multiple Linear Regression:

y = b0 + b1*x1 + b2*x2 + ... + bn*xn

Each coefficient represents the model's estimated change
in prediction for a one-unit change in that feature, holding
the other features constant.

## 4. How It Works

1. Prepare the dataset.
2. Separate features (X) and target (y).
3. Split the data into training and testing sets.
4. Fit the model on training data.
5. Predict values for test data.
6. Evaluate prediction errors.

Ordinary Least Squares estimates coefficients by minimizing
the sum of squared residuals on the training data.

## 5. Loss Function

Residual = Actual value - Predicted value

Ordinary Least Squares minimizes:

Sum of (Actual value - Predicted value)^2

Squaring errors prevents positive and negative residuals
from simply cancelling each other out and penalizes larger
errors more heavily.

## 6. Important Assumptions

- The relationship is approximately linear in the model parameters.
- Observations have an appropriate independence structure.
- Residual variance is constant for standard inference.
- Errors have mean zero conditional on the predictors.
- Predictors are not perfectly multicollinear.
- Residual normality is mainly relevant for certain statistical
  inference procedures, not a universal requirement for prediction.

## 7. Python Implementation

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

# Example dataset
data = pd.DataFrame({
    "experience": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    "salary": [25000, 28000, 32000, 35000, 39000,
               42000, 46000, 49000, 53000, 57000]
})

X = data[["experience"]]
y = data["salary"]

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

model = LinearRegression()
model.fit(X_train, y_train)

predictions = model.predict(X_test)

print("Slope:", model.coef_[0])
print("Intercept:", model.intercept_)
print("MAE:", mean_absolute_error(y_test, predictions))
print("MSE:", mean_squared_error(y_test, predictions))
print("R2:", r2_score(y_test, predictions))

## 8. Evaluation Metrics

- MAE: Average absolute prediction error.
- MSE: Average squared prediction error.
- RMSE: Square root of MSE, in the target's units.
- R-squared: Measures improvement over predicting the target
  mean on the evaluated dataset; it can be negative on test data.

## 9. Advantages

- Simple and interpretable.
- Fast to train.
- Provides a useful baseline.
- Coefficients can help explain relationships under suitable assumptions.

## 10. Limitations

- May perform poorly when the relationship is nonlinear.
- Sensitive to outliers.
- Multicollinearity can make coefficient estimates unstable.
- Extrapolation beyond the training range can be unreliable.

## 11. Interview Answer

Linear Regression is a supervised learning algorithm used
to predict continuous values by modeling a linear relationship
between input features and a target. Ordinary Least Squares
fits the coefficients by minimizing squared residuals.
I evaluate it using metrics such as MAE, RMSE, and R-squared.

## Key Takeaway

Linear Regression predicts continuous values and is often
used as an interpretable baseline for regression problems.
