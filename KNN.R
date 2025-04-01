# Predicting Personal Loan Acceptance using k-NN

# Load required libraries
library(gmodels)
library(caret)
library(class)
library(dplyr)

# Load dataset
ub.df <- read.csv("~/Downloads/UniversalBank.csv")

# Summary stats
summary(ub.df)

# Set seed for reproducibility
set.seed(1947)

# Partition data: 70% training, 30% testing
idx <- createDataPartition(y = ub.df$Personal.Loan, p = 0.7, list = FALSE)
train.df <- ub.df[idx, c("Age", "Experience", "Income", "Family", "CCAvg", "Education",
                         "Mortgage", "Securities.Account", "CD.Account", "Online", "CreditCard")]
test.df <- ub.df[-idx, c("Age", "Experience", "Income", "Family", "CCAvg", "Education",
                         "Mortgage", "Securities.Account", "CD.Account", "Online", "CreditCard")]
train_labels <- ub.df$Personal.Loan[idx]
test_labels <- ub.df$Personal.Loan[-idx]

# k-NN and confusion matrix for various k values
for (k in c(1, 3, 5, 7, 9)) {
  cat("\n\n🔎 k =", k, "\n")
  pred <- knn(train = train.df, test = test.df, cl = train_labels, k = k)
  CrossTable(x = test_labels, y = pred,
             prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,
             dnn = c('Actual', 'Predicted'))
}

# Classify a new customer with profile:
new.df <- data.frame(Age = 40, Experience = 10, Income = 84, Family = 2, CCAvg = 2,
                     Education = 2, Mortgage = 0, Securities.Account = 0,
                     CD.Account = 0, Online = 1, CreditCard = 1)

# Predict for new customer using best k = 9
prediction_new <- knn(train = train.df, test = new.df, cl = train_labels, k = 9)
cat("\nPrediction for new customer (k=9):", prediction_new)
