// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//how to call functions from another contracts
//here we gonna set functions that we are going to call from InterfacesB.sol

 interface interfaceA {
    function setNumber(uint _number)external;
    function getNumber() external view returns(uint);
 }

contract A {
    uint number;

    function setNumber(uint _number)external {
        number = _number;
    }

    function getNumber() external view returns(uint){
        return number;
    }
}