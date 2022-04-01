// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ViewAndPure {
    //Setters functions are always in orange button
    //Getters functions are always in blue (view and pure)
    //Examples below

    uint number;

    function setNumber(uint _number) public {
        number = _number;
    }

    function getNumber()public view returns(uint){
        return number;
    }

    function multiply(uint _number)public pure returns(uint){
        return _number*2;
    }
}