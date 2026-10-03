
# Logistic Regression

## 1. What Is Logistic Regression?

Logistic Regression is a supervised Machine Learning
algorithm primarily used for classification.

Examples:
- Spam or not spam
- Fraudulent or legitimate transaction
- Customer churn or no churn
- Disease present or absent

Despite its name, it is commonly used for classification,
not for predicting unrestricted continuous values.

## 2. How Does It Work?

The model first calculates a linear score:

z = b0 + b1*x1 + b2*x2 + ... + bn*xn

It then transforms the score into a probability using
the sigmoid function.

## 3. Sigmoid Function

sigmoid(z) = 1 / (1 + exp(-z))

The output lies between 0 and 1.

For binary classification, a threshold such as 0.5 can
be used to convert the predicted probability into a class.

Example:
- Probability = 0.82
- Threshold = 0.50
- Predicted class = 1

The threshold can be adjusted depending on the application
and the costs of false positives and false negatives.

## 4. Types

### Binary Logistic Regression
Predicts one of two classes.

Example: Spam vs. not spam.

### Multinomial Logistic Regression
Supports classification among multiple unordered classes.

Example: Classifying a document as sports, business, or technology.

### Ordinal Logistic Regression
Models ordered categories, such as low, medium, and high.
This generally requires a suitable ordinal model rather than
the standard multinomial implementation.

## 5. Decision Boundary

The decision boundary separates regions assigned to different
classes. Standard Logistic Regression creates a linear
decision boundary in its input feature space.

Feature transformations can help represent more complex
boundaries.

## 6. Cost Function

Logistic Regression commonly minimizes log loss, also called
binary cross-entropy for binary classification.

This loss penalizes incorrect probability predictions,
especially confident incorrect predictions.

## 7. Python Implementation

from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import (
    accuracy_score,
    precision_score,
    recall_score,
    f1_score,
    confusion_matrix
)

X, y = make_classification(
    n_samples=1000,
    n_features=10,
    n_informative=6,
    n_redundant=2,
    random_state=42
)

X_train, X_test, y_train, y_test = train_test_split(
    X, y,
    test_size=0.2,
    random_state=42,
    stratify=y
)

model = LogisticRegression(max_iter=1000)
model.fit(X_train, y_train)

predictions = model.predict(X_test)

print("Accuracy:", accuracy_score(y_test, predictions))
print("Precision:", precision_score(y_test, predictions))
print("Recall:", recall_score(y_test, predictions))
print("F1 Score:", f1_score(y_test, predictions))
print("Confusion Matrix:\n", confusion_matrix(y_test, predictions))

## 8. Evaluation Metrics

- Accuracy: Fraction of predictions that are correct.
- Precision: Fraction of predicted positives that are correct.
- Recall: Fraction of actual positives correctly identified.
- F1 Score: Harmonic mean of precision and recall.
- Confusion Matrix: Shows true positives, true negatives,
  false positives, and false negatives.

For imbalanced datasets, accuracy alone can be misleading.

## 9. Advantages

- Interpretable baseline for classification.
- Produces class probabilities.
- Efficient for many datasets.
- Supports regularization.

## 10. Limitations

- Standard Logistic Regression learns a linear decision boundary.
- May struggle with complex nonlinear relationships.
- Can be affected by multicollinearity and irrelevant features.
- Requires careful threshold selection when class errors
  have different costs.

## 11. Linear vs. Logistic Regression

| Aspect | Linear Regression | Logistic Regression |
|---|---|---|
| Main task | Regression | Classification |
| Typical output | Continuous value | Class probability |
| Function | Linear prediction | Sigmoid or suitable multiclass link |
| Common metrics | MAE, RMSE, R-squared | Precision, recall, F1, log loss |

## 12. Interview Answer

Logistic Regression is a supervised classification algorithm
that calculates a linear score from input features and uses
a logistic function to estimate class probabilities.
A decision threshold converts probabilities into predicted
classes. I evaluate it using metrics such as precision,
recall, F1 score, and accuracy.

## Key Takeaway

Logistic Regression is a classification algorithm that
estimates probabilities and is often a strong baseline
for binary classification.
