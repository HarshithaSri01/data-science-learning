
# Overfitting and Underfitting in Machine Learning

## 1. Underfitting

Underfitting occurs when a model is too simple to learn the
important patterns in the training data.

### Causes
- Model is too simple.
- Important features are missing.
- Training is insufficient.
- Regularization is too strong.

### Symptoms
- High training error.
- High testing error.

### Solutions
- Use a more suitable model.
- Add useful features.
- Reduce excessive regularization.
- Train appropriately.

## 2. Overfitting

Overfitting occurs when a model learns the training data too
closely, including noise or patterns that do not generalize.

### Causes
- Model is unnecessarily complex.
- Training data is limited or unrepresentative.
- Too many features relative to the available data.
- Insufficient regularization.

### Symptoms
- Very low training error.
- Much higher validation or testing error.

### Solutions
- Collect more representative data.
- Apply regularization.
- Use cross-validation.
- Reduce unnecessary model complexity.
- Use early stopping where applicable.

## 3. Good Fit

A well-generalizing model learns meaningful patterns and
performs reasonably well on unseen data.

Training and validation errors should both be acceptable,
with no substantial unexplained performance gap.

## 4. Comparison

| Aspect | Underfitting | Overfitting |
|---|---|---|
| Model | Too simple or constrained | Too complex for the data |
| Training error | High | Often low |
| Validation error | High | Often much higher than training error |
| Main issue | Fails to learn patterns | Fails to generalize |
| Remedy | Improve learning capacity | Improve generalization |

## 5. Example

Suppose we predict house prices.

- Underfitting: A model ignores important factors such as
  location and size.
- Overfitting: A model memorizes quirks of the training
  houses and performs poorly on new houses.
- Good fit: A model learns useful relationships and predicts
  prices reasonably well for unseen houses.

## 6. Python Example

from sklearn.tree import DecisionTreeRegressor
from sklearn.metrics import mean_squared_error

# X_train, X_test, y_train, y_test must already be prepared.

model = DecisionTreeRegressor(max_depth=3, random_state=42)
model.fit(X_train, y_train)

train_predictions = model.predict(X_train)
test_predictions = model.predict(X_test)

train_mse = mean_squared_error(y_train, train_predictions)
test_mse = mean_squared_error(y_test, test_predictions)

print("Training MSE:", train_mse)
print("Testing MSE:", test_mse)

A large gap between training and testing error can indicate
overfitting. High errors on both can indicate underfitting,
but these patterns should be interpreted in context.

## 7. Interview Answer

Overfitting happens when a model fits the training data too
closely and performs poorly on unseen data. Underfitting
happens when a model is too simple to capture important
patterns. We can address these issues through model
selection, regularization, cross-validation, and appropriate
feature engineering.

## Key Takeaway

The goal is not to memorize the training data. The goal is
to learn patterns that generalize to new, unseen data.
