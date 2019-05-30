create Table Customer_R1 (
   Postalcode char(6) PRIMARY KEY,
   City char(20),
   Province char(20)
);

create Table Customer_R2 (
   Name char(20) PRIMARY KEY,
   Birthdate char(20)
);

create Table Customer (
   customer_id char(10) PRIMARY KEY,
   name char(20),
   street char(20),
   postalcode char(6),
   FOREIGN KEY (Name) REFERENCES Customer_R2 (Name) ON DELETE CASCADE,
   FOREIGN KEY (postalcode) REFERENCES Customer_R1 (Postalcode) ON DELETE CASCADE
);


create table Animal_R2(
    breed char(20) PRIMARY KEY,
    hypoallergenic char(5));

create table Animal(
    animal_id char(10) PRIMARY KEY,
    name char(20),
    age integer,
    gender char(6),
    breed char(20),
    donation_date char(30),
    customer_id char(10),
    FOREIGN KEY (breed) REFERENCES Animal_R2 (breed),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

create Table Room(
    room_id char(20) PRIMARY KEY,
    room_size integer);

create Table Doctor(
    doctor_id char(10) PRIMARY KEY,
    name char(20));

create Table Doctor_R2(
    doctor_id char(10),
    animal_id char(10) PRIMARY KEY,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id) ON DELETE CASCADE);

create Table Health_Status_Check (
    health_id char(20) PRIMARY KEY,
    vaccination char(20),
    allergies char(20),
    previous_diseases char(20),
    doctor_id char(10),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE);

create Table Drugs_Prescribes(
    name char(20),
    doctor_id char(10),
    dosage integer,
    PRIMARY KEY (name, doctor_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE);

create Table Checks (
    health_id char(20),
    doctor_id char(10),
    animal_id char(10),
    PRIMARY KEY (health_id,doctor_id, animal_id),
    FOREIGN KEY (health_id) REFERENCES Health_Status_Check(health_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id) ON DELETE CASCADE);

create Table Stay_In (
    room_id char(20),
    animal_id char(10),
    PRIMARY KEY (room_id, animal_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id) ON DELETE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id) ON DELETE CASCADE);

CREATE TABLE Administrator(
    AdminID char(10) PRIMARY KEY,
    Name char(20),
    Animal_ID char(10),
    FOREIGN KEY (Animal_id) REFERENCES Animal (animal_id)
 );

CREATE TABLE Registers(
    AdminID char(10),
    Animal_ID char(10),
    Date_reg char(20),
    PRIMARY KEY(AdminID, Animal_ID),
    FOREIGN KEY (AdminID) REFERENCES Administrator (AdminID) ON DELETE CASCADE,
    FOREIGN KEY (Animal_id) REFERENCES Animal (animal_id) ON DELETE CASCADE
);

CREATE TABLE FoodOrders(
    InvoiceNo char(5),
    Type_Food char(10),
    Name char(10),
    Cost char(10),
    AdminID char(10),
    Nutrition char(10),
    PRIMARY KEY (InvoiceNo, Type_Food),
    FOREIGN KEY (AdminID) REFERENCES Administrator (AdminID) ON DELETE CASCADE
);
 
CREATE TABLE Viewing_Sets(
    ViewingID char(10) PRIMARY KEY,
    CustomerID char(10),
    Date_view char(10),
    FOREIGN KEY (CustomerID) REFERENCES Customer (customer_id) ON DELETE CASCADE
);