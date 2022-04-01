// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Globalvariables {
    //msg.sender = the user who is calling the contract
    //msg.value = the value of the amount that the user is sending
    //timestamps = hour and date of the transactions
    //block.number = obvious

    address public addresse;
    uint public value;
    uint public timeStamp = block.timestamp;
    uint public blocknumber = block.number;

    function receiveEther()external payable {
        value = msg.value;
        addresse = msg.sender;
    }

}