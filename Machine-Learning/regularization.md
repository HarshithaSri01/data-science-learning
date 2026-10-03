
# Regularization in Machine Learning

## 1. What Is Regularization?

Regularization is a technique that discourages unnecessarily
complex models by adding a penalty to the training objective.

It can help reduce overfitting and improve generalization.

## 2. Why Do We Need It?

Without suitable regularization, a model may fit noise or
unimportant patterns in the training data.

Regularization can:
- Control model complexity.
- Reduce overly large coefficients.
- Improve performance on unseen data.
- Help manage high-dimensional feature sets.

Too much regularization can cause underfitting.

## 3. L1 Regularization (Lasso)

L1 adds a penalty based on the absolute values of coefficients.

Objective for Linear Regression:

Squared Error + lambda * sum(abs(coefficients))

Key points:
- Can shrink some coefficients exactly to zero.
- Can perform a form of feature selection.
- Useful when a sparse model is desirable.

## 4. L2 Regularization (Ridge)

L2 adds a penalty based on squared coefficient values.

Objective for Linear Regression:

Squared Error + lambda * sum(coefficients^2)

Key points:
- Shrinks coefficients toward zero.
- Usually does not make coefficients exactly zero.
- Can help when predictors are highly correlated.

## 5. Elastic Net

Elastic Net combines L1 and L2 penalties.

Key points:
- Can produce sparse models.
- Also shrinks correlated coefficients.
- Has a mixing parameter that controls the L1/L2 balance.

## 6. What Does Lambda Do?

Lambda controls regularization strength.

- Small lambda: weaker penalty.
- Large lambda: stronger penalty.
- Lambda = 0: no regularization penalty.

The best strength should be selected using validation
or cross-validation, not by looking at test-set results.

Note: In scikit-learn, parameter names and scaling differ
by estimator. For example, Ridge uses alpha, while
LogisticRegression uses C, where smaller C generally
means stronger regularization.

## 7. Python Implementation

from sklearn.datasets import make_regression
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline
from sklearn.linear_model import LinearRegression, Ridge, Lasso, ElasticNet
from sklearn.metrics import mean_squared_error

X, y = make_regression(
    n_samples=500,
    n_features=20,
    noise=25,
    random_state=42
)

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

models = {
    "Linear Regression": make_pipeline(
        StandardScaler(), LinearRegression()
    ),
    "Ridge": make_pipeline(
        StandardScaler(), Ridge(alpha=1.0)
    ),
    "Lasso": make_pipeline(
        StandardScaler(), Lasso(alpha=0.1, max_iter=10000)
    ),
    "Elastic Net": make_pipeline(
        StandardScaler(), ElasticNet(
            alpha=0.1, l1_ratio=0.5, max_iter=10000
        )
    )
}

for name, model in models.items():
    model.fit(X_train, y_train)
    predictions = model.predict(X_test)
    mse = mean_squared_error(y_test, predictions)
    print(name, "Test MSE:", mse)

## 8. L1 vs. L2 vs. Elastic Net

| Aspect | L1 (Lasso) | L2 (Ridge) | Elastic Net |
|---|---|---|---|
| Penalty | Absolute coefficients | Squared coefficients | Combination of both |
| Can zero coefficients | Yes | Usually no | Yes |
| Feature selection | Can be sparse | Not usually | Can be sparse |
| Correlated features | May select one among them | Often shares/shrinks effects | Combines both behaviors |

## 9. Regularization and Feature Scaling

Feature scaling is important for many regularized models
because penalties depend on coefficient magnitudes.

Standardizing numeric features often makes the penalty
more comparable across features.

Fit preprocessing steps on training data only, such as
by using a scikit-learn Pipeline, to avoid data leakage.

## 10. Common Mistakes

- Choosing regularization strength using the test set.
- Applying preprocessing before the train/test split.
- Assuming stronger regularization is always better.
- Forgetting to scale features where appropriate.
- Confusing L1/L2 regularization with feature selection
  methods that use different objectives.

## 11. Interview Answer

Regularization adds a penalty to the model's objective
to control complexity and help reduce overfitting.
L1 regularization can shrink some coefficients to zero,
while L2 generally shrinks coefficients toward zero.
Elastic Net combines both penalties. The regularization
strength is selected using validation or cross-validation.

## Key Takeaway

Regularization balances fitting the training data with
building a model that generalizes to unseen data.
