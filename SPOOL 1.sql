SQL> 
SQL> CREATE TABLE Customer
  2  (Customer_ID int Primary key,
  3  Customer_Name varchar(20) not null,
  4  Customer_Address varchar(10) not null,
  5  Customer_Contact int not null Unique,
  6  Discount_Rate int,
  7  Category varchar(10) not null);

Table created.

SQL> DESCRIBE Customer;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUSTOMER_ID                               NOT NULL NUMBER(38)
 CUSTOMER_NAME                             NOT NULL VARCHAR2(20)
 CUSTOMER_ADDRESS                          NOT NULL VARCHAR2(10)
 CUSTOMER_CONTACT                          NOT NULL NUMBER(38)
 DISCOUNT_RATE                                      NUMBER(38)
 CATEGORY                                  NOT NULL VARCHAR2(10)

SQL> COMMIT;

Commit complete.

SQL> CREATE TABLE Invoice
  2  (Invoice_ID int Primary key,
  3  Invoice Date date,
  4  Total int,
  5  Discount_Amount int,
  6  Net Amount int,
  7  Payment_Option varchar(15));
Invoice Date date,
             *
ERROR at line 3:
ORA-00907: missing right parenthesis 


SQL> CREATE TABLE Invoice
  2  (Invoice_ID int Primary key,
  3  Invoice_Date date,
  4  Total int,
  5  Discount_Amount int,
  6  Net_Amount int,
  7  Payment_Option varchar(15));

Table created.

SQL> DESCRIBE Invoice;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 INVOICE_ID                                NOT NULL NUMBER(38)
 INVOICE_DATE                                       DATE
 TOTAL                                              NUMBER(38)
 DISCOUNT_AMOUNT                                    NUMBER(38)
 NET_AMOUNT                                         NUMBER(38)
 PAYMENT_OPTION                                     VARCHAR2(15)

SQL> CREATE TABLE Vendor
  2  (Vendor_ID int Primary Key,
  3  Vendor_Name varchar(20) not null,
  4  Vendor_Address varchar(10) not null,
  5  Vendor_Contact int not null Unique);

Table created.

SQL> DESCRIBE Vendor;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 VENDOR_ID                                 NOT NULL NUMBER(38)
 VENDOR_NAME                               NOT NULL VARCHAR2(20)
 VENDOR_ADDRESS                            NOT NULL VARCHAR2(10)
 VENDOR_CONTACT                            NOT NULL NUMBER(38)

SQL> CREATE TABLE Product
  2  (Product_ID int Primary key,
  3  Product_Name varchar(20) not null,
  4  Product_Description varchar(30),
  5  Product_Category varchar(15) not null,
  6  Unit_Cost int not null,
  7  Product_Stock int,
  8  Availability varchar(15),
  9  Vendor_ID int not null,
 10  Foreign key(Vendor_ID) REFERENCES Vendor(Vendor_ID));

Table created.

SQL> DESCRIBE Product;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PRODUCT_ID                                NOT NULL NUMBER(38)
 PRODUCT_NAME                              NOT NULL VARCHAR2(20)
 PRODUCT_DESCRIPTION                                VARCHAR2(30)
 PRODUCT_CATEGORY                          NOT NULL VARCHAR2(15)
 UNIT_COST                                 NOT NULL NUMBER(38)
 PRODUCT_STOCK                                      NUMBER(38)
 AVAILABILITY                                       VARCHAR2(15)
 VENDOR_ID                                 NOT NULL NUMBER(38)

SQL> CREATE TABLE Orders
  2  (Order_ID int Primary Key,
  3  Order_Date date,
  4  Invoice_ID int not null,
  5  Foreign Key(Invoice_ID) REFERENCES Invoice(Invoice_ID));

Table created.

SQL> DESCRIBE Orders;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ORDER_ID                                  NOT NULL NUMBER(38)
 ORDER_DATE                                         DATE
 INVOICE_ID                                NOT NULL NUMBER(38)

SQL> CREATE TABLE Order_Details
  2  (Order_ID int not null,
  3  Customer_ID int not null,
  4  Foreign Key(Order_ID) REFERENCES Orders(Order_ID),
  5  Foreign Key(Customer_ID) REFERENCES Customer(Customer_ID));

Table created.

SQL> DESCRIBE Order_Details;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ORDER_ID                                  NOT NULL NUMBER(38)
 CUSTOMER_ID                               NOT NULL NUMBER(38)

SQL> CREATE TABLE Product_Order
  2  (Customer_ID int not null,
  3  Order_ID int not null,
  4  Product_ID int not null,
  5  Product_Quantity int,
  6  Line_Total int not null,
  7  Foreign Key (Customer_ID) REFERENCES Customer (Customer_ID),
  8  Foreign Key (Order_ID) REFERENCES Orders (Order_ID),
  9  Foreign Key (Product_ID) REFERENCES Product (Product_ID));

Table created.

SQL> DESCRIBE Product_Order;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUSTOMER_ID                               NOT NULL NUMBER(38)
 ORDER_ID                                  NOT NULL NUMBER(38)
 PRODUCT_ID                                NOT NULL NUMBER(38)
 PRODUCT_QUANTITY                                   NUMBER(38)
 LINE_TOTAL                                NOT NULL NUMBER(38)

SQL> SELECT * FROM tab;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
CUSTOMER                       TABLE                                            
INVOICE                        TABLE                                            
ORDERS                         TABLE                                            
ORDER_DETAILS                  TABLE                                            
PRODUCT                        TABLE                                            
PRODUCT_ORDER                  TABLE                                            
VENDOR                         TABLE                                            

7 rows selected.

SQL> SET LINESIZE 1000
SQL> SET PAGESIZE 40
SQL> 
SQL> INSERT ALL
  2  INTO Customer values (1011, 'Rima Suwal', 'Teku', 9813000111, 0, 'Regular')
  3  INTO Customer values (1122, 'Sezan Rai', 'Baluwatar', 9841123443, 0, 'Regular')
  4  INTO Customer values (1150, 'Avanish Karna', 'Baneshwor', 9841432660, 5, 'Staff')
  5  INTO Customer values (1244, 'Eva Lama', 'Ason', 9841777788, 10, 'VIP')
  6  INTO Customer values (1460, 'Daya Shrestha', 'Kuleshwor', 9851909090, 10, 'VIP')
  7  INTO Customer values (1593, 'Subin Malla', 'Bafal', 9851334455, 5, 'Staff')
  8  INTO Customer values (1678, 'Ram Maharjan', 'Sitapaila', 9813212121, 10, 'VIP')
  9  INTO Customer values (1746, 'Neha Karki', 'Kamaladi', 9814335678, 0, 'Regular')
 10  INTO Customer values (1867, 'Bina Thakur', 'Chhetrapati', 9841098765, 0, 'Regular')
 11  INTO Customer values (1987, 'Aayush Nepali', 'Babarmahal', 9841888000, 5, 'Staff')
 12  SELECT * FROM dual;
