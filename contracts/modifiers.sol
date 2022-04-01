// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract modifiers {

    uint number;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner(){
        require(msg.sender == owner , "Not the owner");
        _;
    }

    function setNumber(uint _number) public isOwner{
        number = _number;
    }

    function getNumber() public view isOwner returns (uint){
        return number;
    }
}