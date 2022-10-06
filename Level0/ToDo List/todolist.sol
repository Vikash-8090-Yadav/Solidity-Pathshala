pragma solidity ^0.8.0;

contract todo_list
{
    uint public task_count=0;
    
    struct task
    {
        uint id;
        string content;
        bool completed;
    }
    
    //mapping(key => value) public mapping_name;
    
    mapping(uint => task) public tasks;
    
    function create_task(string memory _content) public
    {
        tasks[task_count]=task(task_count,_content,false);
        task_count++;
    }
    
    constructor() public
    {
        create_task("task from constructor");
    }
    
    function toggle_task_status(uint _id) public
    {
        task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
    }
    
}