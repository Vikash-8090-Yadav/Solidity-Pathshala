# Smart Contract to create "Anonymous Polls" with Remix-IDE

A Smart contract that lets users create different Polls in the form of Multiple Choice Questions and other users can then cast their votes on these polls.
 The vote cast by a particular address is not stored on the contract, so it makes their choice anonymous.

The SPDX License List Specification is a list of common licenses used in free and open or collaborative software.
Pragma Thispecifies the version of Solidity used. 

## Getting Started :
Step 1 : Open [Remix IDE](https://remix.ethereum.org/) and upload the Solidity file `polls.sol`.

![image](https://user-images.githubusercontent.com/51871759/194521717-da0278d7-971f-4cb4-8541-d0f1e2c31188.png)

Step 2 : Compile the `polls.sol` file

![image](https://user-images.githubusercontent.com/51871759/194521854-fcf6ade2-d727-4c23-9ae7-f13817fe8602.png)

Step 3 : Once compiled successfully, click the "Deploy" button to deploy the contract on a Remix VM for Ethereum.

![image](https://user-images.githubusercontent.com/51871759/194521989-db6f708c-bda4-4230-8ea5-fa4b6978da7a.png)

Step 4 : Here you can see the all the transactions supported by the deployed contract

![image](https://user-images.githubusercontent.com/51871759/194522094-bdea9c9f-a602-4b64-a6f7-014dd24883ac.png)

Step 5 :
Try out the different transactions from the interface provided by Remix IDE
1) Create Poll : Create a new poll by passing the Qusetion (string) and the Multiple choice options (string array).
2) Accept Vote : Cast your vote in any existing poll by passing the Poll ID (number) and the Option Index (number).
3) Get Poll : Get the details of any existing poll by passing the Poll ID (number).
4) Get Voter : Get the details of a voter by passing their Address (address).
5) Get Total Polls : Get the total number of polls present on the contract.

![image](https://user-images.githubusercontent.com/51871759/194523526-93181227-4e14-42a9-8438-5ecebb53cf52.png)

## Video Walkthrough

https://user-images.githubusercontent.com/51871759/194672388-c4c480fa-d972-4c69-9f1b-f6c5f312eceb.mp4


