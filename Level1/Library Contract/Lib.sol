// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Library {

  // adding an event to add books 
  event AddBook(address recipient, uint bookId);
  // adding an event to set bookId etc
  event SetFinished(uint bookId, bool finished);

 // struct to add properties of the book
 
  struct Book {
    uint id;
    string name;
    uint year;
    string author;
    bool finished;
  }

  Book[] private bookList;

  // Mapping of Book id to the wallet address of the user adding the new book under their name
  mapping(uint256 => address) bookToOwner;

// This function will allow us to add features to our Book like its name, year etc )

  function addBook(string memory name, uint16 year, string memory author, bool finished) external {
    uint bookId = bookList.length;
    bookList.push(Book(bookId, name, year, author, finished));
    bookToOwner[bookId] = msg.sender;
    emit AddBook(msg.sender, bookId);
  }
 
 // With this function we will get the list of our books
  function _getBookList(bool finished) private view returns (Book[] memory) {
    Book[] memory temporary = new Book[](bookList.length);
    uint counter = 0;
    for(uint i=0; i<bookList.length; i++) {
      if(bookToOwner[i] == msg.sender &&
        bookList[i].finished == finished
      ) {
        temporary[counter] = bookList[i];
        counter++;
      }
    }

    Book[] memory result = new Book[](counter);
    for(uint i=0; i<counter; i++) {
      result[i] = temporary[i];
    }
    return result;
  }
  // we will get finished status books with this function    
  function getFinishedBooks() external view returns (Book[] memory) {
    return _getBookList(true);
  }
   
   // we will get unfinished status books with this function    
  function getUnfinishedBooks() external view returns (Book[] memory) {
    return _getBookList(false);
  }
  // allows us to set the status of our book as finished or unfinished
  function setFinished(uint bookId, bool finished) external {
    if (bookToOwner[bookId] == msg.sender) {
      bookList[bookId].finished = finished;
      emit SetFinished(bookId, finished);
    }
  }

}
