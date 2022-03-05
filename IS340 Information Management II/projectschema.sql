# Un-comment to start over:
DROP DATABASE IF EXISTS Book_Selling;
/*  Created by tableDesign_SQL 211117192503
      
  IMPLEMENTATION SETTINGS...
    Schema types (schemaTypes):
      ENTITY;RELATIONSHIP
    Design data types mapped to SQL data types (dataTypes):
      AUTHORID=CHAR(4);NAME=VARCHAR(30);BIO=VARCHAR(5000);IMAGE=VARCHAR(255);CONTRACTID=CHAR(5);PUBID=CHAR(4);ORGNAME=VARCHAR(255);ISBN=VARCHAR(255);TITLE=VARCHAR(255);COUNT=INTEGER;BOOKFORMAT=SET('PAPERBACK','HARDCOVER','KINDLE','AUDIOBOOK');LISTID=VARCHAR(4);PRICE=DECIMAL(6,2);RID=VARCHAR(3);REVIEWTITLE=VARCHAR(255);REVIEWBODY=VARCHAR(5000);CUSTID=VARCHAR(3);ITEMID=VARCHAR(6);CONTACTID=VARCHAR(3);PREFIX=SET('MR','MRS','MS','MZ');PHONE=VARCHAR(30);CCNUM=VARCHAR(30);ADDYID=VARCHAR(5);LINEONESTR=VARCHAR(255);LINETWOSTR=VARCHAR(255);CITY=VARCHAR(255);STATEORPROVINCE=VARCHAR(255);POSTALCODE=VARCHAR(30);COUNTRY=VARCHAR(255)
      (use ;-delimited name=value pairs to map specific, and/or DEFAULT, and/or unspecified ID types)
    ID/Reference constraint suffixes (idSuffix, refSuffix):
      _PK, _FK
*/
CREATE DATABASE IF NOT EXISTS Book_Selling;
USE Book_Selling;

CREATE TABLE Author (
  authorID              /* AUTHORID */          CHAR(4)         NOT NULL,    /* PK */
  authorFName           /* NAME */              VARCHAR(30)     NOT NULL,
  authorLNname          /* NAME */              VARCHAR(30)     NOT NULL,
  ContactInfo_ContactID     /* CONTACTID */     VARCHAR(3)          NULL,    /* FK */
  biography             /* BIO */               VARCHAR(5000)       NULL,
  picture               /* IMAGE */             VARCHAR(255)        NULL,
# AuthorBookTable_Author_authorID   /* AUTHORID */  CHAR(4)     NOT NULL,    /* FK */  (n/a by norm: many in 1:many)
# AuthorBookTable_Book_ISBN     /* ISBN */      VARCHAR(255)    NOT NULL,    /* FK */  (n/a by norm: many in 1:many)
# PublishRights_contractNum     /* CONTRACTID */    CHAR(5)     NOT NULL,    /* FK */  (n/a by norm: many in 1:many)
      CONSTRAINT  Author_PK PRIMARY KEY (authorID)
);

CREATE TABLE AuthorBookTable (
  Author_authorID       /* AUTHORID */          CHAR(4)         NOT NULL,    /* PK: REF as ID */
  Book_ISBN             /* ISBN */              VARCHAR(255)    NOT NULL,    /* PK: REF as ID */
      CONSTRAINT  AuthorBookTable_PK PRIMARY KEY (Author_authorID, Book_ISBN)
);

CREATE TABLE PublishRights (
  contractNum           /* CONTRACTID */        CHAR(5)         NOT NULL,    /* PK */
  Author_authorID       /* AUTHORID */          CHAR(4)         NOT NULL,    /* FK */
  Publisher_publisherID     /* PUBID */         CHAR(4)         NOT NULL,    /* FK */
  Book_ISBN             /* ISBN */              VARCHAR(255)    NOT NULL,    /* FK */
      CONSTRAINT  PublishRights_PK PRIMARY KEY (contractNum)
);

CREATE TABLE Publisher (
  publisherID           /* PUBID */             CHAR(4)         NOT NULL,    /* PK */
  orgName               /* ORGNAME */           VARCHAR(255)    NOT NULL,
  ContactInfo_ContactID     /* CONTACTID */     VARCHAR(3)          NULL,    /* FK */
# PublishRights_contractNum     /* CONTRACTID */    CHAR(5)     NOT NULL,    /* FK */  (n/a by norm: many in 1:many)
# Book_ISBN             /* ISBN */              VARCHAR(255)    NOT NULL,    /* FK */  (n/a by norm: many in 1:many)
      CONSTRAINT  Publisher_PK PRIMARY KEY (publisherID)
);

CREATE TABLE Book (
  ISBN                  /* ISBN */              VARCHAR(255)    NOT NULL,    /* PK */
  title                 /* TITLE */             VARCHAR(255)    NOT NULL,
  numberPages           /* COUNT */             INTEGER         NOT NULL,
  presentedInFormat     /* BOOKFORMAT */        SET('PAPERBACK','HARDCOVER','KINDLE','AUDIOBOOK')   NOT NULL,
# AuthorBookTable_Author_authorID   /* AUTHORID */  CHAR(4)     NOT NULL,    /* FK */  (n/a by norm: many in 1:many)
# AuthorBookTable_Book_ISBN     /* ISBN */      VARCHAR(255)    NOT NULL,    /* FK */  (n/a by norm: many in 1:many)
  PublishRights_contractNum     /* CONTRACTID */    CHAR(5)     NOT NULL,    /* FK */
  Publisher_publisherID     /* PUBID */         CHAR(4)         NOT NULL,    /* FK */
  Booklisting_listingNum    /* LISTID */        VARCHAR(4)          NULL,    /* FK */
      CONSTRAINT  Book_PK PRIMARY KEY (ISBN)
);