INTO Customer values (1867, 'Bina Thakur', 'Chhetrapati', 9841098765, 0, 'Regular')
                                           *
ERROR at line 10:
ORA-12899: value too large for column "RASHI_CW"."CUSTOMER"."CUSTOMER_ADDRESS" (actual: 11, maximum: 10) 


SQL> INSERT ALL
  2  INTO Customer values (1011, 'Rima Suwal', 'Teku', 9813000111, 0, 'Regular')
  3  INTO Customer values (1122, 'Sezan Rai', 'Baluwatar', 9841123443, 0, 'Regular')
  4  INTO Customer values (1150, 'Avanish Karna', 'Baneshwor', 9841432660, 5, 'Staff')
  5  INTO Customer values (1244, 'Eva Lama', 'Ason', 9841777788, 10, 'VIP')
  6  INTO Customer values (1460, 'Daya Shrestha', 'Kuleshwor', 9851909090, 10, 'VIP')
  7  INTO Customer values (1593, 'Subin Malla', 'Bafal', 9851334455, 5, 'Staff')
  8  INTO Customer values (1678, 'Ram Maharjan', 'Sitapaila', 9813212121, 10, 'VIP')
  9  INTO Customer values (1746, 'Neha Karki', 'Kamaladi', 9814335678, 0, 'Regular')
 10  INTO Customer values (1867, 'Bina Thakur', 'Kohity', 9841098765, 0, 'Regular')
 11  INTO Customer values (1987, 'Aayush Nepali', 'Babarmahal', 9841888000, 5, 'Staff')
 12  SELECT * FROM dual;

10 rows created.

SQL> SELECT * FROM Customer;

CUSTOMER_ID CUSTOMER_NAME        CUSTOMER_A CUSTOMER_CONTACT DISCOUNT_RATE CATEGORY                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
----------- -------------------- ---------- ---------------- ------------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
       1011 Rima Suwal           Teku             9813000111             0 Regular                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       1122 Sezan Rai            Baluwatar        9841123443             0 Regular                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       1150 Avanish Karna        Baneshwor        9841432660             5 Staff                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
       1244 Eva Lama             Ason             9841777788            10 VIP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
       1460 Daya Shrestha        Kuleshwor        9851909090            10 VIP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
       1593 Subin Malla          Bafal            9851334455             5 Staff                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
       1678 Ram Maharjan         Sitapaila        9813212121            10 VIP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
       1746 Neha Karki           Kamaladi         9814335678             0 Regular                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       1867 Bina Thakur          Kohity           9841098765             0 Regular                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       1987 Aayush Nepali        Babarmahal       9841888000             5 Staff                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

10 rows selected.

SQL> INSERT ALL
  2  INTO Invoice values (11023, '03-MAY-2023', 4200, 0, 4200, 'Delivery')
  3  INTO Invoice values (13890, '08-MAY-2023', 87000, 4350, 82650, 'E-Wallet')
  4  INTO Invoice values (17869, '20-MAY-2023', 9800, 980, 8820, 'Delivery')
  5  INTO Invoice values (20312, '09-JUN-2023', 3500, 0, 3500, 'Debit')
  6  INTO Invoice values (25619, '18-JUL-2023', 66000, 3300, 62700, 'Debit')
  7  INTO Invoice values (28934, '13-AUG-2023', 175000, 17500, 157500, 'Credit')
  8  INTO Invoice values (33006, '23-AUG-2023', 52500, 0, 52500, 'E-Wallet')
  9  INTO Invoice values (33033, '30-AUG-2023', 12500, 625, 11875, 'E-Wallet')
 10  SELECT * FROM dual;

8 rows created.

SQL> SELECT * FROM Invoice;

INVOICE_ID INVOICE_D      TOTAL DISCOUNT_AMOUNT NET_AMOUNT PAYMENT_OPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
---------- --------- ---------- --------------- ---------- ---------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
     11023 03-MAY-23       4200               0       4200 Delivery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
     13890 08-MAY-23      87000            4350      82650 E-Wallet                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
     17869 20-MAY-23       9800             980       8820 Delivery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
     20312 09-JUN-23       3500               0       3500 Debit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
     25619 18-JUL-23      66000            3300      62700 Debit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
     28934 13-AUG-23     175000           17500     157500 Credit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
     33006 23-AUG-23      52500               0      52500 E-Wallet                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
     33033 30-AUG-23      12500             625      11875 E-Wallet                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

8 rows selected.

SQL> INSERT ALL
  2  INTO Vendor values (105, 'Shyam Mali', 'Balaju', 9841231542)
  3  INTO Vendor values (124, 'Hari Shakya', 'Tinkune', 9841987007)
  4  INTO Vendor values (139, 'Naresh Suwal', 'New Road', 9851676767)
  5  INTO Vendor values (155, 'Birendra Adhikari', 'Sanepa', 9813221221)
  6  INTO Vendor values (198, 'Prakash Ojha', 'Chhauni', 9841551055)
  7  INTO Vendor values (117, 'Sailesh Nepal', 'Baneshwor', 9813444440)
  8  INTO Vendor values (182, 'Laxman Pradhan', 'Thapagaun', 9813335590)
  9  SELECT * FROM dual;

7 rows created.

SQL> SELECT * FROM Vendor;

 VENDOR_ID VENDOR_NAME          VENDOR_ADD VENDOR_CONTACT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
---------- -------------------- ---------- --------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
       105 Shyam Mali           Balaju         9841231542                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
       124 Hari Shakya          Tinkune        9841987007                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
       139 Naresh Suwal         New Road       9851676767                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
       155 Birendra Adhikari    Sanepa         9813221221                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
       198 Prakash Ojha         Chhauni        9841551055                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
       117 Sailesh Nepal        Baneshwor      9813444440                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
       182 Laxman Pradhan       Thapagaun      9813335590                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

7 rows selected.

