// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//Example of how a contract heritate from others contracts variables

contract Owner{
    address owner;

    constructor() { 
    owner = msg.sender;
    }

    modifier isOwner(){
        require(msg.sender == owner,"You are not the owner");
        _;
    }
}

// the "is Owner" tag means that the heritage contract heritate owner variables and functions from owner contract
contract heritage is Owner{
    uint number;
 
    function setNumber(uint _number) public virtual isOwner{
        number = _number;
    }

    function getNumber() public view isOwner returns (uint){
        return number;
    }
}

//Inheritance with virutal and override 

contract inheritance is heritage { 
    
 
    function setNumber(uint _number) public override isOwner{
        number = _number;
    }

}

