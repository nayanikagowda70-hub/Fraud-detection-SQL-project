# Fraud Detection Using SQL

This project explores patterns of fraudulent behaviour within an online payments dataset using SQL.  
The objective was to analyse transaction activity, identify high-risk behaviours, and generate insights that may help prevent financial fraud.

The analysis was carried out in MySQL Workbench using a sample of 40,000 transaction records.

---

## 🔍 Project Goals

- Investigate transaction behaviour across different payment types
- Detect unusual or suspicious activity
- Measure the proportion of fraudulent transactions
- Highlight accounts and transaction patterns that require attention

---

## 🗂️ Dataset Information

The dataset includes the following fields:

- step (hour of simulation)
- type (TRANSFER, CASH_OUT, PAYMENT, etc.)
- amount
- account origin and destination balances
- fraud indicators (isFraud and isFlaggedFraud)

Source: Online payments fraud dataset (publicly available)

---

## ✅ Key SQL Queries Used

---

### 1️⃣ Overall fraud rate

```sql
SELECT
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(100 * SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END) / COUNT(), 4) AS fraud_rate_percent
FROM transactions;
```

---

### 2️⃣ Fraud rate by transaction type

```sql
SELECT 
    type,
    COUNT(*) AS total_txn,
    SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END) AS fraud_txn,
    ROUND(100 * SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END) / COUNT(), 4) AS fraud_rate_percent
FROM transactions
GROUP BY type
ORDER BY fraud_rate_percent DESC;
```

---

### 3️⃣ Top high-value confirmed fraud transactions

```sql
SELECT 
    step,
    type,
    amount,
    nameOrig,
    oldbalanceOrg,
    newbalanceOrig
FROM transactions
WHERE isFraud = 1
    AND newbalanceDest = 0
    AND amount > 0
ORDER BY amount DESC
LIMIT 10;
```
## 📌 Project Screenshots

### ✅ Schema & Table
![Schema](schema_table.png)

### ✅ Overall Fraud Rate
![Overall Fraud Rate](screenshots overall_fraud_rate.png)

### ✅ Fraud Rate by Transaction Type
![Fraud Rate by Type](Screenshot Fraud rate by transaction type.png)

### ✅ Top 10 High-Value Fraud Cases
![High Value Fraud](Screenshot Top 10 high-value fraud cases.png)