SQL> INSERT ALL
  2  INTO Product values (304, 'Iphone XR', 'Black 64GB', 'Mobile', 66000, 30, 'Available', 139)
  3  INTO Product values (332, 'Samsung Galaxy A24', 'White 256GB', 'Mobile', 50000, 56, 'Available', 117)
  4  INTO Product values (367, 'VAIO FE14', 'Black 14.1 inch', 'Laptop', 75000, 52, 'Available', 117)
  5  INTO Product values (321, 'Panasonic', 'Black  32 inch', 'TV', 87000, 59, 'Available', 124)
  6  INTO Product values (310, 'Ultima Atom 520 Pro', 'Black', 'Earbuds', 2500, 45, 'Available', 155)
  7  INTO Product values (359, 'T800 Ultra', 'Orange 44mm', 'Smart Watch', 1750, 51, 'Available', 105)
  8  INTO Product values (365, 'Apple Watch SE', 'Silver 40mm', 'Smart Watch', 6500, 36, 'Out of Stock', 198)
  9  INTO Product values (378, 'Asus Vivobook', 'Navy 14 inch', 'Laptop', 112500, 17, 'Out of Stock', 182)
 10  INTO Product values (385, 'Iphone 15 Pro Max', 'Blue 1TB', 'Mobile', 218000, 57, 'Available', 139)
 11  INTO Product values (399, 'Airpods Pro', 'White', 'Earbuds', 2100, 55, 'Available', 155)
 12  SELECT * FROM dual;

10 rows created.

SQL> SELECT * FROM Product;

PRODUCT_ID PRODUCT_NAME         PRODUCT_DESCRIPTION            PRODUCT_CATEGOR  UNIT_COST PRODUCT_STOCK AVAILABILITY     VENDOR_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
---------- -------------------- ------------------------------ --------------- ---------- ------------- --------------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       304 Iphone XR            Black 64GB                     Mobile               66000            30 Available              139                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       332 Samsung Galaxy A24   White 256GB                    Mobile               50000            56 Available              117                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       367 VAIO FE14            Black 14.1 inch                Laptop               75000            52 Available              117                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       321 Panasonic            Black  32 inch                 TV                   87000            59 Available              124                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       310 Ultima Atom 520 Pro  Black                          Earbuds               2500            45 Available              155                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       359 T800 Ultra           Orange 44mm                    Smart Watch           1750            51 Available              105                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       365 Apple Watch SE       Silver 40mm                    Smart Watch           6500            36 Out of Stock           198                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       378 Asus Vivobook        Navy 14 inch                   Laptop              112500            17 Out of Stock           182                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       385 Iphone 15 Pro Max    Blue 1TB                       Mobile              218000            57 Available              139                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       399 Airpods Pro          White                          Earbuds               2100            55 Available              155                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

10 rows selected.

SQL> INSERT ALL
  2  INTO Orders values (2003, '01-MAY-2023', 11023)
  3  INTO Orders values (2060, '08-MAY-2023', 13890)
  4  INTO Orders values (2133, '20-MAY-2023', 17869)
  5  INTO Orders values (2290, '04-JUN-2023', 20312)
  6  INTO Orders values (2401, '06-JUL-2023', 25619)
  7  INTO Orders values (2679, '10-AUG-2023', 28934)
  8  INTO Orders values (2808, '20-AUG-2023', 33006)
  9  INTO Orders values (2999, '30-AUG-2023', 33033)
 10  SELECT * FROM dual;

8 rows created.

SQL> SELECT * FROM Orders;

  ORDER_ID ORDER_DAT INVOICE_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
---------- --------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
      2003 01-MAY-23      11023                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
      2060 08-MAY-23      13890                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
      2133 20-MAY-23      17869                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
      2290 04-JUN-23      20312                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
      2401 06-JUL-23      25619                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
      2679 10-AUG-23      28934                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
      2808 20-AUG-23      33006                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
      2999 30-AUG-23      33033                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

8 rows selected.

SQL> INSERT ALL
  2  INTO Order_Details values (2003, 1122)
  3  INTO Order_Details values (2060, 1150)
  4  INTO Order_Details values (2133, 1460)
  5  INTO Order_Details values (2290, 1122)
  6  INTO Order_Details values (2401, 1593)
  7  INTO Order_Details values (2679, 1678)
  8  INTO Order_Details values (2808, 1867)
  9  INTO Order_Details values (2999, 1987)
 10  SELECT * FROM dual;

8 rows created.

SQL> SELECT * FROM Order_Details;

  ORDER_ID CUSTOMER_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
---------- -----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      2003        1122                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      2060        1150                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      2133        1460                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      2290        1122                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      2401        1593                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      2679        1678                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      2808        1867                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      2999        1987                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

8 rows selected.

SQL> INSERT ALL
  2  INTO Product_Order values (1122, 2003, 399, 2, 4200)
  3  INTO Product_Order values (1150, 2060, 321, 1, 87000)
  4  INTO Product_Order values (1460, 2133, 399, 3, 6300)
  5  INTO Product_Order values (1460, 2133, 359, 2, 3500)
  6  INTO Product_Order values (1122, 2290, 359, 2, 3500)
  7  INTO Product_Order values (1593, 2401, 304, 1, 66000)
  8  INTO Product_Order values (1678, 2679, 332, 2, 100000)
  9  INTO Product_Order values (1678, 2679, 367, 1, 75000)
 10  INTO Product_Order values (1867, 2808, 332, 1, 50000)
 11  INTO Product_Order values (1867, 2808, 310, 1, 2500)
 12  INTO Product_Order values (1987, 2999, 310, 5, 12500)
 13  SELECT * FROM dual;

11 rows created.

SQL> SELECT * FROM Product_Order;

CUSTOMER_ID   ORDER_ID PRODUCT_ID PRODUCT_QUANTITY LINE_TOTAL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
----------- ---------- ---------- ---------------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
       1122       2003        399                2       4200                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
       1150       2060        321                1      87000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
       1460       2133        399                3       6300                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
       1460       2133        359                2       3500                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
       1122       2290        359                2       3500                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
       1593       2401        304                1      66000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
       1678       2679        332                2     100000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
       1678       2679        367                1      75000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
       1867       2808        332                1      50000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
       1867       2808        310                1       2500                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
       1987       2999        310                5      12500                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

11 rows selected.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Customer
  2  WHERE Category = 'Staff';

