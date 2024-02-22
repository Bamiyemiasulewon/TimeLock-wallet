
TimeLock Smart Contract
The TimeLock Smart Contract is an Ethereum-based contract designed to securely hold Ether (ETH) for a predetermined lock period. It offers a straightforward way for users to deposit ETH, which then becomes withdrawable only after a specified amount of time has passed. This contract is ideal for scenarios requiring time-bound access to funds, such as vesting schedules, savings plans, or simple trust mechanisms.

Features
Ether Deposits: Users can deposit ETH into the TimeLock contract. Each deposit's lock time is set individually, providing flexibility for different use cases.
Lock Time Extension: Users have the option to extend the lock time of their deposits. This feature can be used to prolong the holding period, adding an extra layer of decision-making for fund access.
Secure Withdrawals: Withdrawals are enabled only after the lock time expires. This ensures that funds are accessible only when the predefined conditions are met.
Reentrancy Guard: The contract employs basic security practices, such as updating the user's balance before transferring ETH, to prevent reentrancy attacks—a common vulnerability in smart contracts.
How It Works
Deposit: Users send ETH to the contract, which records their balance and sets a lock time one week from the deposit date.
Increase Lock Time: At any point, users can opt to increase the lock time of their deposits if they wish to extend the holding period.
Withdraw: Once the lock time has passed, users can initiate a withdrawal. The contract ensures that the lock period has expired and that the user has a balance before sending the ETH.
