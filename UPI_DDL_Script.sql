-- =====================================================================
-- UPI Transaction Anaysis
-- =====================================================================
-- Database
-- =====================================================================
CREATE DATABASE upi_analytics CHARACTER SET utf8mb4;
USE upi_analytics;
-- =====================================================================
-- 1. customer_master
-- =====================================================================
CREATE TABLE customer_master (
    customer_id       VARCHAR(15) NOT NULL,
    full_name         VARCHAR(100) NOT NULL,
    age               INT NOT NULL,
    gender            VARCHAR(10) NOT NULL,
    region            VARCHAR(20) NOT NULL,
    date_joined       DATE NOT NULL,
    is_business_user  BOOLEAN NOT NULL,
    risk_score        DECIMAL(3,2) NOT NULL,
    mobile_number     VARCHAR(15) NOT NULL,
    PRIMARY KEY (customer_id),
    UNIQUE (mobile_number)
) ENGINE=InnoDB;

-- =====================================================================
-- 2. device_info
-- =====================================================================
CREATE TABLE device_info (
    device_id    VARCHAR(15) NOT NULL,
    customer_id  VARCHAR(15) NOT NULL,
    device_type  VARCHAR(20) NOT NULL,
    app_version  VARCHAR(15) NOT NULL,
    is_rooted    BOOLEAN NOT NULL,
    last_active  DATETIME(6) NOT NULL,
    PRIMARY KEY (device_id),
    FOREIGN KEY (customer_id)
        REFERENCES customer_master (customer_id)
) ENGINE=InnoDB;

-- =====================================================================
-- 3. upi_account_details
-- =====================================================================
CREATE TABLE upi_account_details (
    upi_id        VARCHAR(50) NOT NULL,
    customer_id   VARCHAR(15) NOT NULL,
    bank_name     VARCHAR(30) NOT NULL,
    account_type  VARCHAR(30) NOT NULL,
    date_added    DATE NOT NULL,
    status        VARCHAR(15) NOT NULL,
    PRIMARY KEY (upi_id),
    FOREIGN KEY (customer_id)
        REFERENCES customer_master (customer_id)
) ENGINE=InnoDB;

-- =====================================================================
-- 4. merchant_info
-- =====================================================================
CREATE TABLE merchant_info (
    merchant_id    VARCHAR(15) NOT NULL,
    merchant_name  VARCHAR(100) NOT NULL,
    merchant_type  VARCHAR(50) NOT NULL,
    region         VARCHAR(20) NOT NULL,
    onboard_date   DATE NOT NULL,
    risk_score     DECIMAL(3,2) NOT NULL,
    PRIMARY KEY (merchant_id)
) ENGINE=InnoDB;

-- =====================================================================
-- 5. upi_transaction_history
-- =====================================================================
CREATE TABLE upi_transaction_history (
    transaction_id    VARCHAR(20) NOT NULL,
    upi_id            VARCHAR(50) NOT NULL,
    customer_id       VARCHAR(15) NOT NULL,
    `timestamp`       DATETIME(6) NOT NULL,
    amount            DECIMAL(12,2) NOT NULL,
    transaction_type  VARCHAR(30) NOT NULL,
    merchant_id       VARCHAR(15) NULL,
    counterparty_upi  VARCHAR(50) NOT NULL,
    status            VARCHAR(15) NOT NULL,
    device_id         VARCHAR(15) NOT NULL,
    device_type       VARCHAR(20) NOT NULL,
    channel           VARCHAR(20) NOT NULL,
    fraud_flag        BOOLEAN NOT NULL DEFAULT FALSE,
    reversal_flag     BOOLEAN NOT NULL DEFAULT FALSE,
    failure_reason    VARCHAR(100) NULL,

    PRIMARY KEY (transaction_id),

    FOREIGN KEY (upi_id)
        REFERENCES upi_account_details (upi_id),

    FOREIGN KEY (customer_id)
        REFERENCES customer_master (customer_id),

    FOREIGN KEY (merchant_id)
        REFERENCES merchant_info (merchant_id),

    FOREIGN KEY (device_id)
        REFERENCES device_info (device_id),

    INDEX idx_txn_timestamp (`timestamp`),
    INDEX idx_txn_status (status),
    INDEX idx_txn_fraud (fraud_flag)
) ENGINE=InnoDB;

-- =====================================================================
-- 6. customer_feedback_surveys
-- =====================================================================
CREATE TABLE customer_feedback_surveys (
    feedback_id         VARCHAR(20) NOT NULL,
    customer_id         VARCHAR(15) NULL,
    date_submitted      DATE NOT NULL,
    feedback_text       VARCHAR(500) NULL,
    satisfaction_score  TINYINT NOT NULL,
    issue_type          VARCHAR(50) NOT NULL,
    resolved            BOOLEAN NOT NULL,
    PRIMARY KEY (feedback_id),
    FOREIGN KEY (customer_id)
        REFERENCES customer_master (customer_id)
) ENGINE=InnoDB;

-- =====================================================================
-- 7. fraud_alert_history
-- =====================================================================
CREATE TABLE fraud_alert_history (
    alert_id         VARCHAR(20) NOT NULL,
    transaction_id   VARCHAR(20) NOT NULL,
    alert_type       VARCHAR(50) NOT NULL,
    alert_date       DATETIME(6) NOT NULL,
    resolved         BOOLEAN NOT NULL,
    resolution_date  DATETIME(6) NULL,
    remarks          VARCHAR(255) NULL,
    PRIMARY KEY (alert_id),
    FOREIGN KEY (transaction_id)
        REFERENCES upi_transaction_history (transaction_id)
) ENGINE=InnoDB;
-- =====================================================================
-- Verify tables
-- =====================================================================