USE netrade;
# A customer's current stock holdings 
DELIMITER //
CREATE PROCEDURE listStock(IN CustID INTEGER)
BEGIN
	SELECT S.*, NumShares
    FROM Stock S, Account A, hasStcok H
    WHERE A.ClientID = CustID;
END//

# The share-price and trailing-stop history for a given conditional order.
DELIMITER //
CREATE PROCEDURE hiddenstopHistory(IN OrderID INTEGER)
BEGIN
SELECT S.StockSymbol, H.PricePerShare, O.PriceType, O.Percentage, O.NumShares, H.stockDate
FROM Stock S, Trade T, StockOrder O, stockHistory H
WHERE T.OrderId= OrderID AND S.StockSymbol=T.StockId AND T.OrderId = O.ID AND H.StockSymbol = S.StockSymbol;

END//
drop procedure hiddenstopHistory;

# The share-price and trailing-stop history for a given conditional order.
DELIMITER //
CREATE PROCEDURE trailingHistory(IN OrderID INTEGER)
BEGIN
	SELECT S.PricePerShare, O.Percentage*TA.PricePerShare
FROM Stock S, Trade T, StockOrder O, Transaction TA
WHERE S.StockSymbol=T.StockId AND T.OrderId = O.ID;

END//

#The share-price history of a given stock over a sertain period of time
DELIMITER //
CREATE PROCEDURE priceHistory(IN StockSymbol CHAR(20))
BEGIN
	Select H.PricePerShare, H.stockDate
    From Stock S, stockHistory H
    Where StockSymbol = S.StockSymbol AND S.StockSymbol = H.StockSymbol;
END//
drop procedure priceHistory;
# A history of all current and past orders a customer has placed 
DELIMITER //
CREATE PROCEDURE orderHistory(CustID INTEGER)
BEGIN
	SELECT O.ID, S.StockSymbol, O.NumShares, O.PriceType, O.OrderType, O.DateTime
    FROM StockOrder O, Trade T, Stock S, Account A
    WHERE A.ID = CustID AND A.ID = T.AccountId 
	AND T.OrderId = O.ID AND S.StockSymbol = T.StockId;
END//
drop procedure if exists orderHistory;
# Stocks available with a particular keyword or set of keywords in the stock name, and most-recent order info 
DELIMITER //
CREATE PROCEDURE searchAvailStockByName(IN SName CHAR(20))
BEGIN
	SELECT DISTINCT *
    FROM Stock S
    WHERE CompanyName LIKE CONCAT('%', CONCAT(SNAME, '%'))
	#	AND O.StockSymbol = S.StockSymbol
	GROUP BY S.StockSymbol;
END//
drop procedure searchAvailStockByName;
# Stocks available of a particular type and most-recent order info 
DELIMITER //
CREATE PROCEDURE searchAvailStockByType(IN SType CHAR(20))
BEGIN
	SELECT *
    FROM Stock S
    WHERE S.Type LIKE CONCAT('%', CONCAT(SType, '%'))
	GROUP BY S.StockSymbol;
END//
#drop procedure searchAvailStockByType;

# Personalized stock suggestion list 
DELIMITER //
CREATE PROCEDURE personalizedStocks(IN CustID INTEGER)
BEGIN
	CALL giveSuggestion(CustID);
END//

# Stocks available of a particular type and most-recent order info
DELIMITER //
CREATE PROCEDURE specificStockWithRecentInfo(IN PriceType CHAR(20))
 BEGIN
    SELECT StockOrder.*
	FROM Stock, StockOrder
	WHERE StockOrder.PriceType = PriceType AND StockOrder.PriceType = PriceType AND (
		SELECT MAX(StockOrder.DateTime)
		FROM StockOrder);
 END //

# Best-Seller list of stocks
DELIMITER //
CREATE PROCEDURE bestSellerStocks()
 BEGIN
    SELECT Trade.StockId, Stock.CompanyName, Stock.PricePerShare, Stock.Type
	FROM Trade, StockOrder, Stock
	WHERE Trade.OrderId = StockOrder.ID AND StockOrder.OrderType = 'sell' AND Stock.StockSymbol = Trade.StockId
	GROUP BY Trade.StockId
	ORDER BY COUNT(Trade.StockId) DESC;
 END //
#drop procedure if exists bestSellerStocks;

DELIMITER //
CREATE PROCEDURE sell(IN symbol CHAR(20), num INTEGER, )
 BEGIN
    SELECT Trade.StockId, Stock.CompanyName, Stock.PricePerShare, Stock.Type
	FROM Trade, StockOrder, Stock
	WHERE Trade.OrderId = StockOrder.ID AND StockOrder.OrderType = 'sell' AND Stock.StockSymbol = Trade.StockId
	GROUP BY Trade.StockId
	ORDER BY COUNT(Trade.StockId) DESC;
 END //
