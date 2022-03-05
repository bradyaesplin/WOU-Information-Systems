/*************************************************************************************
    Note for _relationship_ constraints below:
        
    Apply these constraints AFTER adding initial data, to avoid nuisance errors and 
    to more directly identify issues with _entity_ design or initial data
**************************************************************************************/

ALTER TABLE Author
  ADD CONSTRAINT  Author_ContactInfo_FK FOREIGN KEY (ContactInfo_ContactID)  REFERENCES ContactInfo (ContactID)
;

ALTER TABLE AuthorBookTable
  ADD CONSTRAINT  AuthorBookTable_Author_FK FOREIGN KEY (Author_authorID)  REFERENCES Author (authorID)
;

ALTER TABLE AuthorBookTable
  ADD CONSTRAINT  AuthorBookTable_Book_FK FOREIGN KEY (Book_ISBN)  REFERENCES Book (ISBN)
;

ALTER TABLE PublishRights
  ADD CONSTRAINT  PublishRights_Author_FK FOREIGN KEY (Author_authorID)  REFERENCES Author (authorID)
;

ALTER TABLE PublishRights
  ADD CONSTRAINT  PublishRights_Publisher_FK FOREIGN KEY (Publisher_publisherID)  REFERENCES Publisher (publisherID)
;

ALTER TABLE PublishRights
  ADD CONSTRAINT  PublishRights_Book_FK FOREIGN KEY (Book_ISBN)  REFERENCES Book (ISBN)
;

ALTER TABLE Publisher
  ADD CONSTRAINT  Publisher_ContactInfo_FK FOREIGN KEY (ContactInfo_ContactID)  REFERENCES ContactInfo (ContactID)
;

ALTER TABLE Book
  ADD CONSTRAINT  Book_PublishRights_FK FOREIGN KEY (PublishRights_contractNum)  REFERENCES PublishRights (contractNum)
;

ALTER TABLE Book
  ADD CONSTRAINT  Book_Publisher_FK FOREIGN KEY (Publisher_publisherID)  REFERENCES Publisher (publisherID)
;

ALTER TABLE Book
  ADD CONSTRAINT  Book_Booklisting_FK FOREIGN KEY (Booklisting_listingNum)  REFERENCES Booklisting (listingNum)
;

ALTER TABLE Booklisting
  ADD CONSTRAINT  Booklisting_Book_FK FOREIGN KEY (Book_ISBN)  REFERENCES Book (ISBN)
;

ALTER TABLE Review
  ADD CONSTRAINT  Review_Customer_FK FOREIGN KEY (Customer_customerID)  REFERENCES Customer (customerID)
;

ALTER TABLE Review
  ADD CONSTRAINT  Review_Booklisting_FK FOREIGN KEY (Booklisting_listingNum)  REFERENCES Booklisting (listingNum)
;

ALTER TABLE Customer
  ADD CONSTRAINT  Customer_ContactInfo_FK FOREIGN KEY (ContactInfo_ContactID)  REFERENCES ContactInfo (ContactID)
;

ALTER TABLE CartItem
  ADD CONSTRAINT  CartItem_Booklisting_FK FOREIGN KEY (Booklisting_listingNum)  REFERENCES Booklisting (listingNum)
;

ALTER TABLE CartItem
  ADD CONSTRAINT  CartItem_Customer_FK FOREIGN KEY (Customer_customerID)  REFERENCES Customer (customerID)
;

ALTER TABLE ContactInfo
  ADD CONSTRAINT  ContactInfo_BillAddress_FK FOREIGN KEY (BillAddress_AddressID)  REFERENCES BillAddress (AddressID)
;

ALTER TABLE ContactInfo
  ADD CONSTRAINT  ContactInfo_ShipAddress_FK FOREIGN KEY (ShipAddress_AddressID)  REFERENCES ShipAddress (AddressID)
;

ALTER TABLE ContactInfo
  ADD CONSTRAINT  ContactInfo_Customer_FK FOREIGN KEY (Customer_customerID)  REFERENCES Customer (customerID)
;

ALTER TABLE ContactInfo
  ADD CONSTRAINT  ContactInfo_Author_FK FOREIGN KEY (Author_authorID)  REFERENCES Author (authorID)
;

ALTER TABLE ContactInfo
  ADD CONSTRAINT  ContactInfo_Publisher_FK FOREIGN KEY (Publisher_publisherID)  REFERENCES Publisher (publisherID)
;

ALTER TABLE BillAddress
  ADD CONSTRAINT  BillAddress_ContactInfo_FK FOREIGN KEY (ContactInfo_ContactID)  REFERENCES ContactInfo (ContactID)
;

ALTER TABLE ShipAddress
  ADD CONSTRAINT  ShipAddress_ContactInfo_FK FOREIGN KEY (ContactInfo_ContactID)  REFERENCES ContactInfo (ContactID)
;