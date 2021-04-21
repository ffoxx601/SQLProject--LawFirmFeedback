CREATE DATABASE Law_Firm_Feedback; 
USE Law_Firm_Feedback; 

CREATE TABLE clients 
	(client_id INTEGER NOT NULL, 
    title ENUM('Mr', 'Mrs', 'Ms', 'Miss', 'Dr'),
	first_name VARCHAR(50), 
	last_name VARCHAR(50) NOT NULL, 
	company_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_clients PRIMARY KEY (client_id)
    );

CREATE TABLE clients_contact_details
	(client_id INTEGER NOT NULL, 
	email_address VARCHAR(50) NOT NULL, 
    phone_number VARCHAR(13) NOT NULL,
    CONSTRAINT FK_clients_contact_details FOREIGN KEY (client_id) REFERENCES clients (client_id)
    );

CREATE TABLE solicitors
	(solicitor_id INTEGER NOT NULL, 
    first_name VARCHAR(50), 
    last_name VARCHAR(50) NOT NULL, 
    job_title ENUM('trainee', 'newly qualified', 'associate', 'director', 'partner') NOT NULL, 
    department VARCHAR(50),
    CONSTRAINT PK_solicitors PRIMARY KEY (solicitor_id)
    );

CREATE TABLE cases 
	(case_id INTEGER NOT NULL, 
	client_id INTEGER NOT NULL, 
    solicitor_id INTEGER NOT NULL,
    cost DECIMAL(8,2),
    CONSTRAINT PK_cases PRIMARY KEY (case_id),
	CONSTRAINT FK_cases_1 FOREIGN KEY (client_id) REFERENCES clients (client_id),
	CONSTRAINT FK_cases_2 FOREIGN KEY (solicitor_id) REFERENCES solicitors (solicitor_id)
    );

CREATE TABLE feedback_solutions
	(feedback_category_id INTEGER NOT NULL,
    feedback_category VARCHAR(50) NOT NULL,
    response VARCHAR(50) NOT NULL,
    CONSTRAINT PK_feedback_solutions PRIMARY KEY (feedback_category_id)
    );
    
CREATE TABLE client_feedback
	(feedback_id INTEGER NOT NULL,
    case_id INTEGER NOT NULL, 
	rating INTEGER NOT NULL, 
	quoted_feedback VARCHAR(50), 
	feedback_category_id INTEGER NOT NULL, 
	feedback_form ENUM('written', 'verbal'),
    date_of_entry TIMESTAMP,
    CONSTRAINT PK_client_feedback PRIMARY KEY (feedback_id),
	CONSTRAINT FK_client_feedback_1 FOREIGN KEY (case_id) REFERENCES cases (case_id),
    CONSTRAINT FK_client_feedback_2 FOREIGN KEY (feedback_category_id) REFERENCES feedback_solutions (feedback_category_id) 
    );

    INSERT INTO clients
    VALUES 
    (1, 'Mrs', 'Emma', 'Brian', 'NC WorldWide'), 
    (2, 'Mr', 'Harry', 'Brian', 'NC WorldWide'), 
    (3, 'Miss', 'Rebecca', 'White', 'Green House'), 
    (4,'Mr', 'David', 'Alexander', 'Parker Pencils'), 
    (5, 'Dr', 'Diana', 'Woodhouse', 'DRN'), 
    (6, 'Ms', 'Jenna', 'Jackson', 'Teal Team'), 
    (7, 'Mr', 'Joseph', 'Houlden', 'The Investment Company'),
    (8, 'Ms', 'Lucy', 'Walkerson', 'Yanoo Co'),
    (9, 'Mr', 'Victor', 'Farnhall', 'The Country Estate Co'),
    (10, 'Miss', 'Ellen', 'Goodsmore', 'The Ethics & Goods Co'),
    (11, 'Mrs', 'Alex', 'Neal', 'Automotive Insurance'),
    (12, 'Mr', 'James', 'Jackson', 'DRN'),
    (13, 'Dr', 'Gabriella', 'Grant', 'Green House'),
    (14, 'Mr', 'Jacob', 'Wells', 'Spare Parts & Storage'),
    (15, 'Mr', 'Alex', 'Brown', 'Brown Services Co');
    
 INSERT INTO clients_contact_details
    VALUES 
    (1, 'embry@ncworld.com', '07127377335'),
    (2, 'harry.brian@ncworld.com', '07127374114'),
    (3, 'rebecca.white@greenh.co.uk', '07563325718'),
    (4, 'david.alexander@parkerpencils.com', '07645536211'),
    (5, 'diana.wood@drnservices.com', '07395426155'),
    (6, 'jenna.jackson@tealteam.co.uk', '07768146536'),
    (7, 'joehoulden@investmentsco.com', '07763785322'),
    (8, 'lucy.walkerson2@yanoono.co.uk', '07835253754'), 
    (9, 'victor.farnhall@thecountryest.co.uk', '02086600811'),
    (10, 'ellengoodsmore@ethicsandgoods.com', '07554568325'),
    (11, 'alex.neal14@automoinsure.co.uk', '07885473321'),
    (12, 'james.jackson@drnservices.com', '07866426543'),
    (13, 'gabriellagrant@greenhouse.co.uk', '07755443322'),
    (14, 'jacob.wells33@sparepartsandstore.co.uk', '02086608922'),
    (15, 'alexbrown@browns.com', '02077708933');
    
