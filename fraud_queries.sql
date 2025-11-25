-- 1. Overall fraud rate
SELECT 
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(100 * SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END) / COUNT(), 4) AS fraud_rate_percent
FROM transactions;

-- 2. Fraud rate by transaction type
SELECT 
    type,
    COUNT(*) AS total_txn,
    SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END) AS fraud_txn,
    ROUND(100 * SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END) / COUNT(), 4) AS fraud_rate_percent
FROM transactions
GROUP BY type
ORDER BY fraud_rate_percent DESC;

-- 3. Top 10 high-value fraud cases
SELECT 
    step,
    type,
    amount,
    nameOrig,
    oldbalanceOrg,
    newbalanceOrig
FROM transactions
WHERE isFraud = 1
ORDER BY amount DESC
LIMIT 10;
