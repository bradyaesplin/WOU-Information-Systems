/*  Created by tableData_SQL 211117191834
    Not-applicable (n/a) data pattern (naValue):
      n/a
    No-data (null) data value (nullValue):
      NULL
    Separator for composite ID values combined into single ID value (idSep):
      | ("bar")
*/
USE Book_Selling;

/*  Author( authorID, authorFName, authorLNname, ContactInfo, biography, picture, [N/A:AuthorBookTable], [N/A:PublishRights] )
*/
INSERT INTO Author VALUES (
  1467, 'Frank', 'Herbert', 333, 'Biography Here', 'Picture Link Here' );
INSERT INTO Author VALUES (
  5544, 'Ann', 'Leckie', 333, 'Biography Here', 'Picture Link Here' );
INSERT INTO Author VALUES (
  3973, 'Andrzej', 'Sapkowski', 333, 'Biography Here', 'Picture Link Here' );
INSERT INTO Author VALUES (
  4871, 'Neal', 'Stephenson', 333, 'Biography Here', 'Picture Link Here' );
INSERT INTO Author VALUES (
  7812, 'Gavin', 'de Becker', 333, 'Biography Here', 'Picture Link Here' );
INSERT INTO Author VALUES (
  3587, 'Pierce', 'Brown', 333, 'Biography Here', 'Picture Link Here' );
INSERT INTO Author VALUES (
  8841, 'Richard', 'Morgan', 333, 'Biography Here', 'Picture Link Here' );

/*  AuthorBookTable( Author, Book )
*/
INSERT INTO AuthorBookTable VALUES (
  1467, 0441172717 );
INSERT INTO AuthorBookTable VALUES (
  5544, 'B00BAXFDLM' );
INSERT INTO AuthorBookTable VALUES (
  3973, 'B0010SIPT4' );
INSERT INTO AuthorBookTable VALUES (
  4871, 'B00LZWV8JO' );
INSERT INTO AuthorBookTable VALUES (
  7812, 0440508835 );
INSERT INTO AuthorBookTable VALUES (
  3587, 'B00CVS2J80' );
INSERT INTO AuthorBookTable VALUES (
  8841, 'B000FBFMZ2' );

/*  PublishRights( contractNum, Author, Publisher, Book )
*/
INSERT INTO PublishRights VALUES (
  67431, 1467, 9846, 0441172717 );
INSERT INTO PublishRights VALUES (
  54821, 5544, 4872, 'B00BAXFDLM' );
INSERT INTO PublishRights VALUES (
  12784, 3973, 4872, 'B0010SIPT4' );
INSERT INTO PublishRights VALUES (
  47869, 4871, 4478, 'B00LZWV8JO' );
INSERT INTO PublishRights VALUES (
  87912, 7812, 1321, 0440508835 );
INSERT INTO PublishRights VALUES (
  59134, 3587, 2429, 'B00CVS2J80' );
INSERT INTO PublishRights VALUES (
  12345, 8841, 2429, 'B000FBFMZ2' );

/*  Publisher( publisherID, orgName, ContactInfo, [N/A:PublishRights], [N/A:Book] )
*/
INSERT INTO Publisher VALUES (
  9846, 'Chilton Books', NULL );
INSERT INTO Publisher VALUES (
  4872, 'Orbit', NULL );
INSERT INTO Publisher VALUES (
  4478, 'William Morrow', NULL );
INSERT INTO Publisher VALUES (
  1321, 'Dell', NULL );
INSERT INTO Publisher VALUES (
  2429, 'Del Rey', NULL );

/*  Book( ISBN, title, numberPages, presentedInFormat, [N/A:AuthorBookTable], PublishRights, Publisher, Booklisting )
*/
INSERT INTO Book VALUES (
  0441172717, 'Dune', 412, 'paperback', 67431, 9846, 6571 );
INSERT INTO Book VALUES (
  'B00BAXFDLM', 'Ancillary Justice', 393, 'Kindle', 54821, 4872, 7812 );
INSERT INTO Book VALUES (
  'B0010SIPT4', 'The Last Wish', 292, 'Kindle', 12784, 4872, 4739 );
INSERT INTO Book VALUES (
  'B00LZWV8JO', 'Seveneves', 880, 'Kindle', 47869, 4478, 5132 );
INSERT INTO Book VALUES (
  0440508835, 'The Gift of Fear', 384, 'Paperback', 87912, 1321, 6523 );
INSERT INTO Book VALUES (
  'B00CVS2J80', 'Red Rising', 401, 'Kindle', 59134, 2429, 9134 );
INSERT INTO Book VALUES (
  'B000FBFMZ2', 'Altered Carbon', 544, 'Kindle', 12345, 2429, 1234 );

/*  Booklisting( listingNum, Book, wholesalePrice, [N/A:Review] )
*/
INSERT INTO Booklisting VALUES (
  6571, 0441172717, 4.00 );
INSERT INTO Booklisting VALUES (
  7812, 'B00BAXFDLM', 4.00 );
INSERT INTO Booklisting VALUES (
  4739, 'B0010SIPT4', 4.00 );
INSERT INTO Booklisting VALUES (
  5132, 'B00LZWV8JO', 4.00 );
