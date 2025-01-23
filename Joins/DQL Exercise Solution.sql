CREATE TABLE hospital_billing (
    patient_id INT PRIMARY KEY,
    patient_name NVARCHAR(100),
    admission_date DATE,
    discharge_date DATE,
    total_amount DECIMAL(10, 2),
    insurance_coverage DECIMAL(10, 2),
    payment_status NVARCHAR(50),
    room_type NVARCHAR(50),
    doctor_name NVARCHAR(100),
    nurse_name NVARCHAR(100)
);

INSERT INTO hospital_billing (patient_id, patient_name, admission_date, discharge_date, total_amount, insurance_coverage, payment_status, room_type, doctor_name, nurse_name)
VALUES
    (1, 'John Doe', '2023-01-05', '2023-01-10', 5000, 2500, 'Paid', 'Private', 'Dr. Smith', 'Nurse Johnson'),
    (2, 'Jane Smith', '2023-02-10', '2023-02-15', 7000, 4000, 'Paid', 'Semi-Private', 'Dr. Johnson', 'Nurse Brown'),
    (3, 'Michael Johnson', '2023-03-15', '2023-03-20', 6500, 3000, 'Unpaid', 'General', 'Dr. Miller', 'Nurse Martinez'),
    (4, 'Sarah Williams', '2023-04-20', '2023-04-25', 8500, 5000, 'Paid', 'Private', 'Dr. Davis', 'Nurse Thompson'),
    (5, 'Emily Brown', '2023-05-25', '2023-05-30', 5500, 3000, 'Unpaid', 'Semi-Private', 'Dr. Wilson', 'Nurse Harris'),
    (6, 'David Miller', '2023-06-30', '2023-07-05', 9000, 6000, 'Paid', 'General', 'Dr. Taylor', 'Nurse Rodriguez'),
    (7, 'Olivia Martinez', '2023-07-10', '2023-07-15', 7500, 3500, 'Paid', 'Private', 'Dr. Adams', 'Nurse Lee'),
    (8, 'Alexander Taylor', '2023-08-15', '2023-08-20', 6000, 2000, 'Unpaid', 'Semi-Private', 'Dr. Brown', 'Nurse Scott'),
    (9, 'Emma Thompson', '2023-09-20', '2023-09-25', 8000, 4500, 'Paid', 'General', 'Dr. Harris', 'Nurse Perez'),
    (10, 'Noah Wilson', '2023-10-25', '2023-10-30', 7200, 3000, 'Unpaid', 'Private', 'Dr. Wilson', 'Nurse King'),
    (11, 'Isabella Rodriguez', '2023-11-30', '2023-12-05', 6800, 3500, 'Paid', 'Semi-Private', 'Dr. Anderson', 'Nurse White'),
    (12, 'Ethan Lee', '2023-12-10', '2023-12-15', 5400, 2000, 'Unpaid', 'General', 'Dr. Martinez', 'Nurse Taylor'),
    (13, 'Sophia Scott', '2024-01-15', '2024-01-20', 9200, 5000, 'Paid', 'Private', 'Dr. Perez', 'Nurse Thomas'),
    (14, 'Mia Perez', '2024-02-20', '2024-02-25', 6300, 3000, 'Unpaid', 'Semi-Private', 'Dr. King', 'Nurse Hall'),
    (15, 'James King', '2024-03-25', '2024-03-30', 7800, 4500, 'Paid', 'General', 'Dr. White', 'Nurse Allen'),
    (16, 'Benjamin Hall', '2024-04-30', '2024-05-05', 6800, 3500, 'Unpaid', 'Private', 'Dr. Hall', 'Nurse Young'),
    (17, 'Abigail Allen', '2024-05-10', '2024-05-15', 7400, 4000, 'Paid', 'Private', 'Dr. Young', 'Nurse Adams'),
    (18, 'Ella Thomas', '2024-06-15', '2024-06-20', 5700, 3000, 'Paid', 'General', 'Dr. Adams', 'Nurse Perez'),
    (19, 'Jacob Young', '2024-07-20', '2024-07-25', 8900, 4500, 'Unpaid', 'Semi-Private', 'Dr. Perez', 'Nurse Wilson'),
    (20, 'Charlotte Adams', '2024-08-25', '2024-08-30', 6900, 3500, 'Paid', 'Private', 'Dr. Wilson', 'Nurse Miller');

UPDATE hospital_billing      --update total amount to get queried result
SET total_amount = 3500.00
WHERE patient_id = 12

--1 Retrieve the patient_id and patient_name for all records in the hospital billing dataset.
SELECT patient_id, patient_name
FROM hospital_billing;

