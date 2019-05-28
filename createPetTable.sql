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

create Table Dog(
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
    FOREIGN KEY (animal_id) REFERENCES Animal (animal_id) ON DELETE CASCADE);

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
