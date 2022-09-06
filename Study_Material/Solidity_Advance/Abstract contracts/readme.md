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

![before funk](https://user-images.githubusercontent.com/95535448/188608421-b6a4ff43-f6fe-4df9-804a-e88e4960bf9a.png)

4) Now let's try to remove the implementation part from this function and use a semi colon.

![after funk](https://user-images.githubusercontent.com/95535448/188609756-6c63ca62-74dc-43f7-b83f-da2fa63e4456.png)

Now, we are using a function which does not have any implementation in the parent contract , lets  compile it.

After compiling we will notice three major errors:-

5) Error 1:-

![error](https://user-images.githubusercontent.com/95535448/188612054-d1b70c29-650e-4b44-9162-a5234668a9e6.png)

We can see that we are using a function without implementation so in that case we have to make that contract an **abstract** contract.

#### Solution -
![error2](https://user-images.githubusercontent.com/95535448/188625286-fb02725f-96e3-4768-a1b8-0ac77fe02757.png)


6) Error 2:-

![error2](https://user-images.githubusercontent.com/95535448/188614705-3b164fd7-fd91-4888-bb37-2fe9def70887.png)

Whenever we are making an abstract contract and that abstract contract has a function without implementation we have to mark that fucntion as **virtual**.

#### Solution -
![sol2](https://user-images.githubusercontent.com/95535448/188625918-6b807bb7-c1ef-43a4-8cca-f9248c2d4ecf.png)


7) Error 3:-

![error3 sosososos](https://user-images.githubusercontent.com/95535448/188626208-50a577e9-055d-45d4-89a3-15cc9b4965fb.png)


- If the derived contract is also not implementing the incomplete functions then that derived contract will be marked as abstract. 
- So basically we can solve this issue just by adding abstract. But we will use a different way 

#### Solution

If we implement the parent function inside the child function and add **override** keyword , our issue will be resolved.

![impli](https://user-images.githubusercontent.com/95535448/188623593-ba3e787f-4586-431b-b62e-d240643a31ae.png)

#### Few points about Override 

- Solidity lets developers change how a function in the parent contract is implemented in the derived class. This is known as function overriding.
- The function in the parent contract needs to be declared with the keyword virtual to indicate that it can be overridden in the deriving contract.

#### Now lets see our Abstract contract 


![fina](https://user-images.githubusercontent.com/95535448/188623034-e98075a4-c7de-45e6-936a-8ac5850bcf24.png)