CREATE TABLE Booklisting (
  listingNum            /* LISTID */            VARCHAR(4)      NOT NULL,    /* PK */
  Book_ISBN             /* ISBN */              VARCHAR(255)    NOT NULL,    /* FK */
  wholesalePrice        /* PRICE */             DECIMAL(6,2)    NOT NULL,
# Review_reviewID       /* RID */               VARCHAR(3)          NULL,    /* FK */  (n/a by norm: many in 1:many)
      CONSTRAINT  Booklisting_PK PRIMARY KEY (listingNum)
);

CREATE TABLE Review (
  reviewID              /* RID */               VARCHAR(3)      NOT NULL,    /* PK */
  titleOfReview         /* REVIEWTITLE */       VARCHAR(255)    NOT NULL,
  bodyOfReview          /* REVIEWBODY */        VARCHAR(5000)   NOT NULL,
  Customer_customerID   /* CUSTID */            VARCHAR(3)      NOT NULL,    /* FK */
  Booklisting_listingNum    /* LISTID */        VARCHAR(4)      NOT NULL,    /* FK */
      CONSTRAINT  Review_PK PRIMARY KEY (reviewID)
);

CREATE TABLE Customer (
  customerID            /* CUSTID */            VARCHAR(3)      NOT NULL,    /* PK */
  orgName               /* ORGNAME */           VARCHAR(255)        NULL,
  ContactInfo_ContactID     /* CONTACTID */     VARCHAR(3)      NOT NULL,    /* FK */
# CartItem_itemID       /* ITEMID */            VARCHAR(6)          NULL,    /* FK */  (n/a by norm: many in 1:many)
# Review_reviewID       /* RID */               VARCHAR(3)          NULL,    /* FK */  (n/a by norm: many in 1:many)
      CONSTRAINT  Customer_PK PRIMARY KEY (customerID)
);

CREATE TABLE CartItem (
  itemID                /* ITEMID */            VARCHAR(6)      NOT NULL,    /* PK */
  Booklisting_listingNum    /* LISTID */        VARCHAR(4)      NOT NULL,    /* FK */
  Customer_customerID   /* CUSTID */            VARCHAR(3)      NOT NULL,    /* FK */
      CONSTRAINT  CartItem_PK PRIMARY KEY (itemID)
);

CREATE TABLE ContactInfo (
  ContactID             /* CONTACTID */         VARCHAR(3)      NOT NULL,    /* PK */
  fname                 /* NAME */              VARCHAR(30)     NOT NULL,
  midname               /* NAME */              VARCHAR(30)         NULL,
  lname                 /* NAME */              VARCHAR(30)     NOT NULL,
  prefix                /* PREFIX */            SET('MR','MRS','MS','MZ')       NULL,
  contactPhone          /* PHONE */             VARCHAR(30)     NOT NULL,
  paymentMethod         /* CCNUM */             VARCHAR(30)         NULL,
  BillAddress_AddressID     /* ADDYID */        VARCHAR(5)      NOT NULL,    /* FK */
  ShipAddress_AddressID     /* ADDYID */        VARCHAR(5)      NOT NULL,    /* FK */
  Customer_customerID   /* CUSTID */            VARCHAR(3)          NULL,    /* FK */
  Author_authorID       /* AUTHORID */          CHAR(4)             NULL,    /* FK */
  Publisher_publisherID     /* PUBID */         CHAR(4)             NULL,    /* FK */
      CONSTRAINT  ContactInfo_PK PRIMARY KEY (ContactID)
);

CREATE TABLE BillAddress (
  AddressID             /* ADDYID */            VARCHAR(5)      NOT NULL,    /* PK */
  ContactInfo_ContactID     /* CONTACTID */     VARCHAR(3)      NOT NULL,    /* FK */
  street1               /* LINEONESTR */        VARCHAR(255)    NOT NULL,
  street2               /* LINETWOSTR */        VARCHAR(255)        NULL,
  city                  /* CITY */              VARCHAR(255)    NOT NULL,
  stateProvince         /* STATEORPROVINCE */   VARCHAR(255)    NOT NULL,
  postCode              /* POSTALCODE */        VARCHAR(30)     NOT NULL,
  country               /* COUNTRY */           VARCHAR(255)    NOT NULL,
      CONSTRAINT  BillAddress_PK PRIMARY KEY (AddressID)
);

CREATE TABLE ShipAddress (
  AddressID             /* ADDYID */            VARCHAR(5)      NOT NULL,    /* PK */
  ContactInfo_ContactID     /* CONTACTID */     VARCHAR(3)      NOT NULL,    /* FK */
  street1               /* LINEONESTR */        VARCHAR(255)    NOT NULL,
  street2               /* LINETWOSTR */        VARCHAR(255)        NULL,
  city                  /* CITY */              VARCHAR(255)    NOT NULL,
  stateProvince         /* STATEORPROVINCE */   VARCHAR(255)    NOT NULL,
  postCode              /* POSTALCODE */        VARCHAR(30)     NOT NULL,
  country               /* COUNTRY */           VARCHAR(255)    NOT NULL,
      CONSTRAINT  ShipAddress_PK PRIMARY KEY (AddressID)
);


