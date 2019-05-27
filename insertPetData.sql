/*Insert data into Animal_R2 table*/

insert into Animal_R2 values
('Corgi', 'No');

insert into Animal_R2 values
('Siamese', 'No');

insert into Animal_R2 values
('Schnauzer', 'Yes');

insert into Animal_R2 values
('English Lop', 'Yes');

insert into Animal_R2 values
('Bobtail', 'Yes');

/*Insert data into Animal table*/

insert into Animal values
('1', 'Cheddar', 3, 'Male', 'Corgi', 'May 1, 2019');

insert into Animal values
('2', 'Biscuit', 5, 'Female', 'Siamese', 'May 2, 2019');

insert into Animal values
('3', 'Buddy', 5, 'Male', 'Schnauzer', 'May 3, 2019');

insert into Animal values
('4', 'Hoppy', 3, 'Female', 'English Lop', 'May 5, 2019');

insert into Animal values
('5', 'Luna', 3, 'Female', 'Schnauzer', 'May 3, 2019');

insert into Animal values
('6', 'Happy', 3, 'Male', 'Siamese', 'May 1, 2019');

insert into Animal values
('7', 'Toast', 5, 'Female', 'English Lop', 'May 2, 2019');

insert into Animal values
('8', 'Bud', 9, 'Male', 'Siamese', 'May 3, 2019');

insert into Animal values
('9', 'Bouncer', 8, 'Male', 'English Lop', 'May 9, 2019');

insert into Animal values
('10', 'Teddy', 8, 'Male', 'Corgi', 'May 25, 2019');

insert into Animal values
('11', 'Lily', 8, 'Male', 'Schnauzer', 'May 21, 2019');

insert into Animal values
('12', 'Charlie', 8, 'Male', 'Siamese', 'May 21, 2019');

insert into Animal values
('13', 'Tabby', 8, 'Male', 'Siamese', 'May 23, 2019');

insert into Animal values
('14', 'Carrot', 8, 'Female', 'English Lop', 'May 23, 2019');

insert into Animal values
('15', 'Peanut', 8, 'Male', 'English Lop', 'May 23, 2019');

insert into Animal values
('16', 'Berry', 8, 'Female', 'English Lop', 'May 23, 2019');

/*Insert data into Dog table*/

insert into Dog values
('1', 'False');

insert into Dog values
('3', 'True');

insert into Dog values
('5', 'True');

insert into Dog values
('10', 'False');

insert into Dog values
('11', 'True');

/*Insert data into Cat table*/

insert into Cat values
('2', 'False');

insert into Cat values
('6', 'True');

insert into Cat values
('8', 'True');

insert into Cat values
('12', 'False');

insert into Cat values
('13', 'True');

/*Insert data into Rabbit table*/

insert into Rabbit values
('4', 'False');

insert into Rabbit values
('7', 'True');

insert into Rabbit values
('14', 'True');

insert into Rabbit values
('15', 'False');

insert into Rabbit values
('16', 'True');

/*Insert data into Room table*/
insert into Room values
('1', 5);

insert into Room values
('2', 3);

insert into Room values
('3', 2);

insert into Room values
('4', 1);

insert into Room values
('5', 10);

/*Insert data into Doctor table*/
insert into Doctor values
('1', 'Aaron');

insert into Doctor values
('2', 'Abby');

insert into Doctor values
('3', 'Bear');

insert into Doctor values
('4', 'Brooklyn');

insert into Doctor values
('5', 'Chelsea');

/*Insert data into Doctor_R2 table*/
insert into Doctor_R2 values
('1', '1');

insert into Doctor_R2 values
('2', '2');

insert into Doctor_R2 values
('3', '3');

insert into Doctor_R2 values
('1', '4');

insert into Doctor_R2 values
('2', '5');

/*Insert data into Health_Status_Check table*/
insert into Health_Status_Check values
('1', 'Yes', 'No', 'Dry Eyes', '1');

insert into Health_Status_Check values
('2', 'Yes', 'No', 'Dry Eyes', '1');

insert into Health_Status_Check values
('3', 'No', 'No', 'Dry Eyes', '1');

insert into Health_Status_Check values
('4', 'Yes', 'Yes', 'Iris Cyst', '3');

insert into Health_Status_Check values
('5', 'No', 'No', 'Not Applicable', '3');

/*Insert data into Drugs_Prescribes table*/
insert into Drugs_Prescribes values
('Acepromazine', '5', 2);

insert into Drugs_Prescribes values
('Baytril', '2', 10);

insert into Drugs_Prescribes values
('Capstar', '2', 5);

insert into Drugs_Prescribes values
('Doxycycline', '5', 2);

insert into Drugs_Prescribes values
('Ephedrine', '1', 20);

/*Insert data into Checks table*/
insert into Checks values
('1', '1', '1');

insert into Checks values
('2', '2', '2');

insert into Checks values
('3', '3', '3');

insert into Checks values
('4', '4', '4');

insert into Checks values
('5', '5', '5');

/*Insert data into Stay_In table*/
insert into Stay_In values
('1', '5');

insert into Stay_In values
('1', '6');

insert into Stay_In values
('2', '9');

insert into Stay_In values
('2', '5');

insert into Stay_In values
('3', '7');

commit work;