DROP TABLE visits; --remove visits table if it exists already--
                   --table with foreign key must be dropped first--
DROP TABLE dogs; --remove dogs table if it exists already--
CREATE TABLE dogs ( --create 'dogs' table--
	ID          integer AUTO_INCREMENT PRIMARY KEY, --ID for dog that fills with the next available value--
	Breed       char(20), --breed of the dog--
	Name        char(20) ); --name of the dog--
--insert 5 dogs into 'dogs' table--
--I tried to list all of the data under one 'INSERT INTO' command but I couldn't get it to work--
INSERT INTO dogs (Breed, Name) 
    VALUES('Dachshund','Frankie');
INSERT INTO dogs (Breed, Name)
	VALUES('Dachshund','Pepper');
INSERT INTO dogs (Breed, Name)
	VALUES('Black Lab','Jill');
INSERT INTO dogs (Breed, Name)
	VALUES('Great Pyrenees','Magic');
INSERT INTO dogs (Breed, Name)
	VALUES('Italian Greyhound','Kermit');
DESCRIBE dogs; --show the columns and information about them in 'dogs' table--
SELECT * FROM dogs; --show all the data in 'dogs' table--
CREATE TABLE visits ( --create the visits table--
	Visit_ID        integer AUTO_INCREMENT PRIMARY KEY, --unique ID for the visit--
	The_Date        date, --date of the visit--
	Dog_ID          integer, --ID of the dog--
	FOREIGN KEY (Dog_ID) REFERENCES dogs (ID) ); --dog ID points to ID in 'dogs' table--
--insert dates for different visits in 'visits' table--	
INSERT INTO visits (Dog_ID, The_Date) 
    VALUES((SELECT ID FROM dogs WHERE Name='Frankie'), '2019-03-15');
INSERT INTO visits (Dog_ID, The_Date) 
    VALUES((SELECT ID FROM dogs WHERE Name='Pepper'), '2019-04-16');
INSERT INTO visits (Dog_ID, The_Date) 
    VALUES((SELECT ID FROM dogs WHERE Name='Frankie'), '2019-10-18');
INSERT INTO visits (Dog_ID, The_Date) 
    VALUES((SELECT ID FROM dogs WHERE Name='Magic'), '2019-09-10');
INSERT INTO visits (Dog_ID, The_Date) 
    VALUES((SELECT ID FROM dogs WHERE Name='Kermit'), '2019-06-08');
INSERT INTO visits (Dog_ID, The_Date) 
    VALUES((SELECT ID FROM dogs WHERE Name='Jill'), '2019-05-05');
INSERT INTO visits (Dog_ID, The_Date) 
    VALUES((SELECT ID FROM dogs WHERE Name='Pepper'), '2019-10-10');
INSERT INTO visits (Dog_ID, The_Date) 
    VALUES((SELECT ID FROM dogs WHERE Name='Magic'), '2019-04-06');
DESCRIBE visits; --show columns in 'visits' table and information about them--
SELECT * FROM visits; --show all data in 'visits' table--
ALTER TABLE visits 
	ADD timeov time; --add time of visit column to 'visits' table--
--set time of visit column where specified visit ID is--
UPDATE visits SET 
	timeov = '9:18' WHERE Visit_ID='1';
UPDATE visits SET 
	timeov = '10:30' WHERE Visit_ID='2';
UPDATE visits SET 
	timeov = '12:05' WHERE Visit_ID='3';
UPDATE visits SET 
	timeov = '5:00' WHERE Visit_ID='4';
UPDATE visits SET
	timeov = '10:10' WHERE Visit_ID='8';
SELECT * FROM visits; --show all data in 'visits' table--
	
	
