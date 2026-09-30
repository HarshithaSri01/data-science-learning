# Machine Learning Evaluation Metrics

Evaluation metrics help us measure how well a machine learning model performs.

The choice of metric depends on the type of problem.

---

## 1. Classification Metrics

Classification problems predict categories or classes.

Examples:

- Spam or Not Spam
- Fraud or Not Fraud
- Disease or No Disease

### Accuracy

Accuracy measures the percentage of predictions that are correct.

Formula:

Accuracy = (TP + TN) / (TP + TN + FP + FN)

Accuracy works well when the classes are reasonably balanced.

---

### Precision

Precision answers:

> Of all the samples predicted as positive, how many were actually positive?

Formula:

Precision = TP / (TP + FP)

Precision is important when false positives are costly.

Example:

Spam email detection.

---

### Recall

Recall answers:

> Of all the actual positive samples, how many did the model correctly identify?

Formula:

Recall = TP / (TP + FN)

Recall is important when missing a positive case is costly.

Example:

Fraud detection or disease detection.

---

### F1 Score

F1 Score is the harmonic mean of Precision and Recall.

Formula:

F1 = 2 × (Precision × Recall) / (Precision + Recall)

It is useful when we want a balance between precision and recall.

---

### Confusion Matrix

A confusion matrix contains four values:

- True Positive (TP)
- True Negative (TN)
- False Positive (FP)
- False Negative (FN)

| | Predicted Positive | Predicted Negative |
|---|---|---|
| Actual Positive | TP | FN |
| Actual Negative | FP | TN |

---

## 2. Regression Metrics

Regression problems predict continuous numerical values.

Examples:

- House price prediction
- Sales prediction
- Temperature prediction

### MAE

Mean Absolute Error measures the average absolute difference between actual and predicted values.

MAE = Average(|Actual - Predicted|)

Lower MAE generally means better predictions.

---

### MSE

Mean Squared Error calculates the average squared difference between actual and predicted values.

MSE = Average((Actual - Predicted)²)

Because errors are squared, large errors have a greater effect.

---

### RMSE

Root Mean Squared Error is the square root of MSE.

RMSE = √MSE

RMSE is expressed in the same units as the target variable.

---

### R² Score

R² measures how much of the variation in the target variable is explained by the model.

A higher R² generally indicates that the model explains more of the variation in the target.

---

## Classification vs Regression

| Problem | Common Metrics |
|---|---|
| Classification | Accuracy, Precision, Recall, F1, ROC-AUC |
| Regression | MAE, MSE, RMSE, R² |

## Key Takeaway

There is no single evaluation metric that is best for every machine learning problem.

The appropriate metric depends on:

- Type of problem
- Dataset
- Class balance
- Business objective
- Cost of different types of errors