CUSTOMER_ID CUSTOMER_NAME        CUSTOMER_A CUSTOMER_CONTACT DISCOUNT_RATE CATEGORY                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
----------- -------------------- ---------- ---------------- ------------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
       1150 Avanish Karna        Baneshwor        9841432660             5 Staff                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
       1593 Subin Malla          Bafal            9851334455             5 Staff                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
       1987 Aayush Nepali        Babarmahal       9841888000             5 Staff                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

SQL> SELECT * FROM Invoice
  2  WHERE Order_Date BETWEEN '01-MAY-2023' AND '28-MAY-2023';
WHERE Order_Date BETWEEN '01-MAY-2023' AND '28-MAY-2023'
      *
ERROR at line 2:
ORA-00904: "ORDER_DATE": invalid identifier 


SQL> SELECT * FROM Orders
  2  WHERE Order_Date BETWEEN '01-MAY-2023' AND '28-MAY-2023';

  ORDER_ID ORDER_DAT INVOICE_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
---------- --------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
      2003 01-MAY-23      11023                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
      2060 08-MAY-23      13890                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
      2133 20-MAY-23      17869                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

SQL> SELECT Order_ID, Order_Date FROM Orders
  2  WHERE Order_Date BETWEEN '01-MAY-2023' AND '28-MAY-2023';

  ORDER_ID ORDER_DAT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
---------- ---------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
      2003 01-MAY-23                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
      2060 08-MAY-23                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
      2133 20-MAY-23                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

SQL> SELECT Customer.Customer_ID, Customer.Customer_Name
  2  FROM Customer
  3  LEFT JOIN Order_Details ON Customer.Customer_ID = Order_Details.Customer_ID
  4  WHERE Order_Details.Customer_ID = NULL;

no rows selected

SQL> SELECT Customer.Customer_ID, Customer.Customer_Name
  2  FROM Customer
  3  LEFT JOIN Order_Details ON Customer.Customer_ID = Order_Details.Customer_ID
  4  WHERE Order_Details.Customer_ID IS NULL;

CUSTOMER_ID CUSTOMER_NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
----------- --------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
       1746 Neha Karki                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
       1244 Eva Lama                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
       1011 Rima Suwal                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

SQL> SELECT Customer.Customer_ID, Customer.Customer_Name
  2  Orders.Order_ID, Orders.Order_Date,
  3  Product_Order.Product_ID, Product_Order.Product_Quantity
  4  FROM Customer
  5  LEFT JOIN Orders ON Customer.Customer_ID = Product_Order.Customer_ID
  6  LEFT JOIN Product_Order Orders.Orders_ID = Product_Order.Order_ID
  7  ORDER BY Customer.Customer_ID, Orders.Orders_ID;
Orders.Order_ID, Orders.Order_Date,
      *
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT Customer.Customer_ID, Customer.Customer_Name
  2  FROM Customer
  3  LEFT JOIN Orders ON Customer.Customer_ID = Product_Order.Customer_ID
  4  LEFT JOIN Product_Order Orders.Orders_ID = Product_Order.Order_ID
  5  ORDER BY Customer.Customer_ID, Orders.Orders_ID;
LEFT JOIN Product_Order Orders.Orders_ID = Product_Order.Order_ID
                              *
ERROR at line 4:
ORA-00905: missing keyword 


SQL> SELECT * FROM Product
  2  WHERE Product_Name LIKE '_a%'
  3  AND Product_Stock > 50;

PRODUCT_ID PRODUCT_NAME         PRODUCT_DESCRIPTION            PRODUCT_CATEGOR  UNIT_COST PRODUCT_STOCK AVAILABILITY     VENDOR_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
---------- -------------------- ------------------------------ --------------- ---------- ------------- --------------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       332 Samsung Galaxy A24   White 256GB                    Mobile               50000            56 Available              117                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       321 Panasonic            Black  32 inch                 TV                   87000            59 Available              124                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

SQL> SELECT * FROM Product
  2  WHERE Product_Name LIKE '_a%' OR '_A%'
  3  AND Product_Stock > 50;
AND Product_Stock > 50
*
ERROR at line 3:
ORA-00920: invalid relational operator 


SQL> UPDATE Product
  2  SET Product_Name = 'Vaio FE14'
  3  WHERE Product_ID = 367;

1 row updated.

SQL> SELECT * FROM Product
  2  WHERE Product_Name LIKE '_a%'
  3  AND Product_Stock > 50;

PRODUCT_ID PRODUCT_NAME         PRODUCT_DESCRIPTION            PRODUCT_CATEGOR  UNIT_COST PRODUCT_STOCK AVAILABILITY     VENDOR_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
---------- -------------------- ------------------------------ --------------- ---------- ------------- --------------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       332 Samsung Galaxy A24   White 256GB                    Mobile               50000            56 Available              117                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       367 Vaio FE14            Black 14.1 inch                Laptop               75000            52 Available              117                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       321 Panasonic            Black  32 inch                 TV                   87000            59 Available              124                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

SQL> SELECT Orders.Order_ID, Orders.Order_Date
  2  Order.Customer_ID, Customer.Customer_Name
  3  FROM Orders
  4  JOIN Customer
  5  ON Order.Customer_ID = Customer.Customer_ID
  6  WHERE Orders.Order_Date = (SELECT MAX (Order_Date) FROM Orders);
Order.Customer_ID, Customer.Customer_Name
*
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT Orders.Order_ID, Orders.Order_Date
  2  Orders.Customer_ID, Customer.Customer_Name
  3  FROM Orders
  4  JOIN Customer
  5  ON Orders.Customer_ID = Customer.Customer_ID
  6  WHERE Orders.Order_Date = (SELECT MAX (Order_Date) FROM Orders);
Orders.Customer_ID, Customer.Customer_Name
      *
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT Order_Details.Order_ID, Orders.Order_Date,
  2  Order_Details.Customer_ID, Customer.Customer_Name
  3  FROM Order_Details
  4  JOIN Customer
  5  ON Order_Details.Customer_ID = Customer.Customer_ID
  6  WHERE Orders.Order_Date = (SELECT MAX (Order_Date) FROM Orders);
WHERE Orders.Order_Date = (SELECT MAX (Order_Date) FROM Orders)
      *
ERROR at line 6:
ORA-00904: "ORDERS"."ORDER_DATE": invalid identifier 


SQL> SELECT Order_Details.Order_ID, Order_Details.Customer_ID,
  2  Customer.Customer_Name, Orders.Order_Date
  3  FROM Order_Details
  4  JOIN Orders
  5  ON Order_Details.Order_ID = Orders.Order_ID
  6  JOIN Customer
  7  ON Order_Details.Customer_ID = Customer.Customer_ID
  8  WHERE Orders.Order_Date = (SELECT MAX (Order_Date) FROM Orders);

  ORDER_ID CUSTOMER_ID CUSTOMER_NAME        ORDER_DAT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
