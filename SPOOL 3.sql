SQL> 
SQL> DROP TABLE Customer;
DROP TABLE Customer
           *
ERROR at line 1:
ORA-02449: unique/primary keys in table referenced by foreign keys 


SQL> DROP TABLE Product_Order;

Table dropped.

SQL> ]
SP2-0042: unknown command "]" - rest of line ignored.
SQL> 
SQL> 
SQL> DROP TABLE Order_Details;

Table dropped.

SQL> DROP TABLE Orders;

Table dropped.

SQL> DROP TABLE Product;

Table dropped.

SQL> DROP TABLE Invoice;

Table dropped.

SQL> DROP TABLE Vendor;

Table dropped.

SQL> DROP TABLE Customer;

Table dropped.

SQL> SELECT * FROM TAB;

no rows selected

SQL> SPOOL OFF
