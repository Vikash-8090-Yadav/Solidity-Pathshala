Hi Solidity Explorers ! 
This is a program written to take two numbers as input and return their sum as input. The code is shown in the image 
![Sum_of_num](https://user-images.githubusercontent.com/89985553/193456249-a850d23d-09f0-4954-8694-36abf92e351b.png)

Line 1 in the Code contains the License : // SPDX-License-Identifier: MIT
License of Solidity program has a SPDX License which is a Software Package Data Exchange ( SPDX ), this license allows the expression of components, copyrights and security references 

![Add_pragma](https://user-images.githubusercontent.com/89985553/193457238-68a8cdcb-1e98-4310-9b16-504d0c4d32cb.png)

The First Line of Solidity Code has a pragma solidity , Pragma acts like a directive and it specifies the compiler verson we will be using for the program, in our addition program we are using 0.6.0 version. 

![contract img](https://user-images.githubusercontent.com/89985553/193457487-a4b8c129-d042-4080-84b2-6792b7d9c944.png)

Contract : A contract is a fundamental block of building an application on Ethereum. We name the smart contract which we are going to build. 

![naming variable img](https://user-images.githubusercontent.com/89985553/193457506-6c6e953f-c1c0-4f27-a71e-af7d63d2297f.png)

After nameing, we have to declare the variables data type, here we have integer type. We also need to declare the state of working which is specified by 'public' i.e public functions/ Variables can be used both externally and internally

![write function img](https://user-images.githubusercontent.com/89985553/193457537-1c7d10c9-757c-4d78-bf48-f48abaa7ac5e.png)

Here we go! 
Now we are writing a function - writing a function requires a gas since we are making a change on the blockchain 

![read function img](https://user-images.githubusercontent.com/89985553/193457556-3ab8320c-015e-4245-bd0b-950b9063d9b3.png)

We now have to write a function to get the result, for this we develop a read function. Note : Read functions don't consume gas.

![add deployed](https://user-images.githubusercontent.com/89985553/193457566-194f1ba6-d1b5-4f35-98d7-0eeba1102d4d.png)

This is the interface, we get after depoloying the Smart Contract, Fill the numbers yo want to get the sum and hit the add button. 

![result add deployed](https://user-images.githubusercontent.com/89985553/193457608-191bc108-dcb1-4b95-a6e2-f68e58e866bb.png)

This is the result which we will get after running the smart contract 
