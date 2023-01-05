# Smart Contract "Voting" in Remix-IDE


## Getting Started :


### Step 1:

For opening the remix-ide in browser type: https://remix.ethereum.org/.

A screen will be presented like the following:
![File explorer](https://user-images.githubusercontent.com/95535448/182686591-5ae38b05-1ea2-4532-9ee1-d368a43de36b.png)

Click on the “file explorer” icon onto the left side bar.

Select Solidity in the Environment and click + symbol right to the browser.

Type the file name and enter the respective code into it.

### Step 2:
Now compile the Voting.sol file,

![compile]<img width="962" alt="ss1" src="https://user-images.githubusercontent.com/71769587/210709610-99cbd9c9-568b-4795-a614-eb38816141fd.png">


### Step 3:
Once compiled successfully, click “Deploy and run transactions”. and "Deploy" it ,
![deploy]<img width="960" alt="ss2" src="https://user-images.githubusercontent.com/71769587/210709765-041b5011-8ce4-463c-85cd-492a1449503e.png">
![deploy]<img width="960" alt="ss3" src="https://user-images.githubusercontent.com/71769587/210709782-a2519838-a470-41a2-b4b0-bd62defc9a4a.png">

### Step 4:
And here you can see the all the transactions and deployed contracts-
![deployed contracts]<img width="960" alt="ss4" src="https://user-images.githubusercontent.com/71769587/210709847-c4d29be0-bfd0-43ce-95a0-1c260c56b560.png">

### Step 5:

Functions used in voting smart contract-
1) putVote: Vote your favourite contestant
2) registerCandidate: owner accessible function to register the competing candidates
3) getWinner - declare's the winner of the poll (only declared by the owner )
4) startVoting , stopVoting: owner accessible function to start and stop voting
5) whiteListAddress: owner accesible function to register the people who can vote (i.e. only people above 18, of indian origin etc...)
6) candidateList: get a list of competing candidates
7) candidate: get address of the competing candidates
8) VoteList: get a list of voters
and other functions are self explanatory 


![Voting smart contract]<img width="960" alt="ss4" src="https://user-images.githubusercontent.com/71769587/210709847-c4d29be0-bfd0-43ce-95a0-1c260c56b560.png">


https://user-images.githubusercontent.com/71769587/210715956-61586c16-d9e1-4a69-a821-0de3a9362a06.mp4

