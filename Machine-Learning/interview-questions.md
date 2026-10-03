
# Machine Learning Interview Questions and Answers

## 1. What is Machine Learning?

Machine Learning is a field of AI that enables systems to
learn patterns from data and make predictions or decisions
without explicitly programming every rule.

## 2. What are the main types of Machine Learning?

- Supervised Learning: Learns from labeled examples.
- Unsupervised Learning: Finds patterns in unlabeled data.
- Reinforcement Learning: Learns through interactions,
  rewards, and penalties.

## 3. What is the difference between regression and classification?

- Regression predicts numerical values.
- Classification predicts categories or class probabilities.

Examples:
- Regression: Predicting house prices.
- Classification: Predicting whether a transaction is fraudulent.

## 4. What is overfitting?

Overfitting occurs when a model learns training-specific
details or noise and does not generalize well to unseen data.

Ways to reduce it include regularization, cross-validation,
simplifying the model, and obtaining representative data.

## 5. What is underfitting?

Underfitting occurs when a model is too simple or too
constrained to capture important patterns.

Possible solutions include using a more suitable model,
improving features, or reducing excessive regularization.

## 6. What is the bias-variance trade-off?

- High bias: The model makes overly simplistic assumptions.
- High variance: The model is too sensitive to training data.

The goal is to balance both to obtain good generalization.

## 7. What is the difference between Linear and Logistic Regression?

- Linear Regression predicts continuous numerical values.
- Logistic Regression estimates class probabilities and is
  commonly used for classification.

## 8. What is regularization?

Regularization penalizes model complexity to help reduce
overfitting.

- L1 (Lasso): Can set coefficients exactly to zero.
- L2 (Ridge): Shrinks coefficients toward zero.
- Elastic Net: Combines L1 and L2 penalties.

## 9. What is the difference between a Decision Tree and Random Forest?

A Decision Tree makes predictions using a single tree.
Random Forest combines many trees using voting or averaging.

Random Forest often reduces variance but is generally
harder to interpret than one tree.

## 10. What is cross-validation?

Cross-validation evaluates a model over multiple train/validation
splits to estimate how well it may generalize.

In k-fold cross-validation, the data is divided into k folds.
Each fold is used for validation once, while the others are
used for training.

## 11. What is data leakage?

Data leakage occurs when training or model selection uses
information that would not legitimately be available at
prediction time.

It can produce misleadingly high evaluation scores.

Prevent leakage by splitting data appropriately and fitting
preprocessing steps only on the training portion of each split.

## 12. What is the difference between training and testing data?

- Training data: Used to fit the model.
- Validation data: Used to tune models and hyperparameters.
- Testing data: Used for final evaluation after model selection.

The test set should not guide repeated model tuning.

## 13. What is a confusion matrix?

A confusion matrix summarizes classification predictions
against actual labels.

For binary classification, it contains:
- True Positives (TP)
- True Negatives (TN)
- False Positives (FP)
- False Negatives (FN)

## 14. Explain accuracy, precision, recall, and F1-score.

- Accuracy: Correct predictions divided by all predictions.
- Precision: TP / (TP + FP).
- Recall: TP / (TP + FN).
- F1-score: Harmonic mean of precision and recall.

For imbalanced datasets, accuracy alone may be insufficient.

## 15. What is gradient descent?

Gradient descent is an optimization algorithm that updates
model parameters in the direction that reduces the objective
function, using its gradient and a learning rate.

## 16. What is feature scaling?

Feature scaling transforms numerical features to comparable
scales.

Common methods include:
- Standardization: Centers around mean zero and scales
  using standard deviation.
- Min-max scaling: Transforms values to a chosen range,
  often [0, 1].

Scaling is particularly useful for algorithms sensitive
to feature magnitudes, such as KNN and regularized models.

## 17. What is the difference between bagging and boosting?

- Bagging trains models on resampled datasets and combines
  their predictions; Random Forest is a common example.
- Boosting builds models sequentially, with later stages
  focusing on errors or residuals from earlier stages.

Gradient Boosting and AdaBoost are boosting methods.

## 18. What is a hyperparameter?

A hyperparameter is a setting chosen before or during model
selection rather than directly learned as an ordinary model
parameter during fitting.

Examples include max_depth, n_estimators, and learning_rate.

## 19. What is the difference between parameters and hyperparameters?

- Parameters are learned from training data, such as
  regression coefficients.
- Hyperparameters control the learning process or model
  structure, such as tree depth.

## 20. How do you choose a Machine Learning model?

1. Understand the business problem and target.
2. Inspect and clean the data.
3. Establish a simple baseline.
4. Choose suitable candidate algorithms.
5. Evaluate using appropriate metrics.
6. Tune using validation data or cross-validation.
7. Perform final evaluation on held-out test data.
8. Consider interpretability, latency, cost, and maintenance.

## Key Takeaway

Strong Machine Learning fundamentals require understanding
not only algorithms, but also evaluation, generalization,
data leakage, and the practical trade-offs behind model choice.
