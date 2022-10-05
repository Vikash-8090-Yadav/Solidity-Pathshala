# Smart Contract "ToDo List" in Remix-IDE

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

Now compile the todo.sol file,

![Compile](https://user-images.githubusercontent.com/81668653/193433345-d693e0b3-f541-433b-9d90-0b4e946d4405.png)

### Step 3:

Once compiled successfully, click “Deploy and run transactions”. and "Deploy" it ,

![Deploy](https://user-images.githubusercontent.com/81668653/193433354-eb71ca30-6577-4fba-b8f8-07a1a5a4f919.png)

### Step 4:

Click “>” before your contract you will see a button todolist below as the contract has addTodo, completeTodo, removeTodo, uncompleteTodo and getAllTodos function that returns the all todo list in getAllTodos.

Functionalities :
- addTodo -> This function adds the task into Todo array.
- completeTodo -> In this function, we must provide the task's index, and after clicking it, the task is completed i.e it sets to true
- removeTodo -> In this function, we must also provide the index of the task that we want to remove from the list.
- unComplete -> similar to the previous function In this function, we must provide the index of the task that we want to mark as unfinished.
- getallTodos -> This function will tell us which tasks need to be completed and which tasks have already been completed. i.e It will return the results of all tasks.

Enter Whatever tasks you want, click the functions that correspond to your tasks, and you'll get the following output in getAllTodos:

![Deployed](https://user-images.githubusercontent.com/81668653/193433422-fc246b10-e016-48f2-93d1-930363584f8b.png)


Now, we have successfully run the another smart contract in solidity.