---------- ----------- -------------------- ---------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
      2999        1987 Aayush Nepali        30-AUG-23                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

SQL> SELECT Orders.Orders_ID, Orders.Orders_Date,
  2  Order_Details.Customer_ID, Customer.Customer_Name
  3  FROM Order_Details
  4  JOIN Orders
  5  ON Order_Details.Order_ID = Orders.Orders_Date
  6  JOIN Customer
  7  ON Order_Details.Customer_ID = Customer.Customer_ID;
ON Order_Details.Order_ID = Orders.Orders_Date
                            *
ERROR at line 5:
ORA-00904: "ORDERS"."ORDERS_DATE": invalid identifier 


SQL> SELECT Orders.Order_ID, Orders.Order_Date,
  2  Order_Details.Customer_ID, Customer.Customer_Name
  3  FROM Order_Details
  4  JOIN Orders
  5  ON Order_Details.Order_ID = Orders.Order_Date
  6  JOIN Customer
  7  ON Order_Details.Customer_ID = Customer.Customer_ID;
ON Order_Details.Order_ID = Orders.Order_Date
                          *
ERROR at line 5:
ORA-00932: inconsistent datatypes: expected NUMBER got DATE 


SQL> SELECT Orders.Order_ID, Orders.Order_Date,
  2  Order_Details.Customer_ID, Customer.Customer_Name
  3  FROM Order_Details
  4  JOIN Orders
  5  ON Order_Details.Order_ID = Orders.Order_ID
  6  JOIN Customer
  7  ON Order_Details.Customer_ID = Customer.Customer_ID;

  ORDER_ID ORDER_DAT CUSTOMER_ID CUSTOMER_NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
---------- --------- ----------- --------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
      2290 04-JUN-23        1122 Sezan Rai                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
      2003 01-MAY-23        1122 Sezan Rai                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
      2060 08-MAY-23        1150 Avanish Karna                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
      2133 20-MAY-23        1460 Daya Shrestha                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
      2401 06-JUL-23        1593 Subin Malla                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
      2679 10-AUG-23        1678 Ram Maharjan                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
      2808 20-AUG-23        1867 Bina Thakur                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
      2999 30-AUG-23        1987 Aayush Nepali                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          

8 rows selected.

SQL> SELECT TO_CHAR(Order_Date, 'Month') AS month,
  2  SUM(Total) AS Total_Revenue
  3  FROM Orders
  4  GROUP BY TO_CHAR(Order_Datw, 'Month')
  5  ORDER BY month;
GROUP BY TO_CHAR(Order_Datw, 'Month')
                 *
ERROR at line 4:
ORA-00904: "ORDER_DATW": invalid identifier 


SQL> SELECT TO_CHAR(Order_Date, 'Month') AS month,
  2  SUM(Total) AS Total_Revenue
  3  FROM Orders
  4  GROUP BY TO_CHAR(Order_Date, 'Month')
  5  ORDER BY month;
SUM(Total) AS Total_Revenue
    *
ERROR at line 2:
ORA-00904: "TOTAL": invalid identifier 


SQL> SELECT TO_CHAR(Invoice_Date, 'Month') AS month,
  2  SUM(Total) AS Total_Revenue
  3  FROM Invoice
  4  GROUP BY TO_CHAR(Invoice_Date, 'Month')
  5  ORDER BY month;

MONTH                                TOTAL_REVENUE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
------------------------------------ -------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
August                                      240000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
July                                         66000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
June                                          3500                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
May                                         101000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

SQL> SELECT * FROM Invoice
  2  WHERE Total >= (SELECT AVG(Total) FROM Invoice);

INVOICE_ID INVOICE_D      TOTAL DISCOUNT_AMOUNT NET_AMOUNT PAYMENT_OPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
---------- --------- ---------- --------------- ---------- ---------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
     13890 08-MAY-23      87000            4350      82650 E-Wallet                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
     25619 18-JUL-23      66000            3300      62700 Debit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
     28934 13-AUG-23     175000           17500     157500 Credit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
     33006 23-AUG-23      52500               0      52500 E-Wallet                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

SQL> SELECT * FROM Invoice
  2  WHERE Total >= (SELECT AVG(Total) FROM Invoice);

INVOICE_ID INVOICE_D      TOTAL DISCOUNT_AMOUNT NET_AMOUNT PAYMENT_OPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
---------- --------- ---------- --------------- ---------- ---------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
     13890 08-MAY-23      87000            4350      82650 E-Wallet                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
     25619 18-JUL-23      66000            3300      62700 Debit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
     28934 13-AUG-23     175000           17500     157500 Credit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
     33006 23-AUG-23      52500               0      52500 E-Wallet                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

SQL> SELECT *, COUNT(Vendor_ID) AS REPITION
  2  FROM Product
  3  GROUP BY Vendor_ID
  4  HAVING COUNT(Vendor_ID) > 3;
SELECT *, COUNT(Vendor_ID) AS REPITION
        *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT Product.Vendor_ID, COUNT(Vendor_ID) AS REPITION
  2  Vendor.Vendor_Name, Vendor.Vendor_Address, Vendor.Vendor_Contact
  3  FROM Product
  4  JOIN Vendor
  5  ON Product.Vendor_ID =  Vendor.Vendor_ID
  6  GROUP BY Vendor_ID
  7  HAVING COUNT(Vendor_ID) > 3;
Vendor.Vendor_Name, Vendor.Vendor_Address, Vendor.Vendor_Contact
*
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT Vendor.Vendor_ID, Vendor.Vendor_Name,
  2  Vendor.Vendor_Address, Vendor.Vendor_Contact,
  3  COUNT(Product.Product_ID) AS Total_Supply
  4  FROM Vendor
  5  JOIN Product
  6  ON Vendor.Vendor_ID = Product.Vendor_ID
  7  GROUP BY Vendor.Vendor_ID, Vendor.Vendor_Name, Vendor.Vendor_Address,
  8  Vendor.Vendor_Contact
  9  HAVING COUNT(Product.Product_ID) > 3;

no rows selected

SQL> SELECT Vendor_ID, Count(Vendor_ID) AS Total_Supply
  2  FROM Product
  3  GROUP BY Vendor_ID
  4  HAVING COUNT(Vendor_ID) > 3;

