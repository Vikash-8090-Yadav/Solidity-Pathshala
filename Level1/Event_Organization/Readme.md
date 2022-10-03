# Smart Contract "Event_Organization" in Remix-IDE

Smart contracts are contracts that execute themselves. The Remix is an Integrated Development Environment (IDE) for creating smart contracts in Solidity. The Solidity code can be written, compiled, and debugged using the IDE.

## Getting Started :

### Step 1:

For opening the remix-ide in browser type: https://remix.ethereum.org/.

A screen will be presented like the following:

![image](https://user-images.githubusercontent.com/75573569/182060674-215aa896-cf26-41e7-b484-c249c1033ece.png)

Click on the “file explorer” icon onto the left side bar.

Select Solidity in the Environment and click + symbol right to the browser.

Type the file name and enter the respective code into it.

### Step 2:

Now compile the eventOrganization.sol file,

![Event-1](https://user-images.githubusercontent.com/81668653/193489960-8e7b1d7c-fba2-41be-a519-34825deb2175.png)

![Event-2](https://user-images.githubusercontent.com/81668653/193489997-efdb5c6b-41c5-4b59-b196-1d9cf91eeb8f.png)

### Step 3:

Once compiled successfully, click “Deploy and run transactions”. and "Deploy" it ,

![Event-3](https://user-images.githubusercontent.com/81668653/193490025-313b8d4c-0a24-400d-bbda-294c9ed0480b.png)

### Step 4:

Click “>” before your contract you will see a button EventOrganization below as the contract has buyTicket, createEvent, events, nextId and Tickets.

![Event-4](https://user-images.githubusercontent.com/81668653/193490236-c46b5d88-9e5d-442c-9a1b-e4b3c1727db9.png)

Functionalities :

- createEvent -> It will initiate the event (The event will be created by the organiser.)
- buyTicket -> This is the Payable function for buying event tickets.
- events -> You can fetch any events with there Id.

![Event-5(2)](https://user-images.githubusercontent.com/81668653/193490533-f88e798a-ab97-447f-9868-1813e7f68b70.png)

- Ticktes -> In this function ticktes caan be seen by anyone using there address (means how many tickets that address bought).
 
 ![Event-5(1)](https://user-images.githubusercontent.com/81668653/193490470-0abda402-38e2-4195-a663-40249fd86f44.png)

Creater will create events and user can join any events they want and can buy multiple tickets for multiple shows show.

![Event-5](https://user-images.githubusercontent.com/81668653/193490581-d24512e8-41eb-48c9-ba07-33025f5cc86e.png)

Now, we have successfully run the another smart contract in solidity.
