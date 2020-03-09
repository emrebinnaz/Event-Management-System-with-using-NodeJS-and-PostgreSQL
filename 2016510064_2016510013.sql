    CREATE TABLE Category
	(
		"Name" text not null UNIQUE,
		"Id" serial not null,
		"isDeleted" boolean default false,
		CONSTRAINT pk_category PRIMARY KEY ("Id")
	);
	INSERT INTO Category
	values('Education');
	INSERT INTO Category
	values('Seminar');
	INSERT INTO Category
	values('Sport');
	INSERT INTO Category
	values('Science');
	INSERT INTO Category
	values('Meeting');
	INSERT INTO Category
	values('Competition');

	select * from Category
	drop table Category
	
	CREATE TABLE Organizators(
		"Username" text not null,
		"Password" text not null,
		"Name" text not null,
		"Lastname" text not null,
		"Phone" text not null,
		"Email" text not null,
		"Address" text not null,
		"BirthDate" date not null,
		"isSuperAdmin" boolean default false,
		"DeleteDate" date default null,
		CONSTRAINT pk_organizator PRIMARY KEY ("Username")		
	);
	INSERT INTO Organizators
	values('tahakoldamca','tkoldamca','Taha','Koldamca','076446885','taha@example.com','İzmir Buca','16-10-1997',true);
	INSERT INTO Organizators
	values('emrebinnaz','ebinnaz','Emre','Binnaz','076446886','emre@example.com','İzmir Buca Adatepe Mahallesi','21-06-1997',true);
	INSERT INTO Organizators
	values('deniztayfur','dtayfur','Deniz','Tayfur','076446889','deniz@example.com','Ankara Etimesgut','9-10-1998',true);
	INSERT INTO Organizators
	values('nazmiguzel','nguzel','Nazmi','Guzel','076446887','nazmi@example.com','Hatay Antakya','6-10-1994');
	INSERT INTO Organizators
	values('furkanguneysu','fguneysu','Furkan','Guneysu','076446888','furkan@example.com','Mersin Merkez','2-2-1992');
	INSERT INTO Organizators
	values('saracetinoluk','scetinoluk','Şara','Çetinoluk','076446899','sara@example.com','Turgutlu Merkez','5-2-1992');
	
	select * from Organizators
	drop table Organizators
		
	Create Table Events(
	"Name" text NOT NULL,
  	"Organizator_Username" text NOT NULL,
  	"Address" text NOT NULL,
  	"Price" integer NOT NULL,
  	"Discount" integer NOT NULL,
  	"StartDate" date NOT NULL,
  	"EndDate" date NOT NULL,
	check ("EndDate">="StartDate"),
  	"City" text NOT NULL,
  	"Quota" integer NOT NULL,	
  	"Category_Id" integer NOT NULL,
	"PeopleCount" integer default 0,
	check("Quota">="PeopleCount"),
	"Id" serial NOT NULL,
	"isDeleted" boolean default false,
  	CONSTRAINT pk_event PRIMARY KEY ("Id"),
  	CONSTRAINT "fk_event_category" FOREIGN KEY ("Category_Id")
    REFERENCES Category ("Id") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
  	CONSTRAINT "fk_event_organizators" FOREIGN KEY ("Organizator_Username")
    REFERENCES Organizators ("Username") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
	);	
	INSERT INTO Events
	values('Yapay Zeka Kampı','emrebinnaz','İzmir Bayraklı',100,0,'13-11-2019','15-11-2019','İzmir',50,
	1);
	INSERT INTO Events
	values('Java 101','deniztayfur','Düzce Merkez',25,0,'9-10-2019','10-10-2019','Düzce',81,
	1);
	INSERT INTO Events
	values('Kaynaklar Yürüyüşü','tahakoldamca','Buca Kaynaklar',10,0,'2-10-2019','6-10-2019','İzmir',30,
	3);
	INSERT INTO Events
	values('Siber Güvenlik Konferansı','nazmiguzel','Buca DEÜ Tınaztepe Yerleşkesi',50,10,'5-11-2019','9-11-2019','İzmir',200,
	2);
	INSERT INTO Events
	values('Uzmanlarla Tech Talk Haftası','emrebinnaz','Buca Depark Binası',0,0,'12-10-2019','19-10-2019','İzmir',150,
	4);
	INSERT INTO Events
	values('Ödüllü Kod Yarışması','deniztayfur','Ankara ODTU',20,0,'12-5-2020','12-5-2020','Ankara',75,
	6);
	INSERT INTO Events
	values('BMO İzmir Üye Toplantısı','furkanguneysu','İzmir Konak',0,0,'30-4-2020','30-4-2020','İzmir',100,
	5);
	
	select* from Events
	drop table Events
	
	CREATE TABLE People
	(
		"Name" text NOT NULL,
		"Lastname" text NOT NULL,
		"Username" text UNIQUE default null,
		"Password" text default null,
		"EventCount" integer default 0,
		"Phone" text NOT NULL,
		"Email" text NOT NULL,
		"Address" text NOT NULL,
		"BirthDate" date NOT NULL,
		"DeleteDate" date,
		"Id" serial NOT NULL,
		CONSTRAINT pk_people PRIMARY KEY ("Id")
	);
	INSERT INTO People
	values('Görkem','Akman','gorkem','1234',0,'123456','grkm@example.com','İzmir','21-06-1998');
	INSERT INTO People
	values('Melisa','Şahin','melisa','777',0,'123457','mls@example.com','Düzce','07-08-1997');
	INSERT INTO People
	values('Ece','Şahin','ece','444',0,'123458','ece@example.com','Düzce','23-02-2000');
	INSERT INTO People
	values('Özlem','Coşkun','özlem','555',0,'123459','ozlm@example.com','İstanbul','14-08-1997');
	INSERT INTO People
	values('Sıla','Kılınç',null,null,0,'12345','sıla@example.com','Kırşehir','03-04-1998');
	INSERT INTO People
	values('Zehra','Özdemir',null,null,0,'12346','zehra@example.com','Çorum','04-07-1997');
	INSERT INTO People
	values('Barış','Tayfur',null,null,0,'12347','barıs@example.com','İzmit','17-01-1991');
	
	select * from People
	drop table People
	select * from PeopleInEvents
	CREATE TABLE PeopleInEvents(
		"E_Id" int NOT NULL,
		"P_Id" int NOT NULL,
		"SoldDate" Date NOT NULL,
		"TempVisitor_Id" text,
		"isPay" boolean default false,
		"PaymentAmount" int default 0,
		CONSTRAINT pks PRIMARY KEY ("E_Id","P_Id"),
		CONSTRAINT fk_pinevents1 FOREIGN KEY ("E_Id")
        REFERENCES Events ("Id")  MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT fk_pinevents2 FOREIGN KEY ("P_Id")
		REFERENCES People ("Id") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
 	);
	--visitorsinevents
	INSERT INTO PeopleInEvents
	values(1,5,'11-11-2019');
	INSERT INTO PeopleInEvents
	values(1,6,'11-11-2019');
	INSERT INTO PeopleInEvents
	values(4,7,'03-11-2019');
	--membersinevents
	INSERT INTO PeopleInEvents
	values(4,1,'03-11-2019');
	INSERT INTO PeopleInEvents
	values(4,2,'02-11-2019');
	INSERT INTO PeopleInEvents
	values(2,3,'05-10-2019');
	INSERT INTO PeopleInEvents
	values(2,4,'08-10-2019');
	INSERT INTO PeopleInEvents
	values(5,2,'10-10-2019');
	INSERT INTO PeopleInEvents
	values(3,2,'01-10-2019');
	INSERT INTO PeopleInEvents
	values(3,3,'01-10-2019');
	
	delete from PeopleInEvents 
	select * from PeopleInEvents
	drop table PeopleInEvents 

	CREATE TABLE Logins(
		"Username" text ,
		"Name" text not null,
		"Lastname" text not null,
		"Id"       text not null,
		"TempVisitor_Id" text,
		"EnteringDate" text not null
	);
	drop table Logins

	--Views
	
	CREATE OR REPLACE VIEW EventsView AS SELECT Events."Id" as E_Id,Events."Name",Events."Address",Events."Price",Events."Discount",Events."StartDate",Events."EndDate",Events."City",
	Category."Name" as c_name
	from Events inner join Category on Events."Category_Id"=Category."Id"
	where Events."isDeleted"=false and Events."Quota">Events."PeopleCount" and Events."StartDate">=now();
	select * from Events
	Select *from EventsView 
	drop view ems."EventsView"
	
	CREATE OR REPLACE VIEW MyEventsView AS SELECT e."Name",e."Address",e."Price",e."Discount",e."StartDate",e."EndDate",e."City",pie."P_Id",cat."Name" as "c_name"
 	from Events as e inner join PeopleInEvents as pie on
	e."Id"=pie."E_Id" inner join Category as cat on cat."Id"=e."Category_Id";
	
	Select *from MyEventsView 
	drop view ems."MyEventsView"
	
	--Functions and Triggers
	
	CREATE SEQUENCE sequence_for_alpha_numeric
 	INCREMENT 1
  	MINVALUE 1
 	MAXVALUE 9223372036854775807
  	START 1
 	CACHE 1;
	
    --visitor için temp id olusturma triggeri
	CREATE TRIGGER giveTempVisitorId
    AFTER INSERT ON PeopleInEvents
    FOR EACH ROW
    EXECUTE PROCEDURE generate_temp_visitor_id();
	--drop trigger giveTempVisitorId on PeopleInEvents
	
	CREATE OR REPLACE FUNCTION generate_temp_visitor_id()
 	RETURNS TRIGGER  AS $temp$
	BEGIN
 
		   Update PeopleInEvents 
		   SET "TempVisitor_Id"= TO_CHAR (nextval('sequence_for_alpha_numeric'::regclass),'"VI"fm000000')
		   WHERE "P_Id" In 				
		   			 (SELECT "P_Id" 
					  FROM People as p inner join  PeopleInEvents as pie on pie."P_Id"=p."Id" 
					  WHERE p."Username" is null and "Id" in 
						 (SELECT "Id" 
						  FROM People 
						  WHERE "Id" = (SELECT max("Id") 
										FROM People)));	
	
		 RETURN NEW;
	END;
	$temp$ LANGUAGE PLPGSQL
    
	--insanlar eventlere katıldıkça event ve people countları güncelleme triggeri
    CREATE TRIGGER updateCounts
    AFTER INSERT ON PeopleInEvents
    FOR EACH ROW
    EXECUTE PROCEDURE update_counts(); 
	--drop trigger updateCounts on PeopleInEvents
	
    CREATE OR REPLACE FUNCTION update_counts()
 	RETURNS TRIGGER  AS $temp$
	BEGIN
		  
    update People set "EventCount"=(select count(*) 
									from PeopleInEvents
									where People."Id"=PeopleInEvents."P_Id" );
									
	update Events set "PeopleCount"=(select count(*)
									from PeopleInEvents
									where Events."Id"=PeopleInEvents."E_Id");
									
		 RETURN NEW;
	END;
	$temp$ LANGUAGE PLPGSQL
	
    --satın alınan eventin ücretini indirime göre hesaplatma triggeri
	CREATE TRIGGER updatePayments
    AFTER INSERT ON PeopleInEvents
    FOR EACH ROW
    EXECUTE PROCEDURE update_payment_amount();
	--drop trigger updatePayments on PeopleInEvents
	
	CREATE OR REPLACE FUNCTION update_payment_amount()
 	RETURNS TRIGGER  AS $temp$
	BEGIN
  
	   update PeopleInEvents set "PaymentAmount"=( select "Price" *(100-Events."Discount")/100
											    from Events
											  	where Events."Id"=PeopleInEvents."E_Id");
											
		 RETURN NEW;
	END;
	$temp$ LANGUAGE PLPGSQL
	
	--Stored Procedures
	
	CREATE OR REPLACE PROCEDURE updateCategory(text, INT)
	LANGUAGE plpgsql    
	AS $$
	BEGIN

		UPDATE Category 
		SET "Name" = $1
		WHERE "Id"= $2;
		
		COMMIT;
	END;
	$$;
	--drop procedure updateCategory
	
	select * from PeopleInEvents
	select * from EventsView
	