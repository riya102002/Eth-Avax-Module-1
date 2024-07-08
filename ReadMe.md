
# VoterSystem Smart Contract

The Solidity-written VoterSystem smart contract is located in this repository. With the help of this contract, a basic voting system that allows users to select candidates and system administrators to oversee it will be implemented.




## Overview

Users can cast their votes for candidates using their IDs according to the VoterSystem contract, and the overall number of votes cast is tracked. Basic error handling and administrative functions are also supported by the contract.
## Prerequisites

1. Ethereum development environment (such as Hardhat, Truffle, or Remix IDE)

2. Node.js and npm (for using development environment tools)
## Features

1. Vote Casting: Users can cast votes for candidates identified by a candidate ID.

2. Vote Counting: The total number of votes cast can be retrieved.

3. Admin Access Control: A designated admin address that can have additional privileges.

4. Error Handling:
Emits error messages for specific conditions.


## Contract Details

STATE VARIABLES

1. address public admin: Address of the contract admin.

2. uint public totalVotes: Total number of votes cast.


## Events

1. TotalVoteCasted(address indexed voter, uint candidateId) : Fired when a vote is cast.

2. event Error(string message): Fired when an error condition is triggered.
## Constructor

The constructor sets the initial admin to the address deploying the contract and initializes the total votes to zero.

Solidity Code

constructor() {

    admin = msg.sender;
    totalVotes = 0;
}

## Functions

vote(uint candidateId)

Allows a user to cast a vote for a candidate.

1.Parameters: candidateId - The ID of the candidate (must be between 1 and 7 inclusive).

2.Emits: TotalVoteCasted event.

3.Requirements:
The candidateId must be between 1 and 7 inclusive.

solidity


function vote(uint candidateId) public {

    require(candidateId > 0 && candidateId <= 7, "Invalid candidate ID");
    totalVotes++;
    emit TotalVoteCasted(msg.sender, candidateId);
}


Reverts:

If the candidateId is not between 1 and 7 inclusive.

solidity

function voteWithRevert(uint candidateId) public {

    if(candidateId <= 0 || candidateId > 7) {
        revert("Invalid candidate ID");
    }
    totalVotes++;
    emit TotalVoteCasted(msg.sender, candidateId);
}




getTotalVotes()

Returns the total number of votes cast so far.



Returns: uint - Total votes count.
solidity


function getTotalVotes() 

public view returns (uint) {

    assert(totalVotes >= 0);
    return totalVotes;
}

grantAccess()-Currently a placeholder function representing admin functionality to grant access, only callable by the admin.

Requirements:
The caller must be the admin.
solidity

function grantAccess() public view {
    require(msg.sender == admin, "Only the admin can grant access");
}
triggerError(string memory message)
Triggers an error event with a custom message.

Parameters: 
message - Error message to be emitted.
solidity


function triggerError
(string memory message) public {

    emit Error(message);
}
## Usage

1. Deploy the VoterSystem contract to your desired Ethereum network using a tool such as Remix, Hardhat, or Truffle.

2. Interact with the contract functions via the deployed contract's interface in your chosen tool.

3. Admin can use the admin functionalities as required.
## Testing

Write unit tests using a testing framework like Mocha/Chai if using Hardhat or Truffle.

Alternatively, use the Remix IDE for quick manual testing.
## License

[MIT](https://choosealicense.com/licenses/mit/)

This project VotingSystem is licensed under the MIT license.


## Author

 @RiyaKesharwani [https://github.com/riya102002]
