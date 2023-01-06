## Decentralized Lottery System
 In  a lottery systems, the players choose some numbers on a ticket, enroll it to the lottery organizer and pay an amount of money for it. But this perspective offers no guarantee to the players that the lottery organizer doesn’t manipulate the number selection in order to pay the least. This suspicion could be avoided if the lottery organizer didn’t know the numbers selected by the players before the draw.

Examples :
  1. Sports
      In the world of sports,         the National Basketball Association (NBA) holds a lottery for the 14 teams with the worst record from the previous season that did not make the playoffs. The names of all 14 teams are randomly drawn in order to determine which draft pick they will have. The team that comes out top is essentially given the first opportunity to pick the biggest talent out of college.

 2. Financial
The financial lottery is a game where players pay for a ticket, usually for $1, select a group of numbers, or have machines randomly spit them othem out, and then win prizes if enough of their numbers match those randomly drawn by a machine.

<hr/>

## How does it work

### Step 1: Deploy
<img width="960" alt="deploy" src="https://user-images.githubusercontent.com/71769587/210917866-e5661dd6-fb9c-4b42-ae07-fb879c86777f.png">
Deploy the smart contract in remix IDE

### Step 2: Functions
<img width="960" alt="functions" src="https://user-images.githubusercontent.com/71769587/210917953-4d955619-5275-441c-8b75-6c4b9f1d80de.png">
1. SelectWinner: Owner accessible function to randomly select a winner<br/>
2. getBalance: Get total funds collected for lottery<br/>
3. manager: Owner address<br/>
4. participants: As shown in the video below, different participants need to transact ether or wei from their wallet (must be more than 100 wei) to be a participant in the lottery. That is, basically the person who wants to participate in the lottery needs to pay money to raise the pool prize<br/>
5. random: Function to randomly select a wallet address<br/>

### Video Demonstration


https://user-images.githubusercontent.com/71769587/210918296-418a9a59-ef2f-4e4a-bd35-dce12c014f1d.mp4

