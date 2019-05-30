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
   customer_id char(20) PRIMARY KEY,
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
    customer_id char(20),
    FOREIGN KEY (breed) REFERENCES Animal_R2 (breed),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

/*create Table Dog(
    animal_id char(10) PRIMARY KEY,
    dewormed char(20),
    FOREIGN KEY (animal_id) REFERENCES Animal (animal_id) ON DELETE CASCADE);

create Table Cat(
    animal_id char(10) PRIMARY KEY,
    declawed char(20),
    FOREIGN KEY (animal_id) REFERENCES Animal (animal_id) ON DELETE CASCADE);

create Table Rabbit(
    animal_id char(10) PRIMARY KEY,
    overgrownteeth char(20),
    FOREIGN KEY (animal_id) REFERENCES Animal (animal_id) ON DELETE CASCADE);*/

create Table Room(
    room_id char(20) PRIMARY KEY,
    room_size integer);

create Table Doctor(
    doctor_id char(20) PRIMARY KEY,
    name char(20));

create Table Doctor_R2(
    doctor_id char(20),
    animal_id char(10) PRIMARY KEY,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id) ON DELETE CASCADE);

create Table Health_Status_Check (
    health_id char(20) PRIMARY KEY,
    vaccination char(20),
    allergies char(20),
    previous_diseases char(20),
    doctor_id char(20),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE);

create Table Drugs_Prescribes(
    name char(20),
    doctor_id char(20),
    dosage integer,
    PRIMARY KEY (name, doctor_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE);

create Table Checks (
    health_id char(20),
    doctor_id char(20),
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

CREATE TABLE Adopter(
    Customer_ID char(20) PRIMARY KEY,
    Preference char(30),
    FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_id) ON DELETE CASCADE
);

CREATE TABLE Donor(
    Customer_ID char(20) PRIMARY KEY,
    Reason char(30),
    FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_id) ON DELETE CASCADE
);

CREATE TABLE Administrator(
    AdminID char(20) PRIMARY KEY,
    Name char(20),
    Animal_ID char(20),
    FOREIGN KEY (Animal_id) REFERENCES Animal (animal_id) ON DELETE CASCADE
 );

CREATE TABLE Registers(
    AdminID char(20),
    Animal_ID char(20),
    Date_reg char(20),
    PRIMARY KEY(AdminID, Animal_ID),
    FOREIGN KEY (AdminID) REFERENCES Administrator (AdminID) ON DELETE CASCADE,
    FOREIGN KEY (Animal_id) REFERENCES Animal (animal_id) ON DELETE CASCADE
);

CREATE TABLE FoodOrders_R3(
    InvoiceNo integer,
    Type_Food char(20),
    PRIMARY KEY (InvoiceNo, Type_Food)   
);

CREATE TABLE FoodOrders_R2(
    InvoiceNo integer,
    Name char(20),
    Cost decimal,
    AdminID char(20),
    PRIMARY KEY (InvoiceNo, Name),
    FOREIGN KEY (AdminID) REFERENCES Administrator (AdminID) ON DELETE CASCADE
);

CREATE TABLE FoodOrders(
    Name char(20) PRIMARY KEY,
    Type_Food char(20),
    Nutrition char(30)
);
 
CREATE TABLE Viewing_Sets(
    ViewingID char(20) PRIMARY KEY,
    CustomerID char(20),
    Date_view char(20),
    FOREIGN KEY (CustomerID) REFERENCES Customer (customer_id) ON DELETE CASCADE
);