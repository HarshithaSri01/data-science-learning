
# Decision Trees in Machine Learning

## 1. What Is a Decision Tree?

A Decision Tree is a supervised Machine Learning algorithm
that makes predictions by splitting data into smaller groups
using feature-based rules.

It resembles a flowchart:
- Root node: The first split.
- Internal node: A decision or test on a feature.
- Branch: The outcome of a test.
- Leaf node: The final prediction.

## 2. Types

### Decision Tree Classifier
Predicts a category.

Example: Predicting whether a customer will leave or stay.

### Decision Tree Regressor
Predicts a numerical value.

Example: Predicting house prices.

## 3. How Does It Work?

1. Start with the training dataset.
2. Evaluate candidate features and split points.
3. Choose a split that improves the chosen criterion.
4. Repeat the process for child nodes.
5. Stop when a stopping condition is reached.
6. Predict using the final leaf node.

## 4. Splitting Criteria

### Gini Impurity

Measures how mixed the classes are within a node.

Gini = 1 - sum(p_i^2)

A lower Gini impurity indicates a purer classification node.

### Entropy

Measures uncertainty in class labels.

Entropy = -sum(p_i * log2(p_i))

A split can be selected using information gain, which measures
the reduction in entropy after splitting.

### Mean Squared Error

For regression trees, a common criterion chooses splits that
reduce squared prediction error within the resulting leaves.

## 5. Important Hyperparameters

- max_depth: Maximum depth of the tree.
- min_samples_split: Minimum samples needed to split a node.
- min_samples_leaf: Minimum samples allowed in a leaf.
- max_features: Number of features considered when splitting.
- criterion: The split-quality measure.
- ccp_alpha: Complexity parameter for cost-complexity pruning.

These parameters help control tree complexity.

## 6. Python Implementation: Classification

from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score, classification_report

X, y = load_breast_cancer(return_X_y=True)

X_train, X_test, y_train, y_test = train_test_split(
    X, y,
    test_size=0.2,
    random_state=42,
    stratify=y
)

model = DecisionTreeClassifier(
    max_depth=4,
    min_samples_leaf=3,
    random_state=42
)

model.fit(X_train, y_train)

predictions = model.predict(X_test)

print("Accuracy:", accuracy_score(y_test, predictions))
print(classification_report(y_test, predictions))

## 7. Python Implementation: Regression

from sklearn.datasets import make_regression
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeRegressor
from sklearn.metrics import mean_squared_error

X, y = make_regression(
    n_samples=500,
    n_features=4,
    noise=15,
    random_state=42
)

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

model = DecisionTreeRegressor(
    max_depth=5,
    random_state=42
)

model.fit(X_train, y_train)

predictions = model.predict(X_test)

print("Test MSE:", mean_squared_error(y_test, predictions))

## 8. Overfitting in Decision Trees

A very deep tree can memorize training data and perform
poorly on unseen data.

Ways to control overfitting:
- Limit max_depth.
- Increase min_samples_leaf.
- Increase min_samples_split.
- Use pruning.
- Evaluate with cross-validation.

## 9. Advantages

- Easy to visualize and explain.
- Captures nonlinear relationships.
- Can model feature interactions.
- Does not generally require feature scaling.
- Supports classification and regression.

## 10. Limitations

- Deep trees can overfit.
- Small data changes can produce different trees.
- Greedy splitting may not find a globally optimal tree.
- A single tree may be less accurate than an ensemble.

## 11. Decision Tree vs. Random Forest

| Aspect | Decision Tree | Random Forest |
|---|---|---|
| Structure | One tree | Many trees |
| Interpretability | Usually easier | More complex |
| Stability | Can be sensitive to data changes | Often more stable |
| Overfitting | Deep trees can overfit | Averaging often reduces variance |
| Prediction | One tree's output | Aggregated tree predictions |

## 12. Interview Answer

A Decision Tree is a supervised learning algorithm that
predicts an output through a sequence of feature-based splits.
Classification trees use criteria such as Gini impurity or
entropy, while regression trees commonly minimize prediction
error. I control complexity with parameters such as max_depth
and min_samples_leaf and evaluate performance on unseen data.

## Key Takeaway

Decision Trees are interpretable models for classification
and regression, but controlling their complexity is important
for generalization.