no rows selected

SQL> UPDATE Product
  2  SET Vendor_ID = 139
  3  WHERE Product_ID = 399;

1 row updated.

SQL> SELECT * FROM Product;

PRODUCT_ID PRODUCT_NAME         PRODUCT_DESCRIPTION            PRODUCT_CATEGOR  UNIT_COST PRODUCT_STOCK AVAILABILITY     VENDOR_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
---------- -------------------- ------------------------------ --------------- ---------- ------------- --------------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       304 Iphone XR            Black 64GB                     Mobile               66000            30 Available              139                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       332 Samsung Galaxy A24   White 256GB                    Mobile               50000            56 Available              117                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       367 Vaio FE14            Black 14.1 inch                Laptop               75000            52 Available              117                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       321 Panasonic            Black  32 inch                 TV                   87000            59 Available              124                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       310 Ultima Atom 520 Pro  Black                          Earbuds               2500            45 Available              155                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       359 T800 Ultra           Orange 44mm                    Smart Watch           1750            51 Available              105                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       365 Apple Watch SE       Silver 40mm                    Smart Watch           6500            36 Out of Stock           198                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       378 Asus Vivobook        Navy 14 inch                   Laptop              112500            17 Out of Stock           182                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       385 Iphone 15 Pro Max    Blue 1TB                       Mobile              218000            57 Available              139                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       399 Airpods Pro          White                          Earbuds               2100            55 Available              139                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

10 rows selected.

SQL> SELECT Vendor.Vendor_ID, Vendor.Vendor_Name,
  2  Vendor.Vendor_Address, Vendor.Vendor_Contact,
  3  COUNT(Product.Product_ID) AS Total_Supply
  4  FROM Vendor
  5  JOIN Product
  6  ON Vendor.Vendor_ID = Product.Vendor_ID
  7  GROUP BY Vendor.Vendor_ID, Vendor.Vendor_Name, Vendor.Vendor_Address,
  8  Vendor.Vendor_Contact
  9  HAVING COUNT(Product.Product_ID) >= 3;

 VENDOR_ID VENDOR_NAME          VENDOR_ADD VENDOR_CONTACT TOTAL_SUPPLY                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
---------- -------------------- ---------- -------------- ------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
       139 Naresh Suwal         New Road       9851676767            3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

SQL> SELECT Vendor.Vendor_ID, Vendor.Vendor_Name,
  2  Vendor.Vendor_Address, Vendor.Vendor_Contact,
  3  COUNT(Product.Product_ID) AS Total_Supply
  4  FROM Vendor
  5  JOIN Product
  6  ON Vendor.Vendor_ID = Product.Vendor_ID
  7  GROUP BY Vendor.Vendor_ID, Vendor.Vendor_Name, Vendor.Vendor_Address, Vendor.Vendor_Contact
  8  HAVING COUNT(Product.Product_ID) >= 3;

 VENDOR_ID VENDOR_NAME          VENDOR_ADD VENDOR_CONTACT TOTAL_SUPPLY                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
---------- -------------------- ---------- -------------- ------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
       139 Naresh Suwal         New Road       9851676767            3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

SQL>  UPDATE Product
  2  SET Vendor_ID = 139
  3  WHERE Product_ID = 365;

1 row updated.

SQL> SELECT * FROM Product;

PRODUCT_ID PRODUCT_NAME         PRODUCT_DESCRIPTION            PRODUCT_CATEGOR  UNIT_COST PRODUCT_STOCK AVAILABILITY     VENDOR_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
---------- -------------------- ------------------------------ --------------- ---------- ------------- --------------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       304 Iphone XR            Black 64GB                     Mobile               66000            30 Available              139                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       332 Samsung Galaxy A24   White 256GB                    Mobile               50000            56 Available              117                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       367 Vaio FE14            Black 14.1 inch                Laptop               75000            52 Available              117                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       321 Panasonic            Black  32 inch                 TV                   87000            59 Available              124                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       310 Ultima Atom 520 Pro  Black                          Earbuds               2500            45 Available              155                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       359 T800 Ultra           Orange 44mm                    Smart Watch           1750            51 Available              105                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       365 Apple Watch SE       Silver 40mm                    Smart Watch           6500            36 Out of Stock           139                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       378 Asus Vivobook        Navy 14 inch                   Laptop              112500            17 Out of Stock           182                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       385 Iphone 15 Pro Max    Blue 1TB                       Mobile              218000            57 Available              139                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
       399 Airpods Pro          White                          Earbuds               2100            55 Available              139                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

10 rows selected.

SQL> SELECT Vendor.Vendor_ID, Vendor.Vendor_Name,
  2  Vendor.Vendor_Address, Vendor.Vendor_Contact,
  3  COUNT(Product.Product_ID) AS Total_Supply
  4  FROM Vendor
  5  JOIN Product
  6  ON Vendor.Vendor_ID = Product.Vendor_ID
  7  GROUP BY Vendor.Vendor_ID, Vendor.Vendor_Name, Vendor.Vendor_Address, Vendor.Vendor_Contact
  8  HAVING COUNT(Product.Product_ID) > 3;

 VENDOR_ID VENDOR_NAME          VENDOR_ADD VENDOR_CONTACT TOTAL_SUPPLY                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
---------- -------------------- ---------- -------------- ------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
       139 Naresh Suwal         New Road       9851676767            4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

SQL> SELECT Product.Product_ID, Product.Product_Name, Product.Product_Category
  2  COUNT(Product_Order.Order_ID) AS Total_Orders
  3  FROM Product
  4  JOIN Product_Order
  5  ON Product.Product_ID = Product_Order.Order_ID
  6  GROUP BY Product.Product_ID, Product.Product_Name, Product.Product_Category
  7  ORDER BY Total_Orders DESC LIMIT 3;
COUNT(Product_Order.Order_ID) AS Total_Orders
     *
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT Product.Product_ID, Product.Product_Name, Product.Product_Category,
  2  COUNT(Product_Order.Order_ID) AS Total_Orders
  3  FROM Product
  4  JOIN Product_Order
  5  ON Product.Product_ID = Product_Order.Order_ID
  6  GROUP BY Product.Product_ID, Product.Product_Name, Product.Product_Category
  7  ORDER BY Total_Orders DESC LIMIT 3;
ORDER BY Total_Orders DESC LIMIT 3
                           *
ERROR at line 7:
ORA-00933: SQL command not properly ended 


