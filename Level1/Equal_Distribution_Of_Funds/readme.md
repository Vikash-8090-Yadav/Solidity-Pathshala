# Smart Contract for Distribution of funds

#### Contract Description 
There are two entities in this project:

A person owner of funds=
A person who has a property can  his property to his relatives(kids or beneficiar) after they get x years old (for example
18 years old)
A beneficiar =
beneficiars will get his funds after the time condition satisfies.

## Steps to Run

To run it, we just have to copy the smart contract into [Remix ide](https://remix.ethereum.org/), remix automatically compiles the contract. Then we to just deploy, smart contract's constructor doesn't take any arguments. 


### Output Screenshots =


### Walkthrough Video to compile contract=
 https://drive.google.com/file/d/1S5mi_WUf5EIu6uVlIfhftO1tkic1VTBX/view?usp=share_link

### Functions in this contract:

- addKid() -> Only Owner or dad can add new kid or beneficiary to the contract.
- deposit() -> Dad or owner can store their money in contract which will be distributed to its kids after setted time passes.
- addToKidsBalance() -> Transfers the sent value to particular kid or beneficiar balance
- availabletToWithdraw() -> A beneficiar can check time to time that he or she can withdraw funds or not?
- withdraw() -> A beneficiar can withdraw his or her funds after all conditions satisfies.

#### I have commented out code properly if you have any doubt feel free to ping me Github= DevSwayam.