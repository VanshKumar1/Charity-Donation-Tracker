-- schema.sql
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role ENUM('donor', 'admin') DEFAULT 'donor'
);

CREATE TABLE Campaigns (
    campaign_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    goal_amount DECIMAL(10,2),
    raised_amount DECIMAL(10,2) DEFAULT 0.0,
    start_date DATE,
    end_date DATE,
    status ENUM('active', 'closed') DEFAULT 'active'
);

CREATE TABLE Donations (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    campaign_id INT,
    amount DECIMAL(10,2),
    date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (campaign_id) REFERENCES Campaigns(campaign_id)
);

CREATE TABLE Receipts (
    receipt_id INT AUTO_INCREMENT PRIMARY KEY,
    donation_id INT,
    issue_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    receipt_link VARCHAR(255),
    FOREIGN KEY (donation_id) REFERENCES Donations(donation_id)
);
