// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.9.0;

contract Day5 {

    // Creating a structure book which will contain the book id, title and the author's name
    struct Book {
            uint256 book_id;
            string title;
            string author;
    }
    
    // Array that stores the books
    Book[100] book;
    uint256 i = 1; //counter

    function setBook(uint256 _id, string memory _titile, string memory _author) public {
        require(i<=100);
        // Here we store the details of the book
        book[i] = Book(_id, _titile, _author); 
        i++;
    }

    function getBook(uint256 _i) public view returns (uint256, string memory, string memory){
        // Giving the details of the book with ID i
        return (book[_i].book_id, book[_i].title, book[_i].author);
    }

}