INSERT INTO solicitors
VALUES
(1, 'Gerald', 'Starmer', 'partner', 'commercial law'),
(2, 'Rachel', 'Parker', 'partner', 'intellectual property'),
(3, 'Tony', 'Blackwell', 'associate', 'employment law'),
(4, 'Ingrid', 'Marshall', 'newly qualified', 'intellectual property'),
(5, 'Delia', 'Barnes', 'associate', 'banking'),
(6, 'Daniel', 'Baker', 'partner', 'real estate law'),
(7, 'Alice', 'Fox', 'director', 'real estate law'),
(8, 'Tom', 'Ridge', 'newly qualified', 'intellectual property'),
(9, 'Jacob', 'Farmer', 'associate', 'banking'),
(10, 'Grace', 'West', 'associate', 'commercial law'),
(11, 'Shannon', 'Rest', 'newly qualified', 'employment law'),
(12, 'James', 'Honeywell', 'partner', 'employment law');

INSERT INTO cases
VALUES
(1, 4, 6, 10140),
(2, 15, 6, 22520),
(3, 13, 4, 2030),
(4, 8, 12, 3900),
(5, 13, 4, 1040),
(6, 1, 2, 55000),
(7, 2, 10, 14000),
(8, 7, 12, 15433),
(9, 10, 3, 2100),
(10, 11, 3, 5600),
(11, 15, 5, 12100),
(12, 14, 1, 18700),
(13, 6, 1, 1020),
(14, 3, 5, 14500),
(15, 2, 6, 3000),
(16, 5, 7, 45150),
(17, 9, 11, 33000),
(18, 10, 10, 5400),
(19, 4, 5, 35600),
(20, 12, 11, 12500),
(21, 1, 3, 13450),
(22, 3, 9, 4670),
(23, 8, 6, 5670),
(24, 7, 4, 11900),
(25, 2, 4, 1230);

INSERT INTO feedback_solutions
VALUES
(1, 'too high cost', 'offer 10% discount'),
(2, 'lack of communication', 'contact client to apologise'),
(3, 'undesired case result', 'contact client to discuss'),
(4, 'uncontactable', 'contact client to apologise'),
(5, 'lack of legal knowledge', 'consider staff training'),
(6, 'lack of business knowledge', 'consider staff training'),
(7, 'positive feedback', 'thank client and ask if can use in marketing');

INSERT INTO client_feedback
VALUES 
(1, 1, 2.5, 'TERRIBLE SERVICE!!!!', 2, 'written', '2020-11-02 10:10:10'),
(2, 2, 3, 'solicitor uncontactable', 4, 'written', '2020-10-02 10:10:10'),
(3, 3, 4, 'unexpected additional cost, disappointing', 1, 'verbal', '2020-07-10 10:10:10'),
(4, 4, 9, 'great service', 7, 'verbal', '2020-09-21 10:10:10'),
(5, 6, 10, 'exceptional work, thank you', 7, 'written', '2020-10-27 10:10:10'),
(6, 8, 1, 'could not contact solicitor', 4, 'verbal', '2020-11-01 10:10:10'),
(7, 12, 8, 'great, knowledgable solicitors', 7, 'written', '2018-11-20 10:10:10'),
(8, 15, 2, 'solicitor disappeared for a month', 4, 'verbal', '2020-10-06 10:10:10'),
(9, 23, 4, 'confusing information provided', 2, 'verbal','2020-11-15 10:10:10'),
(10, 17, 9, 'real business knowledge and valuable advice', 7, 'written', '2020-11-12 10:10:10'),
(11, 20, 10, 'exceptional legal knowledge', 7, 'written', '2020-11-13 10:10:10'),
(12, 18, 1, 'WHY DID WE LOSE??!', 3, 'written', '2020-09-16 10:10:10');
 
 SELECT * 
 FROM clients;
 
 SELECT * 
 FROM clients_contact_details;
 
 SELECT * 
 FROM solicitors;
 
 SELECT * 
 FROM cases;
 
 SELECT * 
 FROM feedback_solutions;
 
 SELECT * 
 FROM client_feedback;
 
 -- view (uses at least 3-4 base tables): see ratings for each solicitor without seeing client name or case number for anonymity.  