SQL> SELECT Product.Product_ID, Product.Product_Name, Product.Product_Category,
  2  COUNT(Product_Order.Order_ID) AS Total_Orders
  3  FROM Product
  4  JOIN Product_Order
  5  ON Product.Product_ID = Product_Order.Order_ID
  6  GROUP BY Product.Product_ID, Product.Product_Name, Product.Product_Category
  7  ORDER BY Total_Orders DESC) LIMIT 3;
ORDER BY Total_Orders DESC) LIMIT 3
                          *
ERROR at line 7:
ORA-00933: SQL command not properly ended 


SQL> SELECT Product.Product_ID, Product.Product_Name, Product.Product_Category,
  2  COUNT(Product_Order.Order_ID) AS Total_Orders
  3  FROM Product
  4  JOIN Product_Order
  5  ON Product.Product_ID = Product_Order.Order_ID
  6  GROUP BY Product.Product_ID, Product.Product_Name, Product.Product_Category
  7  ORDER BY Total_Orders DESC LIMIT 3
  8  ;
ORDER BY Total_Orders DESC LIMIT 3
                           *
ERROR at line 7:
ORA-00933: SQL command not properly ended 


SQL> SELECT
  2      Product.Product_ID,
  3      Product.Product_Name,
  4      Product.Product_Category,
  5      COUNT(Product_Order.Order_ID) AS Total_Orders
  6  FROM
  7      Product
  8  JOIN
  9      Product_Order ON Product.Product_ID = Product_Order.Product_ID
 10  GROUP BY
 11      Product.Product_ID, Product.Product_Name, Product.Product_Category
 12  ORDER BY
 13      Total_Orders DESC
 14  LIMIT 3;
LIMIT 3
*
ERROR at line 14:
ORA-00933: SQL command not properly ended 


SQL> SELECT\
  2  
SQL> SELECT
  2      Product.Product_ID,
  3      Product.Product_Name,
  4      Product.Product_Category,
  5      COUNT(Product_Order.Order_ID) AS Total_Orders
  6  FROM
  7      Product
  8  JOIN
  9      Product_Order ON Product.Product_ID = Product_Order.Product_ID
 10  GROUP BY
 11      Product.Product_ID, Product.Product_Name, Product.Product_Category
 12      Total_Orders DESC
 13  LIMIT 3;
    Total_Orders DESC
    *
ERROR at line 12:
ORA-00933: SQL command not properly ended 


SQL> SELECT
  2      Product.Product_ID,
  3      Product.Product_Name,
  4      Product.Product_Category,
  5      COUNT(Product_Order.Order_ID) AS Total_Orders
  6  FROM
  7      Product
  8  JOIN
  9      Product_Order ON Product.Product_ID = Product_Order.Product_ID
 10  GROUP BY
 11      Product.Product_ID, Product.Product_Name, Product.Product_Category
 12  ORDER BY
 13      Total_Orders DESC
 14  LIMIT = 3;
LIMIT = 3
*
ERROR at line 14:
ORA-00933: SQL command not properly ended 


SQL> SELECT
  2      Product.Product_ID,
  3      Product.Product_Name,
  4      Product.Product_Category,
  5      COUNT(Product_Order.Order_ID) AS Total_Orders
  6  FROM
  7      Product
  8  JOIN
  9      Product_Order ON Product.Product_ID = Product_Order.Product_ID
 10  GROUP BY
 11      Product.Product_ID, Product.Product_Name, Product.Product_Category
 12  ORDER BY
 13      Total_Orders DESC
 14  FETCH FIRST 3 ROWS ONLY;
FETCH FIRST 3 ROWS ONLY
*
ERROR at line 14:
ORA-00933: SQL command not properly ended 


SQL> 
SQL> SELECT
  2      Product.Product_ID,
  3      Product.Product_Name,
  4      Product.Product_Category,
  5      COUNT(Product_Order.Order_ID) AS Total_Orders
  6  FROM
  7      Product
  8  JOIN
  9      Product_Order ON Product.Product_ID = Product_Order.Product_ID
 10  GROUP BY
 11      Product.Product_ID, Product.Product_Name, Product.Product_Category
 12  ORDER BY
 13      Total_Orders DESC
 14  WHERE ROWNUM <= 3;
WHERE ROWNUM <= 3
*
ERROR at line 14:
ORA-00933: SQL command not properly ended 


SQL> SELECT Product_ID, Total_Order
  2  FROM (SELECT Product_ID, COUNT(*) AS REPITION)
  3  FROM Product
  4  GROUP BY Product_ID
  5  ORDER BY Total_Order DESC)
  6  WHERE ROWNUM <=3;
FROM (SELECT Product_ID, COUNT(*) AS REPITION)
                                             *
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT Product_ID, Total_Order
  2  FROM (SELECT Product_ID, COUNT(*) AS Total_Order)
  3  FROM Product
  4  GROUP BY Product_ID
  5  ORDER BY Total_Order DESC)
  6  WHERE ROWNUM <=3;
FROM (SELECT Product_ID, COUNT(*) AS Total_Order)
                                                *
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT Product_ID, Word_Count
  2  FROM (SELECT Product_ID, COUNT(*) AS Word_Count)
  3  FROM Product
  4  GROUP BY Product_ID
  5  ORDER BY Word_Count DESC)
  6  WHERE ROWNUM <=3;
FROM (SELECT Product_ID, COUNT(*) AS Word_Count)
                                               *
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT Product_ID, Repitation
  2  FROM ( SELECT Product_ID,
  3  COUNT(*) AS Repitation
  4  FROM Order_Details
  5  GROUP BY Product_ID
  6  ORDER BY Repitation DESC)
  7  WHERE ROWNUM <= 3;
GROUP BY Product_ID
         *
ERROR at line 5:
ORA-00904: "PRODUCT_ID": invalid identifier 


SQL> SELECT Product_ID, Repitation
  2  FROM ( SELECT Product_ID,
  3  COUNT(*) AS Repitation
  4  FROM Product_Order
  5  GROUP BY Product_ID
  6  ORDER BY Repitation DESC)
  7  WHERE ROWNUM <= 3;

PRODUCT_ID REPITATION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
---------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
       399          2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
       359          2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
       310          2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

