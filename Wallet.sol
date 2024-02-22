// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// A contract that allows users to deposit Ether, which can only be withdrawn after a certain lock time has passed
contract TimeLock {
    // Maps an address to its balance in the contract
    mapping(address => uint) public balances;
    // Maps an address to its lock time (timestamp when funds can be withdrawn)
    mapping(address => uint) public lockTime;

    // Allows a user to deposit Ether into the contract. The Ether sent with this transaction
    // is added to the user's balance, and their lock time is set to one week from now
    function deposit() external payable {
        balances[msg.sender] += msg.value; // Increase the sender's balance by the sent amount
        lockTime[msg.sender] = block.timestamp + 1 weeks; // Set the sender's lock time to one week from the current block timestamp
    }

    // Allows a user to increase their lock time by a certain number of seconds
    function increaseLockTime(uint _secondsToIncrease) public {
        lockTime[msg.sender] += _secondsToIncrease; // Increase the sender's lock time
    }

    // Allows a user to withdraw their balance if the lock time has expired
    function withdraw() public {
        require(balances[msg.sender] > 0, "Insufficient funds"); // Ensure the user has funds to withdraw
        require(block.timestamp > lockTime[msg.sender], "Lock time not expired"); // Ensure the lock time has passed

        uint amount = balances[msg.sender]; // Store the user's balance in a temporary variable
        balances[msg.sender] = 0; // Reset the user's balance to 0 before sending to prevent re-entrancy attacks

        // Attempt to send the amount to the user. This uses a low-level call to allow sending Ether.
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether"); // Ensure the Ether was successfully sent
    }
}