--2 List the patient_id, total_fee, and date_of_admission for patients who have been admitted after '2024-07-15'.
SELECT patient_id, total_amount AS total_fee, admission_date AS date_of_admission
FROM hospital_billing
WHERE admission_date > '2024-07-15';

--3 Display the patient_id, patient_name, and doctor's_name for patients who have 'Dr. Wilson' as their doctor.
SELECT patient_id, patient_name, doctor_name
FROM hospital_billing
WHERE doctor_name = 'Dr. Wilson';

--4 Find the patient_id and total_fee for patients whose total_fee is greater than $7000.
SELECT patient_id, total_amount AS total_fee
FROM hospital_billing
WHERE total_amount > 7000;

--5 Show the patient_id, patient_name, and nurse_name for patients who have 'Nurse Miller' as their nurse.
SELECT patient_id, patient_name, nurse_name
FROM hospital_billing
WHERE nurse_name = 'Nurse Miller';

--6 List the patient_id, total_fee, and date_of_admission for patients admitted between '2024-07-20' and '2024-08-20'.
SELECT patient_id, total_amount AS total_fee, admission_date AS date_of_admission
FROM hospital_billing
WHERE admission_date BETWEEN '2024-07-20' AND '2024-08-20';

--7 Display the patient_id, patient_name, and total_fee for patients with 'Paid' status.
SELECT patient_id, patient_name, total_amount AS total_fee
FROM hospital_billing
WHERE payment_status = 'Paid';

--8 Retrieve the patient_id, patient_name, and medicenes_list for patients with 'Unpaid' status.
SELECT patient_id, patient_name  -- medicenes_list field not available in table 
FROM hospital_billing
WHERE payment_status = 'Unpaid';

--9 Show the patient_id, patient_name, and nurse_name for patients who have 'Nurse Perez' as their nurse and 'Dr. Adams' as their doctor.
SELECT patient_id, patient_name, nurse_name
FROM hospital_billing
WHERE nurse_name = 'Nurse Perez' AND doctor_name = 'Dr. Adams';

--10 Find the patient_id and total_fee for patients who have 'General' as their room type.
SELECT patient_id, total_amount AS total_fee
FROM hospital_billing
WHERE room_type = 'General';

--11 Display the patient_id, patient_name, and doctor's_name for patients who have a total_fee between $4000 and $6000.
SELECT patient_id, patient_name, doctor_name
FROM hospital_billing
WHERE total_amount BETWEEN 4000 AND 6000;

--12 List the patient_id, total_fee, and date_of_admission for patients who were admitted before '2024-07-10'.
SELECT patient_id, total_amount AS total_fee, admission_date
FROM hospital_billing
WHERE admission_date < '2024-07-10';

--13 Show the patient_id, patient_name, and nurse_name for patients with 'Semi-Private' room type.
SELECT patient_id, patient_name, nurse_name
FROM hospital_billing
WHERE room_type = 'Semi-Private';

--14 Retrieve the patient_id, total_fee, and date_of_admission for patients whose total_fee is less than $5000.
SELECT patient_id, total_amount AS total_fee, admission_date
FROM hospital_billing
WHERE total_amount < 5000;

--15 Display the patient_id, patient_name, and total_fee for patients with 'Private' room type.
SELECT patient_id, patient_name, total_amount AS total_fee
FROM hospital_billing
WHERE room_type = 'Private';

--16 Find the patient_id and total_fee for patients who have 'Paid' status and a total_fee greater than $6000.
SELECT patient_id, total_amount AS total_fee
FROM hospital_billing
WHERE payment_status = 'Paid' AND total_amount > 6000;

--17 Show the patient_id, patient_name, and nurse_name for patients who have 'Nurse Wilson' as their nurse and 'Dr. Perez' as their doctor.
SELECT patient_id, patient_name, nurse_name, doctor_name
FROM hospital_billing
WHERE nurse_name = 'Nurse Wilson' AND doctor_name = 'Dr. Perez';

--18 List the patient_id, total_fee, and date_of_admission for patients who were admitted after '2024-08-20'.
SELECT patient_id, (total_amount -insurance_coverage) AS total_fee, admission_date
FROM hospital_billing
WHERE admission_date > '2024-08-20';

--19 Display the patient_id, patient_name, and doctor's_name for patients with 'Unpaid' status and a total_fee less than $4000.
SELECT patient_id, patient_name, doctor_name
FROM hospital_billing
WHERE payment_status = 'Unpaid' AND total_amount < 4000;

--20 Retrieve the patient_id, patient_name, and nurse_name for patients who have 'Nurse Perez' as their nurse and a total_fee greater than $5000.
SELECT patient_id, patient_name, nurse_name
FROM hospital_billing
WHERE nurse_name = 'Nurse Perez' AND total_amount > 5000;
