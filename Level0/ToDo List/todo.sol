// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract todo{
    struct Todo {
        string text;
        bool isDone;
    }

    Todo[] private Tasks;

    function addTodo(string memory _text) public {
        Tasks.push(Todo(_text, false));
    }
    function removeTodo(uint256 _index) public {
        Tasks[_index] = Tasks[Tasks.length - 1];
        Tasks.pop();
    }

    function getAllTasks() public view returns (Todo[] memory) {
        return Tasks;
    }

    function completeTodo(uint256 _index) public {
        Tasks[_index].isDone = true;
    }

    function unCompleteTodo(uint256 _index) public {
        Tasks[_index].isDone = false;
    }
}