/* 1 Lista alla order och dess attribut som inte är nycklar, samt kund och de produkter som ingår i ordern,
samt vilket fraktbolag ska skeppa ordern.*/

use OrderDB
go
/*create proc sp_testOrderList as
	begin*/
		select OrderDate, DeliveryDate, /*tblDeliveryCompany.DeliveryID*/ CompanyName from tblOrder
		inner join tblDeliveryCompany on tblOrder.DeliveryID = tblDeliveryCompany.DeliveryID;
	--end

/* 2 Lista alla order som en kund (Kunden ska kunna sökas med delar av efternamnet) har och de
produkter som ingår i ordern, samt vilket fraktbolag ska skeppa ordern.

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

• Visa alla order som ett fraktbolag skeppar. Ska kunna sökas med namnet på fraktbolaget.
• Visa alla order som ska skeppas på ett viss datum och fraktbolaget. Ska sökas med ett datum.
• Visa antal order som ska skeppas för fraktbolagen.
• Visa antal produkter som en tillverkare tillverkar. Ska sökas med namnet på fraktbolaget.
• Om en produkt inte är tillgänglig så kan det inte ingå i en order. VG uppgift, kan lösas med villkor och
print. Kan också lösas av de som har läst på triggers med en AFTER INSERT trigger.*/