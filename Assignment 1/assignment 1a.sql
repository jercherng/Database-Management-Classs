CREATE TABLE PRODUCTS
(
	-- Product ID 			TYPE: NUMERIC-Integer 
	-- Product Description 	TYPE: VARCHAR2(200)
	PRODUCT_ID INT NOT NULL,
	PRODUCT_DESCRIPTION VARCHAR2(200) NOT NULL,
	CONSTRAINT product_pk PRIMARY KEY (PRODUCT_ID)
);

CREATE TABLE ITEMS
(
	-- Item Num   		TYPE: NUMERIC-Integer
	-- ItemDescription 	TYPE: VARCHAR2(200)
	ITEM_NUM INT NOT NULL,
	ITEM_DESCRIPTION VARCHAR2(200) NOT NULL,
	CONSTRAINT items_pk PRIMARY KEY (ITEM_NUM)
);

CREATE TABLE SALES
(
	-- Receipt Num 	TYPE: NUMERIC-Integer
	-- SalesDate 	TYPE: VARCHAR2(200)
	RECEIPT_NUM INT NOT NULL,
	SalesDate DATE NOT NULL,
	CONSTRAINT sales_pk PRIMARY KEY (RECEIPT_NUM)
);

CREATE TABLE USED
(
	-- Product_ID and Item Num are primary keys
	-- Quantity Used integer with constraint >= 0
	PRODUCT_ID INTEGER NOT NULL,
	ITEM_NUM INTEGER NOT NULL,
	QUANTITY_USED INTEGER NOT NULL,
	CONSTRAINT ChkQuantityUsed CHECK(QUANTITY_USED >= 0),
	CONSTRAINT UsedPK PRIMARY KEY (PRODUCT_ID, ITEM_NUM),
	CONSTRAINT UsedFK1 FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
	ON DELETE CASCADE,
	CONSTRAINT UsedFK2 FOREIGN KEY (ITEM_NUM) REFERENCES ITEMS(ITEM_NUM)
	ON DELETE CASCADE
);

CREATE TABLE SOLD
(
	-- Product_ID and Item Num are primary keys
	-- Quantity Used integer with constraint >= 0
	PRODUCT_ID INTEGER NOT NULL,
	RECEIPT_NUM INTEGER NOT NULL,
	QUANTITY_SOLD INTEGER NOT NULL,
	CONSTRAINT ChkQuantitySold CHECK(QUANTITY_SOLD >= 0),
	CONSTRAINT SoldPK PRIMARY KEY (PRODUCT_ID, RECEIPT_NUM),
	CONSTRAINT SoldFK1 FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
  	ON DELETE CASCADE,
	CONSTRAINT SoldFK2 FOREIGN KEY (RECEIPT_NUM) REFERENCES SALES(RECEIPT_NUM)
	ON DELETE CASCADE
);