SQL> SELECT * FROM
  2  (SELECT Customer.Customer_ID, Customer.Customer_Name,
  3  COUNT(Order_Details.Order_ID) AS Number_of_Orders,
  4  SUM(Invoice.Total) AS Total_Expense
  5  FROM Customer
  6  JOIN Order_Details
  7  ON Customer.Customer_ID = Order_Details.Customer_ID
  8  JOIN Invoice
  9  ON Order.Invoice_ID = Invoice.Invoice_ID
 10  WHERE TO_CHAR(Order.Order_Date, Month) = 'August'
 11  GROUP BY Customer.Customer_ID, Customer.Customer_Name
 12  ORDER BY Orders_Made DESC)
 13  WHERE ROWNUM = 1;
ON Order.Invoice_ID = Invoice.Invoice_ID
   *
ERROR at line 9:
ORA-00936: missing expression 


SQL> SELECT * FROM
  2  (SELECT Customer.Customer_ID, Customer.Customer_Name, Customer.Category,
  3  COUNT(Product_Order.Order_ID) AS Number_of_Orders,
  4  SUM(Invoice.Total) AS Total_Expense
  5  FROM Customer
  6  JOIN Product_Order
  7  ON Customer.Customer_ID = Product_Order.Customer_ID
  8  JOIN Orders
  9  ON Product_Order.Order_ID = OrderS.Order_ID
 10  JOIN Invoice
 11  ON OrderS.Invoice_ID = Invoice.Invoice_ID
 12  WHERE TO_CHAR(Order.Order_Date, Month) = 'AUG'
 13  GROUP BY Customer.Customer_ID, Customer.Customer_Name, Customer.Category
 14  ORDER BY Orders_Made DESC)
 15  WHERE ROWNUM = 1;
WHERE TO_CHAR(Order.Order_Date, Month) = 'AUG'
              *
ERROR at line 12:
ORA-00936: missing expression 


SQL> SELECT * FROM
  2  (SELECT Customer.Customer_ID, Customer.Customer_Name, Customer.Category,
  3  COUNT(Product_Order.Order_ID) AS Number_of_Orders,
  4  SUM(Invoice.Total) AS Total_Expense
  5  FROM Customer
  6  JOIN Product_Order
  7  ON Customer.Customer_ID = Product_Order.Customer_ID
  8  JOIN Orders
  9  ON Product_Order.Order_ID = OrderS.Order_ID
 10  JOIN Invoice
 11  ON OrderS.Invoice_ID = Invoice.Invoice_ID
 12  WHERE TO_CHAR(Order.Order_Date, 'Month') = 'AUG'
 13  GROUP BY Customer.Customer_ID, Customer.Customer_Name, Customer.Category
 14  ORDER BY Orders_Made DESC)
 15  WHERE ROWNUM = 1;
WHERE TO_CHAR(Order.Order_Date, 'Month') = 'AUG'
              *
ERROR at line 12:
ORA-00936: missing expression 


SQL> SELECT * FROM(SELECT Customer.Customer_ID, Customer.Customer_Name, Customer.Category,
  2  COUNT(Product_Order.Order_ID) AS Number_of_Orders,
  3  SUM(Invoice.Total) AS Total_Expense
  4  FROM Customer
  5  JOIN Product_Order
  6  ON Customer.Customer_ID = Product_Order.Customer_ID
  7  JOIN Orders
  8  SELECT * FROM
  9  
SQL> 
SQL> 
SQL> SELECT * FROM
  2  (SELECT Customer.Customer_ID, Customer.Customer_Name, Customer.Category,
  3  COUNT(Product_Order.Order_ID) AS Number_of_Orders,
  4  SUM(Invoice.Total) AS Total_Expense
  5  FROM Customer
  6  JOIN Product_Order
  7  ON Customer.Customer_ID = Product_Order.Customer_ID
  8  JOIN Orders
  9  ON Product_Order.Order_ID = Orders.Order_ID
 10  JOIN Invoice
 11  ON Orders.Invoice_ID = Invoice.Invoice_ID
 12  WHERE TO_CHAR(Order.Order_Date, 'YYYY-MM') = '2023-08'
 13  GROUP BY Customer.Customer_ID, Customer.Customer_Name, Customer.Category
 14  ORDER BY Orders_Made DESC)
 15  WHERE ROWNUM = 1;
WHERE TO_CHAR(Order.Order_Date, 'YYYY-MM') = '2023-08'
              *
ERROR at line 12:
ORA-00936: missing expression 
 


SQL> SELECT * FROM
  2  (SELECT Customer.Customer_ID, Customer.Customer_Name, Customer.Category,
  3  COUNT(Product_Order.Order_ID) AS Number_of_Orders,
  4  SUM(Invoice.Total) AS Total_Expense
  5  FROM Customer
  6  JOIN Product_Order
  7  ON Customer.Customer_ID = Product_Order.Customer_ID
  8  JOIN Orders
  9  ON Product_Order.Order_ID = Orders.Order_ID
 10  JOIN Invoice
 11  ON Orders.Invoice_ID = Invoice.Invoice_ID
 12  WHERE TO_CHAR(Order.Order_Date, 'MM') = '08'
 13  GROUP BY Customer.Customer_ID, Customer.Customer_Name, Customer.Category
 14  ORDER BY Number_of_Orders DESC)
 15  WHERE ROWNUM = 1;
WHERE TO_CHAR(Order.Order_Date, 'MM') = '08'
              *
ERROR at line 12:
ORA-00936: missing expression 



SQL> SELECT * FROM
  2  (SELECT Customer.Customer_ID, Customer.Customer_Name, Customer.Category,
  3  COUNT(Product_Order.Order_ID) AS Number_of_Orders,
  4  SUM(Invoice.Total) AS Total_Expense
  5  FROM Customer
  6  JOIN Product_Order
  7  ON Customer.Customer_ID = Product_Order.Customer_ID
  8  JOIN Orders
  9  ON Product_Order.Order_ID = Orders.Order_ID
 10  JOIN Invoice
 11  ON Orders.Invoice_ID = Invoice.Invoice_ID
 12  WHERE TO_CHAR(Orders.Order_Date, 'YYYY-MM') = '2023-08'
 13  GROUP BY Customer.Customer_ID, Customer.Customer_Name, Customer.Category
 14  ORDER BY Number_of_Orders DESC)
 15  WHERE ROWNUM = 1;

CUSTOMER_ID CUSTOMER_NAME        CATEGORY   NUMBER_OF_ORDERS TOTAL_EXPENSE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
----------- -------------------- ---------- ---------------- -------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
       1867 Bina Thakur          Regular                   2        105000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

SQL> SPOOL OFF
