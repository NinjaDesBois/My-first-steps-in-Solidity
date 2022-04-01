// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//How to import variables and functions from another contract to interact with it(importation from Owner.sol)

import './Owner.sol';

//now that the file is imported all the variables and functions are ready to use
contract importation{
    uint number;
 
    function setNumber(uint _number) public isOwner{
        number = _number;
    }

    function getNumber() public view isOwner returns (uint){
        return number;
    }
}
