DELETE FROM BILL;
DELETE FROM BOOKING;
DELETE FROM ROOM;
DELETE FROM HOTEL;
DELETE FROM USER;

INSERT INTO USER (ROLE, LOGIN, PASSWORD)
VALUES ('ADMIN', 'Luther', '1234');
INSERT INTO USER (ROLE, LOGIN, PASSWORD)
VALUES ('USER', 'David', 'qwer');
INSERT INTO USER (ROLE, LOGIN, PASSWORD)
VALUES ('USER', 'Sarah', 'asdf');
INSERT INTO HOTEL (NAME, LOCATION, LUXURY)
VALUES ('Dolphin', 'New York', 4);
INSERT INTO ROOM (HOTEL_ID, NUM_OF_GUESTS, PRICE_PER_NIGHT, CLASS)
VALUES (
        (SELECT ID FROM HOTEL WHERE NAME = 'Dolphin'),
        2,
        250,
        'LUX'
        );
INSERT INTO ROOM (HOTEL_ID, NUM_OF_GUESTS, PRICE_PER_NIGHT, CLASS)
VALUES (
        (SELECT ID FROM HOTEL WHERE NAME = 'Dolphin'),
        2,
        180,
        'STANDART'
        );
INSERT INTO ROOM (HOTEL_ID, NUM_OF_GUESTS, PRICE_PER_NIGHT, CLASS)
VALUES (
        (SELECT ID FROM HOTEL WHERE NAME = 'Dolphin'),
        2,
        120,
        'ECONOMY'
        );
INSERT INTO BOOKING (ROOM_ID, START_DATE, END_DATE)
VALUES (
        (SELECT ID FROM ROOM WHERE PRICE_PER_NIGHT = 180),
        '2019-04-05',
        '2019-04-07'
        );
INSERT INTO BOOKING (ROOM_ID, START_DATE, END_DATE)
VALUES (
        (SELECT ID FROM ROOM WHERE PRICE_PER_NIGHT = 250),
        '2019-05-04',
        '2019-05-06'
        );
INSERT INTO BOOKING (ROOM_ID, START_DATE, END_DATE)
VALUES (
        (SELECT ID FROM ROOM WHERE PRICE_PER_NIGHT = 250),
        '2019-04-03',
        '2019-04-07'
        );
INSERT INTO BILL (USER_ID, BOOKING_ID, STATUS)
VALUES (
        (SELECT ID FROM USER WHERE LOGIN = 'David'),
        (SELECT ID FROM BOOKING WHERE START_DATE = '2019-04-05'),
        'PAID'
        );
INSERT INTO BILL (USER_ID, BOOKING_ID, STATUS)
VALUES (
        (SELECT ID FROM USER WHERE LOGIN = 'Sarah'),
        (SELECT ID FROM BOOKING WHERE START_DATE = '2019-05-04'),
        'PAID'
        );
INSERT INTO BILL (USER_ID, BOOKING_ID, STATUS)
VALUES (
        (SELECT ID FROM USER WHERE LOGIN = 'Sarah'),
        (SELECT ID FROM BOOKING WHERE START_DATE = '2019-04-03'),
        'UNPAID'
        );
SELECT * from BOOKING;
SELECT * from BILL;
SELECT * from USER;
SELECT * from ROOM;
SELECT * from HOTEL;

