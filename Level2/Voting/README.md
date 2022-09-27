# Smart Contract "Voting" in Remix-IDE


## Getting Started :


### Step 1:

For opening the remix-ide in browser type: https://remix.ethereum.org/.

A screen will be presented like the following:
![File explorer](https://user-images.githubusercontent.com/95535448/182686591-5ae38b05-1ea2-4532-9ee1-d368a43de36b.png)

Click on the “file explorer” icon onto the left side bar.

Select Solidity in the Environment and click + symbol right to the browser.

Type the file name and enter the respective code into it.

Step 2:

Now compile the Voting.sol file,
![compile](https://user-images.githubusercontent.com/95535448/182790166-d579baf4-16f6-4924-b0d3-3891119f1561.png)

Step 3:
Once compiled successfully, click “Deploy and run transactions”. and "Deploy" it ,
![deploy](https://user-images.githubusercontent.com/95535448/182790432-3c5bff42-5e2b-4d49-baf0-e6cdc2260922.png)

Step 4:
And here you can see the all the transactions and deployed contracts-
![deployed contracts](https://user-images.githubusercontent.com/95535448/182790663-beb4c612-e4fd-4f44-8cd4-e3caa2f0a05d.png)

Step 5:
Functions used in voting smart contract-
1) partipant1_vote - it is used to give votes to the Participant 1
2) partipant2_vote - it is used to give vote to the Participant 2
3) declare_winner - declare's the winner of the poll (only declared by the owner )
4) partipant1 - gives the address of first participant
5) partipant2 - give the address of second participant
6) parti1_cnt_vote - counts the vote of first participant (only acessible by the owner )
7) parti2_cnt_vote - counts the vote of second participant (only acessible by the owner )
8) owner - This is used to check the owner's address


![Voting smart contract](https://user-images.githubusercontent.com/95535448/182790817-656888df-a4d4-4f07-a489-71a4e7ca8633.png)
