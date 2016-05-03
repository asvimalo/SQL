/* 1 Lista alla order och dess attribut som inte �r nycklar, samt kund och de produkter som ing�r i ordern,
samt vilket fraktbolag ska skeppa ordern.*/

use OrderDB
go
/*create proc sp_testOrderList as
	begin*/
		select OrderDate, DeliveryDate, /*tblDeliveryCompany.DeliveryID*/ CompanyName from tblOrder
		inner join tblDeliveryCompany on tblOrder.DeliveryID = tblDeliveryCompany.DeliveryID;
	--end

/* 2 Lista alla order som en kund (Kunden ska kunna s�kas med delar av efternamnet) har och de
produkter som ing�r i ordern, samt vilket fraktbolag ska skeppa ordern.

use OrderDB
go
create proc sp_ListAll as
	begin*/
		select tblOrder.OrderID, OrderDate, DeliveryDate, tblDeliveryCompany.DeliveryID, CompanyName, tblCustomer.CustomerID, CustomerName, ProductID, Quantity 
		from tblOrderItem inner join tblOrder on tblOrderItem.OrderID = tblOrder.OrderID
					  inner join tblDeliveryCompany on tblOrder.DeliveryID = tblDeliveryCompany.DeliveryID
					  inner join tblCustomer on tblOrder.CostomerID = tblCustomer.CustomerID
	--end

-- 3  Visa den order med mest produkter i.
use OrderDB
go
--create proc sp_maxOrder as
	--begin
		select MAX(Quantity) from tblOrderItem
	--end

-- 4 Visa den dyraste ordern i systemet och kundens namn.

use OrderDB
go
--create proc sp_MostExpensiveOrder as
	--begin
		select /*MAX(/*Total*/)*/ tblOrder.OrderID, tblCustomer.CustomerID, CustomerName 
		from tblOrderItem inner join tblOrder on tblOrderItem.OrderID = tblOrder.OrderID
						  inner join tblCustomer on tblOrder.CustomerID = tblCustomer.CustomerID
	--end
			

/*

� Visa alla order som ett fraktbolag skeppar. Ska kunna s�kas med namnet p� fraktbolaget.
� Visa alla order som ska skeppas p� ett viss datum och fraktbolaget. Ska s�kas med ett datum.
� Visa antal order som ska skeppas f�r fraktbolagen.
� Visa antal produkter som en tillverkare tillverkar. Ska s�kas med namnet p� fraktbolaget.
� Om en produkt inte �r tillg�nglig s� kan det inte ing� i en order. VG uppgift, kan l�sas med villkor och
print. Kan ocks� l�sas av de som har l�st p� triggers med en AFTER INSERT trigger.*/