// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoterSystem {
    address public admin;
    uint public totalVotes;

    event TotalVoteCasted(address indexed voter, uint candidateId);
    event Error(string message);

    constructor() {
        admin = msg.sender;
        totalVotes = 0;
    }

    function vote(uint candidateId) public {
        require(candidateId > 0 && candidateId <= 7, "Invalid candidate ID");

        totalVotes++;

        emit TotalVoteCasted(msg.sender, candidateId);
    }

    function voteWithRevert(uint candidateId) public {
        if(candidateId <= 0 || candidateId > 7) {
            revert("Invalid candidate ID");
        }

        totalVotes++;

        emit TotalVoteCasted(msg.sender, candidateId);
    }

    function getTotalVotes() public view returns (uint) {
        assert(totalVotes >= 0);

        return totalVotes;
    }

    function grantAccess() public view {
        require(msg.sender == admin, "Only the admin can grant access");

        // Grant access to the voter (if required in future)
    }

    function triggerError(string memory message) public {
        emit Error(message);
    }
}
