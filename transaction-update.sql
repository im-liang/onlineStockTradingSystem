start transaction;

INSERT INTO Location(ZipCode, City, State)
VALUES(11790, 'Stony Brook', 'NY'),
	(11794, 'Stony Brook', 'NY'), 
	(93536, 'Los Angeles', 'CA');

INSERT INTO Person(LastName, FirstName, SSN, Address, Telephone, ZipCode)
VALUES('Yang', 'Shang', 111111111, '123 Success Street', 5166328959, 11790),
	('Du', 'Victor', 222222222, '456 Fortune Street', 5166324360, 11790),
    ('Smith', 'John', 333333333, '789 Peace Blvd', 3154434321, 93536),
    ('Philip', 'Lewis', 444444444, '135 Knowledge Lane', 5166668888, 11794),
    ('Smith', 'David', 123456789, '123 College Road', 5162152345, 11790),
    ('Warren', 'David', 789123456, '456 Sunken Street', 6316329987, 11794);
    
INSERT INTO Employee(SSN, HourlyRate, StartDate)
VALUES(123456789, 60, '2005-11-01'),
	(789123456, 50, '2006-02-02');

INSERT INTO Client(Email, Rating, CreditCardNumber, ID)
VALUES('syang@cs.sunysb.edu', 1, 1234567812345678, 111111111),
	('vicdu@cs.sunysb.edu', 1, 5678123456781234, 222222222),
    ('jsmith@ic.sunysb.edu', 1, 2345678923456789, 333333333),
    ('pml@cs.sunysb.edu', 1, 6789234567892345, 444444444);
    
INSERT INTO Stock(StockSymbol, CompanyName, Type, PricePerShare)
VALUES('GM', 'General Motors', 'automotive', 34.23),
	('IBM', 'IBM', 'computer', 91.41),
    ('F', 'Ford', 'automotive', 9.0);
    
INSERT INTO Account(DateOpened, ClientID)
VALUES('2006-10-01', 444444444), 
	('2006-10-15', 222222222);

INSERT INTO hasStock(AccountId,	StockSymbol, NumShares)
VALUES(1, 'GM', 250),
	(1, 'F', 150),
    (2, 'IBM', 50);

INSERT INTO StockOrder(NumShares, PriceType, OrderType, Percentage)
VALUES(75, 'Market', 'buy', 0), 
	(10, 'TrailingStop', 'sell', 0.1);
    
INSERT INTO Transaction(Fee, DateTime, PricePerShare)
VALUES(50, '2015-01-01', 100),
	(0, '2015-01-01', 100);

INSERT INTO Trade(AccountId, BrokerId, OrderId, StockId, TransactionId)
VALUES(1, 1, 1, 'GM', 1),
	(2, 2, 2, 'IBM', 2);

commit;
