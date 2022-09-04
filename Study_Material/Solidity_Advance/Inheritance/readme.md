# Inheritance 
Inheritance in the Solidity is the procedure in which one contract inherits the attributes and methods of another contract. Following are the key highlights.

- A derived contract can access all non-private members including internal methods and state variables. But using this is not allowed.

- Function overriding is allowed provided function signature remains same. In case of difference of output parameters, compilation will fail.

#### Now we will see inheritance with the help of an example using remixIDE:-

1) We have the Parent contract in which we have added some functions and variables.

![Parent](https://user-images.githubusercontent.com/95535448/188303511-b9bfe931-6b9a-4db9-9a88-479442794939.png)

2) Now he have a child contract which is inheriting from the parent contract. 

![child](https://user-images.githubusercontent.com/95535448/188303988-47d87d41-5b05-4875-9dd3-4a3c4e48bc42.png)

You can see the child contract inherites the parent contracts, you can check it by clicking str constructor u will see it returns hello world from it. This is because the child contract has inherited the parent's constructor.  

 ![both](https://user-images.githubusercontent.com/95535448/188304154-5ea5ca2f-cb15-468b-aef6-7d79bc1415db.png)


3) You can see apart from all the inherited values we have the x variable inside the child contract( it was a value of 0 because we have not intialised it yet). But u can notice that the variable x is not present in our Parent contract because the parent contract is not inheriting the child contract.

So, In short we can say **The child contracts inherits the attributes of the parent contract** but **the parent doesn't not inherits the child contract**.