CREATE VIEW Solicitor_Ratings
AS SELECT solicitors.first_name, solicitors.last_name, client_feedback.rating
FROM cases
JOIN solicitors ON solicitors.solicitor_id = cases.solicitor_id
JOIN client_feedback ON client_feedback.case_id = cases.case_id;
 
SELECT * 
FROM Solicitor_Ratings;

-- query with GROUP BY and HAVING: see which solicitors have the lowest average rating out of 10
SELECT last_name, ROUND(AVG(rating), 0)
FROM Solicitor_Ratings
GROUP BY last_name
HAVING AVG(rating) <= 5;

 -- query with GROUP BY and HAVING: see which solicitors have more than 2 client feedback entries
SELECT last_name, COUNT(*)
FROM Solicitor_Ratings
GROUP BY last_name 
HAVING COUNT(*) >= 2;

-- Stored Procedure: add in a new feedback entry from an existing client on an existing case
DELIMITER //
CREATE PROCEDURE New_Feedback_Entry(
IN 	feedback_id INTEGER,
IN  case_id INTEGER, 
IN 	rating INTEGER, 
IN  quoted_feedback VARCHAR(50), 
IN	feedback_category_id INTEGER, 
IN	feedback_form ENUM('written', 'verbal'))
BEGIN 

INSERT INTO client_feedback (feedback_id, case_id, rating, quoted_feedback, feedback_category_id, feedback_form)
VALUES (feedback_id, case_id, rating, quoted_feedback, feedback_category_id, feedback_form);

END//

CALL New_Feedback_Entry (13, 5, 3, 'Poor communication throughout case', '2', 'written');

SELECT *
FROM client_feedback;
​
DROP PROCEDURE New_Feedback_Entry;

-- create a trigger: ensure all data on the form of the feedback (feedback_form - written or verbal) is in lowercase
DELIMITER //

CREATE TRIGGER feedback_form_before_insert
BEFORE INSERT ON client_feedback
FOR EACH ROW
BEGIN
SET NEW.feedback_form = LOWER(NEW.feedback_form);

END//

-- stored function: identify whether client feedback is good, bad or neutral and then collect all the bad feedback
DELIMITER //

CREATE FUNCTION reviewing_type_of_feedback(
rating INTEGER
)
RETURNS VARCHAR(7)
DETERMINISTIC
BEGIN 
	DECLARE type_of_feedback VARCHAR(7);
    IF rating > 6 THEN 
    SET type_of_feedback = 'GOOD';
    ELSEIF (rating > 4 AND rating <= 6) THEN
    SET type_of_feedback = 'NEUTRAL';
    ELSEIF rating <=4 THEN
    SET type_of_feedback = 'BAD';
    END IF;
    RETURN (type_of_feedback);
    END //
    DELIMITER ;

SELECT feedback_id, quoted_feedback, reviewing_type_of_feedback(rating) AS type_of_feedback FROM client_feedback;

SELECT quoted_feedback, reviewing_type_of_feedback(rating)
FROM client_feedback
WHERE reviewing_type_of_feedback(rating) = 'BAD';

-- prepare an example query with a subquery: see which solicitors are working on the highest costing cases
SELECT solicitor_id, first_name, last_name, job_title
FROM solicitors 
WHERE solicitor_id
IN
(SELECT solicitor_id FROM cases WHERE cost > 30000.00); 

-- create an event: if feedback is over 30 days old, set 'review now' column to 'yes' so that the feedback is reviewed
ALTER TABLE client_feedback
ADD COLUMN review_due ENUM('YES', 'NO');

DROP EVENT Review_Now;
DELIMITER //

CREATE EVENT Review_Now
ON SCHEDULE EVERY 1 MINUTE 
STARTS NOW()
DO BEGIN
UPDATE client_feedback SET review_due = 'YES' WHERE date_of_entry < DATE_SUB(NOW(), INTERVAL 30 DAY);
END//

SELECT * 
FROM client_feedback;