INSERT INTO Booklisting VALUES (
  6523, 0440508835, 4.00 );
INSERT INTO Booklisting VALUES (
  9134, 'B00CVS2J80', 4.00 );
INSERT INTO Booklisting VALUES (
  1234, 'B000FBFMZ2', 4.00 );

/*  Review( reviewID, titleOfReview, bodyOfReview, Customer, Booklisting )
*/
INSERT INTO Review VALUES (
  412, 'Great Book!', 'I loved it!', 555, 6571 );
INSERT INTO Review VALUES (
  774, 'Its ok...', 'I liked it', 784, 1234 );

/*  Customer( customerID, orgName, ContactInfo, [N/A:CartItem], [N/A:Review] )
*/
INSERT INTO Customer VALUES (
  555, 'N/A', 555 );
INSERT INTO Customer VALUES (
  754, 'N/A', 754 );
INSERT INTO Customer VALUES (
  135, 'N/A', 135 );
INSERT INTO Customer VALUES (
  912, 'N/A', 912 );
INSERT INTO Customer VALUES (
  871, 'N/A', 871 );
INSERT INTO Customer VALUES (
  784, 'N/A', 784 );

/*  CartItem( itemID, Booklisting, Customer )
*/
INSERT INTO CartItem VALUES (
  685487, 9134, 754 );

/*  ContactInfo( ContactID, fname, midname, lname, prefix, contactPhone, paymentMethod, BillAddress, ShipAddress, Customer, Author, Publisher )
*/
INSERT INTO ContactInfo VALUES (
  555, 'Brady', 'Alexander', 'Esplin', 'Mr', 5555555555, '', 87395, 87395, 555, NULL, NULL );
INSERT INTO ContactInfo VALUES (
  754, 'Alex', 'J.', 'Smith', '', 5555153642, '', 13581, 13581, 754, NULL, NULL );
INSERT INTO ContactInfo VALUES (
  135, 'Shirila', 'I.', 'McNeilly', 'Ms', 5556996596, '', 54356, 54356, 135, NULL, NULL );
INSERT INTO ContactInfo VALUES (
  912, 'Angie', 'G.', 'Scurlock', 'Mz', 5551991373, '', 94513, 94513, 912, NULL, NULL );
INSERT INTO ContactInfo VALUES (
  871, 'Mitch', 'C.', 'Puls', '', 5559558480, '', 12654, 12654, 871, NULL, NULL );
INSERT INTO ContactInfo VALUES (
  784, 'Willie', 'G.', 'Vaccaro', '', 5558485885, '', 65432, 65432, 784, NULL, NULL );
INSERT INTO ContactInfo VALUES (
  333, 'Aria', 'C.', 'Andrews', 'Mz', 5557573435, '', 33333, 33333, NULL, 1467, NULL );

/*  BillAddress( AddressID, ContactInfo, street1, street2, city, stateProvince, postCode, country )
*/
INSERT INTO BillAddress VALUES (
  87395, 555, '5555 Some Street', NULL, 'Albany', 'OR', 97321, 'USA' );
INSERT INTO BillAddress VALUES (
  13581, 754, '8969 Random Road', 'APT B', 'Salem', 'OR', 97112, 'USA' );
INSERT INTO BillAddress VALUES (
  54356, 135, '249 Any Avenue', 'Number 12', 'Scranton', 'PA', 63582, 'USA' );
INSERT INTO BillAddress VALUES (
  94513, 912, '263 Lonesome Lane', NULL, 'Colorado City', 'CO', 87657, 'USA' );
INSERT INTO BillAddress VALUES (
  12654, 871, '369 Cloudy Court', NULL, 'Lansing', 'MI', 28307, 'USA' );
INSERT INTO BillAddress VALUES (
  65432, 784, '711 Calm Court', 'Number 3', 'Rawlings', 'SC', 35684, 'USA' );
INSERT INTO BillAddress VALUES (
  33333, 333, '333 Ronald Avenue', NULL, 'Monterey', 'CA', 93901, 'USA' );

/*  ShipAddress( AddressID, ContactInfo, street1, street2, city, stateProvince, postCode, country )
*/
INSERT INTO ShipAddress VALUES (
  87395, 555, '5555 Some Street', NULL, 'Albany', 'OR', 97321, 'USA' );
INSERT INTO ShipAddress VALUES (
  13581, 754, '8969 Random Road', 'APT B', 'Salem', 'OR', 97112, 'USA' );
INSERT INTO ShipAddress VALUES (
  54356, 135, '249 Any Avenue', 'Number 12', 'Scranton', 'PA', 63582, 'USA' );
INSERT INTO ShipAddress VALUES (
  94513, 912, '263 Lonesome Lane', NULL, 'Colorado City', 'CO', 87657, 'USA' );
INSERT INTO ShipAddress VALUES (
  12654, 871, '369 Cloudy Court', NULL, 'Lansing', 'MI', 28307, 'USA' );
INSERT INTO ShipAddress VALUES (
  65432, 784, '711 Calm Court', 'Number 3', 'Rawlings', 'SC', 35684, 'USA' );
INSERT INTO ShipAddress VALUES (
  33333, 333, '333 Ronald Avenue', NULL, 'Monterey', 'CA', 93901, 'USA' );
