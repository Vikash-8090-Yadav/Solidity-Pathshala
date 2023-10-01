// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.7.0;

contract Banking {
    mapping(address => uint) public userAccount;
    mapping(address => bool) public userExists;

    // Can create a new bank account
    function createAcc() public payable returns (string memory) {
        require(!userExists[msg.sender], "Account already created !");

        if (msg.value > 0) {
            userAccount[msg.sender] = msg.value;
            userExists[msg.sender] = true;
            return "Account created with a deposit";
        }

        userExists[msg.sender] = true;
        return "Account created without a deposit";
    }

    // Can deposit amount in his/her account
    function deposit() public payable returns (string memory) {
        require(userExists[msg.sender], "Account is not created");
        require(msg.value > 0, "Value for deposit is Zero");

        userAccount[msg.sender] += msg.value;

        return "Deposited successfully";
    }

    // Can withdraw amount from  his acocunt
    modifier validWithdrawal(uint amount) {
        require(amount > 0, "Enter a non-zero value for withdrawal");
        require(userExists[msg.sender], "Account is not created");
        require(
            userAccount[msg.sender] >= amount,
            "Insufficient balance in the bank account"
        );
        _;
    }

    function withdraw(
        uint amount
    ) public payable validWithdrawal(amount) returns (string memory) {
        userAccount[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        return "Withdrawal Successful";
    }

    // Can transfer amount from your account to another
    function transferAmount(
        address payable userAddress,
        uint amount
    ) public returns (string memory) {
        require(userExists[msg.sender], "Account is not created");
        require(
            userExists[userAddress],
            "Recipient account does not exist in bank accounts"
        );
        require(amount > 0, "Enter a non-zero value for sending");
        require(
            userAccount[msg.sender] >= amount,
            "Insufficient balance in Bank account"
        );

        userAccount[msg.sender] -= amount;
        userAccount[userAddress] += amount;

        return "Transfer successful";
    }

    // Can send amount to another person
    function sendAmount(
        address payable toAddress,
        uint256 amount
    ) public returns (string memory) {
        require(amount > 0, "Enter a non-zero value for withdrawal");
        require(userExists[msg.sender], "Account is not created");

        uint256 senderBalance = userAccount[msg.sender];
        require(
            senderBalance >= amount,
            "Insufficient balance in Bank account"
        );

        userAccount[msg.sender] -= amount;
        toAddress.transfer(amount);

        return "Transfer successful";
    }

    // Can check  balance
    function userAccountBalance() public view returns (uint) {
        return userAccount[msg.sender];
    }

    // Can check is the account registered to the bank or not
    function accountExist() public view returns (bool) {
        return userExists[msg.sender];
    }
}
