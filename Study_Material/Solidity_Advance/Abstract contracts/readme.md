# Abstract contracts

Abstract contracts are contracts that have atleast one function without its implementation.

- To make a abstract you have to use the abstract keyword.

- Generally an abstract contract contains both implemented as well as abstract functions. 
 
- Derived contract will implement the abstract function and use the existing functions as and when required.

#### Now we will see abstract contract with the help of an example using remixIDE:-

First let's see some basic inheritance

1) We have the Parent contract in which we have added some functions and variables.

![Parent](https://user-images.githubusercontent.com/95535448/188303511-b9bfe931-6b9a-4db9-9a88-479442794939.png)

2) Now he have a child contract which is inheriting from the parent contract. 

![child](https://user-images.githubusercontent.com/95535448/188303988-47d87d41-5b05-4875-9dd3-4a3c4e48bc42.png)

You can see the child contract inherites the parent contracts, you can check it by clicking str constructor u will see it returns hello world from it. This is because the child contract has inherited the parent's constructor.  

3) Now in the parent contract let's look at the setter function.
