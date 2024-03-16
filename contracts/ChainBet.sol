// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedBettingPlatform {
    address public owner;
    uint public betCounter = 0;

        struct Bet {
        uint id;
        string description;
        uint amount;
        address payable participantA;
        address payable participantB;
        address payable winner;
        bool isSettled;

    }
    
    mapping(uint => Bet) public bets;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

       constructor() {
        owner = msg.sender;
    }

     function createBet(string memory description) public payable {
        require(msg.value > 0, "Bet amount must be greater than 0");

        betCounter++;
        bets[betCounter] = Bet(betCounter, description, msg.value, payable(msg.sender), payable(address(0)), payable(address(0)), false);
    }
}