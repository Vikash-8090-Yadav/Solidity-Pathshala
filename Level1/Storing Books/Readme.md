# Storing Books Smart Contract 

This is a smart contract where user can keep records of the books that he reads. It will store the details about the book in an array of datatype "Book". Whenever the user wants, he can retrieve details about the book using the book's id.

A basic library kind of system made with Solidity.
This will store the details of the books when the details like:
* Book ID
* Title
* Author's name

are entered and then later on user can access the book's details by using the Book ID

## Brief introduction about the code 
 
 1. **struct Book** is used to define the structure of the details. The ID, Title and author's name will be taken in Book.
 2. **Book[] book** is an array of the datatype Book. It will store the details of many books.
 3. **setBook()** function is used to store the details of the book. The parameters taken are : ID, Title and Author's name.
 4. **getBook()** function is used to retrieve the details about the book. The parameter passed is the ID.
 

 ### Sreenshots attached:
 
**The code :**
![Screenshot (1137)](https://user-images.githubusercontent.com/73381366/194027211-71ff6134-ad65-47dd-994d-75206d9f9f7f.png) <br>

**Storing data of books :** <br><br>
![Screenshot (1134)](https://user-images.githubusercontent.com/73381366/194027208-3ac89b6d-333d-4bd1-bbc3-49cc28c8fa84.png)

**Retrieving data of books :**<br><br>
![Screenshot (1138)](https://user-images.githubusercontent.com/73381366/194027197-c1f7d119-acb1-4119-b198-3e5a1262ec8d.png) <br>

