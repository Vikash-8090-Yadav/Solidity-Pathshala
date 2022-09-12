### Interface

An interface is an agreement or a conduct between itself and any contract that implements it.

## Interface restrictions-
- They can  only inherit  from other interfaces but not from other contracts.
- They **cannot** declare **state variables**.
- They **cannot** declare **constructors**.
- **Functions** can be declared but **not implemented**. 
- All declared functions should be **external**.

### Lets Understand with the help of Remix.


![1](https://user-images.githubusercontent.com/95535448/189182307-deb79fe8-7f2a-44fd-ae86-1657054b1f51.png)
 
Our interface contract looks like this but we can see some issues here. Let's try to fix them .

#### Solution-

![3](https://user-images.githubusercontent.com/95535448/189183753-365dc434-be74-4239-9a4e-355331a8ed35.png)

As we know we cannot declare state variables and constructors in interface as it is restricted. So we have commented the code and we can see the issues are resolved.

#### Issue

![3](https://user-images.githubusercontent.com/95535448/189183753-365dc434-be74-4239-9a4e-355331a8ed35.png)

- We can see we are still facing an issue. This is because the function we have declared inside our interface , we are not implementing it into our child contract.
- If we implement the parent function inside the child function and add **override** keyword , our issue will be resolved.

#### Solution-
![2](https://user-images.githubusercontent.com/95535448/189183910-3d0450ba-5230-463e-97e7-016ee1bb1158.png)

#### Few points about Override.

- Solidity lets developers change how a function in the parent contract is implemented in the derived class. This is known as function overriding.

#### Now lets see our Interface contract.

![fianl](https://user-images.githubusercontent.com/95535448/189186644-58dc3307-8203-4198-bd03-03e53673961a.png)

#### TakeAway:-
- Interface are more restricted form of abstract contract.
- Eg: If we are working for someone and lets say that person wants us to make some smart contract , that person will give us an interface and will tells us to implement this interface. So basically we will be bound to use all the functions that are present inside there interface. We don't use all the functions inside the interface we will get an error. 

