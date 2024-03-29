SQL> 
SQL> SELECT Product_ID, Product_Name, Repetition
  2  FROM (
  3  SELECT Product.Product_ID, Product.Product_Name, COUNT(*) AS Repetition
  4  JOIN Product ON Product_Order.Product_ID = Product.Product_ID
  5  ORDER BY Repetition DESC )
  6  WHERE ROWNUM <= 3;
JOIN Product ON Product_Order.Product_ID = Product.Product_ID
*
ERROR at line 4:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT Product_ID, Product_Name, Product_Category, Repetition
  2  FROM (
  3  SELECT Product.Product_ID, Product.Product_Name, Product_Category,
  4  COUNT(*) AS Repetition
  5  FROM Product_Order
  6  SELECT Product.Product_ID, Product.Product_Name, Product_Category,
  7  
SQL> 
SQL> SELECT Product_ID, Product_Name, Product_Category, Repetition
  2  FROM (
  3  SELECT Product.Product_ID, Product.Product_Name, Product_Category,
  4  COUNT(*) AS Repetition
  5  FROM Product_Order
  6  JOIN Product ON Product_Order.Product_ID = Product.Product_ID
  7  ORDER BY Repetition DESC )
  8  WHERE ROWNUM <= 3;
SELECT Product.Product_ID, Product.Product_Name, Product_Category,
       *
ERROR at line 3:
ORA-00937: not a single-group group function 


SQL>  SELECT Product_ID, Product_Name, Product_Category, Repetition
  2  FROM (
  3  
SQL> 
SQL> 
SQL> 
SQL> 
SQL> SELECT Product_ID, Product_Name, Product_Category, Repetition
  2  FROM (
  3  SELECT Product.Product_ID, Product.Product_Name, Product.Product_Category
  4  COUNT(*) AS Repetition
  5  FROM Product_Order
  6  JOIN Product
  7  ON Product_Order.Product_ID = Product.Product_ID
  8  GROUP BY Product.Product_ID, Product.Product_Name, Product.Product_Category
  9  ORDER BY Repetition DESC )
 10  WHERE ROWNUM <= 3;
COUNT(*) AS Repetition
     *
ERROR at line 4:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT Product_ID, Product_Name, Product_Category, Repetition
  2  FROM (
  3  SELECT Product.Product_ID, Product.Product_Name, Product.Product_Category,
  4  COUNT(*) AS Repetition
  5  FROM Product_Order
  6  JOIN Product
  7  ON Product_Order.Product_ID = Product.Product_ID
  8  GROUP BY Product.Product_ID, Product.Product_Name, Product.Product_Category
  9  ORDER BY Repetition DESC )
 10  WHERE ROWNUM <= 3;

PRODUCT_ID PRODUCT_NAME         PRODUCT_CATEGOR REPETITION                      
---------- -------------------- --------------- ----------                      
       310 Ultima Atom 520 Pro  Earbuds                  2                      
       399 Airpods Pro          Earbuds                  2                      
       359 T800 Ultra           Smart Watch              2                      

SQL> SET LINESIZE 1000
SQL> SET PAGESIZE 40
SQL> 
SQL> SELECT Product_ID, Product_Name, Product_Category, Repetition
  2  FROM (
  3  SELECT Product.Product_ID, Product.Product_Name, Product.Product_Category,
  4  COUNT(*) AS Repetition
  5  FROM Product_Order
  6  JOIN Product
  7  ON Product_Order.Product_ID = Product.Product_ID
  8  ORDER BY Repetition DESC )
  9  WHERE ROWNUM <= 3;
SELECT Product.Product_ID, Product.Product_Name, Product.Product_Category,
       *
ERROR at line 3:
ORA-00937: not a single-group group function 


SQL> SELECT Product_ID, Product_Name, Product_Category, Repetition
  2  FROM (
  3  SELECT Product.Product_ID, Product.Product_Name, Product.Product_Category,
  4  COUNT(*) AS Repetition
  5  FROM Product_Order
  6  JOIN Product
  7  ON Product_Order.Product_ID = Product.Product_ID
  8  GROUP BY Product.Product_ID, Product.Product_Name, Product.Product_Category
  9  ORDER BY Repetition DESC )
 10  WHERE ROWNUM <= 3;

PRODUCT_ID PRODUCT_NAME         PRODUCT_CATEGOR REPETITION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
---------- -------------------- --------------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
       310 Ultima Atom 520 Pro  Earbuds                  2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
       399 Airpods Pro          Earbuds                  2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
       359 T800 Ultra           Smart Watch              2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

SQL> SPOOL OFF
