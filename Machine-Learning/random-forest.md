
# Random Forest in Machine Learning

## 1. What Is Random Forest?

Random Forest is a supervised Machine Learning algorithm
that combines multiple Decision Trees to make predictions.

It is an ensemble learning method.

- Classification: combines tree predictions using voting.
- Regression: combines tree predictions, commonly by averaging.

## 2. Why Is It Called Random Forest?

It builds a collection of trees using randomness in:
- The training samples, commonly through bootstrap sampling.
- The features considered when searching for a split.

These sources of randomness help make the trees less correlated.
Combining their predictions often improves generalization.

## 3. How Does Random Forest Work?

1. Start with the training dataset.
2. Draw a bootstrap sample for each tree, when bootstrap
   sampling is enabled.
3. Train a Decision Tree on each sample.
4. Consider a random subset of features at each split.
5. Repeat until the requested number of trees is built.
6. Combine the trees' predictions.

## 4. Important Concepts

### Bootstrap Sampling
Creates training samples by sampling rows with replacement.

### Feature Randomness
Restricts the features considered at each split.

### Ensemble Learning
Combines predictions from multiple models.

### Out-of-Bag Evaluation
When bootstrap sampling is enabled, some training rows are
left out of each tree's sample. These rows can help estimate
performance without a separate validation split.

## 5. Important Hyperparameters

- n_estimators: Number of trees.
- max_depth: Maximum depth of each tree.
- min_samples_split: Minimum samples needed to split a node.
- min_samples_leaf: Minimum samples allowed in a leaf.
- max_features: Number or proportion of features considered
  at each split.
- bootstrap: Whether bootstrap samples are used.
- class_weight: Class weighting options for classification.

## 6. Python Implementation: Classification

from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, classification_report

X, y = load_breast_cancer(return_X_y=True)

X_train, X_test, y_train, y_test = train_test_split(
    X, y,
    test_size=0.2,
    random_state=42,
    stratify=y
)

model = RandomForestClassifier(
    n_estimators=100,
    max_depth=None,
    random_state=42,
    n_jobs=-1
)

model.fit(X_train, y_train)

predictions = model.predict(X_test)

print("Accuracy:", accuracy_score(y_test, predictions))
print(classification_report(y_test, predictions))

## 7. Python Implementation: Regression

from sklearn.datasets import make_regression
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error, mean_squared_error

X, y = make_regression(
    n_samples=500,
    n_features=5,
    noise=20,
    random_state=42
)

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

model = RandomForestRegressor(
    n_estimators=100,
    random_state=42,
    n_jobs=-1
)

model.fit(X_train, y_train)

predictions = model.predict(X_test)

print("MAE:", mean_absolute_error(y_test, predictions))
print("MSE:", mean_squared_error(y_test, predictions))

## 8. Feature Importance

Random Forest can estimate feature importance.

Example:

importances = model.feature_importances_
print(importances)

For tree-based models, impurity-based importance can favor
features with many possible split points. Permutation
importance is an alternative for assessing predictive impact.

## 9. Advantages

- Can model nonlinear relationships.
- Often generalizes better than a single deep tree.
- Supports classification and regression.
- Usually does not require feature scaling.
- Can estimate feature importance.
- Can capture interactions between features.

## 10. Limitations

- More computationally expensive than one small tree.
- Less interpretable than a single Decision Tree.
- Can require more memory.
- Impurity-based feature importance can be misleading.
- Very large forests may increase prediction latency.

## 11. Decision Tree vs. Random Forest

| Aspect | Decision Tree | Random Forest |
|---|---|---|
| Models | One tree | Many trees |
| Stability | Can vary considerably | Often more stable |
| Interpretability | Easier to explain | Harder to explain |
| Computation | Often lower | Usually higher |
| Generalization | Can overfit when complex | Often reduces variance |

## 12. Interview Answer

Random Forest is an ensemble learning algorithm that combines
multiple Decision Trees. It introduces randomness through
sampling and feature selection, then aggregates the trees'
predictions using voting for classification or averaging for
regression. It often reduces variance compared with a single
tree and can model nonlinear relationships.

## Key Takeaway

Random Forest combines many trees to produce predictions
that are often more stable than those of a single tree.
