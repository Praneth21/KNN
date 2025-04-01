# 🧠 Predicting Personal Loan Acceptance Using k-NN

**Tool:** R (caret, class, gmodels)  


---

## 🎯 Objective

Universal Bank is attempting to increase adoption of personal loans among its existing depositors. Only 9.6% accepted a loan during their last campaign. This project applies the k-Nearest Neighbors (k-NN) classification algorithm to predict which customers are most likely to accept a personal loan.

---

## 🗂️ Dataset Overview

- 📄 File: UniversalBank.csv
- 📊 5000 records
- 🧾 Key fields: Age, Income, Education, Mortgage, CD Accounts, Online Banking, etc.

---

## 🔍 Steps Performed

### 1️⃣ Data Summary
- Explored customer demographics
- Identified skew in income, spending, and mortgage balances

### 2️⃣ Data Partitioning
- 70% training (3500 records)
- 30% testing (1500 records)

### 3️⃣ k-NN Modeling
- Tried values of **k = 1, 3, 5, 7, 9**
- Measured accuracy with confusion matrix
- **Best k = 9** (Accuracy = 86.9%)

### 4️⃣ New Customer Classification
```r
Age = 40  
Experience = 10  
Income = $84K  
Family = 2  
CCAvg = 2  
Education = 2  
No Mortgage, Online Banking, Credit Card Holder  
#Prediction (k=9): ❌ Did not accept the loan
